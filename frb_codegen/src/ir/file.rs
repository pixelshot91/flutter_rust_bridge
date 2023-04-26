use convert_case::{Case, Casing};

use crate::target::Target;
use crate::utils::misc::{mod_from_rust_path, BlockIndex};
use crate::{generator, ir::*, Opts};
use std::collections::{HashMap, HashSet};
use std::thread;

use crate::utils::misc::ExtraTraitForVec;

pub type IrStructPool = HashMap<String, IrStruct>;
pub type IrEnumPool = HashMap<String, IrEnum>;

use std::cell::RefCell;
// this variable should be `none` for single block case, and not none for multi-blocks case.
thread_local!(pub static SHARED_MODULE: RefCell<Option<String>> = RefCell::new(None));

thread_local!(static SHARED_TYPES_INPUT: RefCell<HashSet<IrType>> = RefCell::new(HashSet::new())); //  shared types among all regular API blocks, in context of function paramters
thread_local!(static FETCHED_FOR_SHARED_TYPES_INPUT: RefCell<bool> = RefCell::new(false));

thread_local!(static SHARED_TYPES_OUTPUT: RefCell<HashSet<IrType>> = RefCell::new(HashSet::new())); //  shared types among all regular API blocks in context of function outputs
thread_local!(static FETCHED_FOR_SHARED_TYPES_OUTPUT: RefCell<bool> = RefCell::new(false));

thread_local!(static SHARED_TYPES_ALL: RefCell<HashSet<IrType>> = RefCell::new(HashSet::new())); //  shared types among all regular API blocks
thread_local!(static FETCHED_FOR_SHARED_TYPES_ALL: RefCell<bool> = RefCell::new(false));

#[derive(Debug, Clone)]
#[cfg_attr(feature = "serde", derive(serde::Serialize))]
pub struct IrFile {
    /// for a regular API block, this field contains APIs defined in this block and
    /// all methods of types(struct/enum)---the types are used only in this block;
    /// for a shared block, it ONLY contains methods from ALL shared types.
    pub funcs: Vec<IrFunc>,
    pub struct_pool: IrStructPool,
    pub enum_pool: IrEnumPool,
    pub has_executor: bool,
    pub block_index: BlockIndex,
    pub shared: bool, // `true` for an auto-generated shared block, otherwise `false`
}

impl IrFile {
    pub fn new(
        funcs: Vec<IrFunc>,
        struct_pool: IrStructPool,
        enum_pool: IrEnumPool,
        has_executor: bool,
        block_index: BlockIndex,
        all_configs: &[Opts],
        shared: bool,
    ) -> Self {
        let ir_fie = IrFile {
            funcs,
            struct_pool,
            enum_pool,
            has_executor,
            block_index,
            shared,
        };

        // Get shared types in advance here, because these types will be used multiple times later for multi-block-cases.
        if all_configs.len() > 1 {
            log::debug!("start for global"); //TODO: delete
            ir_fie.get_shared_distinct_types_for_all_blocks(true, true, all_configs);
            log::debug!("start for input"); //TODO: delete
            ir_fie.get_shared_distinct_types_for_all_blocks(true, false, all_configs);
            log::debug!("start for output"); //TODO: delete
            ir_fie.get_shared_distinct_types_for_all_blocks(false, true, all_configs);
        }

        ir_fie
    }

    /// [f] returns [true] if it wants to stop going to the *children* of this subtree
    pub fn visit_types<F: FnMut(&IrType) -> bool>(
        &self,
        f: &mut F,
        include_func_inputs: bool,
        include_func_output: bool,
    ) {
        for func in &self.funcs {
            if include_func_inputs {
                for field in &func.inputs {
                    field.ty.visit_types(f, self);
                }
            }
            if include_func_output {
                func.output.visit_types(f, self);
            }
        }
    }

    pub fn get_c_struct_names(&self, all_configs: &[Opts]) -> Vec<String> {
        let c_struct_names = self
            .distinct_types(true, true, all_configs)
            .iter()
            .filter_map(|ty| {
                if let IrType::StructRef(_) = ty {
                    Some(ty.rust_wire_type(Target::Io))
                } else {
                    None
                }
            })
            .collect();
        c_struct_names
    }

