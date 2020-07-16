//anim frame 0:red
//anim frame 1: red skeleton
//frame 2 : blue
//frame 3: blue skeleton
//b2: 0 for red, 2 for blue
//b1: 0 to start red, 2 to start blue
.org 0xC44F8
!main:
addiu sp, sp, $ffe8
sw ra, $14 (SP)
lui v1, $8036
lw v1, $1160 (V1)
lw t3, $014c (V1)
bne t3, r0, !skip
nop
addiu at, r0, $0001
sw at, $014c (V1)
lb t1, $0188 (V1)
lui at, $8040
sb t1, $0000 (at)
!skip:
lui at, $8040
lb t1, $0000 (AT)
lw t2, $0144 (V1)
beq t2, t1, !solid
nop
addiu t3, t2, $0001
sw t3, $00f0 (V1)
beq r0, r0, !end
nop
!solid:
jal $803839cc
sw t2, $00f0 (V1)
!end:
lw ra, $14 (SP)
jr ra
addiu sp, sp, $18