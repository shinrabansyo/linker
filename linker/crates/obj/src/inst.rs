use serde::{Serialize, Deserialize};

pub use Inst::*;
pub use InstValue::*;

#[macro_export]
macro_rules! inst {
    // R-形式
    (Add $rd:expr, $rs1:expr, $rs2:expr) => { Inst::Add { rd: $rd, rs1: $rs1, rs2: $rs2 } };
    (Sub $rd:expr, $rs1:expr, $rs2:expr) => { Inst::Sub { rd: $rd, rs1: $rs1, rs2: $rs2 } };
    (And $rd:expr, $rs1:expr, $rs2:expr) => { Inst::And { rd: $rd, rs1: $rs1, rs2: $rs2 } };
    (Or  $rd:expr, $rs1:expr, $rs2:expr) => { Inst::Or  { rd: $rd, rs1: $rs1, rs2: $rs2 } };
    (Xor $rd:expr, $rs1:expr, $rs2:expr) => { Inst::Xor { rd: $rd, rs1: $rs1, rs2: $rs2 } };
    (Srl $rd:expr, $rs1:expr, $rs2:expr) => { Inst::Srl { rd: $rd, rs1: $rs1, rs2: $rs2 } };
    (Sra $rd:expr, $rs1:expr, $rs2:expr) => { Inst::Sra { rd: $rd, rs1: $rs1, rs2: $rs2 } };
    (Sll $rd:expr, $rs1:expr, $rs2:expr) => { Inst::Sll { rd: $rd, rs1: $rs1, rs2: $rs2 } };

    // I-形式
    (Addi $rd:expr, $rs1:expr, $value:expr) => { Inst::Addi { rd: $rd, rs1: $rs1, value: $value } };
    (Subi $rd:expr, $rs1:expr, $value:expr) => { Inst::Subi { rd: $rd, rs1: $rs1, value: $value } };
    (Andi $rd:expr, $rs1:expr, $value:expr) => { Inst::Andi { rd: $rd, rs1: $rs1, value: $value } };
    (Ori  $rd:expr, $rs1:expr, $value:expr) => { Inst::Ori  { rd: $rd, rs1: $rs1, value: $value } };
    (Xori $rd:expr, $rs1:expr, $value:expr) => { Inst::Xori { rd: $rd, rs1: $rs1, value: $value } };
    (Srli $rd:expr, $rs1:expr, $value:expr) => { Inst::Srli { rd: $rd, rs1: $rs1, value: $value } };
    (Srai $rd:expr, $rs1:expr, $value:expr) => { Inst::Srai { rd: $rd, rs1: $rs1, value: $value } };
    (Slli $rd:expr, $rs1:expr, $value:expr) => { Inst::Slli { rd: $rd, rs1: $rs1, value: $value } };
    (Lb   $rd:expr, $rs1:expr, $imm:expr) => { Inst::Lb  { rd: $rd, rs1: $rs1, imm: $imm } };
    (Lbu  $rd:expr, $rs1:expr, $imm:expr) => { Inst::Lbu { rd: $rd, rs1: $rs1, imm: $imm } };
    (Lh   $rd:expr, $rs1:expr, $imm:expr) => { Inst::Lh  { rd: $rd, rs1: $rs1, imm: $imm } };
    (Lhu  $rd:expr, $rs1:expr, $imm:expr) => { Inst::Lhu { rd: $rd, rs1: $rs1, imm: $imm } };
    (Lw   $rd:expr, $rs1:expr, $imm:expr) => { Inst::Lw  { rd: $rd, rs1: $rs1, imm: $imm } };
    (Jal  $rd:expr, $rs1:expr, $imm:expr) => { Inst::Jal { rd: $rd, rs1: $rs1, imm: $imm } };
    (In   $rd:expr, $rs1:expr, $imm:expr) => { Inst::In  { rd: $rd, rs1: $rs1, imm: $imm } };

    // B-形式
    (Beq $rd:expr, $rs1:expr, $rs2:expr, $value:expr) => { Inst::Beq { rd: $rd, rs1: $rs1, rs2: $rs2, value: $value } };
    (Bne $rd:expr, $rs1:expr, $rs2:expr, $value:expr) => { Inst::Bne { rd: $rd, rs1: $rs1, rs2: $rs2, value: $value } };
    (Blt $rd:expr, $rs1:expr, $rs2:expr, $value:expr) => { Inst::Blt { rd: $rd, rs1: $rs1, rs2: $rs2, value: $value } };
    (Ble $rd:expr, $rs1:expr, $rs2:expr, $value:expr) => { Inst::Ble { rd: $rd, rs1: $rs1, rs2: $rs2, value: $value } };

    // S-形式
    (Sb  $rs1:expr, $rs2:expr, $imm:expr) => { Inst::Sb  { rs1: $rs1, rs2: $rs2, imm: $imm } };
    (Sh  $rs1:expr, $rs2:expr, $imm:expr) => { Inst::Sh  { rs1: $rs1, rs2: $rs2, imm: $imm } };
    (Sw  $rs1:expr, $rs2:expr, $imm:expr) => { Inst::Sw  { rs1: $rs1, rs2: $rs2, imm: $imm } };
    (Out $rs1:expr, $rs2:expr, $imm:expr) => { Inst::Out { rs1: $rs1, rs2: $rs2, imm: $imm } };

    // ラベル
    (Label $label:expr) => { Inst::Label { label: $label } };
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Inst {
    // R-形式
    Add { rd: u8, rs1: u8, rs2: u8 },
    Sub { rd: u8, rs1: u8, rs2: u8 },
    And { rd: u8, rs1: u8, rs2: u8 },
    Or  { rd: u8, rs1: u8, rs2: u8 },
    Xor { rd: u8, rs1: u8, rs2: u8 },
    Srl { rd: u8, rs1: u8, rs2: u8 },
    Sra { rd: u8, rs1: u8, rs2: u8 },
    Sll { rd: u8, rs1: u8, rs2: u8 },

    // I-形式
    Addi { rd: u8, rs1: u8, value: InstValue },
    Subi { rd: u8, rs1: u8, value: InstValue },
    Andi { rd: u8, rs1: u8, value: InstValue },
    Ori  { rd: u8, rs1: u8, value: InstValue },
    Xori { rd: u8, rs1: u8, value: InstValue },
    Srli { rd: u8, rs1: u8, value: InstValue },
    Srai { rd: u8, rs1: u8, value: InstValue },
    Slli { rd: u8, rs1: u8, value: InstValue },
    Lb   { rd: u8, rs1: u8, imm: i32 },
    Lbu  { rd: u8, rs1: u8, imm: i32 },
    Lh   { rd: u8, rs1: u8, imm: i32 },
    Lhu  { rd: u8, rs1: u8, imm: i32 },
    Lw   { rd: u8, rs1: u8, imm: i32 },
    Jal  { rd: u8, rs1: u8, imm: i32 },
    In   { rd: u8, rs1: u8, imm: i32 },

    // B-形式
    Beq { rd: u8, rs1: u8, rs2: u8, value: InstValue },
    Bne { rd: u8, rs1: u8, rs2: u8, value: InstValue },
    Blt { rd: u8, rs1: u8, rs2: u8, value: InstValue },
    Ble { rd: u8, rs1: u8, rs2: u8, value: InstValue },

    // S-形式
    Sb  { rs1: u8, rs2: u8, imm: i32 },
    Sh  { rs1: u8, rs2: u8, imm: i32 },
    Sw  { rs1: u8, rs2: u8, imm: i32 },
    Out { rs1: u8, rs2: u8, imm: i32 },

    // ラベル
    Label { label: u32 },
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum InstValue {
    DataLabel(u32),
    InstLabel(u32),
    Function(String),
    Imm(i32),
}
