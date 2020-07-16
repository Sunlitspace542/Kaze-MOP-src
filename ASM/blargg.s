ROM Addr: 0021C24C Hex Behav: 1300244C
00 04 00 00
11 01 64 49
2F 00 00 00 10 00 00 00
23 00 00 00 00 D8 00 48
10 3E 00 03
08 00 00 00 
10 05 00 00 
0C 00 00 00 80 2C 1C 44
10 2B 00 00
09 00 00 00


7CC44:
//START
ADDIU SP, SP, $FFE8
SW RA, $0014 (SP)

LUI T1, $8036
LW V1, $1160 (t1)
LUI T2, $0500
ORI A0, T2, $6154

//load distance
LUI AT, 0x43FA
MTC1 AT, F6
LWC1 F4, 0x015C (V1)
C.LT.S F4, F6
NOP
BC1F //END
NOP

//Damage
ORI A0, T2, $6070

//END

JAL $80277F50                         ;segmented to virtual (a0 ponter, V0 ram address)
NOP
SW V0, $003c(V1)
ADDIU A2, R0, 0x0200
LW A0, 0x00C8 (V1)
JAL 0x8029E530                      ; RotateTorwardsMario (a0 y rotation, A1 object->0x160, a2 speed, v0 new rotation)
LW A1, 0x0160 (V1)
SW V0, 0x00C8 (V1)

//spawn

LW t0, $0154(V1)
andi t0, t0, $0100
beq t0, r0, $end2
nop
sw r0, $0154(V1)
or a0, v1, r0
lui a2, $1300
ori a2, a2, $1A74
jal $8029edcc                             ;spawnobject (a0 pointer, a1 modelID, a2 behaviorID)
addiu a1, r0, $0090

//END2
LW RA, $0014 (SP)
JR RA
ADDIU SP, SP, $0018



05 00 60 70 = segmented address to attack animation
05 00 61 54 = segmented address to lying around animation