//120F000, 8040F000 table in rom
//00 song ID
//0x2E bytes for songname
//80370010: song ID being used now
//use song ID 23 to 2E

//ROM Addr: 0021F0B4 Hex Behav: 130052B4
//00 09 00 00
//11 01 64 49
//23 00 00 00 01 00 01 00
//08 00 00 00
//10 05 00 00
//10 2B 00 00
//0C 00 00 00 80 30 EA 9C
//09 00 00 00

.org 0xC7734
!main:
addiu sp, sp, $ffe8
sw ra, $14 (SP)
lui t0, $8036
lw a0, $1160 (T0)
jal $2a1424
lw a1, $1158 (T0)
beq v0, r0, !end
nop
lui a0, $8036
lw a0, $1160 (A0)
lw t1, $014C (A0)
beq t1, r0, !init
nop
!init:
lui a0, $8036
lw a0, $1160 (A0)
lw t1, $014C (A0)
bne t1, r0, !skip
nop
lb a1, $0188 (A0)
sw a1, $014c (A0)
jal $320544
addiu a0, r0, $0
lui a0, $8036
lw a0, $1160 (A0)
!skip:
lui t2, $8034
lh t2, $afa0 (T2)
lw t0, $017c (a0)
beq t2, t0, !end
nop
andi t1, t2, $0100
sw t2, $017c (a0)
andi t2, t2, $0200
lw t0, $014c (A0)
beq t1, r0, !skipright
nop
addiu t0, t0, $0001
beq r0, r0, !playmusic
nop
!skipright:
beq t2, r0, !skipleft
nop
addiu t0, t0, $ffff
beq r0, r0, !playmusic
nop
!skipleft:
beq r0, r0, !end
nop
!playmusic:
lw t3, $0144 (A0)
slt at, t0, t3
bne at, r0, !okay1
nop
beq r0, r0, !end
nop
!okay1:
lbu t3, $0188 (A0)
slt at, t0, t3
beq at, r0, !okay2
nop
beq r0, r0, !end
nop
!okay2:
sw t0, $014c (a0)
or a1, t0, r0
jal $320544
addiu a0, r0, $0
!end:
lw ra, $14 (SP)
jr ra
addiu sp, sp, $18