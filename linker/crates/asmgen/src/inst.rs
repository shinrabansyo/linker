mod convert;
mod gen_entrypoint;

use std::collections::VecDeque;

use sb_asm::imem::ir::unresolved::Inst as AsmInst;

use sb_linker_config::Config;
use sb_linker_obj::Object;

use convert::convert_inst;
use gen_entrypoint::gen_entrypoint;

pub fn asmgen_inst(config: &Config, objs: Vec<Object>) -> Vec<AsmInst> {
    let mut objs = VecDeque::from(objs);

    // 1. エントリポイントを生成
    let entrypoint = gen_entrypoint(config);
    objs.push_front(entrypoint);

    // 2. オブジェクトファイル内の命令を変換
    objs.into_iter()
        .flat_map(convert_inst)
        .collect()
}
