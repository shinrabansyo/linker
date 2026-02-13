
===
@__entrypoint
  addi r2 = r0, 4096
  beq  r1, (r0, r0) -> @.main.main
  beq  r0, (r0, r0) -> 0
@.main.vec2_new
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  subi r4 = r3, 20
  subi r2 = r2, 16
  add  r21 = r0, r10
  add  r20 = r0, r11
  addi r22 = r0, 8
  add  r10 = r0, r22
  beq  r1, (r0, r0) -> @.main.malloc
  add  r22 = r0, r10
  add  r7 = r0, r22
  sw   r7[0] = r21
  add  r7 = r0, r22
  sw   r7[4] = r20
  add  r10 = r0, r22
@.main.vec2_new.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r3 = r3[0]
  addi r2 = r2, 20
  jal  r0, r1[0]
@.main.vec2_free
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  subi r4 = r3, 12
  subi r2 = r2, 8
  add  r20 = r0, r10
  add  r10 = r0, r20
  beq  r1, (r0, r0) -> @.main.free
@.main.vec2_free.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r3 = r3[0]
  addi r2 = r2, 12
  jal  r0, r1[0]
@.main.vec2_dot
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  sw   r3[-28] = r25
  sw   r3[-32] = r26
  sw   r3[-36] = r27
  subi r4 = r3, 40
  subi r2 = r2, 36
  add  r22 = r0, r10
  add  r21 = r0, r11
  addi r20 = r0, 0
  add  r20 = r22, r20
  add  r7 = r0, r20
  lw   r20 = r7[0]
  addi r23 = r0, 0
  add  r23 = r21, r23
  add  r7 = r0, r23
  lw   r24 = r7[0]
  add  r23 = r0, r20
  add  r26 = r0, r24
  addi r20 = r0, 0
  addi r24 = r0, 32
  addi r25 = r0, 1
@.main.vec2_dot.0
  bne  r0, (r24, r0) -> 12
  beq  r0, (r0, r0) -> @.main.vec2_dot.1
  and  r27 = r26, r25
  sub  r27 = r0, r27
  and  r27 = r23, r27
  add  r20 = r20, r27
  sll  r23 = r23, r25
  srl  r26 = r26, r25
  sub  r24 = r24, r25
  beq  r0, (r0, r0) -> @.main.vec2_dot.0
@.main.vec2_dot.1
  addi r23 = r0, 4
  add  r22 = r22, r23
  add  r7 = r0, r22
  lw   r22 = r7[0]
  addi r23 = r0, 4
  add  r21 = r21, r23
  add  r7 = r0, r21
  lw   r23 = r7[0]
  add  r21 = r0, r22
  add  r22 = r0, r23
  addi r26 = r0, 0
  addi r23 = r0, 32
  addi r24 = r0, 1
@.main.vec2_dot.2
  bne  r0, (r23, r0) -> 12
  beq  r0, (r0, r0) -> @.main.vec2_dot.3
  and  r25 = r22, r24
  sub  r25 = r0, r25
  and  r25 = r21, r25
  add  r26 = r26, r25
  sll  r21 = r21, r24
  srl  r22 = r22, r24
  sub  r23 = r23, r24
  beq  r0, (r0, r0) -> @.main.vec2_dot.2
@.main.vec2_dot.3
  add  r20 = r20, r26
  add  r10 = r0, r20
@.main.vec2_dot.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r25 = r3[-28]
  lw   r26 = r3[-32]
  lw   r27 = r3[-36]
  lw   r3 = r3[0]
  addi r2 = r2, 40
  jal  r0, r1[0]
@.main.main
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  subi r4 = r3, 20
  subi r2 = r2, 16
  addi r20 = r0, 4096
  add  r10 = r0, r20
  beq  r1, (r0, r0) -> @.main.init_heap_area
  addi r20 = r0, 1
  add  r10 = r0, r20
  beq  r1, (r0, r0) -> @.main.println_i32
  addi r20 = r0, 1
  add  r10 = r0, r20
  addi r20 = r0, 2
  add  r11 = r0, r20
  beq  r1, (r0, r0) -> @.main.vec2_new
  add  r20 = r0, r10
  addi r21 = r0, 2
  add  r10 = r0, r21
  beq  r1, (r0, r0) -> @.main.println_i32
  addi r21 = r0, 3
  add  r10 = r0, r21
  addi r21 = r0, 4
  add  r11 = r0, r21
  beq  r1, (r0, r0) -> @.main.vec2_new
  add  r22 = r0, r10
  addi r21 = r0, 3
  add  r10 = r0, r21
  beq  r1, (r0, r0) -> @.main.println_i32
  add  r10 = r0, r20
  add  r11 = r0, r22
  beq  r1, (r0, r0) -> @.main.vec2_dot
  beq  r1, (r0, r0) -> @.main.println_i32
  add  r10 = r0, r20
  beq  r1, (r0, r0) -> @.main.vec2_free
  add  r10 = r0, r22
  beq  r1, (r0, r0) -> @.main.vec2_free
@.main.main.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r3 = r3[0]
  addi r2 = r2, 20
  jal  r0, r1[0]
  add  r0 = r0, r0
  add  r0 = r0, r0
@.main.print_char
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  subi r4 = r3, 12
  subi r2 = r2, 8
  add  r20 = r0, r10
  out  r0[0] = r20
@.main.print_char.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r3 = r3[0]
  addi r2 = r2, 12
  jal  r0, r1[0]
