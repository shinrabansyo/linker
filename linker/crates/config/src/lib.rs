use serde::{Serialize, Deserialize};

#[derive(Debug, Default, Serialize, Deserialize)]
pub struct Config {
    pub general: General,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct General {
    pub stack_addr: u32,
}

impl Default for General {
    fn default() -> General {
        General {
            stack_addr: 0x0000_1000,
        }
    }
}
