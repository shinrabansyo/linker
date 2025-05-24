use std::fmt::Write;

use sb_linker_obj::inst::{Inst, InstValue};
use sb_linker_obj::Object;

pub fn write_insts<W: Write>(buf: &mut W, obj: Object) -> anyhow::Result<()> {
    // 変換に使用するクロージャ
    macro_rules! write_value {
        ($buf:expr, $value:expr) => {
            match $value {
                InstValue::InstLabel(label) => writeln!($buf, "@{}.{}", obj.name, label),
                InstValue::Function(fname) => writeln!($buf, "@{}", fname),
                InstValue::Imm(imm) => writeln!($buf, "{}", imm),
                _ => unimplemented!(),
            }
        };
    }

    let mut write_inst = |inst: &Inst| {
        match inst {
            // R-形式
            Inst::Add { rd, rs1, rs2 } => {
                writeln!(buf, "  add  r{} = r{}, r{}", rd, rs1, rs2)
            }
            Inst::Sub { rd, rs1, rs2 } => {
                writeln!(buf, "  sub  r{} = r{}, r{}", rd, rs1, rs2)
            }
            Inst::And { rd, rs1, rs2 } => {
                writeln!(buf, "  and  r{} = r{}, r{}", rd, rs1, rs2)
            }
            Inst::Or  { rd, rs1, rs2 } => {
                writeln!(buf, "  or   r{} = r{}, r{}", rd, rs1, rs2)
            }
            Inst::Xor { rd, rs1, rs2 } => {
                writeln!(buf, "  xor  r{} = r{}, r{}", rd, rs1, rs2)
            }
            Inst::Srl { rd, rs1, rs2 } => {
                writeln!(buf, "  srl  r{} = r{}, r{}", rd, rs1, rs2)
            }
            Inst::Sra { rd, rs1, rs2 } => {
                writeln!(buf, "  sra  r{} = r{}, r{}", rd, rs1, rs2)
            }
            Inst::Sll { rd, rs1, rs2 } => {
                writeln!(buf, "  sll  r{} = r{}, r{}", rd, rs1, rs2)
            }

            // I-形式
            Inst::Addi { rd, rs1, value } => {
                write!(buf, "  addi r{} = r{}, ", rd, rs1)?;
                write_value!(buf, value)
            }
            Inst::Subi { rd, rs1, value } => {
                write!(buf, "  subi r{} = r{}, ", rd, rs1)?;
                write_value!(buf, value)
            }
            Inst::Andi { rd, rs1, value } => {
                write!(buf, "  andi r{} = r{}, ", rd, rs1)?;
                write_value!(buf, value)
            }
            Inst::Ori  { rd, rs1, value } => {
                write!(buf, "  ori  r{} = r{}, ", rd, rs1)?;
                write_value!(buf, value)
            }
            Inst::Xori { rd, rs1, value } => {
                write!(buf, "  xori r{} = r{}, ", rd, rs1)?;
                write_value!(buf, value)
            }
            Inst::Srli { rd, rs1, value } => {
                write!(buf, "  srli r{} = r{}, ", rd, rs1)?;
                write_value!(buf, value)
            }
            Inst::Srai { rd, rs1, value } => {
                write!(buf, "  srai r{} = r{}, ", rd, rs1)?;
                write_value!(buf, value)
            }
            Inst::Slli { rd, rs1, value } => {
                write!(buf, "  slli r{} = r{}, ", rd, rs1)?;
                write_value!(buf, value)
            }
            Inst::Lb   { rd, rs1, imm } => {
                writeln!(buf, "  lb   r{} = r{}[{}]", rd, rs1, imm)
            }
            Inst::Lbu  { rd, rs1, imm } => {
                writeln!(buf, "  lbu  r{} = r{}[{}]", rd, rs1, imm)
            }
            Inst::Lh   { rd, rs1, imm } => {
                writeln!(buf, "  lh   r{} = r{}[{}]", rd, rs1, imm)
            }
            Inst::Lhu  { rd, rs1, imm } => {
                writeln!(buf, "  lhu  r{} = r{}[{}]", rd, rs1, imm)
            }
            Inst::Lw   { rd, rs1, imm } => {
                writeln!(buf, "  lw   r{} = r{}[{}]", rd, rs1, imm)
            }
            Inst::Jal  { rd, rs1, imm } => {
                writeln!(buf, "  jal  r{}, r{}[{}]", rd, rs1, imm)
            }
            Inst::In   { rd, rs1, imm } => {
                writeln!(buf, "  in   r{} = r{}[{}]", rd, rs1, imm)
            }

            // B-形式
            Inst::Beq { rd, rs1, rs2, value } => {
                write!(buf, "  beq  r{}, (r{}, r{}) -> ", rd, rs1, rs2)?;
                write_value!(buf, value)
            }
            Inst::Bne { rd, rs1, rs2, value } => {
                write!(buf, "  bne  r{}, (r{}, r{}) -> ", rd, rs1, rs2)?;
                write_value!(buf, value)
            }
            Inst::Blt { rd, rs1, rs2, value } => {
                write!(buf, "  blt  r{}, (r{}, r{}) -> ", rd, rs1, rs2)?;
                write_value!(buf, value)
            }
            Inst::Ble { rd, rs1, rs2, value } => {
                write!(buf, "  ble  r{}, (r{}, r{}) -> ", rd, rs1, rs2)?;
                write_value!(buf, value)
            }

            // S-形式
            Inst::Sb { rs1, rs2, imm } => {
                writeln!(buf, "  sb   r{}[{}] = r{}", rs1, imm, rs2)
            }
            Inst::Sh { rs1, rs2, imm } => {
                writeln!(buf, "  sh   r{}[{}] = r{}", rs1, imm, rs2)
            }
            Inst::Sw { rs1, rs2, imm } => {
                writeln!(buf, "  sw   r{}[{}] = r{}", rs1, imm, rs2)
            }
            Inst::Out { rs1, rs2, imm } => {
                writeln!(buf, "  out  r{}[{}] = r{}", rs1, imm, rs2)
            }

            // ラベル
            Inst::Label { label} => {
                writeln!(buf, "@{}.{}", obj.name, label)
            }
        }
    };

    // 変換処理本体
    for inst in obj.code.iter() {
        write_inst(inst)?;
    }

    Ok(())
}
