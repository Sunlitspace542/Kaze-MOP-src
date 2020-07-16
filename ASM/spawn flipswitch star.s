.org 0x632BC
!main:
addiu sp, sp, $ffe0
sw ra, $14 (SP)
lui t0, $8034
addiu t0, t0, $d488
sw t0, $0018 (SP)
!loop:
lui t1, $8036
ori t1, t1, $0e88
lw t0, $0018 (SP)
beq t1, t0, !spawn
nop
lw t2, $20c (T0)
lui t3, $800e
ori t3, t3, $b758
bne t2, t3, !skip
nop
lw t4, $00f0 (T0)
beq t4, r0, !end
nop
!skip:
addiu t0, t0, $260
sw t0, $0018 (SP)
beq r0, r0, !loop
nop
!spawn:
JAL $2A8CDC
nop
lui t2, $8036
lw t2, $1160 (T2)
lwc1 f12, $00a0 (T2)
lwc1 f14, $00a4 (T2)
JAL $802F2B88
lw a2, $00a8 (T2)
lui t2, $8036
lw t2, $1160 (T2)
lb t1, $0188 (T2)
sb t1, $0188 (V0)
sh r0, $0074 (T2)
!end:
lw ra, $14 (SP)
jr ra
addiu sp, sp, $20


.org 0x63CDC
!subcall:
lui t0, $8034
addiu t0, t0, $d488
!loopsub:
lw t2, $20c (T0)
lui t3, $800e
ori t3, t3, $b758
bne t2, t3, !skipsub
nop
addiu at, r0, $2
sw at, $014c (T0)
sw at, $00f0 (T0)
!skipsub:
addiu t0, t0, $260
lui t1, $8036
ori t1, t1, $0e88
bne t1, t0, !loopsub
nop
jr ra
nop