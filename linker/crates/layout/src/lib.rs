mod data;
mod inst;

use sb_linker_obj::inst::Inst;
use sb_linker_obj::Object;

pub fn layout(objs: Vec<Object>) -> Vec<Inst> {
    // 1. データのレイアウト
    let _ = data::layout(&objs);

    // 2. 命令領域にレイアウト結果を反映
    let insts = inst::apply_layout(objs);

    insts
}
