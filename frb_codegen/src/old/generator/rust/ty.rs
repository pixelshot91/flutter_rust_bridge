use std::borrow::Cow;

use crate::generator::rust::*;
use crate::target::Acc;
use enum_dispatch::enum_dispatch;

#[enum_dispatch]
pub trait TypeRustGeneratorTrait {
    fn wire2api_body(&self) -> Acc<Option<String>>;

    /// Handles JsValue to Self conversions.
    fn wire2api_jsvalue(&self) -> Option<Cow<str>> {
        None
    }

    fn self_access(&self, obj: String) -> String {
        obj
    }

    fn convert_to_dart(&self, obj: String) -> String {
        format!("{obj}.into_into_dart().into_dart()")
    }

    fn allocate_funcs(
        &self,
        _collector: &mut ExternFuncCollector,
        _block_index: BlockIndex,
    ) -> Acc<Option<String>> {
        Acc::default()
    }

    fn related_funcs(
        &self,
        _collector: &mut ExternFuncCollector,
        _block_index: BlockIndex,
    ) -> Acc<Option<String>> {
        Acc::default()
    }

    fn impl_intodart(&self) -> String {
        "".to_string()
    }

    fn new_with_nullptr(&self, _collector: &mut ExternFuncCollector) -> String {
        "".to_string()
    }

    fn imports(&self) -> Option<String> {
        None
    }
}

#[derive(Debug, Clone)]
pub struct TypeGeneratorContext<'a> {
    pub ir_pack: &'a IrPack,
    pub config: &'a Opts,
}

#[macro_export]
macro_rules! type_rust_generator_struct {
    ($cls:ident, $ir_cls:ty) => {
        #[derive(Debug, Clone)]
        pub struct $cls<'a> {
            pub ir: $ir_cls,
            pub context: $crate::generator::rust::ty::TypeGeneratorContext<'a>,
        }
    };
}

#[enum_dispatch(TypeRustGeneratorTrait)]
#[derive(Debug, Clone)]
pub enum TypeRustGenerator<'a> {
    Primitive(TypePrimitiveGenerator<'a>),
    Delegate(TypeDelegateGenerator<'a>),
    PrimitiveList(TypePrimitiveListGenerator<'a>),
    Optional(TypeOptionalGenerator<'a>),
    OptionalList(TypeOptionalListGenerator<'a>),
    GeneralList(TypeGeneralListGenerator<'a>),
    StructRef(TypeStructRefGenerator<'a>),
    Boxed(TypeBoxedGenerator<'a>),
    EnumRef(TypeEnumRefGenerator<'a>),
    SyncReturn(TypeSyncReturnGenerator<'a>),
    DartOpaque(TypeDartOpaqueGenerator<'a>),
    RustOpaque(TypeRustOpaqueGenerator<'a>),
    Dynamic(TypeDynamicGenerator<'a>),
    Record(TypeRecordGenerator<'a>),
}

impl<'a> TypeRustGenerator<'a> {
    pub fn new(ty: IrType, ir_pack: &'a IrPack, config: &'a Opts) -> Self {
        let context = TypeGeneratorContext { ir_pack, config };
        match ty {
            Primitive(ir) => TypePrimitiveGenerator { ir, context }.into(),
            Delegate(ir) => TypeDelegateGenerator { ir, context }.into(),
            PrimitiveList(ir) => TypePrimitiveListGenerator { ir, context }.into(),
            Optional(ir) => TypeOptionalGenerator { ir, context }.into(),
            OptionalList(ir) => TypeOptionalListGenerator { ir, context }.into(),
            GeneralList(ir) => TypeGeneralListGenerator { ir, context }.into(),
            StructRef(ir) => TypeStructRefGenerator { ir, context }.into(),
            Boxed(ir) => TypeBoxedGenerator { ir, context }.into(),
            EnumRef(ir) => TypeEnumRefGenerator { ir, context }.into(),
            SyncReturn(ir) => TypeSyncReturnGenerator::new(ir, context).into(),
            DartOpaque(ir) => TypeDartOpaqueGenerator { ir, context }.into(),
            RustOpaque(ir) => TypeRustOpaqueGenerator { ir, context }.into(),
            Dynamic(ir) => TypeDynamicGenerator { ir, context }.into(),
            Record(ir) => TypeRecordGenerator { ir, context }.into(),
            Unencodable(IrTypeUnencodable { string, .. }) => {
                panic!("Cannot generate Rust code for {}", string)
            }
        }
    }
}
