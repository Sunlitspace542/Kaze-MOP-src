.org 0x68df8
!main:
addiu sp, sp, $ffe8
sw ra, $14 (SP)
lui t0, $8036
lw a0, $1160 (t0)
lw t7, $014c (A0)
bne t7, r0, !nospawn
nop
addiu at, r0, $0001
sw at, $014c (a0)
addiu a1, r0, $0027
lui a2, $1300
jal $29edcc
addiu a2, a2, $2a48
lui t0, $8036
lw a0, $1160 (t0)
!nospawn:
lui t2, $8034
lw t2, $b17c (T2)
andi t3, t2, $0800
beq t3, r0, !skip
nop
lw t5, $014c (A0)
addiu at, r0, $0002
beq t5, at, !skip
nop
addiu at, r0, $0002
sw at, $014c (a0)
lw t8, $00d8 (a0)
andi t8, t8, $8000
addiu at, r0, $0400
bne t8, r0, !negative
nop
addiu at, r0, $fc00
!negative:
sw at, $11c (A0)
beq r0, r0, !end
nop
!skip:
lw t1, $014c (a0)
addiu at, r0, $1
beq t1, at, !end
nop
lw t8, $0154 (A0)
slti at, t8, $001F
bne at, r0, !end
nop
sw r0, $11c (A0)
lui t2, $8034
lw t2, $b17c (T2)
andi t3, t2, $0800
bne t3, r0, !end
nop
addiu at, r0, $0001
sw at, $014c (A0)
!end:
jal $2a2bc4
nop
lw ra, $14 (SP)
jr ra
addiu sp, sp, $18


