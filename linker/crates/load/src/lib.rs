use std::io::{Read, Seek};

use sb_linker_obj::Object;
use sb_linker_load_objfile::load_objfile;

pub fn load<R: Read + Seek>(mut f: R) -> anyhow::Result<Vec<Object>> {
    // Object::dump 経由で出力されたファイル
    if let obj@Ok(_) = load_objfile(&mut f) {
        return obj;
    }
    f.rewind()?;

    Err(anyhow::anyhow!("Failed to load object file"))
}
