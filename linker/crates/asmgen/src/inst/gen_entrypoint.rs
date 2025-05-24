use sb_linker_config::Config;
use sb_linker_obj::inst::{Inst, InstValue};
use sb_linker_obj::{inst, Object};

pub fn gen_entrypoint(config: &Config) -> Object {
    Object::new("__entrypoint".to_string(), vec![
        // スタックポインタ調整
        inst!(Addi 2, 0, InstValue::Imm(config.general.stack_addr as i32)),

        // main 関数呼び出し
        inst!(Beq 1, 0, 0, InstValue::Function("global.main".to_string())),

        // 無限ループ
        inst!(Beq 0, 0, 0, InstValue::Imm(0)),
    ])
}
