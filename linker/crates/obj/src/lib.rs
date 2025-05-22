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

    pub fn dump(&self, f: &mut impl Write) -> anyhow::Result<()> {
        // Header
        f.write_all(&[0x12, 0x04])?;

        // Body
        serde_cbor::to_writer(f, &self)?;

        Ok(())
    }
}
