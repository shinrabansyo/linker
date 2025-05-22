pub mod inst;

use std::fs::File;
use std::io::Write;
use std::path::Path;

use serde::{Serialize, Deserialize};

use inst::Inst;

#[derive(Debug, Serialize, Deserialize)]
pub struct Object {
    name: String,
    code: Vec<Inst>,
}

impl Object {
    pub fn new(name: String, code: Vec<Inst>) -> Object {
        Object { name, code }
    }

    pub fn dump<P: AsRef<Path>>(&self, path: P) -> anyhow::Result<()> {
        let mut f = File::create(path)?;

        // Header
        f.write_all(&[0x12, 0x04])?;

        // Body
        serde_cbor::to_writer(&mut f, &self)?;

        Ok(())
    }
}