    /// get distinct types for this instance,
    /// which could be either for a regular or for an auto-generated shared API block.
    /// NOTE: in multi-blocks case, the output would NOT include shared types for a regular block.
    pub fn distinct_types(
        &self,
        include_func_inputs: bool,
        include_func_output: bool,
        all_configs: &[Opts],
    ) -> Vec<IrType> {
        let shared_types = self.get_shared_distinct_types_for_all_blocks(
            include_func_inputs,
            include_func_output,
            all_configs,
        );
        let types =
            match !self.shared {
                true => {
                    let raw_distinct_types =
                        self.get_regular_distinct_types(include_func_inputs, include_func_output);
                    log::debug!("the raw distinct types for {include_func_inputs}-{include_func_output}:{:?}", raw_distinct_types); //TODO: delete
                    let collect = raw_distinct_types
                        .difference(&shared_types)
                        .cloned()
                        .collect();
                    log::debug!("the final distinct types:{:?}", collect); //TODO: delete
                    collect
                }
                false => shared_types,
            };

        let mut types = types.into_iter().collect::<Vec<_>>();
        types.sort_by_key(|ty| ty.safe_ident());
        types
    }

    /// get dinstinct types only for a regular API block(the current IrFile instance).
    /// NOTE: in multi-blocks case, the returned value would include shared types for the regular block.
    fn get_regular_distinct_types(
        &self,
        include_func_inputs: bool,
        include_func_output: bool,
    ) -> HashSet<IrType> {
        assert!(include_func_inputs || include_func_output);
        assert!(!self.shared);
        let mut seen_idents = HashSet::new();
        let mut ans = Vec::new();
        self.visit_types(
            &mut |ty| {
                let ident = ty.safe_ident();
                let contains = seen_idents.contains(&ident);
                if !contains {
                    seen_idents.insert(ident);
                    ans.push(ty.clone());
                }
                contains
            },
            include_func_inputs,
            include_func_output,
        );

        ans.into_iter().collect::<HashSet<_>>()
    }

    /// get shared types in context of both function inputs and outputs.
    /// for a regular block, only shared types used in this block would be returned.
    /// for a shared block, all shared types would be returned.
    fn get_shared_distinct_types_for_current_block(&self) -> HashSet<IrType> {
        let global_shared = self.get_shared_distinct_types_for_all_blocks(true, true, &[]);
        if self.shared {
            global_shared
        } else {
            self.get_regular_distinct_types(true, true)
                .intersection(&global_shared)
                .map(|s| s.to_owned())
                .collect()
        }
    }

    /// Whatever this IrFile instance represents for, get shared types through `all_configs`, which
    /// may or may not include the shared config at the last index.
    /// For single-block case, it should return empty.
    /// For multi-block case, it should return ALL shared types among ALL regular
    /// blocks, which means that some of the shared types may not be used in all regular blocks.
    /// Also note `include_func_inputs` and `include_func_output` are essential for getting
    /// shared types within different context.
    fn get_shared_distinct_types_for_all_blocks(
        &self,
        include_func_inputs: bool,
        include_func_output: bool,
        all_configs: &[Opts],
    ) -> HashSet<IrType> {
        let fetch_func = |golbal_shared_types: &'static thread::LocalKey<
            RefCell<HashSet<IrType>>,
        >,
                          fetched_for_golbal_shared_types: &'static thread::LocalKey<
            RefCell<bool>,
        >| {
            golbal_shared_types.with(|shared| {
                fetched_for_golbal_shared_types.with(|fetched| {
                    let shares = shared.borrow_mut();
                    if all_configs.len() <= 1 {
                        // CASE 1: it is single block case;
                        // CASE 2: it is multi-blocks case, but `all_configs` is not available;
                        return shares.clone();
                    }
                    let mut fetched = fetched.borrow_mut();
                    if *fetched {
                        return shares.clone();
                    }
                    let r = self.get_shared_types_for_all_blocks_from_scratch(
                        shares,
                        include_func_inputs,
                        include_func_output,
                        all_configs,
                    );
                    *fetched = true;
                    r
                })
            })
        };

        match (include_func_inputs, include_func_output) {
            (true, true) => fetch_func(&SHARED_TYPES_ALL, &FETCHED_FOR_SHARED_TYPES_ALL),
            (true, false) => fetch_func(&SHARED_TYPES_INPUT, &FETCHED_FOR_SHARED_TYPES_INPUT),
            (false, true) => fetch_func(&SHARED_TYPES_OUTPUT, &FETCHED_FOR_SHARED_TYPES_OUTPUT),
            (false, false) => panic!("either input or output should be true"),
        }
    }

