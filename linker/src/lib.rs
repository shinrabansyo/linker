use std::io::{Read, Seek};

pub use sb_linker_config as config;
pub use sb_linker_obj as obj;

use sb_linker_config::Config;
use sb_linker_load::load;
use sb_linker_layout::layout;
use sb_linker_asmgen::asmgen;

pub fn link<R: Read + Seek>(config: Config, inputs: Vec<R>) -> anyhow::Result<String> {
    // 1. リンク対象ファイルの読み込み
    let mut objs = vec![];
    for input in inputs {
        objs.extend(load(input)?);
    }

    // 2. データ配置決定
    let objs = layout(objs);

    // 3. アセンブリコード生成
    let asm = asmgen(&config, objs)?;

    Ok(asm)
}
