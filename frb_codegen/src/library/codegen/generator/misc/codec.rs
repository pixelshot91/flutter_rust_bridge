use crate::codegen::ir::ty::IrType;
use serde::Serialize;
use strum::IntoEnumIterator;
use strum_macros::{Display, EnumIter};

#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Hash, Display, EnumIter)]
pub(crate) enum CodecMode {
    Cst,
    Dco,
    Sse,
}

#[derive(Clone, Debug, PartialEq, Eq, Serialize, Hash)]
pub(crate) struct CodecModePack {
    pub dart2rust: CodecMode,
    pub rust2dart: CodecMode,
}

#[doc(hidden)]
#[macro_export]
macro_rules! codegen_codec_structs {
    ($partial_name:ident) => (
        crate::codegen_codec_structs!(
            @private

            $partial_name;

            Cst,
            Dco,
            Sse,
        );
    );
    (@private $partial_name:ident ; $($name:ident),*,) => (
        paste::paste! {
            pub(crate) struct [<$partial_name Entrypoint>]<'a>(
                Box<dyn [<$partial_name EntrypointTrait>]<'a>>
            );

            impl<'a> From<CodecMode> for [<$partial_name Entrypoint>]<'a> {
                fn from(mode: CodecMode) -> Self {
                    match mode {
                        $(
                        CodecMode::$name => Self(Box::new([<$name $partial_name Entrypoint>] {})),
                        )*
                    }
                }
            }

            impl<'a> std::ops::Deref for [<$partial_name Entrypoint>]<'a> {
                type Target = Box<dyn [<$partial_name EntrypointTrait>]<'a>>;

                fn deref(&self) -> &Self::Target {
                    &self.0
                }
            }
        }
    )
}

pub(crate) trait BaseCodecEntrypointTrait<C, O> {
    fn generate_encode(&self, context: C, types: &[IrType]) -> Option<O>;

    fn generate_decode(&self, context: C, types: &[IrType]) -> Option<O>;
}
