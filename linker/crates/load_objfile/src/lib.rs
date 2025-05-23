use std::io::Read;

use sb_linker_obj::Object;

pub fn load_objfile<R: Read>(f: &mut R) -> anyhow::Result<Object> {
    // Header
    let mut header = [0; 2];
    f.read(&mut header)?;
    if header != [0x12, 0x04] {
        return Err(anyhow::anyhow!("Invalid object file header"));
    }

    // Body
    let obj: Object = serde_cbor::from_reader(f)?;

    Ok(obj)
}
