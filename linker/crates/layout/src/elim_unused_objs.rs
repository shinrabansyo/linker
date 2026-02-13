use std::collections::HashSet;

use sb_linker_obj::inst::{Inst, InstValue};
use sb_linker_obj::Object;

pub fn elim_unused_objs(objs: Vec<Object>) -> Vec<Object> {
    let callees = objs.as_slice().collect_callees(".main.main");
    objs
        .into_iter()
        .filter(|obj| callees.contains(&obj.name))
        .collect()
}

trait ObjectListExt {
    fn collect_callees(&self, name: &str) -> HashSet<String>;
    fn get_by_name(&self, name: &str) -> Option<&Object>;
}

impl ObjectListExt for &[Object] {
    fn collect_callees(&self, name: &str) -> HashSet<String> {
        let mut used_objs = HashSet::from([name.to_string()]);
        for inst in &self.get_by_name(name).unwrap().code {
            if let Inst::Beq { value: InstValue::Function(label), .. } = inst {
                if used_objs.contains(label) {
                    continue;
                }
                used_objs.extend(self.collect_callees(label));
            }
        }
        used_objs
    }

    fn get_by_name(&self, name: &str) -> Option<&Object> {
        for obj in *self {
            if obj.name == name {
                return Some(obj);
            }
        }
        None
    }
}
