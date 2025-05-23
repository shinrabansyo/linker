mod inst;

use sb_asm::dmem::ir::Data as AsmData;
use sb_asm::imem::ir::unresolved::Inst as AsmInst;

use sb_linker_config::Config;
use sb_linker_obj::Object;

use inst::asmgen_inst;

pub fn asmgen(config: &Config, objs: Vec<Object>) -> (Vec<AsmData>, Vec<AsmInst>) {
    let asm_data = vec![];
    let asm_inst = asmgen_inst(config, objs);
    (asm_data, asm_inst)
}
