use std::env;
use std::fs::File;
use std::io::Write;

use sb_linker::config::Config;
use sb_linker::link;

fn main() -> anyhow::Result<()> {
    let args = std::env::args();
    if args.len() < 3 {
        return Err(anyhow::anyhow!("usage: sb-linker <input> <output>"));
    }

    let path = env::args().nth(1).unwrap();
    let asm = link(Config::default(), vec![File::open(&path)?])?;

    let path = env::args().nth(2).unwrap();
    let mut f = File::create(&path)?;
    f.write_all(asm.as_bytes())?;

    Ok(())
}
