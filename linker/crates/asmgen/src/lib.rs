use sb_asm::dmem::ir::Data as AsmData;
use sb_asm::imem::ir::unresolved::Inst as AsmInst;

use sb_linker_obj::inst::Inst as ObjInst;

pub fn asmgen(_: Vec<ObjInst>) -> (Vec<AsmData>, Vec<AsmInst>) {
    todo!()
}
