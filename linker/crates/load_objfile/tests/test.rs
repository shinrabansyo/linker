use vfs::{FileSystem, MemoryFS};

use sb_linker_obj::inst::*;
use sb_linker_obj::{inst, Object};
use sb_linker_load_objfile::load_objfile;

#[test]
fn test_load_objfile() {
    let obj_1 = Object::new(
        "test_1".to_string(),
        vec![
            inst!(Addi 0, 0, Imm(0)),
            inst!(Addi 0, 0, Imm(1)),
        ]
    );
    let obj_2 = Object::new(
        "test_2".to_string(),
        vec![
            inst!(Addi 0, 0, Imm(2)),
            inst!(Addi 0, 0, Imm(3)),
        ]
    );
    let objs = [obj_1, obj_2];

    let fs = MemoryFS::new();

    let mut obj_file = fs.create_file("/test.o").unwrap();
    Object::dump(&mut obj_file, &objs).unwrap();

    let mut obj_file = fs.open_file("/test.o").unwrap();
    assert!(load_objfile(&mut obj_file).is_ok());
}
