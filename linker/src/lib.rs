use std::io::{Read, Seek};

use sb_asm::assemble_ir;
use sb_linker_config::Config;
use sb_linker_load::load;

pub fn link<R: Read + Seek>(_: Config, inputs: Vec<&mut R>) -> anyhow::Result<String> {
    // 1. リンク対象ファイルを読み込む
    let _ = inputs
        .into_iter()
        .map(load)
        .collect::<anyhow::Result<Vec<_>>>()?;

    // n. アセンブル
    let (data, inst) = assemble_ir(vec![], vec![])?;
    let asm = format!("{}\n===\n{}", data, inst);

    Ok(asm)
}
