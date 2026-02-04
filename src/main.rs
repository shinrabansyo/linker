use std::fs::File;
use std::path::PathBuf;
use std::io::Write;

use bpaf::{Bpaf, Parser};

use sb_linker::config::{Config, General};
use sb_linker::link;

#[derive(Bpaf)]
struct CliOptions {
    // リンク設定
    /// Linker configuration file
    #[bpaf(short, long)]
    config: Option<PathBuf>,
    /// Main function name (default: .main.main)
    #[bpaf(short, long, fallback(".main.main".into()))]
    main: String,
    /// Stack start address (default: 0x0000_1000)
    #[bpaf(short, long, long, fallback(0x0000_1000))]
    stack_addr: u32,

    // ファイル
    /// Output file
    #[bpaf(short, long, fallback("a.asm".into()))]
    output: PathBuf,
    /// Input file
    #[bpaf(positional("INPUT"), guard(is_not_empty, "At least one input file is required"))]
    input: Vec<PathBuf>,
}

fn is_not_empty<T>(a: &Vec<T>) -> bool {
    !a.is_empty()
}

fn main() -> anyhow::Result<()> {
    let opts = cli_options().to_options().run();

    let config = match opts.config {
        Some(path) => {
            toml::from_str::<Config>(&std::fs::read_to_string(&path)?)?
        }
        None => Config {
            general: General {
                main: opts.main,
                stack_addr: opts.stack_addr,
            },
        },
    };
    let inputs = opts
        .input
        .into_iter()
        .map(|path| File::open(&path))
        .collect::<Result<Vec<_>, _>>()?;
    let asm = link(config, inputs)?;
    write!(File::create(&opts.output)?, "{}", asm)?;

    Ok(())
}
