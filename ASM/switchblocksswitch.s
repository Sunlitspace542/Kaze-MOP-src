//anim frame 0:red
//anim frame 1:blue
//b2: is bue?
//0x180: dest scaling
.org 0xAA63C
!main:
addiu sp, sp, $ffe8
sw ra, $0014 (SP)
jal $802A3CFC
nop
lw t2, $0144 (T8)
sw t2, $00f0 (T8)
beq v0, r0, !end
nop
lui at, $8040
lb t4, $0000 (AT)
srl t4, t4, $1
beq t2, t4, !end
nop
sll t2, t2, $1
sb t2, $0000 (AT)
lui a0, $303b
jal $2ca144
ori a0, a0, $0081
lui t8, $8036
lw t8, $1160 (T8)
!end:
lui at, $3f80
sw at, $0180 (T8)
lui at, $8040
lb t1, $0000 (AT)
lw t2, $0144 (T8)
sll t2, t2, $1
bne t2, t1, !afterend
nop
lui at, $3d4c
sw at, $0180 (T8)
!afterend:
lwc1 f2, $0030 (T8)
lwc1 f4, $0180 (T8)
sub.s f6, f4, f2
lui at, $3e4c
mtc1 at, f8
mul.s f6, f6, f8
add.s f4, f2, f6
swc1 f4, $0030 (T8)
jal $3839cc
nop
lw ra, $14 (SP)
jr ra
addiu sp, sp, $18