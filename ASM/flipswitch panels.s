.org 0x63238
!main:
addiu sp, sp, $ffe8
sw ra, $14 (SP)
lui t0, $8036
lw t0, $1160 (T0)
lw t3, $014c (T0)
addiu at, r0, $2
beq at, t3, !end
nop
jal $2a3cfc
nop
beq v0, r0, !preend
nop
lui t0, $8036
lw t0, $1160 (T0)
lw t1, $014c (T0)
addiu at, r0, $0001
sw at, $014c (T0)
bne t1, r0, !end
nop
lw t4, $00f0 (T0)
xori t4, t4, $1
sw t4, $00f0(t0)
lui a0, $3017
jal $2ca144
ori a0, a0, $0081
beq r0, r0, !end
nop
!preend:
sw r0, $014c (T8)
!end:
jal $3839cc
nop
lw ra, $14(SP)
jr ra
addiu sp, sp, $18