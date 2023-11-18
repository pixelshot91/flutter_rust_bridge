use crate::command_run;
use crate::commands::command_runner::call_shell;
use crate::utils::dart_repository::dart_repo::DartRepository;
use crate::utils::path_utils::path_to_string;
use anyhow::bail;
use log::debug;
use serde_json::json;
use std::io::Write;
use std::path::{Path, PathBuf};
use std::str::FromStr;

fn ffigen(
    c_path: &Path,
    dart_path: &Path,
    dart_class_name: &str,
    llvm_path: &[PathBuf],
    llvm_compiler_opts: &str,
    dart_root: &Path,
) -> anyhow::Result<()> {
    debug!("execute ffigen c_path={c_path:?} dart_path={dart_path:?} llvm_path={llvm_path:?}",);

    let config = parse_config(
        dart_class_name,
        c_path,
        dart_path,
        llvm_path,
        llvm_compiler_opts,
    )?;
    debug!("ffigen config: {}", config);

    let mut config_file = tempfile::NamedTempFile::new()?;
    config_file.write_all(config.as_bytes())?;
    debug!("ffigen config_file: {:?}", config_file);

    let repo = DartRepository::from_str(&path_to_string(dart_root)?).unwrap();
    let res = command_run!(
        call_shell[Some(dart_root)],
        *repo.toolchain.as_run_command(),
        "run",
        "ffigen",
        "--config",
        config_file.path()
    )?;

    if !res.status.success() {
        let err = String::from_utf8_lossy(&res.stderr);
        let out = String::from_utf8_lossy(&res.stdout);
        let pat = "Couldn't find dynamic library in default locations.";
        if err.contains(pat) || out.contains(pat) {
            bail!("ffigen could not find LLVM. Please supply --llvm-path to flutter_rust_bridge_codegen, e.g.: \
                flutter_rust_bridge_codegen .. --llvm-path <path_to_llvm>");
        }
        bail!("ffigen failed:\nstderr: {err}\nstdout: {out}");
    }

    Ok(())
}

fn parse_config(
    dart_class_name: &str,
    c_path: &Path,
    dart_path: &Path,
    llvm_path: &[PathBuf],
    llvm_compiler_opts: &str,
) -> anyhow::Result<String> {
    let dart_path_str = path_to_string(dart_path)?;
    let c_path_str = path_to_string(c_path)?;
    let llvm_path_str = llvm_path
        .iter()
        .map(|x| path_to_string(x))
        .collect::<anyhow::Result<Vec<_>>>()?;
    let llvm_compiler_opts_list = if llvm_compiler_opts.is_empty() {
        vec![]
    } else {
        vec![llvm_compiler_opts]
    };

    let json = json!({
        "output": dart_path_str,
        "name": dart_class_name,
        "description": "generated by flutter_rust_bridge",
        "headers": {
          "entry-points": [c_path_str],
          "include-directives": [c_path_str],
        },
        "comments": false,
        "preamble": "// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names",
        "llvm_path": llvm_path_str,
        "compiler-opts": llvm_compiler_opts_list,
    });

    Ok(serde_json::to_string(&json)?)
}
