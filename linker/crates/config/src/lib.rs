use serde::{Serialize, Deserialize};

#[derive(Debug, Default, Serialize, Deserialize)]
pub struct Config {
    pub general: General,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct General {
    pub main: String,
    pub stack_addr: u32,
}

impl Default for General {
    fn default() -> General {
        General {
            main: ".global.main".to_string(),
            stack_addr: 0x0000_1000,
        }
    }
}

impl General {
    pub fn set_main(&mut self, main: String) {
        self.main = main;
    }

    pub fn set_stack_addr(&mut self, stack_addr: u32) {
        self.stack_addr = stack_addr;
    }
}
