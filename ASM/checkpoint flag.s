//0x80400010
//bparam2: is reset flag?
.org 0x7E69E0
!main:
addiu sp, sp, $ffe8
sw ra, $14 (SP)
lui a0, $8036
lw a1, $1158 (A0)
jal $2a1424
lw a0, $1160 (A0)
beq v0, r0, !end
nop
lui a0, $8036
lw a0, $1160 (A0)
lw t2, $0144 (A0)
bne t2, r0, !doother
nop
lui at, $8040
addiu t3, r0, $1
lw a3, $0010 (AT)
sw t3, $0010 (AT)
lwc1 f2, $00a0 (A0)
swc1 f2, $0014 (AT)
lwc1 f2, $00a4 (A0)
swc1 f2, $0018 (AT)
lwc1 f2, $00a8 (A0)
swc1 f2, $001C (AT)
lui t1, $8060
lui at, $B886
ori at, at, $0bff
sw at, $4400 (T1)
lui at, $4818
ori at, at, $01ff
sw at, $4408 (T1)
bne a3, r0, !end
nop
lui a0, $306a
jal $2ca144
ori a0, a0, $0081
beq r0, r0, !end
nop
!doother:
lui at, $8040
sw r0, $0014 (AT)
sw r0, $0018 (AT)
sw r0, $001C (AT)
sw r0, $0010 (AT)
lui t1, $8060
lui at, $ffff
ori at, at, $ffff
sw at, $4400 (T1)
lui at, $7f7f
ori at, at, $7fff
sw at, $4408 (T1)

!end:
lui a0, $8036
lw a0, $1160 (A0)
lw t2, $0144 (A0)
sw r0, $9c (A0)
sw r0, $134 (A0)
lui at, $42c8
sw at, $1f8 (A0)
lui at, $441c
sw at, $1fc (A0)
beq t2, r0, !final
nop
lui at, $441c
sw at, $1f8 (A0)
lui at, $8000
sw at, $130 (A0)
sw r0, $14 (A0)
!final:
bne t2, r0, !actually
nop
lw t2, $0154 (A0)
bne t2, r0, !skipsetpos
nop
lui at, $8040
lw t2, $0010 (at)
beq t2, r0, !skipsetpos
nop
lui t4, $8034
lwc1 f2, $0014 (AT)
lui t6, $42c8
mtc1 t6, f4
add.s f2, f2, f4
swc1 f2, $b1ac (t4)
lwc1 f2, $0018 (AT)
swc1 f2, $b1b0 (t4)
lwc1 f2, $001C (AT)
swc1 f2, $b1b4 (t4)
!skipsetpos:
!actually:
lw ra, $14 (SP)
jr ra
addiu sp, sp, $18