2AC310: 05 08 00 00 03 02 26 84
2ABE50: 05 08 00 00 03 02 26 14
2ABE48: call dmacopy 11 08 00 00 80 30 c4 b0

AD4A20:
22 08 00 8A 16 00 0E D4 
22 08 00 8B 16 00 0F 24 
22 08 00 7B 03 01 DB F8 
21 08 00 92 03 01 FC 98 
21 08 00 97 03 02 08 60 
22 08 00 98 03 02 12 F4 
22 08 00 99 03 02 25 E4 
10 08 00 00 00 00 00 00
10 08 00 00 00 00 00 00
10 08 00 00 00 00 00 00
10 08 00 00 00 00 00 00
10 08 00 00 00 00 00 00
10 08 00 00 00 00 00 00
05 08 00 00 15 00 01 B8 
22 08 00 9B 0F 00 0A DC 
22 08 00 9D 0F 00 0B 08 
22 08 00 CF 0F 00 04 CC 
05 08 00 00 15 00 06 78

use model IDs:
F0, F1, F2, F3, F4, F5
f0: flipblock pointer: AD4B30 data:7D0000//5F0000

//copy to 805F0000 from 7d0000 tp 800000
addiu sp, sp, $ffe8
sw ra, $14 (SP)
lui a0, $805F
lui a1, $007d
jal $80278504
lui a2, $0080
addiu v0, r0, $00010		//otherwise crashes because
lw ra, $14 (SP)
jr ra
addiu sp, sp, $18



AD4AC0 switchblock geo
//anim frame 0:red
//anim frame 1: red skeleton
//frame 2 : blue
//frame 3: blue skeleton

//switchblock:
pointer ad4a54
data: 7D1DA0 // 5f1DA0
CP: 7D1D9C

0x06 to 7d2e60// 5f2e60 at 7d3220


//switchblock skeleton:
pointer ad4ad8
data: 7d3270 // 5f3270
jump tp 7d57d0

dlblue at 7d5df0

switch 
pointer ad4a6c
data 7D5E50 5f5e50
model ID f2
behavior id 21D8E0 // 3AE0

jump tp 7d70f0
at 7d7580