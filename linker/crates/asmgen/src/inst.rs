use sb_asm::imem::ir::unresolved::Inst as AsmInst;
use sb_asm::imem::ir::unresolved::InstKind as AsmInstKind;
use sb_asm::imem::ir::unresolved::Value as AsmInstValue;

use sb_linker_obj::inst::Inst as ObjInst;
use sb_linker_obj::inst::InstValue as ObjInstValue;
use sb_linker_obj::Object;

pub fn asmgen_inst(objs: Vec<Object>) -> Vec<AsmInst> {
    objs.into_iter()
        .flat_map(asmgen_inst_in_obj)
        .collect()
}

fn asmgen_inst_in_obj(obj: Object) -> Vec<AsmInst> {
    let gen_label = |label: u32| {
        format!("{}.{}", &obj.name, label)
    };

    let convert_value = |value: ObjInstValue| {
        match value {
            ObjInstValue::InstLabel(label) => AsmInstValue::InstLabel(gen_label(label)),
            ObjInstValue::Imm(imm) => AsmInstValue::Imm(imm as i64),
            _ => unimplemented!(),
        }
    };

    let convert_inst = |inst: ObjInst| {
        match inst {
            // R-形式
            ObjInst::Add { rd, rs1, rs2 } => AsmInstKind::Add { rd, rs1, rs2 },
            ObjInst::Sub { rd, rs1, rs2 } => AsmInstKind::Sub { rd, rs1, rs2 },
            ObjInst::And { rd, rs1, rs2 } => AsmInstKind::And { rd, rs1, rs2 },
            ObjInst::Or  { rd, rs1, rs2 } => AsmInstKind::Or  { rd, rs1, rs2 },
            ObjInst::Xor { rd, rs1, rs2 } => AsmInstKind::Xor { rd, rs1, rs2 },
            ObjInst::Srl { rd, rs1, rs2 } => AsmInstKind::Srl { rd, rs1, rs2 },
            ObjInst::Sra { rd, rs1, rs2 } => AsmInstKind::Sra { rd, rs1, rs2 },
            ObjInst::Sll { rd, rs1, rs2 } => AsmInstKind::Sll { rd, rs1, rs2 },

            // I-形式
            ObjInst::Addi { rd, rs1, value } => AsmInstKind::Addi { rd, rs1, val: convert_value(value) },
            ObjInst::Subi { rd, rs1, value } => AsmInstKind::Subi { rd, rs1, val: convert_value(value) },
            ObjInst::Andi { rd, rs1, value } => AsmInstKind::Andi { rd, rs1, val: convert_value(value) },
            ObjInst::Ori  { rd, rs1, value } => AsmInstKind::Ori  { rd, rs1, val: convert_value(value) },
            ObjInst::Xori { rd, rs1, value } => AsmInstKind::Xori { rd, rs1, val: convert_value(value) },
            ObjInst::Srli { rd, rs1, value } => AsmInstKind::Srli { rd, rs1, val: convert_value(value) },
            ObjInst::Srai { rd, rs1, value } => AsmInstKind::Srai { rd, rs1, val: convert_value(value) },
            ObjInst::Slli { rd, rs1, value } => AsmInstKind::Slli { rd, rs1, val: convert_value(value) },
            ObjInst::Lb   { rd, rs1, imm } => AsmInstKind::Lb  { rd, rs1, imm },
            ObjInst::Lbu  { rd, rs1, imm } => AsmInstKind::Lbu { rd, rs1, imm },
            ObjInst::Lh   { rd, rs1, imm } => AsmInstKind::Lh  { rd, rs1, imm },
            ObjInst::Lhu  { rd, rs1, imm } => AsmInstKind::Lhu { rd, rs1, imm },
            ObjInst::Lw   { rd, rs1, imm } => AsmInstKind::Lw  { rd, rs1, imm },
            ObjInst::Jal  { rd, rs1, imm } => AsmInstKind::Jal { rd, rs1, imm },
            ObjInst::In   { rd, rs1, imm } => AsmInstKind::In  { rd, rs1, imm },

            // B-形式
            ObjInst::Beq { rd, rs1, rs2, value } => AsmInstKind::Beq { rd, rs1, rs2, val: convert_value(value) },
            ObjInst::Bne { rd, rs1, rs2, value } => AsmInstKind::Bne { rd, rs1, rs2, val: convert_value(value) },
            ObjInst::Blt { rd, rs1, rs2, value } => AsmInstKind::Blt { rd, rs1, rs2, val: convert_value(value) },
            ObjInst::Ble { rd, rs1, rs2, value } => AsmInstKind::Ble { rd, rs1, rs2, val: convert_value(value) },

            // S-形式
            ObjInst::Sb  { rs1, rs2, imm } => AsmInstKind::Sb  { rs1, rs2, imm },
            ObjInst::Sh  { rs1, rs2, imm } => AsmInstKind::Sh  { rs1, rs2, imm },
            ObjInst::Sw  { rs1, rs2, imm } => AsmInstKind::Sw  { rs1, rs2, imm },
            ObjInst::Out { rs1, rs2, imm } => AsmInstKind::Out { rs1, rs2, imm },

            // ラベル
            _ => unreachable!(),
        }
    };

    // 生成部本体
    let mut obj_inst_iter = obj.code.into_iter();
    let mut asm_insts = vec![];
    while let Some(inst) = obj_inst_iter.next() {
        // 1. ラベル確認
        let mut label = None;
        let inst = match inst {
            ObjInst::Label { label: label_num } => {
                label = Some(gen_label(label_num));
                obj_inst_iter.next().unwrap()
            }
            _ => inst,
        };

        // 2. 命令変換 (ObjInst -> AsmInst)
        let asm = AsmInst {
            label,
            kind: convert_inst(inst),
        };
        asm_insts.push(asm);
    }

    asm_insts
}

