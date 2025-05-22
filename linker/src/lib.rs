use std::io::{Read, Seek};

use sb_linker_load::load;

pub fn link<R: Read + Seek>(inputs: Vec<&mut R>) -> anyhow::Result<()> {
    // 1. リンク対象ファイルを読み込む
    let _ = inputs
        .into_iter()
        .map(load)
        .collect::<anyhow::Result<Vec<_>>>()?;

    Ok(())
}