@.main.println_char
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  subi r4 = r3, 12
  subi r2 = r2, 8
  add  r20 = r0, r10
  add  r10 = r0, r20
  beq  r1, (r0, r0) -> @.main.print_char
  addi r20 = r0, 10
  out  r0[0] = r20
@.main.println_char.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r3 = r3[0]
  addi r2 = r2, 12
  jal  r0, r1[0]
@.main.print_i32
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  sw   r3[-28] = r25
  sw   r3[-32] = r26
  sw   r3[-36] = r27
  sw   r3[-40] = r28
  subi r4 = r3, 44
  subi r2 = r2, 40
  add  r22 = r0, r10
  addi r20 = r0, 10
  ble  r0, (r20, r22) -> 12
  beq  r0, (r0, r0) -> @.main.print_i32.0
  addi r20 = r0, 1
  beq  r0, (r0, r0) -> @.main.print_i32.1
@.main.print_i32.0
  addi r20 = r0, 0
@.main.print_i32.1
  bne  r0, (r20, r0) -> 12
  beq  r0, (r0, r0) -> @.main.print_i32.5
  addi r21 = r0, 10
  add  r20 = r0, r22
  xor  r23 = r20, r21
  addi r24 = r0, 31
  srl  r23 = r23, r24
  ble  r0, (r0, r20) -> 12
  sub  r20 = r0, r20
  ble  r0, (r0, r21) -> 12
  sub  r21 = r0, r21
  addi r24 = r0, 1
  addi r25 = r0, 0
  addi r26 = r0, 31
@.main.print_i32.2
  srl  r27 = r20, r26
  ble  r0, (r21, r27) -> 12
  beq  r0, (r0, r0) -> @.main.print_i32.3
  sll  r27 = r21, r26
  sub  r20 = r20, r27
  sll  r27 = r24, r26
  or   r25 = r25, r27
@.main.print_i32.3
  beq  r0, (r26, r0) -> 18
  sub  r26 = r26, r24
  beq  r0, (r0, r0) -> @.main.print_i32.2
@.main.print_i32.4
  beq  r0, (r0, r23) -> 12
  sub  r25 = r0, r25
  add  r10 = r0, r25
  beq  r1, (r0, r0) -> @.main.print_i32
  beq  r0, (r0, r0) -> @.main.print_i32.6
@.main.print_i32.5
  add  r0 = r12, r4
@.main.print_i32.6
  addi r24 = r0, 10
  add  r23 = r0, r22
  add  r22 = r0, r24
  addi r24 = r0, 31
  srl  r24 = r23, r24
  ble  r0, (r0, r23) -> 12
  sub  r23 = r0, r23
  ble  r0, (r0, r22) -> 12
  sub  r22 = r0, r22
  addi r27 = r0, 1
  addi r25 = r0, 0
  addi r26 = r0, 31
@.main.print_i32.7
  srl  r28 = r23, r26
  ble  r0, (r22, r28) -> 12
  beq  r0, (r0, r0) -> @.main.print_i32.8
  sll  r28 = r22, r26
  sub  r23 = r23, r28
  sll  r28 = r27, r26
  or   r25 = r25, r28
@.main.print_i32.8
  beq  r0, (r26, r0) -> 18
  sub  r26 = r26, r27
  beq  r0, (r0, r0) -> @.main.print_i32.7
@.main.print_i32.9
  beq  r0, (r0, r24) -> 12
  sub  r23 = r0, r23
  addi r24 = r0, 48
  add  r23 = r23, r24
  out  r0[0] = r23
@.main.print_i32.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r25 = r3[-28]
  lw   r26 = r3[-32]
  lw   r27 = r3[-36]
  lw   r28 = r3[-40]
  lw   r3 = r3[0]
  addi r2 = r2, 44
  jal  r0, r1[0]
@.main.println_i32
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  subi r4 = r3, 12
  subi r2 = r2, 8
  add  r20 = r0, r10
  add  r10 = r0, r20
  beq  r1, (r0, r0) -> @.main.print_i32
  addi r20 = r0, 10
  out  r0[0] = r20
@.main.println_i32.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r3 = r3[0]
  addi r2 = r2, 12
  jal  r0, r1[0]
@.main.init_display_16
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  subi r4 = r3, 12
  subi r2 = r2, 8
  addi r20 = r0, 2
  out  r0[6] = r20
@.main.init_display_16.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r3 = r3[0]
  addi r2 = r2, 12
  jal  r0, r1[0]
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
@.main.set_pallet
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  subi r4 = r3, 28
  subi r2 = r2, 24
  add  r23 = r0, r10
  add  r22 = r0, r11
  add  r21 = r0, r12
  add  r20 = r0, r13
  addi r24 = r0, 24
  sll  r23 = r23, r24
  addi r24 = r0, 16
  sll  r22 = r22, r24
  or   r22 = r23, r22
  addi r23 = r0, 8
  sll  r21 = r21, r23
  or   r21 = r22, r21
  or   r20 = r21, r20
  out  r0[7] = r20
@.main.set_pallet.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r3 = r3[0]
  addi r2 = r2, 28
  jal  r0, r1[0]
@.main.draw_pixel
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  subi r4 = r3, 24
  subi r2 = r2, 20
  add  r23 = r0, r10
  add  r21 = r0, r11
  add  r20 = r0, r12
  addi r22 = r0, 268435456
  add  r22 = r22, r23
  addi r23 = r0, 7
  sll  r21 = r21, r23
  add  r21 = r22, r21
  add  r7 = r0, r21
  out  r7[0] = r20
