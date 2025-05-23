use sb_linker_obj::inst::Inst;
use sb_linker_obj::Object;

pub fn apply_layout(objs: Vec<Object>) -> Vec<Inst> {
    objs.into_iter()
        .flat_map(|obj| obj.code)
        .collect()
}
