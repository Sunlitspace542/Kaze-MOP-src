.org 0xc7834
!main:
addiu sp, sp, $ffe0
sw ra, $14 (SP)
lui v1, $8036
lw v1, $1160 (V1)
lw v0, $014c (V1)
bne v0, r0, !scaledown
nop
JAL $802A3CFC
nop
beq v0, r0, !end
nop
addiu at, r0, $0001
sw at, $014c (V1)
beq r0, r0, !end
nop
!scaledown:
lw v0, $014c (V1)
addiu at, r0, $0002
beq v0, at, !transform
nop
lw v0, $0154 (V1)
slti at, v0, $013
bne at, r0, !skip
nop
addiu at, r0, $0002
sw at, $14c (V1)
!skip:
lui at, $3d4c
mtc1 at, f2
mtc1 v0, f4
cvt.s.w f4, f4
lui at, $3f80
mtc1 at, f6
mul.s f2, f2, f4
sub.s f6, f6, f2
swc1 f6, $0030 (V1)
beq r0, r0, !end
nop
!transform:
lw v0, $154 (V1)
bne v0, r0, !endloop
nop

!startloop:
lui a0, $8033
ori a0, a0, $d488
lui v1, $8036
ori v1, v1, $0e88
sw a0, $0018 (SP)
!loop:
lw a0, $0018 (SP)
addiu a0, a0, $260
sw a0, $0018 (SP)
lh t1, $0074 (A0)
beq t1, r0, !deactivated1
nop
lui a1, $800e
ori a1, a1, $bab4
lw a2, $01cc (A0)
beq a2, a1, !spawnboxto
nop
nop
lui a1, $800e
ori a1, a1, $c680
beq a2, a1, !spawncointo
nop
!deactivated1:
slt at, a0, v1
beq at, r0, !endloop
nop
beq r0, r0, !loop
nop
!spawnboxto:
sh r0, $0074 (A0)
addiu a1, r0, $0081
lui a2, $1300
jal $29edcc
addiu a2, a2, $14e0
beq r0, r0, !loop
nop
!spawncointo:
sh r0, $0074 (A0)
addiu a1, r0, $0075
lui a2, $1300
jal $29edcc
addiu a2, a2, $090c
beq r0, r0, !loop
nop
!endloop:
lw v0, $154 (V1)
addiu at, r0, $d4
bne at, v0, !preend
nop
!endloopback:
lui a0, $8036
lw a0, $1160 (A0)
sh r0, $0074 (A0)
addiu at, r0, $00e0
sw at, $0154 (A0)
beq r0, r0, !startloop
nop
!preend:
andi v0, v0, $007
addiu at, r0, $001
bne v0, at, !end
nop
lui a0, $3054
jal $2ca144
ori a0, a0, $0081
!end:
lw ra, $14 (SP)
jr ra
addiu sp, sp, $20