#[cfg(test)]
mod tests {
    use sb_asm::imem::ir::unresolved::InstKind as AsmInstKind;
    use sb_asm::imem::ir::unresolved::Value as AsmInstValue;

    use sb_linker_obj::inst::Inst;
    use sb_linker_obj::inst::InstValue;
    use sb_linker_obj::{inst, Object};

    use super::asmgen_inst;

    #[test]
    fn test_asmgen_mixing() {
        let obj_1 = Object {
            name: "test1".to_string(),
            code: vec![
                inst!(Addi 0, 0, InstValue::Imm(0)),
                inst!(Beq  0, 0, 0, InstValue::InstLabel(0)),
            ],
        };
        let obj_2 = Object {
            name: "test2".to_string(),
            code: vec![
                inst!(Addi 0, 0, InstValue::Imm(0)),
                inst!(Beq  0, 0, 0, InstValue::InstLabel(0)),
            ],
        };

        let asm_inst = asmgen_inst(vec![obj_1, obj_2]);

        assert_eq!(asm_inst.len(), 4);
        assert_inst_label_eq(&asm_inst[1].kind, "test1.0");
        assert_inst_label_eq(&asm_inst[3].kind, "test2.0");
    }

    #[test]
    fn test_asmgen_labeling() {
        let obj = Object {
            name: "test".to_string(),
            code: vec![
                inst!(Label 0),
                inst!(Addi 0, 0, InstValue::Imm(0)),
            ],
        };

        let asm_inst = asmgen_inst(vec![obj]);

        assert_eq!(asm_inst.len(), 1);
        assert_eq!(asm_inst[0].label, Some("test.0".to_string()));
    }

    fn assert_inst_label_eq(inst: &AsmInstKind, label: &str) {
        let assert_inst_label_eq = |value: &AsmInstValue| {
            match value {
                AsmInstValue::InstLabel(l) => assert_eq!(l, label),
                _ => panic!("Expected InstLabel, but got {:?}", value),
            }
        };

        match inst {
            // I-形式
            AsmInstKind::Addi { val, .. } => assert_inst_label_eq(val),
            AsmInstKind::Subi { val, .. } => assert_inst_label_eq(val),
            AsmInstKind::Andi { val, .. } => assert_inst_label_eq(val),
            AsmInstKind::Ori  { val, .. } => assert_inst_label_eq(val),
            AsmInstKind::Xori { val, .. } => assert_inst_label_eq(val),
            AsmInstKind::Srli { val, .. } => assert_inst_label_eq(val),
            AsmInstKind::Srai { val, .. } => assert_inst_label_eq(val),
            AsmInstKind::Slli { val, .. } => assert_inst_label_eq(val),

            // B-形式
            AsmInstKind::Beq { val, .. } => assert_inst_label_eq(val),
            AsmInstKind::Bne { val, .. } => assert_inst_label_eq(val),
            AsmInstKind::Blt { val, .. } => assert_inst_label_eq(val),
            AsmInstKind::Ble { val, .. } => assert_inst_label_eq(val),

            _ => {}
        }
    }
}
