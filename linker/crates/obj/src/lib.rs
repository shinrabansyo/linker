pub mod inst;

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
}
