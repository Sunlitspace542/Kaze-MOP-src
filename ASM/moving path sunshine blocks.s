//(B1: is red?)
//(B2: path ID, 0 is quadrangle, 1 is updown, 2 is leftright) each path is 0x20 bytes)
//path formatting:
//0: zspeed+
//1: zspeed-
//2: xspeed+
//3: xspeed-
//4: back to beginning
//0x17c current path ID
//0x164 path timer
//7E4200

.org 0x7E4000
!main:
addiu sp, sp, $ffe8
sw ra, $14 (SP)
lui v1, $8036
lw v1, $1160 (V1)
lw t4, $0180 (V1)
bne t4, r0, !noinit
nop
addiu at, r0, $0001
sw at, $0180 (V1)
lb t2, $0188 (V1)
sw t2, $00f0 (V1)
sll t2, t2, $7
sw t2, $0154 (V1)
!noinit:
lw t2, $0154 (V1)
addiu at, r0, $0110
bne t2, at, !norotate
nop
addiu at, r0, $0400
sw at, $0114 (V1)
sw r0, $0154 (V1)
!norotate:
addiu at, r0, $20
bne t2, at, !noreset
nop
sw r0, $114 (V1)
!noreset:
lw t2, $0144 (V1)
sll t2, t2, $5
lw t5, $017c (V1)
add t2, t2, t5
lui at, $8060
ori at, at, $4200
add t2, at, t2
lb t3, $0000 (T2)
beq t3, r0, !label1
nop
addiu at, r0, $1
beq t3, at, !label2
nop
addiu at, r0, $2
beq t3, at, !label3
nop
addiu at, r0, $3
beq t3, at, !label4
nop
sw r0, $017c (V1)
beq r0, r0, !noreset
nop
!label4:
lui at, $C100
sw r0, $00b4 (V1)
sw at, $00ac (V1)
beq r0, r0, !process
nop
!label3:
lui at, $4100
sw r0, $00b4 (V1)
sw at, $00ac (V1)
beq r0, r0, !process
nop
!label2:
lui at, $c100
sw at, $00b4 (V1)
sw r0, $00ac (V1)
beq r0, r0, !process
nop
!label1:
lui at, $4100
sw at, $00b4 (V1)
sw r0, $00ac (V1)
beq r0, r0, !process
nop
!process:
lw t1, $0164 (V1)
addiu t1, t1, $1
sw t1, $0164 (V1)
addiu at, r0, $3C
bne t1, at, !noadding
nop
lw t3, $017c (V1)
addiu t3, t3, $1
sw t3, $017c (V1)
sw r0, $0164 (V1)
!noadding:
jal $29f070
nop
jal $2a2bc4
nop
lw ra, $14 (SP)
jr ra
addiu sp, sp, $18