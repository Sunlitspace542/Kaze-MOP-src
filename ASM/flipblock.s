.org 0xc75ec
!main:
addiu sp, sp, $ffe8
sw ra, $14 (SP)
lui v1, $8036
lw v1, $1160 (v1)
lw at, $014c (v1)
bne at, r0, !skip
nop
jal $3839cc
nop
jal $802A3754
nop
beq v0, r0, !nostomp
nop
addiu at, r0, $0001
sw at, $014c (V1)
!nostomp:
lui v0, $8036
jal $309560
lw a0, $1160 (V0)
beq v0, r0, !end
nop
lui a0, $8036
lw a1, $1158 (A0)
lw a0, $1160 (A0)
lwc1 f2, $00a4 (a0)
lwc1 f4, $00a4 (A1)
c.lt.s f2, f4
nop
bc1T !end
nop
lui v0, $8034
lwc1 f2, $b1bc (V0)
lui at, $4170
mtc1 at, f6
c.lt.s f2, f6
nop
bc1t !end
nop
addiu at, r0, $0001
sw at, $014c (V1)
sw r0, $b1bc (v0)
beq r0, r0, !end
nop
!skip:
lw t0, $0154 (V1)
bne t0, r0, !norotspeed
nop
addiu at, r0, $1680
sw at, $0114 (V1)
lui at, $3dcc
sw at, $0034 (V1)
lui a0, $300a
jal $2ca144
ori a0, a0, $81
lui v1, $8036
lw v1, $1160 (V1)
!norotspeed:
lw t1, $0114 (V1)
lw t2, $00d0 (V1)
add t2, t2, t1
sw t2, $00d0 (V1)
addiu t1, t1, $ffe0
sw t1, $0114 (V1)
bne t1, r0, !preend
nop
lui at, $3f80
sw at, $0034 (V1)
sw r0, $014c (V1)
sw r0, $00d0 (V1)
!preend:
lw a1, $00d0 (V1)
andi a2, a1, $FFFF
slt at, a2, a1
beq at, r0, !end
nop
sw a2, $00d0 (V1)
nop
lui a0, $300a
jal $2ca144
ori a0, a0, $81
!end:
lw ra, $14 (SP)
jr ra
addiu sp, sp, $18