mod data;
mod inst;

use sb_linker_obj::Object;

pub fn layout(objs: Vec<Object>) -> Vec<Object> {
    // 1. データのレイアウト
    let _ = data::layout(&objs);

    // 2. 命令領域にレイアウト結果を反映
    let objs = inst::apply_layout(objs);

    objs
}
