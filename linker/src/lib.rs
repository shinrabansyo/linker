use std::io::{Read, Seek};

use sb_asm::assemble_ir;
use sb_linker_config::Config;
use sb_linker_obj::Object;
use sb_linker_load::load;
use sb_linker_layout::layout;
use sb_linker_asmgen::asmgen;

pub fn link_files<R: Read + Seek>(config: Config, inputs: Vec<&mut R>) -> anyhow::Result<(String, String)> {
    // 1. リンク対象ファイルの読み込み
    let objs = inputs
        .into_iter()
        .map(load)
        .collect::<anyhow::Result<Vec<_>>>()?;

    // 2. リンク
    link_objs(config, objs)
}

pub fn link_objs(config: Config, objs: Vec<Object>) -> anyhow::Result<(String, String)> {
    // 1. データ配置決定
    let objs = layout(objs);

    // 2. アセンブリコード生成
    let (asm_data, asm_inst) = asmgen(&config, objs);

    // 3. アセンブル
    let (data, inst) = assemble_ir(asm_data, asm_inst)?;

    Ok((data, inst))
}
