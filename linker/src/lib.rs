use std::fs::File;
use std::path::Path;

use sb_linker_load::load;

pub fn link<P: AsRef<Path>>(paths: &[P]) -> anyhow::Result<()> {
    // 1. リンク対象ファイルを読み込む
    let _ = paths
        .iter()
        .map(|path| {
            let mut file = File::open(path)?;
            load(&mut file)
        })
        .collect::<Vec<_>>();

    Ok(())
}
