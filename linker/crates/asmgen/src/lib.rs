mod inst;

use sb_linker_config::Config;
use sb_linker_obj::Object;

use inst::asmgen_inst;

pub fn asmgen(config: &Config, objs: Vec<Object>) -> anyhow::Result<String> {
    // 1. データ領域用コードを生成
    let asm_data = "".to_string();

    // 2. 命令領域用コードを生成
    let asm_inst = asmgen_inst(config, objs)?;

    // 3. アセンブリコードとして結合
    let asm = format!("{}\n===\n{}", asm_data, asm_inst);

    Ok(asm)
}
