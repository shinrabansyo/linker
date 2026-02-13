mod elim_unused_objs;
mod mixin_data_section;

use sb_linker_obj::Object;

use elim_unused_objs::elim_unused_objs;
use mixin_data_section::mixin_data_section;

pub fn layout(objs: Vec<Object>) -> Vec<Object> {
    // 未使用オブジェクトを削除
    let objs = elim_unused_objs(objs);

    // 複数のオブジェクトファイルに存在するデータセクションを 1 つにまとめる (TODO)
    let (_, objs) = mixin_data_section(objs);

    objs
}
