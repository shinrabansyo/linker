use std::io::{Read, Seek};

use sb_linker_config::Config;
use sb_linker_load::load;
use sb_linker_layout::layout;
use sb_linker_asmgen::asmgen;

pub fn link<R: Read + Seek>(config: Config, inputs: Vec<&mut R>) -> anyhow::Result<(String, String)> {
    // 1. リンク対象ファイルの読み込み
    let objs = inputs
        .into_iter()
        .map(load)
        .collect::<anyhow::Result<Vec<_>>>()?;

    // 2. データ配置決定
    let objs = layout(objs);

    // 3. アセンブリコード生成
    let asm = asmgen(&config, objs)?;

    Ok(asm)
}
