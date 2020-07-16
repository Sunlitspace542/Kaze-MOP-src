//point1 0x164,0x168
//point2 0x16c, 0x17c
//distance from point1 to point 2: 0x184

.org 0x68ed8
!main:
addiu sp, sp, $ffD8
sw ra, $14 (SP)
lui t0, $8036
lw v1, $1160 (T0)
lw t2, $014c (v1)
lw t9, $00d0 (V1)
sw t9, $0024 (SP)
bne t2, r0, !noinit
nop
or a0, v1, r0
addiu a1, r0, $2c
lui a2, $1300
jal $29edcc
addiu a2, a2, $2a48
sw v0, $006c (V1)
addiu at, r0, $0001
sw at, $014c (V1)
lbu t3, $0188 (v1)
sll t3, t3, $4
mtc1 t3, f4
cvt.s.w f4, f4
swc1 f4, $00b8 (v1)
jal $2a1308
nop
lwc1 f2, $00a0 (V1)
lwc1 f4, $00a8 (V1)
lwc1 f12, $00ac (V1)
lwc1 f14, $00b4 (V1)
add.s f2, f2, f12
add.s f4, f4, f14
swc1 f2, $0164 (V1)
swc1 f4, $0168 (V1)
lw t3, $0144 (v1)
sll t3, t3, $4
mtc1 t3, f4
cvt.s.w f4, f4
neg.s f4, f4
swc1 f4, $00b8 (v1)
jal $2a1308
nop
lwc1 f2, $00a0 (V1)
lwc1 f4, $00a8 (V1)
lwc1 f12, $00ac (V1)
lwc1 f14, $00b4 (V1)
add.s f2, f2, f12
add.s f4, f4, f14
swc1 f2, $016c (V1)
swc1 f4, $017c (V1)
sw r0, $ac (V1)
sw r0, $b4 (V1)
lwc1 f2, $0164 (v1)
lwc1 f4, $0168 (v1)
lwc1 f12, $016c (v1)
lwc1 f14, $017c (v1)
sub.s f2, f2, f12
sub.s f4, f4, f14
mul.s f2, f2, f2
mul.s f4, f4, f4
jal $80323A50
add.s f12, f2, f4
swc1 f0, $0184 (v1)

!noinit:
lwc1 f2, $00a0 (v1)
lwc1 f4, $00a8 (v1)
lwc1 f12, $0164 (v1)
lwc1 f14, $0168 (v1)
sub.s f2, f2, f12
sub.s f4, f4, f14
mul.s f2, f2, f2
mul.s f4, f4, f4
jal $80323A50
add.s f12, f2, f4
swc1 f0, $0018 (SP)
lwc1 f2, $00a0 (v1)
lwc1 f4, $00a8 (v1)
lwc1 f12, $016c (v1)
lwc1 f14, $017C (v1)
sub.s f2, f2, f12
sub.s f4, f4, f14
mul.s f2, f2, f2
mul.s f4, f4, f4
jal $80323A50
add.s f12, f2, f4
swc1 f0, $001c (SP)
lui t1, $8036
lw t1, $1158 (T1)
lwc1 f2, $00a0 (t1)
lwc1 f4, $00a8 (t1)
lwc1 f12, $016c (v1)
lwc1 f14, $017C (v1)
sub.s f2, f2, f12
sub.s f4, f4, f14
mul.s f2, f2, f2
mul.s f4, f4, f4
jal $80323A50
add.s f12, f2, f4
swc1 f0, $0020 (SP)
jal $2a3cfc
nop
beq v0, r0, !end
nop
lui t0, $8036
lw t1, $1158 (T0)
lwc1 f2, $00a0 (t8)
lwc1 f4, $00a8 (T8)
lwc1 f12, $00a0 (T1)
lwc1 f14, $00a8 (T1)
sub.s f2, f2, f12
sub.s f4, f4, f14
mul.s f2, f2, f2
mul.s f4, f4, f4
jal $80323A50
add.s f12, f2, f4
lui at, $4248
mtc1 at, f2
c.lt.s f0, f2
nop
bc1t !end
nop
lwc1 f2, $001C (SP)
lwc1 f4, $0020 (SP)
c.lt.s f2, f4
nop
bc1t !rotatenegative
nop
addiu at, r0, $fe00
lwc1 f12, $0184 (V1)
lwc1 f4, $0018 (SP)
c.lt.s f4, f12
nop
bc1t !back
nop
addiu at, r0, $200
beq r0, r0, !back
nop
!rotatenegative:
addiu at, r0, $0200
lwc1 f12, $0184 (V1)
lwc1 f4, $0018 (SP)
c.lt.s f4, f12
nop
bc1t !back
nop
addiu at, r0, $fe00

!back:
lw t1, $00d0 (V1)
add t1, t1, at
sw t1, $00d0 (V1)
!end:
lw t2, $00d0 (v1)
mtc1 t2, f4
cvt.s.w f4, f4
lui at, $3f64
mtc1 at, f8
mul.s f10, f8, f4
cvt.w.s f10, f10
mfc1 t4, f10
sw t4, $00d0 (V1)
lw t5, $0024 (SP)
sub t6, t4, t5
sw t6, $114 (V1)


mtc1 t4, f6
cvt.s.w f6, f6
lui at, $3c83
mtc1 at, f8
mul.s f8, f8, f6
lui at, $3a83
ori at, at, $126f
mtc1 at, f10
lwc1 f6, $001c (SP)
lwc1 f4, $0018 (SP)
mtc1 r0, f14
lwc1 f2, $00b8 (V1)
c.lt.s f14, f2
nop
bc1f !takeone
nop
mul.s f12, f4, f8
beq r0, r0, !calculate
nop
!takeone:
mul.s f12, f6, f8

!calculate:
mul.s f12, f12, f10
mtc1 r0, f14
nop
c.lt.s f12, f14
nop
bc1F !positive
nop
neg.s f12, f12
!positive:
jal $323A50
nop
bc1f !noreset
nop
neg.s f0, f0
!noreset:
lwc1 f12, $0184 (V1)
lwc1 f4, $0018 (SP)
c.lt.s f4, f12
nop
bc1t !checktwo
nop
jal $323a50
mul.s f12, f0, f0
beq r0, r0, !store
nop
!checktwo:
lwc1 f4, $001c (SP)
c.lt.s f4, f12
nop
bc1t !store
nop
jal $323a50
mul.s f12, f0, f0
neg.s f0, f0

!store:
swc1 f0, $00b8 (V1)
jal $323a50
mul.s f12, f0, f0
lui at, $4100
mtc1 at, f10
c.lt.s f0, f10
nop
bc1t !nosound
nop
lw t1, $0154 (V1)
andi at, t1, $1
beq at, r0, !nosound
nop
lui a0, $5035
jal $2ca144
ori a0, a0, $0081
!nosound:
lui at, $4348
mtc1 at, f2
mul.s f2, f2, f0
cvt.w.s f2, f2
mfc1 t4, f2
lw t0, $006c (V1)
lw t2, $00d0 (t0)
add t2, t2, t4
sw t2, $00d0 (t0)
lw at, $00a0 (V1)
sw at, $00a0 (T0)
lw at, $00a4 (V1)
sw at, $00a4 (T0)
lw at, $00a8 (V1)
sw at, $00a8 (T0)
jal $2a1308
nop
jal $29f070
nop
lw ra, $14 (SP)
jr ra
addiu sp, sp, $28