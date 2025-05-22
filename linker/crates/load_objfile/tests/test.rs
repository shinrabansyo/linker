use vfs::{FileSystem, MemoryFS};

use sb_linker_obj::inst::*;
use sb_linker_obj::{inst, Object};
use sb_linker_load_objfile::load_objfile;

#[test]
fn test_load_objfile() {
    let obj = Object::new(
        "test".to_string(),
        vec![
            inst!(Addi 0, 0, Imm(0)),
            inst!(Addi 0, 0, Imm(1)),
            inst!(Addi 0, 0, Imm(2)),
            inst!(Addi 0, 0, Imm(3)),
        ]
    );

    let fs = MemoryFS::new();

    let mut obj_file = fs.create_file("/test.o").unwrap();
    obj.dump(&mut obj_file).unwrap();

    let mut obj_file = fs.open_file("/test.o").unwrap();
    assert!(load_objfile(&mut obj_file).is_ok());
}