    fn get_shared_types_for_all_blocks_from_scratch(
        &self,
        mut shares: std::cell::RefMut<HashSet<IrType>>,
        include_func_inputs: bool,
        include_func_output: bool,
        all_configs: &[Opts],
    ) -> HashSet<IrType> {
        // get it from scratch for multi-blocks case
        let regular_configs = if !all_configs.last().unwrap().shared {
            all_configs
        } else {
            &all_configs[0..all_configs.len() - 1]
        };
        assert!(regular_configs.iter().all(|c| !c.shared));
        let mut block_uniques = Vec::new();
        let mut all_regular_types = Vec::new();
        let mut regular_ir_files = Vec::new();
        for (i, config) in regular_configs.iter().enumerate() {
            log::debug!("before get regular irfile for {i}"); //TODO: delete
            let ir_file = config.get_ir_file(&[]).unwrap();
            log::debug!("after get regular irfile for {i}"); //TODO: delete

            let distinct_types =
                ir_file.get_regular_distinct_types(include_func_inputs, include_func_output);
            regular_ir_files.push(ir_file.clone());
            all_regular_types.extend(distinct_types.clone());

            block_uniques.push(distinct_types);
        }

        // pick out the raw shared types
        *shares = all_regular_types
            .find_duplicates(true)
            .into_iter()
            .collect::<HashSet<_>>();
        log::debug!(
            "the raw shared for index:{} {include_func_inputs}-{include_func_output} is:{:?}",
            self.block_index.0,
            shares
        );
        //TODO: delete

        //↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓for cross shared types↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
        if !self.shared {
            log::debug!("block_uniques:{block_uniques:?}"); //TODO: delete
            for (i, each_block_uniques) in block_uniques.iter().enumerate() {
                for suspected_shared_type in each_block_uniques {
                    self.add_cross_shared_types(
                        suspected_shared_type,
                        BlockIndex(i),
                        &mut shares,
                        &regular_ir_files,
                        include_func_inputs,
                        include_func_output,
                    );
                }
            }
        } else {
            unreachable!(
                "when dealing cross shared types for a shared block,
                 there should have been some shared types got
                 when dealing with regular blocks before."
            )
        }
        //↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑for cross shared types↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

        log::debug!(
            "the new shared for index:{} {include_func_inputs}-{include_func_output} is:{:?}",
            self.block_index.0,
            shares
        );
        //TODO: delete

        shares.clone()
    }

    /// For a CROSS shared type which is shared as an input parameter ONLY ONCE in one block
    /// and shared as an output value in ANOTHER/OTHER block(s) or vice versa,
    /// the current logic of `get_regular_distinct_types(..)` would not pick it out,
    /// even both `include_func_inputs` and `include_func_output` are set true.
    /// because the signatures for the same raw type(e.g. `bool`) are different when it is used as input and output of a function.
    /// But indeed, this special kind of type should be treated as shared type within
    /// either input or output context or both, even it is shared but not shared in ALL of regular API blocks.
    /// Thus, here comes an extra manipulation to pick it out.
    fn add_cross_shared_types(
        &self,
        suspected_shared_type: &IrType,
        block_index: BlockIndex,
        shares: &mut HashSet<IrType>,
        regular_ir_files: &[IrFile],
        include_func_inputs: bool,
        include_func_output: bool,
    ) {
        match (include_func_inputs, include_func_output) {
            (true, true) => {
                for ir_file in regular_ir_files.iter() {
                    if ir_file.block_index != block_index {
                        let oppo_distinct_types = ir_file.get_regular_distinct_types(true, true);
                        let found = oppo_distinct_types.iter().find(|each| {
                            let cond1 = format!("box_autoadd_{}", each.safe_ident())
                                == suspected_shared_type.safe_ident();
                            let cond2 =
                                format!("box_autoadd_{}", suspected_shared_type.safe_ident())
                                    == each.safe_ident();
                            let cond3 = suspected_shared_type.safe_ident() == each.safe_ident();
                            cond1 || cond2 || cond3
                        });
                        if found.is_some() {
                            log::debug!(
                                "insert `{:?}` for {}-{}",
                                suspected_shared_type,
                                include_func_inputs,
                                include_func_output
                            ); //TODO: delete
                            shares.insert(suspected_shared_type.clone());
                            break;
                        }
                    }
                }
            }
            (true, false) => {
                for each_ir_file in regular_ir_files.iter() {
                    if each_ir_file.block_index != block_index {
                        let oppo_distinct_types = each_ir_file
                            .get_regular_distinct_types(!include_func_inputs, !include_func_output);
                        let found = oppo_distinct_types.iter().find(|each| {
                            format!("box_autoadd_{}", each.safe_ident())
                                == suspected_shared_type.safe_ident()
                                || suspected_shared_type.safe_ident() == each.safe_ident()
                        });
                        if found.is_some() {
                            log::debug!(
                                "insert `{:?}` for {}-{}",
                                suspected_shared_type,
                                include_func_inputs,
                                include_func_output
                            ); //TODO: delete
                            shares.insert(suspected_shared_type.clone());
                            break;
                        }
                    }
                }
            }
            (false, true) => {
                for ir_file in regular_ir_files.iter() {
                    if ir_file.block_index != block_index {
                        let oppo_distinct_types = ir_file
                            .get_regular_distinct_types(!include_func_inputs, !include_func_output);
                        let found = oppo_distinct_types.iter().find(|each| {
                            format!("box_autoadd_{}", suspected_shared_type.safe_ident())
                                == each.safe_ident()
                                || suspected_shared_type.safe_ident() == each.safe_ident()
                        });
                        if found.is_some() {
                            log::debug!(
                                "insert `{:?}` for {}-{}",
                                suspected_shared_type,
                                include_func_inputs,
                                include_func_output
                            ); //TODO: delete
                            shares.insert(suspected_shared_type.clone());
                            break;
                        }
                    }
                }
            }
            (false, false) => unreachable!(),
        }
    }

