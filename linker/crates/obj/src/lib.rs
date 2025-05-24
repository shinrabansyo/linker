pub mod inst;

use std::io::Write;

use serde::{Serialize, Deserialize};

use inst::Inst;

#[derive(Debug, Serialize, Deserialize)]
pub struct Object {
    pub name: String,
    pub code: Vec<Inst>,
}

impl Object {
    pub fn new(name: String, code: Vec<Inst>) -> Object {
        Object { name, code }
    }

    pub fn update_code(&mut self, code: Vec<Inst>) {
        self.code = code;
    }

    pub fn dump(mut f: &mut impl Write, objs: &[Object]) -> anyhow::Result<()> {
        // Header
        f.write_all(&[0x12, 0x04])?;

        // Body
        serde_cbor::to_writer(&mut f, &objs)?;
        f.flush()?;

        Ok(())
    }
}