@.main.draw_pixel.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r3 = r3[0]
  addi r2 = r2, 24
  jal  r0, r1[0]
@.main.draw_hline
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  subi r4 = r3, 28
  subi r2 = r2, 24
  add  r22 = r0, r10
  add  r20 = r0, r11
  add  r23 = r0, r12
  add  r21 = r0, r13
@.main.draw_hline.2
  ble  r0, (r22, r20) -> 12
  beq  r0, (r0, r0) -> @.main.draw_hline.0
  addi r24 = r0, 1
  beq  r0, (r0, r0) -> @.main.draw_hline.1
@.main.draw_hline.0
  addi r24 = r0, 0
@.main.draw_hline.1
  bne  r0, (r24, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_hline.3
  add  r10 = r0, r22
  add  r11 = r0, r23
  add  r12 = r0, r21
  beq  r1, (r0, r0) -> @.main.draw_pixel
  addi r24 = r0, 1
  add  r22 = r22, r24
  beq  r0, (r0, r0) -> @.main.draw_hline.2
@.main.draw_hline.3
  add  r0 = r12, r4
@.main.draw_hline.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r3 = r3[0]
  addi r2 = r2, 28
  jal  r0, r1[0]
@.main.draw_vline
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  subi r4 = r3, 28
  subi r2 = r2, 24
  add  r22 = r0, r10
  add  r23 = r0, r11
  add  r21 = r0, r12
  add  r20 = r0, r13
@.main.draw_vline.6
  ble  r0, (r23, r21) -> 12
  beq  r0, (r0, r0) -> @.main.draw_vline.4
  addi r24 = r0, 1
  beq  r0, (r0, r0) -> @.main.draw_vline.5
@.main.draw_vline.4
  addi r24 = r0, 0
@.main.draw_vline.5
  bne  r0, (r24, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_vline.7
  add  r10 = r0, r22
  add  r11 = r0, r23
  add  r12 = r0, r20
  beq  r1, (r0, r0) -> @.main.draw_pixel
  addi r24 = r0, 1
  add  r23 = r23, r24
  beq  r0, (r0, r0) -> @.main.draw_vline.6
@.main.draw_vline.7
  add  r0 = r12, r4
@.main.draw_vline.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r3 = r3[0]
  addi r2 = r2, 28
  jal  r0, r1[0]
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
@.main.draw_rect
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  sw   r3[-28] = r25
  sw   r3[-32] = r26
  sw   r3[-36] = r27
  subi r4 = r3, 40
  subi r2 = r2, 36
  add  r21 = r0, r10
  add  r22 = r0, r11
  add  r24 = r0, r12
  add  r25 = r0, r13
  add  r23 = r0, r14
  addi r20 = r0, 0
@.main.draw_rect.14
  blt  r0, (r20, r25) -> 12
  beq  r0, (r0, r0) -> @.main.draw_rect.8
  addi r26 = r0, 1
  beq  r0, (r0, r0) -> @.main.draw_rect.9
@.main.draw_rect.8
  addi r26 = r0, 0
@.main.draw_rect.9
  bne  r0, (r26, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_rect.15
  addi r26 = r0, 0
@.main.draw_rect.12
  blt  r0, (r26, r24) -> 12
  beq  r0, (r0, r0) -> @.main.draw_rect.10
  addi r27 = r0, 1
  beq  r0, (r0, r0) -> @.main.draw_rect.11
@.main.draw_rect.10
  addi r27 = r0, 0
@.main.draw_rect.11
  bne  r0, (r27, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_rect.13
  add  r27 = r21, r26
  add  r10 = r0, r27
  add  r27 = r22, r20
  add  r11 = r0, r27
  add  r12 = r0, r23
  beq  r1, (r0, r0) -> @.main.draw_pixel
  addi r27 = r0, 1
  add  r26 = r26, r27
  beq  r0, (r0, r0) -> @.main.draw_rect.12
@.main.draw_rect.13
  addi r26 = r0, 1
  add  r20 = r20, r26
  beq  r0, (r0, r0) -> @.main.draw_rect.14
@.main.draw_rect.15
  add  r0 = r12, r4
@.main.draw_rect.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r25 = r3[-28]
  lw   r26 = r3[-32]
  lw   r27 = r3[-36]
  lw   r3 = r3[0]
  addi r2 = r2, 40
  jal  r0, r1[0]
@.main.draw_rect_line
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  sw   r3[-28] = r25
  sw   r3[-32] = r26
  sw   r3[-36] = r27
  subi r4 = r3, 40
  subi r2 = r2, 36
  add  r23 = r0, r10
  add  r24 = r0, r11
  add  r21 = r0, r12
  add  r20 = r0, r13
  add  r22 = r0, r14
  addi r25 = r0, 0
@.main.draw_rect_line.18
  blt  r0, (r25, r21) -> 12
  beq  r0, (r0, r0) -> @.main.draw_rect_line.16
  addi r26 = r0, 1
  beq  r0, (r0, r0) -> @.main.draw_rect_line.17
@.main.draw_rect_line.16
  addi r26 = r0, 0
@.main.draw_rect_line.17
  bne  r0, (r26, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_rect_line.19
  add  r26 = r23, r25
  add  r10 = r0, r26
  add  r11 = r0, r24
  add  r12 = r0, r22
  beq  r1, (r0, r0) -> @.main.draw_pixel
  add  r26 = r23, r25
  add  r10 = r0, r26
  add  r26 = r24, r20
  addi r27 = r0, 1
  sub  r26 = r26, r27
  add  r11 = r0, r26
  add  r12 = r0, r22
  beq  r1, (r0, r0) -> @.main.draw_pixel
  addi r26 = r0, 1
  add  r25 = r25, r26
  beq  r0, (r0, r0) -> @.main.draw_rect_line.18
@.main.draw_rect_line.19
  addi r25 = r0, 0
@.main.draw_rect_line.22
  blt  r0, (r25, r20) -> 12
  beq  r0, (r0, r0) -> @.main.draw_rect_line.20
  addi r26 = r0, 1
  beq  r0, (r0, r0) -> @.main.draw_rect_line.21
@.main.draw_rect_line.20
  addi r26 = r0, 0
@.main.draw_rect_line.21
  bne  r0, (r26, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_rect_line.23
  add  r10 = r0, r23
  add  r26 = r24, r25
  add  r11 = r0, r26
  add  r12 = r0, r22
  beq  r1, (r0, r0) -> @.main.draw_pixel
  add  r27 = r23, r21
  addi r26 = r0, 1
  sub  r26 = r27, r26
  add  r10 = r0, r26
  add  r26 = r24, r25
  add  r11 = r0, r26
  add  r12 = r0, r22
  beq  r1, (r0, r0) -> @.main.draw_pixel
  addi r26 = r0, 1
  add  r25 = r25, r26
  beq  r0, (r0, r0) -> @.main.draw_rect_line.22
@.main.draw_rect_line.23
  add  r0 = r12, r4
@.main.draw_rect_line.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r25 = r3[-28]
  lw   r26 = r3[-32]
  lw   r27 = r3[-36]
  lw   r3 = r3[0]
  addi r2 = r2, 40
  jal  r0, r1[0]
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
@.main.draw_circle
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  sw   r3[-28] = r25
  sw   r3[-32] = r26
  sw   r3[-36] = r27
  sw   r3[-40] = r28
  sw   r3[-44] = r29
  subi r4 = r3, 48
  subi r2 = r2, 60
  add  r24 = r0, r10
  add  r23 = r0, r11
  add  r22 = r0, r12
  add  r20 = r0, r13
  addi r21 = r0, 0
  addi r25 = r0, 1
  sub  r25 = r25, r22
@.main.draw_circle.34
  ble  r0, (r21, r22) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle.24
  addi r26 = r0, 1
  beq  r0, (r0, r0) -> @.main.draw_circle.25
@.main.draw_circle.24
  addi r26 = r0, 0
@.main.draw_circle.25
  bne  r0, (r26, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle.35
  sub  r26 = r24, r21
  add  r10 = r0, r26
  add  r26 = r24, r21
  add  r11 = r0, r26
  add  r26 = r23, r22
  add  r12 = r0, r26
  add  r13 = r0, r20
  beq  r1, (r0, r0) -> @.main.draw_hline
  sub  r26 = r24, r21
  add  r10 = r0, r26
  add  r26 = r24, r21
  add  r11 = r0, r26
  sub  r26 = r23, r22
  add  r12 = r0, r26
  add  r13 = r0, r20
  beq  r1, (r0, r0) -> @.main.draw_hline
  sub  r26 = r24, r22
  add  r10 = r0, r26
  add  r26 = r24, r22
  add  r11 = r0, r26
  add  r26 = r23, r21
  add  r12 = r0, r26
  add  r13 = r0, r20
  beq  r1, (r0, r0) -> @.main.draw_hline
  sub  r26 = r24, r22
  add  r10 = r0, r26
  add  r26 = r24, r22
  add  r11 = r0, r26
  sub  r26 = r23, r21
  add  r12 = r0, r26
  add  r13 = r0, r20
  beq  r1, (r0, r0) -> @.main.draw_hline
  addi r26 = r0, 0
  blt  r0, (r25, r26) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle.26
  addi r26 = r0, 1
  beq  r0, (r0, r0) -> @.main.draw_circle.27
@.main.draw_circle.26
  addi r26 = r0, 0
@.main.draw_circle.27
  bne  r0, (r26, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle.32
  addi r26 = r0, 2
  add  r28 = r0, r26
  add  r5 = r0, r21
  sw   r4[-4] = r5
  addi r26 = r0, 0
  addi r29 = r0, 32
  addi r27 = r0, 1
@.main.draw_circle.28
  bne  r0, (r29, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle.29
  lw   r6 = r4[-4]
  and  r5 = r6, r27
  sw   r4[-8] = r5
  lw   r7 = r4[-8]
  sub  r5 = r0, r7
  sw   r4[-8] = r5
  lw   r7 = r4[-8]
  and  r5 = r28, r7
  sw   r4[-8] = r5
  lw   r7 = r4[-8]
  add  r26 = r26, r7
  sll  r28 = r28, r27
  lw   r6 = r4[-4]
  srl  r5 = r6, r27
  sw   r4[-4] = r5
  sub  r29 = r29, r27
  beq  r0, (r0, r0) -> @.main.draw_circle.28
@.main.draw_circle.29
  addi r27 = r0, 3
  add  r26 = r26, r27
  add  r25 = r25, r26
  beq  r0, (r0, r0) -> @.main.draw_circle.33
@.main.draw_circle.32
  addi r26 = r0, 2
  sub  r27 = r21, r22
  add  r5 = r0, r27
  sw   r4[0] = r5
  addi r27 = r0, 0
  addi r5 = r0, 32
  sw   r4[-12] = r5
  addi r28 = r0, 1
@.main.draw_circle.30
  lw   r6 = r4[-12]
  bne  r0, (r6, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle.31
  lw   r6 = r4[0]
  and  r29 = r6, r28
  sub  r29 = r0, r29
  and  r29 = r26, r29
  add  r27 = r27, r29
  sll  r26 = r26, r28
  lw   r6 = r4[0]
  srl  r5 = r6, r28
  sw   r4[0] = r5
  lw   r6 = r4[-12]
  sub  r5 = r6, r28
  sw   r4[-12] = r5
  beq  r0, (r0, r0) -> @.main.draw_circle.30
@.main.draw_circle.31
  addi r26 = r0, 5
  add  r26 = r27, r26
  add  r25 = r25, r26
  addi r26 = r0, 1
  sub  r22 = r22, r26
@.main.draw_circle.33
  addi r26 = r0, 1
  add  r21 = r21, r26
  beq  r0, (r0, r0) -> @.main.draw_circle.34
@.main.draw_circle.35
  add  r0 = r12, r4
@.main.draw_circle.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r25 = r3[-28]
  lw   r26 = r3[-32]
  lw   r27 = r3[-36]
  lw   r28 = r3[-40]
  lw   r29 = r3[-44]
  lw   r3 = r3[0]
  addi r2 = r2, 64
  jal  r0, r1[0]
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
@.main.draw_circle_line
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  sw   r3[-28] = r25
  sw   r3[-32] = r26
  sw   r3[-36] = r27
  sw   r3[-40] = r28
  sw   r3[-44] = r29
  subi r4 = r3, 48
  subi r2 = r2, 60
  add  r24 = r0, r10
  add  r22 = r0, r11
  add  r20 = r0, r12
  add  r23 = r0, r13
  addi r21 = r0, 0
  addi r25 = r0, 1
  sub  r25 = r25, r20
@.main.draw_circle_line.46
  ble  r0, (r21, r20) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle_line.36
  addi r26 = r0, 1
  beq  r0, (r0, r0) -> @.main.draw_circle_line.37
@.main.draw_circle_line.36
  addi r26 = r0, 0
@.main.draw_circle_line.37
  bne  r0, (r26, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle_line.47
  add  r26 = r24, r21
  add  r10 = r0, r26
  add  r26 = r22, r20
  add  r11 = r0, r26
  add  r12 = r0, r23
  beq  r1, (r0, r0) -> @.main.draw_pixel
  sub  r26 = r24, r21
  add  r10 = r0, r26
  add  r26 = r22, r20
  add  r11 = r0, r26
  add  r12 = r0, r23
  beq  r1, (r0, r0) -> @.main.draw_pixel
  add  r26 = r24, r21
  add  r10 = r0, r26
  sub  r26 = r22, r20
  add  r11 = r0, r26
  add  r12 = r0, r23
  beq  r1, (r0, r0) -> @.main.draw_pixel
  sub  r26 = r24, r21
  add  r10 = r0, r26
  sub  r26 = r22, r20
  add  r11 = r0, r26
  add  r12 = r0, r23
  beq  r1, (r0, r0) -> @.main.draw_pixel
  add  r26 = r24, r20
  add  r10 = r0, r26
  add  r26 = r22, r21
  add  r11 = r0, r26
  add  r12 = r0, r23
  beq  r1, (r0, r0) -> @.main.draw_pixel
  sub  r26 = r24, r20
  add  r10 = r0, r26
  add  r26 = r22, r21
  add  r11 = r0, r26
  add  r12 = r0, r23
  beq  r1, (r0, r0) -> @.main.draw_pixel
  add  r26 = r24, r20
  add  r10 = r0, r26
  sub  r26 = r22, r21
  add  r11 = r0, r26
  add  r12 = r0, r23
  beq  r1, (r0, r0) -> @.main.draw_pixel
  sub  r26 = r24, r20
  add  r10 = r0, r26
  sub  r26 = r22, r21
  add  r11 = r0, r26
  add  r12 = r0, r23
  beq  r1, (r0, r0) -> @.main.draw_pixel
  addi r26 = r0, 0
  blt  r0, (r25, r26) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle_line.38
  addi r26 = r0, 1
  beq  r0, (r0, r0) -> @.main.draw_circle_line.39
@.main.draw_circle_line.38
  addi r26 = r0, 0
@.main.draw_circle_line.39
  bne  r0, (r26, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle_line.44
  addi r26 = r0, 2
  add  r5 = r0, r26
  sw   r4[-12] = r5
  add  r27 = r0, r21
  addi r26 = r0, 0
  addi r29 = r0, 32
  addi r28 = r0, 1
@.main.draw_circle_line.40
  bne  r0, (r29, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle_line.41
  and  r5 = r27, r28
  sw   r4[-4] = r5
  lw   r7 = r4[-4]
  sub  r5 = r0, r7
  sw   r4[-4] = r5
  lw   r6 = r4[-12]
  lw   r7 = r4[-4]
  and  r5 = r6, r7
  sw   r4[-4] = r5
  lw   r7 = r4[-4]
  add  r26 = r26, r7
  lw   r6 = r4[-12]
  sll  r5 = r6, r28
  sw   r4[-12] = r5
  srl  r27 = r27, r28
  sub  r29 = r29, r28
  beq  r0, (r0, r0) -> @.main.draw_circle_line.40
@.main.draw_circle_line.41
  addi r27 = r0, 3
  add  r26 = r26, r27
  add  r25 = r25, r26
  beq  r0, (r0, r0) -> @.main.draw_circle_line.45
@.main.draw_circle_line.44
  addi r26 = r0, 2
  sub  r27 = r21, r20
  add  r5 = r0, r27
  sw   r4[0] = r5
  addi r27 = r0, 0
  addi r29 = r0, 32
  addi r5 = r0, 1
  sw   r4[-8] = r5
@.main.draw_circle_line.42
  bne  r0, (r29, r0) -> 12
  beq  r0, (r0, r0) -> @.main.draw_circle_line.43
  lw   r6 = r4[0]
  lw   r7 = r4[-8]
  and  r28 = r6, r7
  sub  r28 = r0, r28
  and  r28 = r26, r28
  add  r27 = r27, r28
  lw   r7 = r4[-8]
  sll  r26 = r26, r7
  lw   r6 = r4[0]
  lw   r7 = r4[-8]
  srl  r5 = r6, r7
  sw   r4[0] = r5
  lw   r7 = r4[-8]
  sub  r29 = r29, r7
  beq  r0, (r0, r0) -> @.main.draw_circle_line.42
@.main.draw_circle_line.43
  addi r26 = r0, 5
  add  r26 = r27, r26
  add  r25 = r25, r26
  addi r26 = r0, 1
  sub  r20 = r20, r26
@.main.draw_circle_line.45
  addi r26 = r0, 1
  add  r21 = r21, r26
  beq  r0, (r0, r0) -> @.main.draw_circle_line.46
@.main.draw_circle_line.47
  add  r0 = r12, r4
@.main.draw_circle_line.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r25 = r3[-28]
  lw   r26 = r3[-32]
  lw   r27 = r3[-36]
  lw   r28 = r3[-40]
  lw   r29 = r3[-44]
  lw   r3 = r3[0]
  addi r2 = r2, 64
  jal  r0, r1[0]
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
@.main.rand_xorshift
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  subi r4 = r3, 16
  subi r2 = r2, 12
  add  r20 = r0, r10
  addi r21 = r0, 13
  sll  r21 = r20, r21
  xor  r21 = r20, r21
  add  r20 = r0, r21
  addi r21 = r0, 7
  srl  r21 = r20, r21
  xor  r21 = r20, r21
  add  r20 = r0, r21
  addi r21 = r0, 17
  sll  r21 = r20, r21
  xor  r21 = r20, r21
  add  r20 = r0, r21
  add  r10 = r0, r20
@.main.rand_xorshift.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r3 = r3[0]
  addi r2 = r2, 16
  jal  r0, r1[0]
@.main.free_list_search
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  subi r4 = r3, 24
  subi r2 = r2, 20
  add  r21 = r0, r10
  add  r20 = r0, r11
  addi r22 = r0, 1
  sub  r22 = r0, r22
  beq  r0, (r21, r22) -> 12
  beq  r0, (r0, r0) -> @.main.free_list_search.0
  addi r22 = r0, 1
  beq  r0, (r0, r0) -> @.main.free_list_search.1
@.main.free_list_search.0
  addi r22 = r0, 0
@.main.free_list_search.1
  bne  r0, (r22, r0) -> 12
  beq  r0, (r0, r0) -> @.main.free_list_search.2
  addi r22 = r0, 0
  add  r10 = r0, r22
  beq  r0, (r0, r0) -> @.main.free_list_search.4294967295
  beq  r0, (r0, r0) -> @.main.free_list_search.3
@.main.free_list_search.2
  add  r0 = r12, r4
@.main.free_list_search.3
  addi r22 = r0, 0
  add  r22 = r21, r22
  add  r7 = r0, r22
  lw   r22 = r7[0]
  blt  r0, (r22, r20) -> 12
  beq  r0, (r0, r0) -> @.main.free_list_search.4
  addi r22 = r0, 1
  beq  r0, (r0, r0) -> @.main.free_list_search.5
@.main.free_list_search.4
  addi r22 = r0, 0
@.main.free_list_search.5
  beq  r0, (r0, r22) -> 12
  beq  r0, (r0, r0) -> @.main.free_list_search.8
  addi r22 = r0, 0
  add  r22 = r21, r22
  add  r7 = r0, r22
  lw   r22 = r7[0]
  addi r23 = r0, 1
  sub  r23 = r0, r23
  beq  r0, (r22, r23) -> 12
  beq  r0, (r0, r0) -> @.main.free_list_search.6
  addi r22 = r0, 1
  beq  r0, (r0, r0) -> @.main.free_list_search.7
@.main.free_list_search.6
  addi r22 = r0, 0
@.main.free_list_search.7
  beq  r0, (r0, r22) -> 12
  beq  r0, (r0, r0) -> @.main.free_list_search.8
  addi r22 = r0, 0
  beq  r0, (r0, r0) -> @.main.free_list_search.9
@.main.free_list_search.8
  addi r22 = r0, 1
@.main.free_list_search.9
  bne  r0, (r22, r0) -> 12
  beq  r0, (r0, r0) -> @.main.free_list_search.10
  addi r22 = r0, 8
  add  r22 = r21, r22
  add  r7 = r0, r22
  lw   r22 = r7[0]
  add  r10 = r0, r22
  add  r11 = r0, r20
  beq  r1, (r0, r0) -> @.main.free_list_search
  beq  r0, (r0, r0) -> @.main.free_list_search.4294967295
  beq  r0, (r0, r0) -> @.main.free_list_search.11
@.main.free_list_search.10
  add  r0 = r12, r4
@.main.free_list_search.11
  add  r10 = r0, r21
@.main.free_list_search.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r3 = r3[0]
  addi r2 = r2, 24
  jal  r0, r1[0]
@.main.init_heap_area
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  sw   r3[-28] = r25
  sw   r3[-32] = r26
  sw   r3[-36] = r27
  subi r4 = r3, 40
  subi r2 = r2, 36
  add  r20 = r0, r10
  addi r21 = r0, 0
  addi r22 = r0, 1
  sub  r22 = r0, r22
  add  r7 = r0, r21
  sw   r7[0] = r22
  addi r22 = r0, 1
  sub  r22 = r0, r22
  add  r7 = r0, r21
  sw   r7[4] = r22
  addi r22 = r0, 12
  add  r7 = r0, r21
  sw   r7[8] = r22
  addi r21 = r0, 12
  addi r22 = r0, 12
  addi r23 = r0, 2
  add  r25 = r0, r23
  addi r24 = r0, 0
  addi r27 = r0, 32
  addi r26 = r0, 1
@.main.init_heap_area.12
  bne  r0, (r27, r0) -> 12
  beq  r0, (r0, r0) -> @.main.init_heap_area.13
  and  r23 = r25, r26
  sub  r23 = r0, r23
  and  r23 = r22, r23
  add  r24 = r24, r23
  sll  r22 = r22, r26
  srl  r25 = r25, r26
  sub  r27 = r27, r26
  beq  r0, (r0, r0) -> @.main.init_heap_area.12
@.main.init_heap_area.13
  sub  r20 = r20, r24
  add  r7 = r0, r21
  sw   r7[0] = r20
  addi r20 = r0, 0
  add  r7 = r0, r21
  sw   r7[4] = r20
  addi r20 = r0, 1
  sub  r20 = r0, r20
  add  r7 = r0, r21
  sw   r7[8] = r20
@.main.init_heap_area.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r25 = r3[-28]
  lw   r26 = r3[-32]
  lw   r27 = r3[-36]
  lw   r3 = r3[0]
  addi r2 = r2, 40
  jal  r0, r1[0]
  add  r0 = r0, r0
  add  r0 = r0, r0
@.main.malloc
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  sw   r3[-28] = r25
  sw   r3[-32] = r26
  sw   r3[-36] = r27
  sw   r3[-40] = r28
  subi r4 = r3, 44
  subi r2 = r2, 40
  add  r21 = r0, r10
  addi r20 = r0, 0
  add  r10 = r0, r20
  add  r11 = r0, r21
  beq  r1, (r0, r0) -> @.main.free_list_search
  add  r20 = r0, r10
  addi r22 = r0, 0
  beq  r0, (r20, r22) -> 12
  beq  r0, (r0, r0) -> @.main.malloc.14
  addi r22 = r0, 1
  beq  r0, (r0, r0) -> @.main.malloc.15
@.main.malloc.14
  addi r22 = r0, 0
@.main.malloc.15
  bne  r0, (r22, r0) -> 12
  beq  r0, (r0, r0) -> @.main.malloc.16
  addi r22 = r0, 0
  add  r10 = r0, r22
  beq  r0, (r0, r0) -> @.main.malloc.4294967295
  beq  r0, (r0, r0) -> @.main.malloc.17
@.main.malloc.16
  add  r0 = r12, r4
@.main.malloc.17
  addi r22 = r0, 0
  add  r22 = r20, r22
  add  r7 = r0, r22
  lw   r22 = r7[0]
  addi r23 = r0, 12
  add  r23 = r21, r23
  blt  r0, (r23, r22) -> 12
  beq  r0, (r0, r0) -> @.main.malloc.18
  addi r22 = r0, 1
  beq  r0, (r0, r0) -> @.main.malloc.19
@.main.malloc.18
  addi r22 = r0, 0
@.main.malloc.19
  bne  r0, (r22, r0) -> 12
  beq  r0, (r0, r0) -> @.main.malloc.20
  addi r22 = r0, 12
  add  r22 = r20, r22
  add  r23 = r22, r21
  addi r22 = r0, 0
  add  r22 = r20, r22
  add  r7 = r0, r22
  lw   r22 = r7[0]
  sub  r22 = r22, r21
  addi r24 = r0, 12
  sub  r22 = r22, r24
  add  r7 = r0, r23
  sw   r7[0] = r22
  addi r22 = r0, 4
  add  r22 = r20, r22
  add  r7 = r0, r22
  lw   r22 = r7[0]
  add  r7 = r0, r23
  sw   r7[4] = r22
  addi r22 = r0, 8
  add  r22 = r20, r22
  add  r7 = r0, r22
  lw   r22 = r7[0]
  add  r7 = r0, r23
  sw   r7[8] = r22
  addi r22 = r0, 4
  add  r22 = r20, r22
  add  r7 = r0, r22
  lw   r24 = r7[0]
  addi r22 = r0, 8
  add  r24 = r24, r22
  add  r7 = r0, r24
  lw   r22 = r7[0]
  add  r7 = r0, r24
  sw   r7[0] = r23
  beq  r0, (r0, r0) -> @.main.malloc.21
@.main.malloc.20
  add  r0 = r12, r4
@.main.malloc.21
  addi r23 = r0, 0
  add  r23 = r20, r23
  add  r7 = r0, r23
  lw   r23 = r7[0]
  addi r24 = r0, 12
  add  r24 = r21, r24
  ble  r0, (r23, r24) -> 12
  beq  r0, (r0, r0) -> @.main.malloc.22
  addi r23 = r0, 1
  beq  r0, (r0, r0) -> @.main.malloc.23
@.main.malloc.22
  addi r23 = r0, 0
@.main.malloc.23
  bne  r0, (r23, r0) -> 12
  beq  r0, (r0, r0) -> @.main.malloc.24
  addi r23 = r0, 4
  add  r23 = r20, r23
  add  r7 = r0, r23
  lw   r23 = r7[0]
  addi r24 = r0, 8
  add  r24 = r23, r24
  add  r7 = r0, r24
  lw   r23 = r7[0]
  addi r25 = r0, 8
  add  r25 = r20, r25
  add  r7 = r0, r25
  lw   r25 = r7[0]
  add  r7 = r0, r24
  sw   r7[0] = r25
  addi r24 = r0, 8
  add  r24 = r20, r24
  add  r7 = r0, r24
  lw   r25 = r7[0]
  addi r24 = r0, 4
  add  r25 = r25, r24
  add  r7 = r0, r25
  lw   r24 = r7[0]
  addi r26 = r0, 4
  add  r26 = r20, r26
  add  r7 = r0, r26
  lw   r26 = r7[0]
  add  r7 = r0, r25
  sw   r7[0] = r26
  addi r25 = r0, 0
  add  r25 = r20, r25
  add  r7 = r0, r25
  lw   r25 = r7[0]
  add  r21 = r0, r25
  beq  r0, (r0, r0) -> @.main.malloc.25
@.main.malloc.24
  add  r0 = r12, r4
@.main.malloc.25
  addi r25 = r0, 12
  add  r25 = r20, r25
  addi r26 = r0, 0
  add  r27 = r20, r26
  add  r7 = r0, r27
  lw   r26 = r7[0]
  add  r7 = r0, r27
  sw   r7[0] = r21
  addi r21 = r0, 4
  add  r27 = r20, r21
  add  r7 = r0, r27
  lw   r21 = r7[0]
  addi r28 = r0, 0
  add  r7 = r0, r27
  sw   r7[0] = r28
  addi r27 = r0, 8
  add  r27 = r20, r27
  add  r7 = r0, r27
  lw   r20 = r7[0]
  addi r28 = r0, 0
  add  r7 = r0, r27
  sw   r7[0] = r28
  add  r10 = r0, r25
@.main.malloc.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r25 = r3[-28]
  lw   r26 = r3[-32]
  lw   r27 = r3[-36]
  lw   r28 = r3[-40]
  lw   r3 = r3[0]
  addi r2 = r2, 44
  jal  r0, r1[0]
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
  add  r0 = r0, r0
@.main.free
  subi r2 = r2, 4
  sw   r2[0] = r3
  addi r3 = r2, 0
  sw   r3[-4] = r1
  sw   r3[-8] = r20
  sw   r3[-12] = r21
  sw   r3[-16] = r22
  sw   r3[-20] = r23
  sw   r3[-24] = r24
  sw   r3[-28] = r25
  sw   r3[-32] = r26
  subi r4 = r3, 36
  subi r2 = r2, 32
  add  r21 = r0, r10
  addi r20 = r0, 12
  sub  r21 = r21, r20
  addi r22 = r0, 0
  addi r20 = r0, 4
  add  r24 = r21, r20
  add  r7 = r0, r24
  lw   r20 = r7[0]
  add  r23 = r0, r22
  add  r7 = r0, r24
  sw   r7[0] = r23
  addi r23 = r0, 8
  add  r24 = r21, r23
  add  r7 = r0, r24
  lw   r23 = r7[0]
  addi r25 = r0, 8
  add  r25 = r22, r25
  add  r7 = r0, r25
  lw   r25 = r7[0]
  add  r7 = r0, r24
  sw   r7[0] = r25
  addi r24 = r0, 8
  add  r24 = r22, r24
  add  r7 = r0, r24
  lw   r25 = r7[0]
  addi r24 = r0, 4
  add  r25 = r25, r24
  add  r7 = r0, r25
  lw   r24 = r7[0]
  add  r26 = r0, r21
  add  r7 = r0, r25
  sw   r7[0] = r26
  addi r25 = r0, 8
  add  r25 = r22, r25
  add  r7 = r0, r25
  lw   r22 = r7[0]
  add  r7 = r0, r25
  sw   r7[0] = r21
@.main.free.4294967295
  lw   r1 = r3[-4]
  lw   r20 = r3[-8]
  lw   r21 = r3[-12]
  lw   r22 = r3[-16]
  lw   r23 = r3[-20]
  lw   r24 = r3[-24]
  lw   r25 = r3[-28]
  lw   r26 = r3[-32]
  lw   r3 = r3[0]
  addi r2 = r2, 36
  jal  r0, r1[0]