    pub fn generate_rust(&self, config: &Opts, all_configs: &[Opts]) -> generator::rust::Output {
        log::debug!("generate_rust 1"); //TODO: delete

        let regular_mod = mod_from_rust_path(config, all_configs, false).unwrap();
        let shared_mod = SHARED_MODULE.with(|text| {
            log::debug!("inner all configs len:{:?}", all_configs.len()); //TODO: delete
            *text.borrow_mut() = mod_from_rust_path(config, all_configs, true);
            text.borrow().clone()
        });
        log::debug!("regular mod:{regular_mod}"); //TODO: delete
        log::debug!("shared mod:{:?}", shared_mod); //TODO: delete

        generator::rust::generate(
            self,
            &regular_mod,
            shared_mod.as_deref(),
            config,
            all_configs,
        )
    }

    pub fn generate_dart(
        &self,
        config: &Opts,
        all_configs: &[Opts],
        wasm_funcs: &[IrFuncDisplay],
    ) -> generator::dart::Output {
        generator::dart::generate(self, config, all_configs, wasm_funcs)
    }

    /// Get all symbols(function names) defined explicitly or implictily.
    /// It is ok to just parse 1 config, whatever it is for single or multi-blocks case,
    /// since only symbols related to the specific config is needed.
    pub fn get_all_symbols(&self, config: &Opts) -> Vec<String> {
        self.generate_rust(config, &[config.clone()])
            .extern_func_names
    }

    /// check if `ty` is sharely used in current block
    pub fn is_type_shared(&self, ty: &IrType) -> bool {
        // if ty.safe_ident().contains("box_autoadd_") {
        //     // though `self.get_shared_distinct_types_for_current_block()` collects both input and output types,
        //     // "cross" shared types are not distinguished from input and output yet.
        //     // Therefore, here work around it by manually check `box_autoadd_`, which
        //     // is used as an input type prefix.
        //     // for more info, please take a look at `get_shared_distinct_types(...)`
        //     log::debug!("now checking {}", ty.safe_ident()); //TODO: delete
        //     for each in &self.get_shared_distinct_types_for_current_block() {
        //         if ty.safe_ident().contains(&each.safe_ident()) {
        //             log::debug!("{} is shared!", ty.safe_ident()); //TODO: delete
        //             return true;
        //         }
        //     }
        // } else {
        //     return self
        //         .get_shared_distinct_types_for_current_block()
        //         .contains(ty);
        // }
        // false

        log::warn!("it is time to check type shared for ty:{:?}", ty); //TODO: delete
        let get_shared_distinct_types_for_current_block =
            &self.get_shared_distinct_types_for_current_block();
        log::warn!(
            "the fetched get_shared_distinct_types_for_current_block_index_{:?}:{:?}",
            self.block_index,
            get_shared_distinct_types_for_current_block
        ); //TODO: delete

        // TODO: is this work around correct for `syncReturn` wrapper type?
        for each in get_shared_distinct_types_for_current_block {
            let s = each.safe_ident();
            log::debug!("the gott safe ident: {s}"); //TODO: delete
        }

        let found_op = get_shared_distinct_types_for_current_block
            .iter()
            .find(|each| each.safe_ident() == ty.safe_ident());
        let r = found_op.is_some();
        log::warn!("the r is :{r} for {ty:?}"); //TODO: delete
        r
    }

    pub fn get_shared_type_names(&self) -> HashSet<String> {
        self.get_shared_distinct_types_for_current_block()
            .iter()
            .flat_map(|ty| {
                let safe_ident = ty.safe_ident();
                std::iter::once(safe_ident.clone())
                    .chain(std::iter::once(safe_ident.to_case(Case::UpperCamel)))
            })
            .collect()
    }
}
