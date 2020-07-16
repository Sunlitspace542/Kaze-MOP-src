//21EEB4//50B4
//00 04 00 00
//11 01 00 41
//0E 45 14 00
//08 00 00 00
//0C 00 00 00 80 30 c4 DC
//09 00 00 00

//B1: size, Red 
//B2: Green, Blue 

.org C74DC
!main:
addiu sp, sp, $ffe8
sw ra, $14 (SP)
Lui t0, $8036
Lw t0, $1160 (T0)
lw t1, $0154 (T0)
andi t1, t1, $4
beq t1, r0, !end
nop
sw r0, $0154 (T0)
or a0, r0, t0
lui a2, $1300
ori a2, a2, $2AF0
jal $8029edcc
addiu a1, r0, $0
Lui a0, $8036
Lw a0, $1160 (a0)
lbu t0, $0188 (a0)
andi t0, t0, $f0
srl t0, t0, $2
addiu t0, t0, $8
mtc1 t0, f4
cvt.s.w f4, f4
lui t0, $8039
lb t1, $eee0 (T0)
mtc1 t1, f2
cvt.s.w f2, f2
lb t2, $eee1 (T0)
mtc1 t2, f6
cvt.s.w f6, f6
lui at, $3D4C
mtc1 at, f8
mul.s f4, f4, f8
mul.s f2, f2, f4
mul.s f6, f6, f4
lwc1 f10, $00a0 (v0)
add.s f2, f2, f10
swc1 f2, $00a0 (V0)
lwc1 f10, $00a8 (V0)
add.s f6, f6, f10
swc1 f6, $00a8 (V0)
jal $383bb0
nop
lui a0, $0403
jal $277f50
ori a0, a0, $2a48
Lui t0, $8036
Lw t0, $1160 (T0)
lbu t1, $0188 (T0)
lw t2, $0144 (T0)
andi t3, t2, $F //blue
andi t4, t2, $F0//green
andi t5, t1, $F //red
sll t6, t3, $4
or t3, t6, t3
srl t6, t4, $4
or t4, t6, t4
sll t6, t5, $4
or t5, t6, t5
addiu a0, v0, $0040
!loop:
sb t5, $00C (V0)
sb t4, $00D (V0)
sb t3, $00e (V0)
addiu v0, v0, $10
bne a0, v0, !loop
nop

!end:
lw ra, $14 (SP)
jr ra
addiu sp, sp, $18

.org 0x81508
!fix:
SLTI AT, T9, $0008
