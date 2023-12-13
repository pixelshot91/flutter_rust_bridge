use crate::command_run;
use crate::commands::command_runner::call_shell;
use crate::utils::console::simple_progress;
use crate::utils::dart_repository::dart_repo::DartRepository;
use crate::utils::path_utils::path_to_string;
use anyhow::bail;
use log::{debug, info};
use std::path::Path;
use std::str::FromStr;

pub fn dart_build_runner(dart_root: &Path) -> anyhow::Result<()> {
    let _pb = simple_progress("Run Dart build_runner".to_owned(), 1);
    debug!("Running build_runner at dart_root={dart_root:?}");

    let repo = DartRepository::from_str(&path_to_string(dart_root)?).unwrap();
    let out = command_run!(
        call_shell[Some(dart_root)],
        *repo.toolchain.as_run_command(),
        *repo.command_extra_args(),
        "run",
        "build_runner",
        "build",
        "--delete-conflicting-outputs",
        "--enable-experiment=class-modifiers",
    )?;
    if !out.status.success() {
        bail!(
            "Failed to run build_runner for {:?}: {}",
            dart_root,
            String::from_utf8_lossy(&out.stdout)
        );
    }
    Ok(())
}
