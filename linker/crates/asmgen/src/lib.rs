mod inst;

use sb_linker_config::Config;
use sb_linker_obj::Object;

use inst::asmgen_inst;

pub fn asmgen(config: &Config, objs: Vec<Object>) -> anyhow::Result<(String, String)> {
    let asm_data = "".to_string();
    let asm_inst = asmgen_inst(config, objs)?;
    Ok((asm_data, asm_inst))
}
