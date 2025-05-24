mod convert;
mod gen_entrypoint;

use std::collections::VecDeque;
use std::fmt::Write;

use sb_linker_config::Config;
use sb_linker_obj::Object;

use convert::write_insts;
use gen_entrypoint::gen_entrypoint;

pub fn asmgen_inst(config: &Config, objs: Vec<Object>) -> anyhow::Result<String> {
    // 1. エントリポイントを生成
    let entrypoint = gen_entrypoint(config);

    // 2. オブジェクトファイルの配置順を調整
    let mut objs = VecDeque::from(objs);
    objs.push_front(entrypoint);

    // 3. オブジェクトファイル内の命令を書き出し
    let mut result = String::new();
    for obj in objs {
        writeln!(&mut result, "@{}", obj.name)?;
        write_insts(&mut result, obj)?;
    }

    Ok(result)
}
