use std::io::{Read, Seek};

use sb_asm::assemble_ir;
use sb_linker_config::Config;
use sb_linker_load::load;
use sb_linker_layout::layout;
use sb_linker_asmgen::asmgen;

pub fn link<R: Read + Seek>(_: Config, inputs: Vec<&mut R>) -> anyhow::Result<String> {
    // 1. リンク対象ファイルの読み込み
    let objs = inputs
        .into_iter()
        .map(load)
        .collect::<anyhow::Result<Vec<_>>>()?;

    // 2. データ配置決定
    let insts = layout(objs);

    // 3. アセンブリコード生成
    let (asm_data, asm_inst) = asmgen(insts);

    // 4. アセンブル
    let (data, inst) = assemble_ir(asm_data, asm_inst)?;
    let asm = format!("{}\n===\n{}", data, inst);

    Ok(asm)
}
