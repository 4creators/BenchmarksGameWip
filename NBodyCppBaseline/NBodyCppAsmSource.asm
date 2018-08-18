   1              	 .file "NBodyCppBaseline.cpp"
   2              	 .intel_syntax noprefix
   3              	 .text
   4              	.Ltext0:
   5              	 .section .text._ZN11NBodySystemC2Ev,"axG",@progbits,_ZN11NBodySystemC5Ev,comdat
   6              	 .align 2
   7              	 .p2align 4,,15
   8              	 .weak _ZN11NBodySystemC2Ev
  10              	_ZN11NBodySystemC2Ev:
  11              	.LFB6402:
  12              	 .file 1 "NBodyCppBaseline.cpp"
   1:NBodyCppBaseline.cpp **** 
   2:NBodyCppBaseline.cpp **** /* The Computer Language Benchmarks Game
   3:NBodyCppBaseline.cpp ****    https://salsa.debian.org/benchmarksgame-team/benchmarksgame/
   4:NBodyCppBaseline.cpp **** 
   5:NBodyCppBaseline.cpp ****    contributed by Mark C. Lewis
   6:NBodyCppBaseline.cpp ****    modified slightly by Chad Whipkey
   7:NBodyCppBaseline.cpp ****    converted from java to c++,added sse support, by Branimir Maksimovic
   8:NBodyCppBaseline.cpp ****    modified by Vaclav Zeman
   9:NBodyCppBaseline.cpp **** */
  10:NBodyCppBaseline.cpp **** 
  11:NBodyCppBaseline.cpp **** #include <cstdio>
  12:NBodyCppBaseline.cpp **** #include <cmath>
  13:NBodyCppBaseline.cpp **** #include <cstdlib>
  14:NBodyCppBaseline.cpp **** #include <chrono>
  15:NBodyCppBaseline.cpp **** #include <ctime>
  16:NBodyCppBaseline.cpp **** #include <array>
  17:NBodyCppBaseline.cpp **** #include <immintrin.h>
  18:NBodyCppBaseline.cpp **** 
  19:NBodyCppBaseline.cpp **** static const double PI = 3.141592653589793;
  20:NBodyCppBaseline.cpp **** static const double SOLAR_MASS = 4 * PI * PI;
  21:NBodyCppBaseline.cpp **** static const double DAYS_PER_YEAR = 365.24;
  22:NBodyCppBaseline.cpp **** 
  23:NBodyCppBaseline.cpp **** 
  24:NBodyCppBaseline.cpp **** class alignas(16) Body {
  25:NBodyCppBaseline.cpp **** 
  26:NBodyCppBaseline.cpp **** public:
  27:NBodyCppBaseline.cpp ****     double x, y, z, filler, vx, vy, vz, mass;
  28:NBodyCppBaseline.cpp **** 
  29:NBodyCppBaseline.cpp ****     Body() {}
  30:NBodyCppBaseline.cpp **** 
  31:NBodyCppBaseline.cpp ****     static Body& jupiter() {
  32:NBodyCppBaseline.cpp ****         static Body p;
  33:NBodyCppBaseline.cpp ****         p.x = 4.84143144246472090e+00;
  34:NBodyCppBaseline.cpp ****         p.y = -1.16032004402742839e+00;
  35:NBodyCppBaseline.cpp ****         p.z = -1.03622044471123109e-01;
  36:NBodyCppBaseline.cpp ****         p.vx = 1.66007664274403694e-03 * DAYS_PER_YEAR;
  37:NBodyCppBaseline.cpp ****         p.vy = 7.69901118419740425e-03 * DAYS_PER_YEAR;
  38:NBodyCppBaseline.cpp ****         p.vz = -6.90460016972063023e-05 * DAYS_PER_YEAR;
  39:NBodyCppBaseline.cpp ****         p.mass = 9.54791938424326609e-04 * SOLAR_MASS;
  40:NBodyCppBaseline.cpp ****         return p;
  41:NBodyCppBaseline.cpp ****     }
  42:NBodyCppBaseline.cpp **** 
  43:NBodyCppBaseline.cpp ****     static Body& saturn() {
  44:NBodyCppBaseline.cpp ****         static Body p;
  45:NBodyCppBaseline.cpp ****         p.x = 8.34336671824457987e+00;
  46:NBodyCppBaseline.cpp ****         p.y = 4.12479856412430479e+00;
  47:NBodyCppBaseline.cpp ****         p.z = -4.03523417114321381e-01;
  48:NBodyCppBaseline.cpp ****         p.vx = -2.76742510726862411e-03 * DAYS_PER_YEAR;
  49:NBodyCppBaseline.cpp ****         p.vy = 4.99852801234917238e-03 * DAYS_PER_YEAR;
  50:NBodyCppBaseline.cpp ****         p.vz = 2.30417297573763929e-05 * DAYS_PER_YEAR;
  51:NBodyCppBaseline.cpp ****         p.mass = 2.85885980666130812e-04 * SOLAR_MASS;
  52:NBodyCppBaseline.cpp ****         return p;
  53:NBodyCppBaseline.cpp ****     }
  54:NBodyCppBaseline.cpp **** 
  55:NBodyCppBaseline.cpp ****     static Body& uranus() {
  56:NBodyCppBaseline.cpp ****         static Body p;
  57:NBodyCppBaseline.cpp ****         p.x = 1.28943695621391310e+01;
  58:NBodyCppBaseline.cpp ****         p.y = -1.51111514016986312e+01;
  59:NBodyCppBaseline.cpp ****         p.z = -2.23307578892655734e-01;
  60:NBodyCppBaseline.cpp ****         p.vx = 2.96460137564761618e-03 * DAYS_PER_YEAR;
  61:NBodyCppBaseline.cpp ****         p.vy = 2.37847173959480950e-03 * DAYS_PER_YEAR;
  62:NBodyCppBaseline.cpp ****         p.vz = -2.96589568540237556e-05 * DAYS_PER_YEAR;
  63:NBodyCppBaseline.cpp ****         p.mass = 4.36624404335156298e-05 * SOLAR_MASS;
  64:NBodyCppBaseline.cpp ****         return p;
  65:NBodyCppBaseline.cpp ****     }
  66:NBodyCppBaseline.cpp **** 
  67:NBodyCppBaseline.cpp ****     static Body& neptune() {
  68:NBodyCppBaseline.cpp ****         static Body p;
  69:NBodyCppBaseline.cpp ****         p.x = 1.53796971148509165e+01;
  70:NBodyCppBaseline.cpp ****         p.y = -2.59193146099879641e+01;
  71:NBodyCppBaseline.cpp ****         p.z = 1.79258772950371181e-01;
  72:NBodyCppBaseline.cpp ****         p.vx = 2.68067772490389322e-03 * DAYS_PER_YEAR;
  73:NBodyCppBaseline.cpp ****         p.vy = 1.62824170038242295e-03 * DAYS_PER_YEAR;
  74:NBodyCppBaseline.cpp ****         p.vz = -9.51592254519715870e-05 * DAYS_PER_YEAR;
  75:NBodyCppBaseline.cpp ****         p.mass = 5.15138902046611451e-05 * SOLAR_MASS;
  76:NBodyCppBaseline.cpp ****         return p;
  77:NBodyCppBaseline.cpp ****     }
  78:NBodyCppBaseline.cpp **** 
  79:NBodyCppBaseline.cpp ****     static Body& sun() {
  80:NBodyCppBaseline.cpp ****         static Body p;
  81:NBodyCppBaseline.cpp ****         p.mass = SOLAR_MASS;
  82:NBodyCppBaseline.cpp ****         return p;
  83:NBodyCppBaseline.cpp ****     }
  84:NBodyCppBaseline.cpp **** 
  85:NBodyCppBaseline.cpp ****     Body& offsetMomentum(double px, double py, double pz) {
  86:NBodyCppBaseline.cpp ****         vx = -px / SOLAR_MASS;
  87:NBodyCppBaseline.cpp ****         vy = -py / SOLAR_MASS;
  88:NBodyCppBaseline.cpp ****         vz = -pz / SOLAR_MASS;
  89:NBodyCppBaseline.cpp ****         return *this;
  90:NBodyCppBaseline.cpp ****     }
  91:NBodyCppBaseline.cpp **** };
  92:NBodyCppBaseline.cpp **** 
  93:NBodyCppBaseline.cpp **** 
  94:NBodyCppBaseline.cpp **** class NBodySystem {
  95:NBodyCppBaseline.cpp **** private:
  96:NBodyCppBaseline.cpp ****     std::array<Body, 5> bodies;
  97:NBodyCppBaseline.cpp **** 
  98:NBodyCppBaseline.cpp **** public:
  99:NBodyCppBaseline.cpp ****     NBodySystem()
  13              	 .loc 1 99 0
  14              	 .cfi_startproc
  15              	.LVL0:
  16 0000 53       	 push rbx
  17              	 .cfi_def_cfa_offset 16
  18              	 .cfi_offset 3,-16
  19              	.LBB382:
  20              	.LBB383:
  21              	.LBB384:
  80:NBodyCppBaseline.cpp ****         p.mass = SOLAR_MASS;
  22              	 .loc 1 80 0
  23 0001 0FB60500 	 movzx eax,BYTE PTR _ZGVZN4Body3sunEvE1p[rip]
  23      000000
  24              	.LBE384:
  25              	.LBE383:
  26              	.LBE382:
  27              	 .loc 1 99 0
  28 0008 4889FB   	 mov rbx,rdi
  29              	.LBB426:
  30              	.LBB388:
  31              	.LBB385:
  80:NBodyCppBaseline.cpp ****         p.mass = SOLAR_MASS;
  32              	 .loc 1 80 0
  33 000b 84C0     	 test al,al
  34 000d 0F848503 	 je .L34
  34      0000
  35              	.LVL1:
  36              	.L3:
  37              	.LBE385:
  38              	.LBE388:
 100:NBodyCppBaseline.cpp ****         : bodies{ {
 101:NBodyCppBaseline.cpp ****             Body::sun(),
 102:NBodyCppBaseline.cpp ****             Body::jupiter(),
 103:NBodyCppBaseline.cpp ****             Body::saturn(),
 104:NBodyCppBaseline.cpp ****             Body::uranus(),
 105:NBodyCppBaseline.cpp ****             Body::neptune()
 106:NBodyCppBaseline.cpp ****             } }
  39              	 .loc 1 106 0
  40 0013 660F6F05 	 movdqa xmm0,XMMWORD PTR _ZZN4Body3sunEvE1p[rip]
  40      00000000 
  41              	.LBB389:
  42              	.LBB386:
  81:NBodyCppBaseline.cpp ****         return p;
  43              	 .loc 1 81 0
  44 001b 488B0500 	 mov rax,QWORD PTR .LC0[rip]
  44      000000
  45 0022 48890500 	 mov QWORD PTR _ZZN4Body3sunEvE1p[rip+56],rax
  45      000000
  46              	.LBE386:
  47              	.LBE389:
  48              	 .loc 1 106 0
  49 0029 0F2903   	 movaps XMMWORD PTR [rbx],xmm0
  50 002c 660F6F05 	 movdqa xmm0,XMMWORD PTR _ZZN4Body3sunEvE1p[rip+16]
  50      00000000 
  51 0034 0F294310 	 movaps XMMWORD PTR 16[rbx],xmm0
  52 0038 660F6F05 	 movdqa xmm0,XMMWORD PTR _ZZN4Body3sunEvE1p[rip+32]
  52      00000000 
  53 0040 0F294320 	 movaps XMMWORD PTR 32[rbx],xmm0
  54 0044 660F6F05 	 movdqa xmm0,XMMWORD PTR _ZZN4Body3sunEvE1p[rip+48]
  54      00000000 
  55 004c 0F294330 	 movaps XMMWORD PTR 48[rbx],xmm0
  56              	.LBB390:
  57              	.LBB391:
  32:NBodyCppBaseline.cpp ****         p.x = 4.84143144246472090e+00;
  58              	 .loc 1 32 0
  59 0050 0FB60500 	 movzx eax,BYTE PTR _ZGVZN4Body7jupiterEvE1p[rip]
  59      000000
  60 0057 84C0     	 test al,al
  61 0059 0F84D903 	 je .L35
  61      0000
  62              	.L6:
  33:NBodyCppBaseline.cpp ****         p.y = -1.16032004402742839e+00;
  63              	 .loc 1 33 0
  64 005f 660F2805 	 movapd xmm0,XMMWORD PTR .LC1[rip]
  64      00000000 
  35:NBodyCppBaseline.cpp ****         p.vx = 1.66007664274403694e-03 * DAYS_PER_YEAR;
  65              	 .loc 1 35 0
  66 0067 488B0500 	 mov rax,QWORD PTR .LC2[rip]
  66      000000
  33:NBodyCppBaseline.cpp ****         p.y = -1.16032004402742839e+00;
  67              	 .loc 1 33 0
  68 006e 0F290500 	 movaps XMMWORD PTR _ZZN4Body7jupiterEvE1p[rip],xmm0
  68      000000
  36:NBodyCppBaseline.cpp ****         p.vy = 7.69901118419740425e-03 * DAYS_PER_YEAR;
  69              	 .loc 1 36 0
  70 0075 660F2805 	 movapd xmm0,XMMWORD PTR .LC3[rip]
  70      00000000 
  35:NBodyCppBaseline.cpp ****         p.vx = 1.66007664274403694e-03 * DAYS_PER_YEAR;
  71              	 .loc 1 35 0
  72 007d 48890500 	 mov QWORD PTR _ZZN4Body7jupiterEvE1p[rip+16],rax
  72      000000
  36:NBodyCppBaseline.cpp ****         p.vy = 7.69901118419740425e-03 * DAYS_PER_YEAR;
  73              	 .loc 1 36 0
  74 0084 0F290500 	 movaps XMMWORD PTR _ZZN4Body7jupiterEvE1p[rip+32],xmm0
  74      000000
  75 008b 660F2805 	 movapd xmm0,XMMWORD PTR .LC4[rip]
  75      00000000 
  76 0093 0F290500 	 movaps XMMWORD PTR _ZZN4Body7jupiterEvE1p[rip+48],xmm0
  76      000000
  77              	.LBE391:
  78              	.LBE390:
  79              	 .loc 1 106 0
  80 009a 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC19[rip]
  80      00000000 
  81 00a2 0F294340 	 movaps XMMWORD PTR 64[rbx],xmm0
  82 00a6 660F6F05 	 movdqa xmm0,XMMWORD PTR _ZZN4Body7jupiterEvE1p[rip+16]
  82      00000000 
  83 00ae 0F294350 	 movaps XMMWORD PTR 80[rbx],xmm0
  84 00b2 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC20[rip]
  84      00000000 
  85 00ba 0F294360 	 movaps XMMWORD PTR 96[rbx],xmm0
  86 00be 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC21[rip]
  86      00000000 
  87 00c6 0F294370 	 movaps XMMWORD PTR 112[rbx],xmm0
  88              	.LBB393:
  89              	.LBB394:
  44:NBodyCppBaseline.cpp ****         p.x = 8.34336671824457987e+00;
  90              	 .loc 1 44 0
  91 00ca 0FB60500 	 movzx eax,BYTE PTR _ZGVZN4Body6saturnEvE1p[rip]
  91      000000
  92 00d1 84C0     	 test al,al
  93 00d3 0F843703 	 je .L36
  93      0000
  94              	.L9:
  45:NBodyCppBaseline.cpp ****         p.y = 4.12479856412430479e+00;
  95              	 .loc 1 45 0
  96 00d9 660F2805 	 movapd xmm0,XMMWORD PTR .LC5[rip]
  96      00000000 
  47:NBodyCppBaseline.cpp ****         p.vx = -2.76742510726862411e-03 * DAYS_PER_YEAR;
  97              	 .loc 1 47 0
  98 00e1 488B0500 	 mov rax,QWORD PTR .LC6[rip]
  98      000000
  45:NBodyCppBaseline.cpp ****         p.y = 4.12479856412430479e+00;
  99              	 .loc 1 45 0
 100 00e8 0F290500 	 movaps XMMWORD PTR _ZZN4Body6saturnEvE1p[rip],xmm0
 100      000000
  48:NBodyCppBaseline.cpp ****         p.vy = 4.99852801234917238e-03 * DAYS_PER_YEAR;
 101              	 .loc 1 48 0
 102 00ef 660F2805 	 movapd xmm0,XMMWORD PTR .LC7[rip]
 102      00000000 
  47:NBodyCppBaseline.cpp ****         p.vx = -2.76742510726862411e-03 * DAYS_PER_YEAR;
 103              	 .loc 1 47 0
 104 00f7 48890500 	 mov QWORD PTR _ZZN4Body6saturnEvE1p[rip+16],rax
 104      000000
  48:NBodyCppBaseline.cpp ****         p.vy = 4.99852801234917238e-03 * DAYS_PER_YEAR;
 105              	 .loc 1 48 0
 106 00fe 0F290500 	 movaps XMMWORD PTR _ZZN4Body6saturnEvE1p[rip+32],xmm0
 106      000000
 107 0105 660F2805 	 movapd xmm0,XMMWORD PTR .LC8[rip]
 107      00000000 
 108 010d 0F290500 	 movaps XMMWORD PTR _ZZN4Body6saturnEvE1p[rip+48],xmm0
 108      000000
 109              	.LBE394:
 110              	.LBE393:
 111              	 .loc 1 106 0
 112 0114 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC22[rip]
 112      00000000 
 113 011c 0F298380 	 movaps XMMWORD PTR 128[rbx],xmm0
 113      000000
 114 0123 660F6F05 	 movdqa xmm0,XMMWORD PTR _ZZN4Body6saturnEvE1p[rip+16]
 114      00000000 
 115 012b 0F298390 	 movaps XMMWORD PTR 144[rbx],xmm0
 115      000000
 116 0132 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC23[rip]
 116      00000000 
 117 013a 0F2983A0 	 movaps XMMWORD PTR 160[rbx],xmm0
 117      000000
 118 0141 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC24[rip]
 118      00000000 
 119 0149 0F2983B0 	 movaps XMMWORD PTR 176[rbx],xmm0
 119      000000
 120              	.LBB396:
 121              	.LBB397:
  56:NBodyCppBaseline.cpp ****         p.x = 1.28943695621391310e+01;
 122              	 .loc 1 56 0
 123 0150 0FB60500 	 movzx eax,BYTE PTR _ZGVZN4Body6uranusEvE1p[rip]
 123      000000
 124 0157 84C0     	 test al,al
 125 0159 0F848902 	 je .L37
 125      0000
 126              	.L12:
  57:NBodyCppBaseline.cpp ****         p.y = -1.51111514016986312e+01;
 127              	 .loc 1 57 0
 128 015f 660F2805 	 movapd xmm0,XMMWORD PTR .LC9[rip]
 128      00000000 
  59:NBodyCppBaseline.cpp ****         p.vx = 2.96460137564761618e-03 * DAYS_PER_YEAR;
 129              	 .loc 1 59 0
 130 0167 488B0500 	 mov rax,QWORD PTR .LC10[rip]
 130      000000
  57:NBodyCppBaseline.cpp ****         p.y = -1.51111514016986312e+01;
 131              	 .loc 1 57 0
 132 016e 0F290500 	 movaps XMMWORD PTR _ZZN4Body6uranusEvE1p[rip],xmm0
 132      000000
  60:NBodyCppBaseline.cpp ****         p.vy = 2.37847173959480950e-03 * DAYS_PER_YEAR;
 133              	 .loc 1 60 0
 134 0175 660F2805 	 movapd xmm0,XMMWORD PTR .LC11[rip]
 134      00000000 
  59:NBodyCppBaseline.cpp ****         p.vx = 2.96460137564761618e-03 * DAYS_PER_YEAR;
 135              	 .loc 1 59 0
 136 017d 48890500 	 mov QWORD PTR _ZZN4Body6uranusEvE1p[rip+16],rax
 136      000000
  60:NBodyCppBaseline.cpp ****         p.vy = 2.37847173959480950e-03 * DAYS_PER_YEAR;
 137              	 .loc 1 60 0
 138 0184 0F290500 	 movaps XMMWORD PTR _ZZN4Body6uranusEvE1p[rip+32],xmm0
 138      000000
 139 018b 660F2805 	 movapd xmm0,XMMWORD PTR .LC12[rip]
 139      00000000 
 140 0193 0F290500 	 movaps XMMWORD PTR _ZZN4Body6uranusEvE1p[rip+48],xmm0
 140      000000
 141              	.LBE397:
 142              	.LBE396:
 143              	 .loc 1 106 0
 144 019a 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC25[rip]
 144      00000000 
 145 01a2 0F2983C0 	 movaps XMMWORD PTR 192[rbx],xmm0
 145      000000
 146 01a9 660F6F05 	 movdqa xmm0,XMMWORD PTR _ZZN4Body6uranusEvE1p[rip+16]
 146      00000000 
 147 01b1 0F2983D0 	 movaps XMMWORD PTR 208[rbx],xmm0
 147      000000
 148 01b8 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC26[rip]
 148      00000000 
 149 01c0 0F2983E0 	 movaps XMMWORD PTR 224[rbx],xmm0
 149      000000
 150 01c7 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC27[rip]
 150      00000000 
 151 01cf 0F2983F0 	 movaps XMMWORD PTR 240[rbx],xmm0
 151      000000
 152              	.LBB399:
 153              	.LBB400:
  68:NBodyCppBaseline.cpp ****         p.x = 1.53796971148509165e+01;
 154              	 .loc 1 68 0
 155 01d6 0FB60500 	 movzx eax,BYTE PTR _ZGVZN4Body7neptuneEvE1p[rip]
 155      000000
 156 01dd 84C0     	 test al,al
 157 01df 0F84DB01 	 je .L38
 157      0000
 158              	.L15:
  71:NBodyCppBaseline.cpp ****         p.vx = 2.68067772490389322e-03 * DAYS_PER_YEAR;
 159              	 .loc 1 71 0
 160 01e5 488B0500 	 mov rax,QWORD PTR .LC14[rip]
 160      000000
 161              	.LBE400:
 162              	.LBE399:
 163              	.LBB404:
 164              	.LBB405:
 107:NBodyCppBaseline.cpp ****     {
 108:NBodyCppBaseline.cpp ****         double px = 0.0;
 109:NBodyCppBaseline.cpp ****         double py = 0.0;
 110:NBodyCppBaseline.cpp ****         double pz = 0.0;
 111:NBodyCppBaseline.cpp ****         for (size_t i = 0; i < bodies.size(); ++i) {
 112:NBodyCppBaseline.cpp ****             px += bodies[i].vx * bodies[i].mass;
 165              	 .loc 1 112 0
 166 01ec F20F1073 	 movsd xmm6,QWORD PTR 96[rbx]
 166      60
 167 01f1 660FEFC9 	 pxor xmm1,xmm1
 168              	.LBE405:
 169              	.LBE404:
 170              	.LBB415:
 171              	.LBB401:
  69:NBodyCppBaseline.cpp ****         p.y = -2.59193146099879641e+01;
 172              	 .loc 1 69 0
 173 01f5 660F2805 	 movapd xmm0,XMMWORD PTR .LC13[rip]
 173      00000000 
 174              	.LBE401:
 175              	.LBE415:
 176              	.LBB416:
 177              	.LBB406:
 113:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 178              	 .loc 1 113 0
 179 01fd F20F106B 	 movsd xmm5,QWORD PTR 104[rbx]
 179      68
 180              	.LBE406:
 181              	.LBE416:
 182              	.LBB417:
 183              	.LBB402:
  71:NBodyCppBaseline.cpp ****         p.vx = 2.68067772490389322e-03 * DAYS_PER_YEAR;
 184              	 .loc 1 71 0
 185 0202 48890500 	 mov QWORD PTR _ZZN4Body7neptuneEvE1p[rip+16],rax
 185      000000
  69:NBodyCppBaseline.cpp ****         p.y = -2.59193146099879641e+01;
 186              	 .loc 1 69 0
 187 0209 0F290500 	 movaps XMMWORD PTR _ZZN4Body7neptuneEvE1p[rip],xmm0
 187      000000
  72:NBodyCppBaseline.cpp ****         p.vy = 1.62824170038242295e-03 * DAYS_PER_YEAR;
 188              	 .loc 1 72 0
 189 0210 660F2805 	 movapd xmm0,XMMWORD PTR .LC15[rip]
 189      00000000 
 190 0218 0F290500 	 movaps XMMWORD PTR _ZZN4Body7neptuneEvE1p[rip+32],xmm0
 190      000000
 191 021f 660F2805 	 movapd xmm0,XMMWORD PTR .LC16[rip]
 191      00000000 
 192 0227 0F290500 	 movaps XMMWORD PTR _ZZN4Body7neptuneEvE1p[rip+48],xmm0
 192      000000
 193              	.LBE402:
 194              	.LBE417:
 106:NBodyCppBaseline.cpp ****     {
 195              	 .loc 1 106 0
 196 022e 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC28[rip]
 196      00000000 
 197              	.LBB418:
 198              	.LBB407:
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 199              	 .loc 1 112 0
 200 0236 F20F1063 	 movsd xmm4,QWORD PTR 56[rbx]
 200      38
 201              	 .loc 1 113 0
 202 023b F20F1053 	 movsd xmm2,QWORD PTR 40[rbx]
 202      28
 203              	.LBE407:
 204              	.LBE418:
 106:NBodyCppBaseline.cpp ****     {
 205              	 .loc 1 106 0
 206 0240 0F298300 	 movaps XMMWORD PTR 256[rbx],xmm0
 206      010000
 207 0247 660F6F05 	 movdqa xmm0,XMMWORD PTR _ZZN4Body7neptuneEvE1p[rip+16]
 207      00000000 
 208              	.LBB419:
 209              	.LBB408:
 210              	 .loc 1 113 0
 211 024f F20F59D4 	 mulsd xmm2,xmm4
 212              	.LBE408:
 213              	.LBE419:
 106:NBodyCppBaseline.cpp ****     {
 214              	 .loc 1 106 0
 215 0253 0F298310 	 movaps XMMWORD PTR 272[rbx],xmm0
 215      010000
 216 025a 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC29[rip]
 216      00000000 
 217 0262 0F298320 	 movaps XMMWORD PTR 288[rbx],xmm0
 217      010000
 218 0269 660F6F05 	 movdqa xmm0,XMMWORD PTR .LC30[rip]
 218      00000000 
 219 0271 0F298330 	 movaps XMMWORD PTR 304[rbx],xmm0
 219      010000
 220              	.LVL2:
 221              	.LBB420:
 222              	.LBB409:
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 223              	 .loc 1 112 0
 224 0278 F20F1043 	 movsd xmm0,QWORD PTR 32[rbx]
 224      20
 225              	 .loc 1 113 0
 226 027d F20F58D1 	 addsd xmm2,xmm1
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 227              	 .loc 1 112 0
 228 0281 F20F59C4 	 mulsd xmm0,xmm4
 114:NBodyCppBaseline.cpp ****             pz += bodies[i].vz * bodies[i].mass;
 229              	 .loc 1 114 0
 230 0285 F20F5963 	 mulsd xmm4,QWORD PTR 48[rbx]
 230      30
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 231              	 .loc 1 112 0
 232 028a F20F58C1 	 addsd xmm0,xmm1
 233              	.LVL3:
 234              	 .loc 1 114 0
 235 028e 660F28DC 	 movapd xmm3,xmm4
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 236              	 .loc 1 112 0
 237 0292 F20F1063 	 movsd xmm4,QWORD PTR 120[rbx]
 237      78
 238              	 .loc 1 114 0
 239 0297 F20F58D9 	 addsd xmm3,xmm1
 240              	.LVL4:
 241 029b F20F104B 	 movsd xmm1,QWORD PTR 112[rbx]
 241      70
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 242              	 .loc 1 112 0
 243 02a0 F20F59F4 	 mulsd xmm6,xmm4
 113:NBodyCppBaseline.cpp ****             pz += bodies[i].vz * bodies[i].mass;
 244              	 .loc 1 113 0
 245 02a4 F20F59EC 	 mulsd xmm5,xmm4
 246              	 .loc 1 114 0
 247 02a8 F20F59CC 	 mulsd xmm1,xmm4
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 248              	 .loc 1 112 0
 249 02ac F20F10A3 	 movsd xmm4,QWORD PTR 184[rbx]
 249      B8000000 
 250 02b4 F20F58C6 	 addsd xmm0,xmm6
 251              	.LVL5:
 252 02b8 F20F10B3 	 movsd xmm6,QWORD PTR 160[rbx]
 252      A0000000 
 113:NBodyCppBaseline.cpp ****             pz += bodies[i].vz * bodies[i].mass;
 253              	 .loc 1 113 0
 254 02c0 F20F58D5 	 addsd xmm2,xmm5
 255              	.LVL6:
 256 02c4 F20F10AB 	 movsd xmm5,QWORD PTR 168[rbx]
 256      A8000000 
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 257              	 .loc 1 112 0
 258 02cc F20F59F4 	 mulsd xmm6,xmm4
 259              	 .loc 1 114 0
 260 02d0 F20F58CB 	 addsd xmm1,xmm3
 261              	.LVL7:
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 262              	 .loc 1 112 0
 263 02d4 F20F109B 	 movsd xmm3,QWORD PTR 248[rbx]
 263      F8000000 
 113:NBodyCppBaseline.cpp ****             pz += bodies[i].vz * bodies[i].mass;
 264              	 .loc 1 113 0
 265 02dc F20F59EC 	 mulsd xmm5,xmm4
 266              	 .loc 1 114 0
 267 02e0 F20F59A3 	 mulsd xmm4,QWORD PTR 176[rbx]
 267      B0000000 
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 268              	 .loc 1 112 0
 269 02e8 F20F58F0 	 addsd xmm6,xmm0
 270              	.LVL8:
 271 02ec F20F1083 	 movsd xmm0,QWORD PTR 224[rbx]
 271      E0000000 
 113:NBodyCppBaseline.cpp ****             pz += bodies[i].vz * bodies[i].mass;
 272              	 .loc 1 113 0
 273 02f4 F20F58EA 	 addsd xmm5,xmm2
 274              	.LVL9:
 275 02f8 F20F1093 	 movsd xmm2,QWORD PTR 232[rbx]
 275      E8000000 
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 276              	 .loc 1 112 0
 277 0300 F20F59C3 	 mulsd xmm0,xmm3
 278              	 .loc 1 114 0
 279 0304 F20F58CC 	 addsd xmm1,xmm4
 280              	.LVL10:
 113:NBodyCppBaseline.cpp ****             pz += bodies[i].vz * bodies[i].mass;
 281              	 .loc 1 113 0
 282 0308 F20F59D3 	 mulsd xmm2,xmm3
 283              	 .loc 1 114 0
 284 030c F20F599B 	 mulsd xmm3,QWORD PTR 240[rbx]
 284      F0000000 
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 285              	 .loc 1 112 0
 286 0314 660F28E0 	 movapd xmm4,xmm0
 287 0318 F20F1083 	 movsd xmm0,QWORD PTR 312[rbx]
 287      38010000 
 113:NBodyCppBaseline.cpp ****             pz += bodies[i].vz * bodies[i].mass;
 288              	 .loc 1 113 0
 289 0320 F20F58EA 	 addsd xmm5,xmm2
 290              	.LVL11:
 291 0324 F20F1093 	 movsd xmm2,QWORD PTR 296[rbx]
 291      28010000 
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 292              	 .loc 1 112 0
 293 032c F20F58E6 	 addsd xmm4,xmm6
 294              	.LVL12:
 295              	 .loc 1 114 0
 296 0330 F20F58D9 	 addsd xmm3,xmm1
 297              	.LVL13:
 298 0334 F20F108B 	 movsd xmm1,QWORD PTR 304[rbx]
 298      30010000 
 113:NBodyCppBaseline.cpp ****             pz += bodies[i].vz * bodies[i].mass;
 299              	 .loc 1 113 0
 300 033c F20F59D0 	 mulsd xmm2,xmm0
 301              	 .loc 1 114 0
 302 0340 F20F59C8 	 mulsd xmm1,xmm0
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 303              	 .loc 1 112 0
 304 0344 F20F5983 	 mulsd xmm0,QWORD PTR 288[rbx]
 304      20010000 
 305              	.LVL14:
 113:NBodyCppBaseline.cpp ****             pz += bodies[i].vz * bodies[i].mass;
 306              	 .loc 1 113 0
 307 034c F20F58D5 	 addsd xmm2,xmm5
 308              	.LVL15:
 309              	 .loc 1 114 0
 310 0350 F20F58CB 	 addsd xmm1,xmm3
 311              	.LVL16:
 312              	.LBE409:
 313              	.LBB410:
 314              	.LBB411:
  86:NBodyCppBaseline.cpp ****         vy = -py / SOLAR_MASS;
 315              	 .loc 1 86 0
 316 0354 F30F7E1D 	 movq xmm3,QWORD PTR .LC18[rip]
 316      00000000 
 317              	.LBE411:
 318              	.LBE410:
 319              	.LBB413:
 112:NBodyCppBaseline.cpp ****             py += bodies[i].vy * bodies[i].mass;
 320              	 .loc 1 112 0
 321 035c F20F58C4 	 addsd xmm0,xmm4
 322              	.LBE413:
 323              	.LBB414:
 324              	.LBB412:
  87:NBodyCppBaseline.cpp ****         vz = -pz / SOLAR_MASS;
 325              	 .loc 1 87 0
 326 0360 660F57D3 	 xorpd xmm2,xmm3
 327              	.LVL17:
 328 0364 F20F5E15 	 divsd xmm2,QWORD PTR .LC0[rip]
 328      00000000 
 329 036c F20F1153 	 movsd QWORD PTR 40[rbx],xmm2
 329      28
  88:NBodyCppBaseline.cpp ****         return *this;
 330              	 .loc 1 88 0
 331 0371 660F57CB 	 xorpd xmm1,xmm3
 332              	.LVL18:
 333 0375 F20F5E0D 	 divsd xmm1,QWORD PTR .LC0[rip]
 333      00000000 
 334 037d F20F114B 	 movsd QWORD PTR 48[rbx],xmm1
 334      30
 335              	.LVL19:
  86:NBodyCppBaseline.cpp ****         vy = -py / SOLAR_MASS;
 336              	 .loc 1 86 0
 337 0382 660F57C3 	 xorpd xmm0,xmm3
 338 0386 F20F5E05 	 divsd xmm0,QWORD PTR .LC0[rip]
 338      00000000 
 339 038e F20F1143 	 movsd QWORD PTR 32[rbx],xmm0
 339      20
 340              	.LBE412:
 341              	.LBE414:
 342              	.LBE420:
 343              	.LBE426:
 115:NBodyCppBaseline.cpp ****         }
 116:NBodyCppBaseline.cpp ****         bodies[0].offsetMomentum(px, py, pz);
 117:NBodyCppBaseline.cpp ****     }
 344              	 .loc 1 117 0
 345 0393 5B       	 pop rbx
 346              	 .cfi_remember_state
 347              	 .cfi_def_cfa_offset 8
 348              	.LVL20:
 349 0394 C3       	 ret
 350              	.LVL21:
 351              	 .p2align 4,,10
 352 0395 0F1F00   	 .p2align 3
 353              	.L34:
 354              	 .cfi_restore_state
 355              	.LBB427:
 356              	.LBB421:
 357              	.LBB387:
  80:NBodyCppBaseline.cpp ****         p.mass = SOLAR_MASS;
 358              	 .loc 1 80 0
 359 0398 488D3D00 	 lea rdi,_ZGVZN4Body3sunEvE1p[rip]
 359      000000
 360 039f E8000000 	 call __cxa_guard_acquire@PLT
 360      00
 361              	.LVL22:
 362 03a4 85C0     	 test eax,eax
 363 03a6 0F8467FC 	 je .L3
 363      FFFF
 364 03ac 488D3D00 	 lea rdi,_ZGVZN4Body3sunEvE1p[rip]
 364      000000
 365 03b3 E8000000 	 call __cxa_guard_release@PLT
 365      00
 366              	.LVL23:
 367 03b8 E956FCFF 	 jmp .L3
 367      FF
 368 03bd 0F1F00   	 .p2align 4,,10
 369              	 .p2align 3
 370              	.L38:
 371              	.LBE387:
 372              	.LBE421:
 373              	.LBB422:
 374              	.LBB403:
  68:NBodyCppBaseline.cpp ****         p.x = 1.53796971148509165e+01;
 375              	 .loc 1 68 0
 376 03c0 488D3D00 	 lea rdi,_ZGVZN4Body7neptuneEvE1p[rip]
 376      000000
 377 03c7 E8000000 	 call __cxa_guard_acquire@PLT
 377      00
 378              	.LVL24:
 379 03cc 85C0     	 test eax,eax
 380 03ce 0F8411FE 	 je .L15
 380      FFFF
 381 03d4 488D3D00 	 lea rdi,_ZGVZN4Body7neptuneEvE1p[rip]
 381      000000
 382 03db E8000000 	 call __cxa_guard_release@PLT
 382      00
 383              	.LVL25:
 384 03e0 E900FEFF 	 jmp .L15
 384      FF
 385              	 .p2align 4,,10
 386 03e5 0F1F00   	 .p2align 3
 387              	.L37:
 388              	.LBE403:
 389              	.LBE422:
 390              	.LBB423:
 391              	.LBB398:
  56:NBodyCppBaseline.cpp ****         p.x = 1.28943695621391310e+01;
 392              	 .loc 1 56 0
 393 03e8 488D3D00 	 lea rdi,_ZGVZN4Body6uranusEvE1p[rip]
 393      000000
 394 03ef E8000000 	 call __cxa_guard_acquire@PLT
 394      00
 395              	.LVL26:
 396 03f4 85C0     	 test eax,eax
 397 03f6 0F8463FD 	 je .L12
 397      FFFF
 398 03fc 488D3D00 	 lea rdi,_ZGVZN4Body6uranusEvE1p[rip]
 398      000000
 399 0403 E8000000 	 call __cxa_guard_release@PLT
 399      00
 400              	.LVL27:
 401 0408 E952FDFF 	 jmp .L12
 401      FF
 402 040d 0F1F00   	 .p2align 4,,10
 403              	 .p2align 3
 404              	.L36:
 405              	.LBE398:
 406              	.LBE423:
 407              	.LBB424:
 408              	.LBB395:
  44:NBodyCppBaseline.cpp ****         p.x = 8.34336671824457987e+00;
 409              	 .loc 1 44 0
 410 0410 488D3D00 	 lea rdi,_ZGVZN4Body6saturnEvE1p[rip]
 410      000000
 411 0417 E8000000 	 call __cxa_guard_acquire@PLT
 411      00
 412              	.LVL28:
 413 041c 85C0     	 test eax,eax
 414 041e 0F84B5FC 	 je .L9
 414      FFFF
 415 0424 488D3D00 	 lea rdi,_ZGVZN4Body6saturnEvE1p[rip]
 415      000000
 416 042b E8000000 	 call __cxa_guard_release@PLT
 416      00
 417              	.LVL29:
 418 0430 E9A4FCFF 	 jmp .L9
 418      FF
 419              	 .p2align 4,,10
 420 0435 0F1F00   	 .p2align 3
 421              	.L35:
 422              	.LBE395:
 423              	.LBE424:
 424              	.LBB425:
 425              	.LBB392:
  32:NBodyCppBaseline.cpp ****         p.x = 4.84143144246472090e+00;
 426              	 .loc 1 32 0
 427 0438 488D3D00 	 lea rdi,_ZGVZN4Body7jupiterEvE1p[rip]
 427      000000
 428 043f E8000000 	 call __cxa_guard_acquire@PLT
 428      00
 429              	.LVL30:
 430 0444 85C0     	 test eax,eax
 431 0446 0F8413FC 	 je .L6
 431      FFFF
 432 044c 488D3D00 	 lea rdi,_ZGVZN4Body7jupiterEvE1p[rip]
 432      000000
 433 0453 E8000000 	 call __cxa_guard_release@PLT
 433      00
 434              	.LVL31:
 435 0458 E902FCFF 	 jmp .L6
 435      FF
 436              	.LBE392:
 437              	.LBE425:
 438              	.LBE427:
 439              	 .cfi_endproc
 440              	.LFE6402:
 442              	 .weak _ZN11NBodySystemC1Ev
 443              	 .set _ZN11NBodySystemC1Ev,_ZN11NBodySystemC2Ev
 444              	 .section .text._ZN11NBodySystem6energyEv,"axG",@progbits,_ZN11NBodySystem6energyEv,comdat
 445              	 .align 2
 446              	 .p2align 4,,15
 447              	 .weak _ZN11NBodySystem6energyEv
 449              	_ZN11NBodySystem6energyEv:
 450              	.LFB6405:
 118:NBodyCppBaseline.cpp **** 
 119:NBodyCppBaseline.cpp ****     void advance(double dt) {
 120:NBodyCppBaseline.cpp ****         const size_t N = (bodies.size() - 1)*bodies.size() / 2;
 121:NBodyCppBaseline.cpp ****         struct alignas(16) R {
 122:NBodyCppBaseline.cpp ****             double dx, dy, dz, filler;
 123:NBodyCppBaseline.cpp ****         };
 124:NBodyCppBaseline.cpp ****         alignas(16) static R r[1000];
 125:NBodyCppBaseline.cpp ****         alignas(16) static double mag[1000];
 126:NBodyCppBaseline.cpp **** 
 127:NBodyCppBaseline.cpp ****         for (size_t i = 0, k = 0; i < bodies.size() - 1; ++i) {
 128:NBodyCppBaseline.cpp ****             Body& iBody = bodies[i];
 129:NBodyCppBaseline.cpp ****             for (size_t j = i + 1; j < bodies.size(); ++j, ++k) {
 130:NBodyCppBaseline.cpp ****                 r[k].dx = iBody.x - bodies[j].x;
 131:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 132:NBodyCppBaseline.cpp ****                 r[k].dz = iBody.z - bodies[j].z;
 133:NBodyCppBaseline.cpp ****             }
 134:NBodyCppBaseline.cpp ****         }
 135:NBodyCppBaseline.cpp **** 
 136:NBodyCppBaseline.cpp ****         for (size_t i = 0; i < N; i += 2) {
 137:NBodyCppBaseline.cpp ****             __m128d dx, dy, dz;
 138:NBodyCppBaseline.cpp ****             dx = _mm_loadl_pd(dx, &r[i].dx);
 139:NBodyCppBaseline.cpp ****             dy = _mm_loadl_pd(dy, &r[i].dy);
 140:NBodyCppBaseline.cpp ****             dz = _mm_loadl_pd(dz, &r[i].dz);
 141:NBodyCppBaseline.cpp **** 
 142:NBodyCppBaseline.cpp ****             dx = _mm_loadh_pd(dx, &r[i + 1].dx);
 143:NBodyCppBaseline.cpp ****             dy = _mm_loadh_pd(dy, &r[i + 1].dy);
 144:NBodyCppBaseline.cpp ****             dz = _mm_loadh_pd(dz, &r[i + 1].dz);
 145:NBodyCppBaseline.cpp **** 
 146:NBodyCppBaseline.cpp **** 
 147:NBodyCppBaseline.cpp ****             __m128d dSquared = _mm_add_pd(_mm_add_pd(_mm_mul_pd(dx, dx), _mm_mul_pd(dy, dy)), _mm_m
 148:NBodyCppBaseline.cpp **** 
 149:NBodyCppBaseline.cpp ****             __m128d distance =
 150:NBodyCppBaseline.cpp ****                 _mm_cvtps_pd(_mm_rsqrt_ps(_mm_cvtpd_ps(dSquared)));
 151:NBodyCppBaseline.cpp ****             for (size_t j = 0;j < 2;++j)
 152:NBodyCppBaseline.cpp ****             {
 153:NBodyCppBaseline.cpp ****                 distance = _mm_sub_pd( _mm_mul_pd(distance, _mm_set1_pd(1.5)),
 154:NBodyCppBaseline.cpp ****                     _mm_mul_pd(_mm_mul_pd(_mm_set1_pd(0.5), dSquared), _mm_mul_pd(_mm_mul_pd(distan
 155:NBodyCppBaseline.cpp ****             }
 156:NBodyCppBaseline.cpp **** 
 157:NBodyCppBaseline.cpp ****             __m128d dmag = _mm_mul_pd( _mm_div_pd( _mm_set1_pd(dt), dSquared), distance);
 158:NBodyCppBaseline.cpp ****             _mm_store_pd(&mag[i], dmag);
 159:NBodyCppBaseline.cpp ****         }
 160:NBodyCppBaseline.cpp **** 
 161:NBodyCppBaseline.cpp ****         for (size_t i = 0, k = 0; i < bodies.size() - 1; ++i) {
 162:NBodyCppBaseline.cpp ****             Body& iBody = bodies[i];
 163:NBodyCppBaseline.cpp ****             for (size_t j = i + 1; j < bodies.size(); ++j, ++k) {
 164:NBodyCppBaseline.cpp ****                 iBody.vx -= r[k].dx * bodies[j].mass * mag[k];
 165:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 166:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 167:NBodyCppBaseline.cpp **** 
 168:NBodyCppBaseline.cpp ****                 bodies[j].vx += r[k].dx * iBody.mass * mag[k];
 169:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 170:NBodyCppBaseline.cpp ****                 bodies[j].vz += r[k].dz * iBody.mass * mag[k];
 171:NBodyCppBaseline.cpp ****             }
 172:NBodyCppBaseline.cpp ****         }
 173:NBodyCppBaseline.cpp **** 
 174:NBodyCppBaseline.cpp ****         for (size_t i = 0; i < bodies.size(); ++i) {
 175:NBodyCppBaseline.cpp ****             bodies[i].x += dt * bodies[i].vx;
 176:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 177:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 178:NBodyCppBaseline.cpp ****         }
 179:NBodyCppBaseline.cpp ****     }
 180:NBodyCppBaseline.cpp **** 
 181:NBodyCppBaseline.cpp ****     double energy() {
 451              	 .loc 1 181 0
 452              	 .cfi_startproc
 453              	.LVL32:
 454 0000 4154     	 push r12
 455              	 .cfi_def_cfa_offset 16
 456              	 .cfi_offset 12,-16
 182:NBodyCppBaseline.cpp ****         double e = 0.0;
 457              	 .loc 1 182 0
 458 0002 660FEFDB 	 pxor xmm3,xmm3
 459 0006 660FEFF6 	 pxor xmm6,xmm6
 181:NBodyCppBaseline.cpp ****         double e = 0.0;
 460              	 .loc 1 181 0
 461 000a 55       	 push rbp
 462              	 .cfi_def_cfa_offset 24
 463              	 .cfi_offset 6,-24
 464 000b BD020000 	 mov ebp,2
 464      00
 465 0010 53       	 push rbx
 466              	 .cfi_def_cfa_offset 32
 467              	 .cfi_offset 3,-32
 468 0011 4889FB   	 mov rbx,rdi
 469 0014 4883EC30 	 sub rsp,48
 470              	 .cfi_def_cfa_offset 80
 471 0018 F20F1025 	 movsd xmm4,QWORD PTR .LC31[rip]
 471      00000000 
 472              	.LVL33:
 473              	.L46:
 474              	.LBB428:
 475              	.LBB429:
 183:NBodyCppBaseline.cpp **** 
 184:NBodyCppBaseline.cpp ****         for (size_t i = 0; i < bodies.size(); ++i) {
 185:NBodyCppBaseline.cpp ****             Body const & iBody = bodies[i];
 186:NBodyCppBaseline.cpp ****             double dx, dy, dz, distance;
 187:NBodyCppBaseline.cpp ****             e += 0.5 * iBody.mass *
 188:NBodyCppBaseline.cpp ****                 (iBody.vx * iBody.vx
 476              	 .loc 1 188 0
 477 0020 F20F104B 	 movsd xmm1,QWORD PTR 32[rbx]
 477      20
 189:NBodyCppBaseline.cpp ****                     + iBody.vy * iBody.vy
 478              	 .loc 1 189 0
 479 0025 F20F1053 	 movsd xmm2,QWORD PTR 40[rbx]
 479      28
 480              	.LBB430:
 190:NBodyCppBaseline.cpp ****                     + iBody.vz * iBody.vz);
 191:NBodyCppBaseline.cpp **** 
 192:NBodyCppBaseline.cpp ****             for (size_t j = i + 1; j < bodies.size(); ++j) {
 481              	 .loc 1 192 0
 482 002a 4C8D65FF 	 lea r12,-1[rbp]
 483              	.LBE430:
 190:NBodyCppBaseline.cpp ****                     + iBody.vz * iBody.vz);
 484              	 .loc 1 190 0
 485 002e F20F1043 	 movsd xmm0,QWORD PTR 48[rbx]
 485      30
 187:NBodyCppBaseline.cpp ****                 (iBody.vx * iBody.vx
 486              	 .loc 1 187 0
 487 0033 F20F106B 	 movsd xmm5,QWORD PTR 56[rbx]
 487      38
 188:NBodyCppBaseline.cpp ****                     + iBody.vy * iBody.vy
 488              	 .loc 1 188 0
 489 0038 F20F59C9 	 mulsd xmm1,xmm1
 189:NBodyCppBaseline.cpp ****                     + iBody.vz * iBody.vz);
 490              	 .loc 1 189 0
 491 003c F20F59D2 	 mulsd xmm2,xmm2
 190:NBodyCppBaseline.cpp **** 
 492              	 .loc 1 190 0
 493 0040 F20F59C0 	 mulsd xmm0,xmm0
 189:NBodyCppBaseline.cpp ****                     + iBody.vz * iBody.vz);
 494              	 .loc 1 189 0
 495 0044 F20F58D1 	 addsd xmm2,xmm1
 187:NBodyCppBaseline.cpp ****                 (iBody.vx * iBody.vx
 496              	 .loc 1 187 0
 497 0048 660F28CD 	 movapd xmm1,xmm5
 498 004c F20F59CC 	 mulsd xmm1,xmm4
 190:NBodyCppBaseline.cpp **** 
 499              	 .loc 1 190 0
 500 0050 F20F58D0 	 addsd xmm2,xmm0
 187:NBodyCppBaseline.cpp ****                 (iBody.vx * iBody.vx
 501              	 .loc 1 187 0
 502 0054 F20F59CA 	 mulsd xmm1,xmm2
 503 0058 F20F58CE 	 addsd xmm1,xmm6
 504              	.LVL34:
 505              	.LBB437:
 506              	 .loc 1 192 0
 507 005c 4883FD06 	 cmp rbp,6
 508 0060 0F84B201 	 je .L39
 508      0000
 509 0066 4C89E0   	 mov rax,r12
 510              	.LBB431:
 193:NBodyCppBaseline.cpp ****                 Body const & jBody = bodies[j];
 194:NBodyCppBaseline.cpp ****                 dx = iBody.x - jBody.x;
 511              	 .loc 1 194 0
 512 0069 F20F1033 	 movsd xmm6,QWORD PTR [rbx]
 195:NBodyCppBaseline.cpp ****                 dy = iBody.y - jBody.y;
 513              	 .loc 1 195 0
 514 006d F20F1053 	 movsd xmm2,QWORD PTR 8[rbx]
 514      08
 515 0072 48C1E006 	 sal rax,6
 196:NBodyCppBaseline.cpp ****                 dz = iBody.z - jBody.z;
 516              	 .loc 1 196 0
 517 0076 F20F1043 	 movsd xmm0,QWORD PTR 16[rbx]
 517      10
 518 007b 4801F8   	 add rax,rdi
 194:NBodyCppBaseline.cpp ****                 dy = iBody.y - jBody.y;
 519              	 .loc 1 194 0
 520 007e F20F5C30 	 subsd xmm6,QWORD PTR [rax]
 521              	.LVL35:
 195:NBodyCppBaseline.cpp ****                 dy = iBody.y - jBody.y;
 522              	 .loc 1 195 0
 523 0082 F20F5C50 	 subsd xmm2,QWORD PTR 8[rax]
 523      08
 524              	.LVL36:
 525              	 .loc 1 196 0
 526 0087 F20F5C40 	 subsd xmm0,QWORD PTR 16[rax]
 526      10
 527              	.LVL37:
 197:NBodyCppBaseline.cpp **** 
 198:NBodyCppBaseline.cpp ****                 distance = sqrt(dx*dx + dy * dy + dz * dz);
 528              	 .loc 1 198 0
 529 008c F20F59D2 	 mulsd xmm2,xmm2
 530              	.LVL38:
 531 0090 F20F59F6 	 mulsd xmm6,xmm6
 532              	.LVL39:
 533 0094 F20F59C0 	 mulsd xmm0,xmm0
 534              	.LVL40:
 535 0098 F20F58D6 	 addsd xmm2,xmm6
 536 009c F20F58C2 	 addsd xmm0,xmm2
 537 00a0 660F2ED8 	 ucomisd xmm3,xmm0
 538 00a4 F20F51D0 	 sqrtsd xmm2,xmm0
 539 00a8 0F877701 	 ja .L57
 539      0000
 540              	.LVL41:
 541              	.L41:
 199:NBodyCppBaseline.cpp ****                 e -= (iBody.mass * jBody.mass) / distance;
 542              	 .loc 1 199 0
 543 00ae 49C1E406 	 sal r12,6
 544              	.LVL42:
 545 00b2 660F28F1 	 movapd xmm6,xmm1
 546 00b6 F2420F10 	 movsd xmm0,QWORD PTR 56[rdi+r12]
 546      442738
 547 00bd 41BC0600 	 mov r12d,6
 547      0000
 548 00c3 F20F59C5 	 mulsd xmm0,xmm5
 549 00c7 F20F5EC2 	 divsd xmm0,xmm2
 550 00cb F20F5CF0 	 subsd xmm6,xmm0
 551              	.LVL43:
 552              	.LBE431:
 192:NBodyCppBaseline.cpp ****                 Body const & jBody = bodies[j];
 553              	 .loc 1 192 0
 554 00cf 4883FD05 	 cmp rbp,5
 555 00d3 0F842E01 	 je .L42
 555      0000
 556 00d9 4889E8   	 mov rax,rbp
 557              	.LBB432:
 194:NBodyCppBaseline.cpp ****                 dy = iBody.y - jBody.y;
 558              	 .loc 1 194 0
 559 00dc F20F100B 	 movsd xmm1,QWORD PTR [rbx]
 195:NBodyCppBaseline.cpp ****                 dz = iBody.z - jBody.z;
 560              	 .loc 1 195 0
 561 00e0 F20F1053 	 movsd xmm2,QWORD PTR 8[rbx]
 561      08
 562              	.LVL44:
 563 00e5 48C1E006 	 sal rax,6
 196:NBodyCppBaseline.cpp **** 
 564              	 .loc 1 196 0
 565 00e9 F20F1043 	 movsd xmm0,QWORD PTR 16[rbx]
 565      10
 566 00ee 4801F8   	 add rax,rdi
 194:NBodyCppBaseline.cpp ****                 dy = iBody.y - jBody.y;
 567              	 .loc 1 194 0
 568 00f1 F20F5C08 	 subsd xmm1,QWORD PTR [rax]
 569              	.LVL45:
 195:NBodyCppBaseline.cpp ****                 dz = iBody.z - jBody.z;
 570              	 .loc 1 195 0
 571 00f5 F20F5C50 	 subsd xmm2,QWORD PTR 8[rax]
 571      08
 572              	.LVL46:
 196:NBodyCppBaseline.cpp **** 
 573              	 .loc 1 196 0
 574 00fa F20F5C40 	 subsd xmm0,QWORD PTR 16[rax]
 574      10
 575              	.LVL47:
 198:NBodyCppBaseline.cpp ****                 e -= (iBody.mass * jBody.mass) / distance;
 576              	 .loc 1 198 0
 577 00ff F20F59C9 	 mulsd xmm1,xmm1
 578              	.LVL48:
 579 0103 F20F59D2 	 mulsd xmm2,xmm2
 580              	.LVL49:
 581 0107 F20F59C0 	 mulsd xmm0,xmm0
 582              	.LVL50:
 583 010b F20F58D1 	 addsd xmm2,xmm1
 584 010f F20F58C2 	 addsd xmm0,xmm2
 585 0113 660F2ED8 	 ucomisd xmm3,xmm0
 586 0117 F20F51C8 	 sqrtsd xmm1,xmm0
 587 011b 0F874D01 	 ja .L58
 587      0000
 588              	.LVL51:
 589              	.L43:
 590              	 .loc 1 199 0
 591 0121 4889E8   	 mov rax,rbp
 592              	.LBE432:
 192:NBodyCppBaseline.cpp ****                 Body const & jBody = bodies[j];
 593              	 .loc 1 192 0
 594 0124 4C8D6501 	 lea r12,1[rbp]
 595              	.LBB433:
 596              	 .loc 1 199 0
 597 0128 48C1E006 	 sal rax,6
 598 012c F20F1044 	 movsd xmm0,QWORD PTR 56[rdi+rax]
 598      0738
 599 0132 F20F59C5 	 mulsd xmm0,xmm5
 600 0136 F20F5EC1 	 divsd xmm0,xmm1
 601 013a F20F5CF0 	 subsd xmm6,xmm0
 602              	.LVL52:
 603              	.LBE433:
 192:NBodyCppBaseline.cpp ****                 Body const & jBody = bodies[j];
 604              	 .loc 1 192 0
 605 013e 4983FC05 	 cmp r12,5
 606 0142 0F84BF00 	 je .L42
 606      0000
 607 0148 4C89E0   	 mov rax,r12
 608              	.LBB434:
 194:NBodyCppBaseline.cpp ****                 dy = iBody.y - jBody.y;
 609              	 .loc 1 194 0
 610 014b F20F1013 	 movsd xmm2,QWORD PTR [rbx]
 195:NBodyCppBaseline.cpp ****                 dz = iBody.z - jBody.z;
 611              	 .loc 1 195 0
 612 014f F20F104B 	 movsd xmm1,QWORD PTR 8[rbx]
 612      08
 613              	.LVL53:
 614 0154 48C1E006 	 sal rax,6
 196:NBodyCppBaseline.cpp **** 
 615              	 .loc 1 196 0
 616 0158 F20F1043 	 movsd xmm0,QWORD PTR 16[rbx]
 616      10
 617 015d 4801F8   	 add rax,rdi
 194:NBodyCppBaseline.cpp ****                 dy = iBody.y - jBody.y;
 618              	 .loc 1 194 0
 619 0160 F20F5C10 	 subsd xmm2,QWORD PTR [rax]
 620              	.LVL54:
 195:NBodyCppBaseline.cpp ****                 dz = iBody.z - jBody.z;
 621              	 .loc 1 195 0
 622 0164 F20F5C48 	 subsd xmm1,QWORD PTR 8[rax]
 622      08
 623              	.LVL55:
 196:NBodyCppBaseline.cpp **** 
 624              	 .loc 1 196 0
 625 0169 F20F5C40 	 subsd xmm0,QWORD PTR 16[rax]
 625      10
 626              	.LVL56:
 198:NBodyCppBaseline.cpp ****                 e -= (iBody.mass * jBody.mass) / distance;
 627              	 .loc 1 198 0
 628 016e F20F59C9 	 mulsd xmm1,xmm1
 629              	.LVL57:
 630 0172 F20F59D2 	 mulsd xmm2,xmm2
 631              	.LVL58:
 632 0176 F20F59C0 	 mulsd xmm0,xmm0
 633              	.LVL59:
 634 017a F20F58CA 	 addsd xmm1,xmm2
 635 017e F20F58C1 	 addsd xmm0,xmm1
 636 0182 660F2ED8 	 ucomisd xmm3,xmm0
 637 0186 F20F51C8 	 sqrtsd xmm1,xmm0
 638 018a 0F872701 	 ja .L59
 638      0000
 639              	.LVL60:
 640              	.L44:
 641              	 .loc 1 199 0
 642 0190 4C89E0   	 mov rax,r12
 643 0193 48C1E006 	 sal rax,6
 644 0197 F20F1044 	 movsd xmm0,QWORD PTR 56[rdi+rax]
 644      0738
 645 019d F20F59C5 	 mulsd xmm0,xmm5
 646 01a1 F20F5EC1 	 divsd xmm0,xmm1
 647 01a5 F20F5CF0 	 subsd xmm6,xmm0
 648              	.LVL61:
 649              	.LBE434:
 192:NBodyCppBaseline.cpp ****                 Body const & jBody = bodies[j];
 650              	 .loc 1 192 0
 651 01a9 4883FD03 	 cmp rbp,3
 652 01ad 7458     	 je .L42
 653              	.LVL62:
 654              	.LBB435:
 194:NBodyCppBaseline.cpp ****                 dy = iBody.y - jBody.y;
 655              	 .loc 1 194 0
 656 01af F20F1013 	 movsd xmm2,QWORD PTR [rbx]
 195:NBodyCppBaseline.cpp ****                 dz = iBody.z - jBody.z;
 657              	 .loc 1 195 0
 658 01b3 F20F104B 	 movsd xmm1,QWORD PTR 8[rbx]
 658      08
 659              	.LVL63:
 194:NBodyCppBaseline.cpp ****                 dy = iBody.y - jBody.y;
 660              	 .loc 1 194 0
 661 01b8 F20F5C97 	 subsd xmm2,QWORD PTR 256[rdi]
 661      00010000 
 662              	.LVL64:
 195:NBodyCppBaseline.cpp ****                 dz = iBody.z - jBody.z;
 663              	 .loc 1 195 0
 664 01c0 F20F5C8F 	 subsd xmm1,QWORD PTR 264[rdi]
 664      08010000 
 665              	.LVL65:
 196:NBodyCppBaseline.cpp **** 
 666              	 .loc 1 196 0
 667 01c8 F20F1043 	 movsd xmm0,QWORD PTR 16[rbx]
 667      10
 668 01cd F20F5C87 	 subsd xmm0,QWORD PTR 272[rdi]
 668      10010000 
 669              	.LVL66:
 198:NBodyCppBaseline.cpp ****                 e -= (iBody.mass * jBody.mass) / distance;
 670              	 .loc 1 198 0
 671 01d5 F20F59C9 	 mulsd xmm1,xmm1
 672              	.LVL67:
 673 01d9 F20F59D2 	 mulsd xmm2,xmm2
 674              	.LVL68:
 675 01dd F20F59C0 	 mulsd xmm0,xmm0
 676              	.LVL69:
 677 01e1 F20F58CA 	 addsd xmm1,xmm2
 678 01e5 F20F58C1 	 addsd xmm0,xmm1
 679 01e9 660F2ED8 	 ucomisd xmm3,xmm0
 680 01ed F20F51C8 	 sqrtsd xmm1,xmm0
 681 01f1 0F870901 	 ja .L60
 681      0000
 682              	.LVL70:
 683              	.L45:
 684              	 .loc 1 199 0
 685 01f7 F20F59AF 	 mulsd xmm5,QWORD PTR 312[rdi]
 685      38010000 
 686 01ff F20F5EE9 	 divsd xmm5,xmm1
 687 0203 F20F5CF5 	 subsd xmm6,xmm5
 688              	.LVL71:
 689              	.L42:
 690 0207 4883C340 	 add rbx,64
 691 020b 4C89E5   	 mov rbp,r12
 692              	.LVL72:
 693 020e E90DFEFF 	 jmp .L46
 693      FF
 694              	.LVL73:
 695              	 .p2align 4,,10
 696 0213 0F1F4400 	 .p2align 3
 696      00
 697              	.L39:
 698              	.LBE435:
 699              	.LBE437:
 700              	.LBE429:
 701              	.LBE428:
 200:NBodyCppBaseline.cpp ****             }
 201:NBodyCppBaseline.cpp ****         }
 202:NBodyCppBaseline.cpp ****         return e;
 203:NBodyCppBaseline.cpp ****     }
 702              	 .loc 1 203 0
 703 0218 4883C430 	 add rsp,48
 704              	 .cfi_remember_state
 705              	 .cfi_def_cfa_offset 32
 706 021c 660F28C1 	 movapd xmm0,xmm1
 707 0220 5B       	 pop rbx
 708              	 .cfi_def_cfa_offset 24
 709 0221 5D       	 pop rbp
 710              	 .cfi_def_cfa_offset 16
 711              	.LVL74:
 712 0222 415C     	 pop r12
 713              	 .cfi_def_cfa_offset 8
 714              	.LVL75:
 715 0224 C3       	 ret
 716              	.LVL76:
 717              	.L57:
 718              	 .cfi_restore_state
 719 0225 F20F115C 	 movsd QWORD PTR 40[rsp],xmm3
 719      2428
 720 022b F20F1164 	 movsd QWORD PTR 32[rsp],xmm4
 720      2420
 721 0231 48897C24 	 mov QWORD PTR 24[rsp],rdi
 721      18
 722 0236 F20F114C 	 movsd QWORD PTR 16[rsp],xmm1
 722      2410
 723 023c F20F1154 	 movsd QWORD PTR 8[rsp],xmm2
 723      2408
 724              	.LBB440:
 725              	.LBB439:
 726              	.LBB438:
 727              	.LBB436:
 198:NBodyCppBaseline.cpp ****                 e -= (iBody.mass * jBody.mass) / distance;
 728              	 .loc 1 198 0
 729 0242 E8000000 	 call sqrt@PLT
 729      00
 730              	.LVL77:
 731 0247 F20F106B 	 movsd xmm5,QWORD PTR 56[rbx]
 731      38
 732 024c F20F105C 	 movsd xmm3,QWORD PTR 40[rsp]
 732      2428
 733 0252 F20F1064 	 movsd xmm4,QWORD PTR 32[rsp]
 733      2420
 734 0258 488B7C24 	 mov rdi,QWORD PTR 24[rsp]
 734      18
 735 025d F20F104C 	 movsd xmm1,QWORD PTR 16[rsp]
 735      2410
 736 0263 F20F1054 	 movsd xmm2,QWORD PTR 8[rsp]
 736      2408
 737 0269 E940FEFF 	 jmp .L41
 737      FF
 738              	.LVL78:
 739              	.L58:
 740 026e F20F115C 	 movsd QWORD PTR 40[rsp],xmm3
 740      2428
 741 0274 F20F1164 	 movsd QWORD PTR 32[rsp],xmm4
 741      2420
 742 027a 48897C24 	 mov QWORD PTR 24[rsp],rdi
 742      18
 743 027f F20F114C 	 movsd QWORD PTR 16[rsp],xmm1
 743      2410
 744 0285 F20F1174 	 movsd QWORD PTR 8[rsp],xmm6
 744      2408
 745 028b E8000000 	 call sqrt@PLT
 745      00
 746              	.LVL79:
 747 0290 F20F106B 	 movsd xmm5,QWORD PTR 56[rbx]
 747      38
 748 0295 F20F105C 	 movsd xmm3,QWORD PTR 40[rsp]
 748      2428
 749 029b F20F1064 	 movsd xmm4,QWORD PTR 32[rsp]
 749      2420
 750 02a1 488B7C24 	 mov rdi,QWORD PTR 24[rsp]
 750      18
 751 02a6 F20F104C 	 movsd xmm1,QWORD PTR 16[rsp]
 751      2410
 752 02ac F20F1074 	 movsd xmm6,QWORD PTR 8[rsp]
 752      2408
 753 02b2 E96AFEFF 	 jmp .L43
 753      FF
 754              	.LVL80:
 755              	.L59:
 756 02b7 F20F115C 	 movsd QWORD PTR 40[rsp],xmm3
 756      2428
 757 02bd F20F1164 	 movsd QWORD PTR 32[rsp],xmm4
 757      2420
 758 02c3 48897C24 	 mov QWORD PTR 24[rsp],rdi
 758      18
 759 02c8 F20F114C 	 movsd QWORD PTR 16[rsp],xmm1
 759      2410
 760 02ce F20F1174 	 movsd QWORD PTR 8[rsp],xmm6
 760      2408
 761 02d4 E8000000 	 call sqrt@PLT
 761      00
 762              	.LVL81:
 763 02d9 F20F106B 	 movsd xmm5,QWORD PTR 56[rbx]
 763      38
 764 02de F20F105C 	 movsd xmm3,QWORD PTR 40[rsp]
 764      2428
 765 02e4 F20F1064 	 movsd xmm4,QWORD PTR 32[rsp]
 765      2420
 766 02ea 488B7C24 	 mov rdi,QWORD PTR 24[rsp]
 766      18
 767 02ef F20F104C 	 movsd xmm1,QWORD PTR 16[rsp]
 767      2410
 768 02f5 F20F1074 	 movsd xmm6,QWORD PTR 8[rsp]
 768      2408
 769 02fb E990FEFF 	 jmp .L44
 769      FF
 770              	.LVL82:
 771              	.L60:
 772 0300 F20F115C 	 movsd QWORD PTR 40[rsp],xmm3
 772      2428
 773 0306 F20F1164 	 movsd QWORD PTR 32[rsp],xmm4
 773      2420
 774 030c 48897C24 	 mov QWORD PTR 24[rsp],rdi
 774      18
 775 0311 F20F1174 	 movsd QWORD PTR 16[rsp],xmm6
 775      2410
 776 0317 F20F114C 	 movsd QWORD PTR 8[rsp],xmm1
 776      2408
 777 031d E8000000 	 call sqrt@PLT
 777      00
 778              	.LVL83:
 779 0322 F20F106B 	 movsd xmm5,QWORD PTR 56[rbx]
 779      38
 780 0327 F20F104C 	 movsd xmm1,QWORD PTR 8[rsp]
 780      2408
 781 032d F20F1074 	 movsd xmm6,QWORD PTR 16[rsp]
 781      2410
 782 0333 488B7C24 	 mov rdi,QWORD PTR 24[rsp]
 782      18
 783 0338 F20F1064 	 movsd xmm4,QWORD PTR 32[rsp]
 783      2420
 784 033e F20F105C 	 movsd xmm3,QWORD PTR 40[rsp]
 784      2428
 785 0344 E9AEFEFF 	 jmp .L45
 785      FF
 786              	.LBE436:
 787              	.LBE438:
 788              	.LBE439:
 789              	.LBE440:
 790              	 .cfi_endproc
 791              	.LFE6405:
 793              	 .section .rodata.str1.1,"aMS",@progbits,1
 794              	.LC32:
 795 0000 252E3966 	 .string "%.9f\n"
 795      0A00
 796              	.LC37:
 797 0006 546F7461 	 .string "Total time: %.3F\n"
 797      6C207469 
 797      6D653A20 
 797      252E3346 
 797      0A00
 798              	 .section .text.startup,"ax",@progbits
 799              	 .p2align 4,,15
 800              	 .globl main
 802              	main:
 803              	.LFB6406:
 204:NBodyCppBaseline.cpp **** };
 205:NBodyCppBaseline.cpp **** 
 206:NBodyCppBaseline.cpp **** int main(int argc, char** argv) {
 804              	 .loc 1 206 0
 805              	 .cfi_startproc
 806              	.LVL84:
 807 0000 4155     	 push r13
 808              	 .cfi_def_cfa_offset 16
 809              	 .cfi_offset 13,-16
 810 0002 4154     	 push r12
 811              	 .cfi_def_cfa_offset 24
 812              	 .cfi_offset 12,-24
 813 0004 55       	 push rbp
 814              	 .cfi_def_cfa_offset 32
 815              	 .cfi_offset 6,-32
 816 0005 4889F5   	 mov rbp,rsi
 817 0008 53       	 push rbx
 818              	 .cfi_def_cfa_offset 40
 819              	 .cfi_offset 3,-40
 820 0009 89FB     	 mov ebx,edi
 821 000b 4881EC58 	 sub rsp,344
 821      010000
 822              	 .cfi_def_cfa_offset 384
 823              	 .loc 1 206 0
 824 0012 64488B04 	 mov rax,QWORD PTR fs:40
 824      25280000 
 824      00
 825 001b 48898424 	 mov QWORD PTR 328[rsp],rax
 825      48010000 
 826 0023 31C0     	 xor eax,eax
 207:NBodyCppBaseline.cpp **** 
 208:NBodyCppBaseline.cpp ****     auto start = std::chrono::system_clock::now();
 827              	 .loc 1 208 0
 828 0025 E8000000 	 call _ZNSt6chrono3_V212system_clock3nowEv@PLT
 828      00
 829              	.LVL85:
 830 002a 4989C4   	 mov r12,rax
 831              	.LVL86:
 209:NBodyCppBaseline.cpp **** 
 210:NBodyCppBaseline.cpp ****     int n = argc >= 2 ? atoi(argv[1]) : 50000000;
 832              	 .loc 1 210 0
 833 002d 83FB01   	 cmp ebx,1
 834 0030 0F8F420B 	 jg .L75
 834      0000
 835              	.LVL87:
 211:NBodyCppBaseline.cpp **** 
 212:NBodyCppBaseline.cpp ****     NBodySystem bodies;
 836              	 .loc 1 212 0
 837 0036 4889E3   	 mov rbx,rsp
 838              	.LVL88:
 210:NBodyCppBaseline.cpp **** 
 839              	 .loc 1 210 0
 840 0039 BD80F0FA 	 mov ebp,50000000
 840      02
 841              	.LVL89:
 842              	 .loc 1 212 0
 843 003e 4889DF   	 mov rdi,rbx
 844 0041 E8000000 	 call _ZN11NBodySystemC1Ev
 844      00
 845              	.LVL90:
 213:NBodyCppBaseline.cpp ****     printf("%.9f\n", bodies.energy());
 846              	 .loc 1 213 0
 847 0046 4889DF   	 mov rdi,rbx
 848 0049 E8000000 	 call _ZN11NBodySystem6energyEv
 848      00
 849              	.LVL91:
 850              	.LBB559:
 851              	.LBB560:
 852              	 .file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
   1:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** /* Checking macros for stdio functions.
   2:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    Copyright (C) 2004-2018 Free Software Foundation, Inc.
   3:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    This file is part of the GNU C Library.
   4:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
   5:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    The GNU C Library is free software; you can redistribute it and/or
   6:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    modify it under the terms of the GNU Lesser General Public
   7:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    License as published by the Free Software Foundation; either
   8:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    version 2.1 of the License, or (at your option) any later version.
   9:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  10:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    The GNU C Library is distributed in the hope that it will be useful,
  11:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    but WITHOUT ANY WARRANTY; without even the implied warranty of
  12:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  13:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    Lesser General Public License for more details.
  14:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  15:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    You should have received a copy of the GNU Lesser General Public
  16:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    License along with the GNU C Library; if not, see
  17:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****    <http://www.gnu.org/licenses/>.  */
  18:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  19:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** #ifndef _STDIO_H
  20:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** # error "Never include <bits/stdio2.h> directly; use <stdio.h> instead."
  21:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** #endif
  22:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  23:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** extern int __sprintf_chk (char *__restrict __s, int __flag, size_t __slen,
  24:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			  const char *__restrict __format, ...) __THROW;
  25:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** extern int __vsprintf_chk (char *__restrict __s, int __flag, size_t __slen,
  26:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			   const char *__restrict __format,
  27:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			   _G_va_list __ap) __THROW;
  28:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  29:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** #ifdef __va_arg_pack
  30:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** __fortify_function int
  31:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** __NTH (sprintf (char *__restrict __s, const char *__restrict __fmt, ...))
  32:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** {
  33:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
  34:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 				  __bos (__s), __fmt, __va_arg_pack ());
  35:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** }
  36:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** #elif !defined __cplusplus
  37:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** # define sprintf(str, ...) \
  38:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****   __builtin___sprintf_chk (str, __USE_FORTIFY_LEVEL - 1, __bos (str), \
  39:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			   __VA_ARGS__)
  40:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** #endif
  41:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  42:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** __fortify_function int
  43:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** __NTH (vsprintf (char *__restrict __s, const char *__restrict __fmt,
  44:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 		 _G_va_list __ap))
  45:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** {
  46:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****   return __builtin___vsprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
  47:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 				   __bos (__s), __fmt, __ap);
  48:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** }
  49:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  50:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** #if defined __USE_ISOC99 || defined __USE_UNIX98
  51:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  52:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** extern int __snprintf_chk (char *__restrict __s, size_t __n, int __flag,
  53:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			   size_t __slen, const char *__restrict __format,
  54:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			   ...) __THROW;
  55:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** extern int __vsnprintf_chk (char *__restrict __s, size_t __n, int __flag,
  56:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			    size_t __slen, const char *__restrict __format,
  57:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			    _G_va_list __ap) __THROW;
  58:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  59:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** # ifdef __va_arg_pack
  60:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** __fortify_function int
  61:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** __NTH (snprintf (char *__restrict __s, size_t __n,
  62:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 		 const char *__restrict __fmt, ...))
  63:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** {
  64:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
  65:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 				   __bos (__s), __fmt, __va_arg_pack ());
  66:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** }
  67:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** # elif !defined __cplusplus
  68:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** #  define snprintf(str, len, ...) \
  69:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****   __builtin___snprintf_chk (str, len, __USE_FORTIFY_LEVEL - 1, __bos (str), \
  70:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			    __VA_ARGS__)
  71:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** # endif
  72:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  73:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** __fortify_function int
  74:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** __NTH (vsnprintf (char *__restrict __s, size_t __n,
  75:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 		  const char *__restrict __fmt, _G_va_list __ap))
  76:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** {
  77:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****   return __builtin___vsnprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
  78:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 				    __bos (__s), __fmt, __ap);
  79:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** }
  80:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  81:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** #endif
  82:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  83:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** #if __USE_FORTIFY_LEVEL > 1
  84:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  85:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** extern int __fprintf_chk (FILE *__restrict __stream, int __flag,
  86:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			  const char *__restrict __format, ...);
  87:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** extern int __printf_chk (int __flag, const char *__restrict __format, ...);
  88:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** extern int __vfprintf_chk (FILE *__restrict __stream, int __flag,
  89:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			   const char *__restrict __format, _G_va_list __ap);
  90:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** extern int __vprintf_chk (int __flag, const char *__restrict __format,
  91:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			  _G_va_list __ap);
  92:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
  93:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** # ifdef __va_arg_pack
  94:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** __fortify_function int
  95:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** fprintf (FILE *__restrict __stream, const char *__restrict __fmt, ...)
  96:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** {
  97:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
  98:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 			__va_arg_pack ());
  99:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** }
 100:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** 
 101:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** __fortify_function int
 102:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** printf (const char *__restrict __fmt, ...)
 103:/usr/include/x86_64-linux-gnu/bits/stdio2.h **** {
 104:/usr/include/x86_64-linux-gnu/bits/stdio2.h ****   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
 853              	 .loc 2 104 0
 854 004e BF010000 	 mov edi,1
 854      00
 855 0053 B8010000 	 mov eax,1
 855      00
 856 0058 488D3500 	 lea rsi,.LC32[rip]
 856      000000
 857 005f E8000000 	 call __printf_chk@PLT
 857      00
 858              	.LVL92:
 859              	.L68:
 860 0064 F20F106C 	 movsd xmm5,QWORD PTR 72[rsp]
 860      2448
 861 006a 4C8B4424 	 mov r8,QWORD PTR 8[rsp]
 861      08
 862              	.LBE560:
 863              	.LBE559:
 210:NBodyCppBaseline.cpp **** 
 864              	 .loc 1 210 0
 865 006f 31C9     	 xor ecx,ecx
 866 0071 488D0500 	 lea rax,_ZZN11NBodySystem7advanceEdE1r[rip]
 866      000000
 867 0078 F20F10B4 	 movsd xmm6,QWORD PTR 264[rsp]
 867      24080100 
 867      00
 868 0081 F20F1024 	 movsd xmm4,QWORD PTR [rsp]
 868      24
 869 0086 488D1500 	 lea rdx,_ZZN11NBodySystem7advanceEdE3mag[rip]
 869      000000
 870 008d F20F105C 	 movsd xmm3,QWORD PTR 64[rsp]
 870      2440
 871 0093 F20F107C 	 movsd xmm7,QWORD PTR 16[rsp]
 871      2410
 872 0099 F20F104C 	 movsd xmm1,QWORD PTR 80[rsp]
 872      2450
 873 009f 66490F7E 	 movq r11,xmm6
 873      F3
 874 00a4 F20F1094 	 movsd xmm2,QWORD PTR 128[rsp]
 874      24800000 
 874      00
 875 00ad 660F28F5 	 movapd xmm6,xmm5
 876 00b1 488BBC24 	 mov rdi,QWORD PTR 136[rsp]
 876      88000000 
 877 00b9 488BB424 	 mov rsi,QWORD PTR 200[rsp]
 877      C8000000 
 878 00c1 66490F6E 	 movq xmm5,r8
 878      E8
 879 00c6 F20F1084 	 movsd xmm0,QWORD PTR 144[rsp]
 879      24900000 
 879      00
 880 00cf F2440F10 	 movsd xmm8,QWORD PTR 192[rsp]
 880      8424C000 
 880      0000
 881 00d9 F2440F10 	 movsd xmm13,QWORD PTR 208[rsp]
 881      AC24D000 
 881      0000
 882 00e3 F2440F10 	 movsd xmm14,QWORD PTR 256[rsp]
 882      B4240001 
 882      0000
 883 00ed F2440F10 	 movsd xmm15,QWORD PTR 272[rsp]
 883      BC241001 
 883      0000
 884 00f7 66440F28 	 movapd xmm12,XMMWORD PTR .LC33[rip]
 884      25000000 
 884      00
 885 0100 66440F28 	 movapd xmm10,XMMWORD PTR .LC34[rip]
 885      15000000 
 885      00
 886 0109 66440F28 	 movapd xmm11,XMMWORD PTR .LC35[rip]
 886      1D000000 
 886      00
 887 0112 F2440F10 	 movsd xmm9,QWORD PTR .LC38[rip]
 887      0D000000 
 887      00
 888              	.LVL93:
 889 011b 0F1F4400 	 .p2align 4,,10
 889      00
 890              	 .p2align 3
 891              	.L69:
 892              	.LBB562:
 893              	.LBB563:
 894              	.LBB564:
 895              	.LBB565:
 896              	.LBB566:
 897              	.LBB567:
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 898              	 .loc 1 130 0
 899 0120 660F14DE 	 unpcklpd xmm3,xmm6
 132:NBodyCppBaseline.cpp ****             }
 900              	 .loc 1 132 0
 901 0124 660F28F7 	 movapd xmm6,xmm7
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 902              	 .loc 1 130 0
 903 0128 660F14E5 	 unpcklpd xmm4,xmm5
 132:NBodyCppBaseline.cpp ****             }
 904              	 .loc 1 132 0
 905 012c F20F5CF1 	 subsd xmm6,xmm1
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 906              	 .loc 1 130 0
 907 0130 660F28EC 	 movapd xmm5,xmm4
 908 0134 660F5CEB 	 subpd xmm5,xmm3
 132:NBodyCppBaseline.cpp ****             }
 909              	 .loc 1 132 0
 910 0138 66490F7E 	 movq r8,xmm6
 910      F0
 911 013d F20F1135 	 movsd QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+16],xmm6
 911      00000000 
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 912              	 .loc 1 130 0
 913 0145 66480F6E 	 movq xmm6,rdi
 913      F7
 914 014a 660F14D6 	 unpcklpd xmm2,xmm6
 132:NBodyCppBaseline.cpp ****             }
 915              	 .loc 1 132 0
 916 014e 660F28F7 	 movapd xmm6,xmm7
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 917              	 .loc 1 130 0
 918 0152 0F2928   	 movaps XMMWORD PTR [rax],xmm5
 919              	.LVL94:
 920 0155 660F28EC 	 movapd xmm5,xmm4
 132:NBodyCppBaseline.cpp ****             }
 921              	 .loc 1 132 0
 922 0159 F20F5CF0 	 subsd xmm6,xmm0
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 923              	 .loc 1 130 0
 924 015d 660F5CEA 	 subpd xmm5,xmm2
 132:NBodyCppBaseline.cpp ****             }
 925              	 .loc 1 132 0
 926 0161 66480F7E 	 movq rdi,xmm6
 926      F7
 927 0166 F20F1135 	 movsd QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+48],xmm6
 927      00000000 
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 928              	 .loc 1 130 0
 929 016e 66480F6E 	 movq xmm6,rsi
 929      F6
 930 0173 66440F14 	 unpcklpd xmm8,xmm6
 930      C6
 931 0178 66490F6E 	 movq xmm6,r11
 931      F3
 932 017d 0F292D00 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+32],xmm5
 932      000000
 933              	.LVL95:
 934 0184 660F28EC 	 movapd xmm5,xmm4
 935 0188 66440F14 	 unpcklpd xmm14,xmm6
 935      F6
 936 018d 660F28F3 	 movapd xmm6,xmm3
 937 0191 66410F5C 	 subpd xmm5,xmm8
 937      E8
 938 0196 66410F5C 	 subpd xmm4,xmm14
 938      E6
 939 019b 66410F5C 	 subpd xmm6,xmm8
 939      F0
 940 01a0 0F292D00 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+64],xmm5
 940      000000
 132:NBodyCppBaseline.cpp ****             }
 941              	 .loc 1 132 0
 942 01a7 660F28EF 	 movapd xmm5,xmm7
 943 01ab F2410F5C 	 subsd xmm7,xmm15
 943      FF
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 944              	 .loc 1 130 0
 945 01b0 0F292500 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+96],xmm4
 945      000000
 946 01b7 660F28E3 	 movapd xmm4,xmm3
 947 01bb 66410F5C 	 subpd xmm3,xmm14
 947      DE
 132:NBodyCppBaseline.cpp ****             }
 948              	 .loc 1 132 0
 949 01c0 F2410F5C 	 subsd xmm5,xmm13
 949      ED
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 950              	 .loc 1 130 0
 951 01c5 660F5CE2 	 subpd xmm4,xmm2
 952 01c9 0F293500 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+160],xmm6
 952      000000
 132:NBodyCppBaseline.cpp ****             }
 953              	 .loc 1 132 0
 954 01d0 660F28F1 	 movapd xmm6,xmm1
 955 01d4 F2410F5C 	 subsd xmm6,xmm13
 955      F5
 956 01d9 F20F113D 	 movsd QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+112],xmm7
 956      00000000 
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 957              	 .loc 1 130 0
 958 01e1 0F291D00 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+192],xmm3
 958      000000
 132:NBodyCppBaseline.cpp ****             }
 959              	 .loc 1 132 0
 960 01e8 660F28D9 	 movapd xmm3,xmm1
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 961              	 .loc 1 130 0
 962 01ec 0F292500 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+128],xmm4
 962      000000
 132:NBodyCppBaseline.cpp ****             }
 963              	 .loc 1 132 0
 964 01f3 660F28E1 	 movapd xmm4,xmm1
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 965              	 .loc 1 130 0
 966 01f7 660F28CA 	 movapd xmm1,xmm2
 967 01fb 66410F5C 	 subpd xmm2,xmm14
 967      D6
 968 0200 66410F5C 	 subpd xmm1,xmm8
 968      C8
 132:NBodyCppBaseline.cpp ****             }
 969              	 .loc 1 132 0
 970 0205 66490F7E 	 movq r10,xmm6
 970      F2
 971 020a F20F1135 	 movsd QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+176],xmm6
 971      00000000 
 972 0212 660F28F0 	 movapd xmm6,xmm0
 973 0216 F2410F5C 	 subsd xmm6,xmm13
 973      F5
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 974              	 .loc 1 130 0
 975 021b 66450F5C 	 subpd xmm8,xmm14
 975      C6
 132:NBodyCppBaseline.cpp ****             }
 976              	 .loc 1 132 0
 977 0220 F20F112D 	 movsd QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+80],xmm5
 977      00000000 
 978              	.LVL96:
 979              	.LBE567:
 980              	.LBE566:
 981              	.LBE565:
 982              	.LBB586:
 983              	.LBB587:
 984              	.LBB588:
 985              	.LBB589:
 986              	 .file 3 "/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h"
   1:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Copyright (C) 2003-2017 Free Software Foundation, Inc.
   2:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
   3:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    This file is part of GCC.
   4:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
   5:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    GCC is free software; you can redistribute it and/or modify
   6:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    it under the terms of the GNU General Public License as published by
   7:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    the Free Software Foundation; either version 3, or (at your option)
   8:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    any later version.
   9:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  10:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    GCC is distributed in the hope that it will be useful,
  11:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    but WITHOUT ANY WARRANTY; without even the implied warranty of
  12:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  13:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    GNU General Public License for more details.
  14:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  15:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    Under Section 7 of GPL version 3, you are granted additional
  16:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    permissions described in the GCC Runtime Library Exception, version
  17:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    3.1, as published by the Free Software Foundation.
  18:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  19:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    You should have received a copy of the GNU General Public License and
  20:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    a copy of the GCC Runtime Library Exception along with this program;
  21:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
  22:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    <http://www.gnu.org/licenses/>.  */
  23:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  24:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Implemented from the specification included in the Intel C++ Compiler
  25:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    User Guide and Reference, version 9.0.  */
  26:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  27:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #ifndef _EMMINTRIN_H_INCLUDED
  28:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #define _EMMINTRIN_H_INCLUDED
  29:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  30:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* We need definitions from the SSE header files*/
  31:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #include <xmmintrin.h>
  32:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  33:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #ifndef __SSE2__
  34:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #pragma GCC push_options
  35:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #pragma GCC target("sse2")
  36:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #define __DISABLE_SSE2__
  37:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #endif /* __SSE2__ */
  38:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  39:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* SSE2 */
  40:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef double __v2df __attribute__ ((__vector_size__ (16)));
  41:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef long long __v2di __attribute__ ((__vector_size__ (16)));
  42:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef unsigned long long __v2du __attribute__ ((__vector_size__ (16)));
  43:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef int __v4si __attribute__ ((__vector_size__ (16)));
  44:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef unsigned int __v4su __attribute__ ((__vector_size__ (16)));
  45:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef short __v8hi __attribute__ ((__vector_size__ (16)));
  46:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef unsigned short __v8hu __attribute__ ((__vector_size__ (16)));
  47:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef char __v16qi __attribute__ ((__vector_size__ (16)));
  48:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef unsigned char __v16qu __attribute__ ((__vector_size__ (16)));
  49:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  50:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* The Intel API is flexible enough that we must allow aliasing with other
  51:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    vector types, and their scalar components.  */
  52:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef long long __m128i __attribute__ ((__vector_size__ (16), __may_alias__));
  53:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef double __m128d __attribute__ ((__vector_size__ (16), __may_alias__));
  54:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  55:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Unaligned version of the same types.  */
  56:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef long long __m128i_u __attribute__ ((__vector_size__ (16), __may_alias__, __aligned__ (1)));
  57:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** typedef double __m128d_u __attribute__ ((__vector_size__ (16), __may_alias__, __aligned__ (1)));
  58:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  59:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a selector for use with the SHUFPD instruction.  */
  60:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #define _MM_SHUFFLE2(fp1,fp0) \
  61:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****  (((fp1) << 1) | (fp0))
  62:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  63:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a vector with element 0 as F and the rest zero.  */
  64:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
  65:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set_sd (double __F)
  66:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
  67:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __extension__ (__m128d){ __F, 0.0 };
  68:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
  69:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  70:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a vector with both elements equal to F.  */
  71:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
  72:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set1_pd (double __F)
  73:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
  74:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __extension__ (__m128d){ __F, __F };
  75:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
  76:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  77:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
  78:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set_pd1 (double __F)
  79:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
  80:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set1_pd (__F);
  81:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
  82:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  83:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a vector with the lower value X and upper value W.  */
  84:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
  85:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set_pd (double __W, double __X)
  86:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
  87:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __extension__ (__m128d){ __X, __W };
  88:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
  89:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  90:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a vector with the lower value W and upper value X.  */
  91:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
  92:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_setr_pd (double __W, double __X)
  93:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
  94:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __extension__ (__m128d){ __W, __X };
  95:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
  96:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
  97:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create an undefined vector.  */
  98:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
  99:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_undefined_pd (void)
 100:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 101:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   __m128d __Y = __Y;
 102:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __Y;
 103:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 104:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 105:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a vector of zeros.  */
 106:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 107:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_setzero_pd (void)
 108:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 109:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __extension__ (__m128d){ 0.0, 0.0 };
 110:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 111:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 112:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Sets the low DPFP value of A from the low value of B.  */
 113:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 114:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_move_sd (__m128d __A, __m128d __B)
 115:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 116:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d) __builtin_ia32_movsd ((__v2df)__A, (__v2df)__B);
 117:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 118:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 119:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Load two DPFP values from P.  The address must be 16-byte aligned.  */
 120:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 121:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_load_pd (double const *__P)
 122:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 123:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return *(__m128d *)__P;
 124:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 125:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 126:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Load two DPFP values from P.  The address need not be 16-byte aligned.  */
 127:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 128:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_loadu_pd (double const *__P)
 129:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 130:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return *(__m128d_u *)__P;
 131:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 132:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 133:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a vector with all two elements equal to *P.  */
 134:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 135:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_load1_pd (double const *__P)
 136:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 137:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set1_pd (*__P);
 138:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 139:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 140:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a vector with element 0 as *P and the rest zero.  */
 141:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 142:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_load_sd (double const *__P)
 143:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 144:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_sd (*__P);
 145:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 146:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 147:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 148:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_load_pd1 (double const *__P)
 149:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 150:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_load1_pd (__P);
 151:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 152:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 153:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Load two DPFP values in reverse order.  The address must be aligned.  */
 154:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 155:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_loadr_pd (double const *__P)
 156:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 157:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   __m128d __tmp = _mm_load_pd (__P);
 158:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_shufpd (__tmp, __tmp, _MM_SHUFFLE2 (0,1));
 159:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 160:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 161:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Store two DPFP values.  The address must be 16-byte aligned.  */
 162:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 163:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_store_pd (double *__P, __m128d __A)
 164:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 165:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   *(__m128d *)__P = __A;
 166:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 167:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 168:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Store two DPFP values.  The address need not be 16-byte aligned.  */
 169:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 170:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_storeu_pd (double *__P, __m128d __A)
 171:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 172:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   *(__m128d_u *)__P = __A;
 173:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 174:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 175:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Stores the lower DPFP value.  */
 176:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 177:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_store_sd (double *__P, __m128d __A)
 178:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 179:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   *__P = ((__v2df)__A)[0];
 180:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 181:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 182:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline double __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 183:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtsd_f64 (__m128d __A)
 184:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 185:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return ((__v2df)__A)[0];
 186:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 187:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 188:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 189:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_storel_pd (double *__P, __m128d __A)
 190:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 191:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   _mm_store_sd (__P, __A);
 192:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 193:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 194:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Stores the upper DPFP value.  */
 195:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 196:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_storeh_pd (double *__P, __m128d __A)
 197:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 198:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   *__P = ((__v2df)__A)[1];
 199:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 200:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 201:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Store the lower DPFP value across two words.
 202:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    The address must be 16-byte aligned.  */
 203:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 204:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_store1_pd (double *__P, __m128d __A)
 205:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 206:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   _mm_store_pd (__P, __builtin_ia32_shufpd (__A, __A, _MM_SHUFFLE2 (0,0)));
 207:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 208:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 209:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 210:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_store_pd1 (double *__P, __m128d __A)
 211:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 212:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   _mm_store1_pd (__P, __A);
 213:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 214:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 215:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Store two DPFP values in reverse order.  The address must be aligned.  */
 216:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 217:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_storer_pd (double *__P, __m128d __A)
 218:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 219:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   _mm_store_pd (__P, __builtin_ia32_shufpd (__A, __A, _MM_SHUFFLE2 (0,1)));
 220:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 221:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 222:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 223:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtsi128_si32 (__m128i __A)
 224:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 225:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_vec_ext_v4si ((__v4si)__A, 0);
 226:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 227:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 228:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #ifdef __x86_64__
 229:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Intel intrinsic.  */
 230:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 231:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtsi128_si64 (__m128i __A)
 232:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 233:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return ((__v2di)__A)[0];
 234:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 235:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 236:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Microsoft intrinsic.  */
 237:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 238:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtsi128_si64x (__m128i __A)
 239:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 240:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return ((__v2di)__A)[0];
 241:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 242:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #endif
 243:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 244:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 245:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_add_pd (__m128d __A, __m128d __B)
 246:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 247:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d) ((__v2df)__A + (__v2df)__B);
 248:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 249:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 250:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 251:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_add_sd (__m128d __A, __m128d __B)
 252:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 253:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_addsd ((__v2df)__A, (__v2df)__B);
 254:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 255:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 256:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 257:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_sub_pd (__m128d __A, __m128d __B)
 258:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 259:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d) ((__v2df)__A - (__v2df)__B);
 260:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 261:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 262:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 263:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_sub_sd (__m128d __A, __m128d __B)
 264:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 265:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_subsd ((__v2df)__A, (__v2df)__B);
 266:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 267:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 268:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 269:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_mul_pd (__m128d __A, __m128d __B)
 270:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d) ((__v2df)__A * (__v2df)__B);
 272:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 273:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 274:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 275:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_mul_sd (__m128d __A, __m128d __B)
 276:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 277:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_mulsd ((__v2df)__A, (__v2df)__B);
 278:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 279:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 280:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 281:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_div_pd (__m128d __A, __m128d __B)
 282:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 283:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d) ((__v2df)__A / (__v2df)__B);
 284:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 285:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 286:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 287:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_div_sd (__m128d __A, __m128d __B)
 288:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 289:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_divsd ((__v2df)__A, (__v2df)__B);
 290:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 291:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 292:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 293:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_sqrt_pd (__m128d __A)
 294:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 295:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_sqrtpd ((__v2df)__A);
 296:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 297:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 298:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Return pair {sqrt (B[0]), A[1]}.  */
 299:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 300:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_sqrt_sd (__m128d __A, __m128d __B)
 301:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 302:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   __v2df __tmp = __builtin_ia32_movsd ((__v2df)__A, (__v2df)__B);
 303:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_sqrtsd ((__v2df)__tmp);
 304:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 305:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 306:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 307:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_min_pd (__m128d __A, __m128d __B)
 308:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 309:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_minpd ((__v2df)__A, (__v2df)__B);
 310:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 311:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 312:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 313:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_min_sd (__m128d __A, __m128d __B)
 314:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 315:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_minsd ((__v2df)__A, (__v2df)__B);
 316:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 317:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 318:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 319:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_max_pd (__m128d __A, __m128d __B)
 320:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 321:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_maxpd ((__v2df)__A, (__v2df)__B);
 322:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 323:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 324:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 325:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_max_sd (__m128d __A, __m128d __B)
 326:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 327:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_maxsd ((__v2df)__A, (__v2df)__B);
 328:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 329:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 330:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 331:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_and_pd (__m128d __A, __m128d __B)
 332:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 333:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_andpd ((__v2df)__A, (__v2df)__B);
 334:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 335:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 336:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 337:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_andnot_pd (__m128d __A, __m128d __B)
 338:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 339:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_andnpd ((__v2df)__A, (__v2df)__B);
 340:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 341:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 342:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 343:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_or_pd (__m128d __A, __m128d __B)
 344:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 345:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_orpd ((__v2df)__A, (__v2df)__B);
 346:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 347:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 348:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 349:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_xor_pd (__m128d __A, __m128d __B)
 350:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 351:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_xorpd ((__v2df)__A, (__v2df)__B);
 352:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 353:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 354:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 355:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpeq_pd (__m128d __A, __m128d __B)
 356:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 357:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpeqpd ((__v2df)__A, (__v2df)__B);
 358:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 359:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 360:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 361:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmplt_pd (__m128d __A, __m128d __B)
 362:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 363:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpltpd ((__v2df)__A, (__v2df)__B);
 364:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 365:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 366:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 367:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmple_pd (__m128d __A, __m128d __B)
 368:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 369:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmplepd ((__v2df)__A, (__v2df)__B);
 370:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 371:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 372:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 373:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpgt_pd (__m128d __A, __m128d __B)
 374:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 375:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpgtpd ((__v2df)__A, (__v2df)__B);
 376:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 377:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 378:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 379:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpge_pd (__m128d __A, __m128d __B)
 380:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 381:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpgepd ((__v2df)__A, (__v2df)__B);
 382:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 383:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 384:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 385:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpneq_pd (__m128d __A, __m128d __B)
 386:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 387:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpneqpd ((__v2df)__A, (__v2df)__B);
 388:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 389:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 390:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 391:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpnlt_pd (__m128d __A, __m128d __B)
 392:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 393:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpnltpd ((__v2df)__A, (__v2df)__B);
 394:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 395:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 396:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 397:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpnle_pd (__m128d __A, __m128d __B)
 398:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 399:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpnlepd ((__v2df)__A, (__v2df)__B);
 400:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 401:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 402:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 403:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpngt_pd (__m128d __A, __m128d __B)
 404:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 405:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpngtpd ((__v2df)__A, (__v2df)__B);
 406:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 407:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 408:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 409:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpnge_pd (__m128d __A, __m128d __B)
 410:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 411:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpngepd ((__v2df)__A, (__v2df)__B);
 412:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 413:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 414:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 415:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpord_pd (__m128d __A, __m128d __B)
 416:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 417:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpordpd ((__v2df)__A, (__v2df)__B);
 418:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 419:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 420:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 421:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpunord_pd (__m128d __A, __m128d __B)
 422:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 423:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpunordpd ((__v2df)__A, (__v2df)__B);
 424:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 425:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 426:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 427:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpeq_sd (__m128d __A, __m128d __B)
 428:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 429:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpeqsd ((__v2df)__A, (__v2df)__B);
 430:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 431:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 432:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 433:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmplt_sd (__m128d __A, __m128d __B)
 434:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 435:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpltsd ((__v2df)__A, (__v2df)__B);
 436:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 437:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 438:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 439:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmple_sd (__m128d __A, __m128d __B)
 440:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 441:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmplesd ((__v2df)__A, (__v2df)__B);
 442:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 443:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 444:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 445:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpgt_sd (__m128d __A, __m128d __B)
 446:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 447:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d) __builtin_ia32_movsd ((__v2df) __A,
 448:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 					 (__v2df)
 449:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 					 __builtin_ia32_cmpltsd ((__v2df) __B,
 450:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 								 (__v2df)
 451:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 								 __A));
 452:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 453:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 454:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 455:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpge_sd (__m128d __A, __m128d __B)
 456:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 457:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d) __builtin_ia32_movsd ((__v2df) __A,
 458:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 					 (__v2df)
 459:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 					 __builtin_ia32_cmplesd ((__v2df) __B,
 460:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 								 (__v2df)
 461:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 								 __A));
 462:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 463:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 464:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 465:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpneq_sd (__m128d __A, __m128d __B)
 466:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 467:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpneqsd ((__v2df)__A, (__v2df)__B);
 468:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 469:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 470:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 471:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpnlt_sd (__m128d __A, __m128d __B)
 472:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 473:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpnltsd ((__v2df)__A, (__v2df)__B);
 474:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 475:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 476:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 477:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpnle_sd (__m128d __A, __m128d __B)
 478:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 479:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpnlesd ((__v2df)__A, (__v2df)__B);
 480:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 481:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 482:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 483:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpngt_sd (__m128d __A, __m128d __B)
 484:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 485:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d) __builtin_ia32_movsd ((__v2df) __A,
 486:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 					 (__v2df)
 487:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 					 __builtin_ia32_cmpnltsd ((__v2df) __B,
 488:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 								  (__v2df)
 489:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 								  __A));
 490:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 491:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 492:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 493:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpnge_sd (__m128d __A, __m128d __B)
 494:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 495:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d) __builtin_ia32_movsd ((__v2df) __A,
 496:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 					 (__v2df)
 497:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 					 __builtin_ia32_cmpnlesd ((__v2df) __B,
 498:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 								  (__v2df)
 499:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 								  __A));
 500:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 501:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 502:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 503:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpord_sd (__m128d __A, __m128d __B)
 504:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 505:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpordsd ((__v2df)__A, (__v2df)__B);
 506:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 507:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 508:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 509:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cmpunord_sd (__m128d __A, __m128d __B)
 510:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 511:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cmpunordsd ((__v2df)__A, (__v2df)__B);
 512:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 513:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 514:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 515:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_comieq_sd (__m128d __A, __m128d __B)
 516:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 517:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_comisdeq ((__v2df)__A, (__v2df)__B);
 518:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 519:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 520:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 521:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_comilt_sd (__m128d __A, __m128d __B)
 522:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 523:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_comisdlt ((__v2df)__A, (__v2df)__B);
 524:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 525:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 526:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 527:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_comile_sd (__m128d __A, __m128d __B)
 528:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 529:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_comisdle ((__v2df)__A, (__v2df)__B);
 530:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 531:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 532:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 533:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_comigt_sd (__m128d __A, __m128d __B)
 534:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 535:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_comisdgt ((__v2df)__A, (__v2df)__B);
 536:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 537:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 538:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 539:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_comige_sd (__m128d __A, __m128d __B)
 540:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 541:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_comisdge ((__v2df)__A, (__v2df)__B);
 542:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 543:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 544:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 545:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_comineq_sd (__m128d __A, __m128d __B)
 546:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 547:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_comisdneq ((__v2df)__A, (__v2df)__B);
 548:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 549:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 550:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 551:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_ucomieq_sd (__m128d __A, __m128d __B)
 552:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 553:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_ucomisdeq ((__v2df)__A, (__v2df)__B);
 554:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 555:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 556:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 557:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_ucomilt_sd (__m128d __A, __m128d __B)
 558:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 559:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_ucomisdlt ((__v2df)__A, (__v2df)__B);
 560:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 561:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 562:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 563:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_ucomile_sd (__m128d __A, __m128d __B)
 564:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 565:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_ucomisdle ((__v2df)__A, (__v2df)__B);
 566:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 567:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 568:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 569:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_ucomigt_sd (__m128d __A, __m128d __B)
 570:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 571:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_ucomisdgt ((__v2df)__A, (__v2df)__B);
 572:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 573:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 574:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 575:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_ucomige_sd (__m128d __A, __m128d __B)
 576:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 577:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_ucomisdge ((__v2df)__A, (__v2df)__B);
 578:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 579:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 580:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 581:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_ucomineq_sd (__m128d __A, __m128d __B)
 582:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 583:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_ucomisdneq ((__v2df)__A, (__v2df)__B);
 584:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 585:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 586:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a vector of Qi, where i is the element number.  */
 587:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 588:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 589:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set_epi64x (long long __q1, long long __q0)
 590:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 591:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
 592:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 593:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 594:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 595:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set_epi64 (__m64 __q1,  __m64 __q0)
 596:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 597:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi64x ((long long)__q1, (long long)__q0);
 598:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 599:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 600:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 601:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set_epi32 (int __q3, int __q2, int __q1, int __q0)
 602:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 603:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __extension__ (__m128i)(__v4si){ __q0, __q1, __q2, __q3 };
 604:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 605:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 606:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 607:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set_epi16 (short __q7, short __q6, short __q5, short __q4,
 608:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 	       short __q3, short __q2, short __q1, short __q0)
 609:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 610:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __extension__ (__m128i)(__v8hi){
 611:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****     __q0, __q1, __q2, __q3, __q4, __q5, __q6, __q7 };
 612:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 613:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 614:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 615:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set_epi8 (char __q15, char __q14, char __q13, char __q12,
 616:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 	      char __q11, char __q10, char __q09, char __q08,
 617:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 	      char __q07, char __q06, char __q05, char __q04,
 618:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 	      char __q03, char __q02, char __q01, char __q00)
 619:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 620:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __extension__ (__m128i)(__v16qi){
 621:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****     __q00, __q01, __q02, __q03, __q04, __q05, __q06, __q07,
 622:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****     __q08, __q09, __q10, __q11, __q12, __q13, __q14, __q15
 623:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   };
 624:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 625:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 626:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Set all of the elements of the vector to A.  */
 627:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 628:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 629:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set1_epi64x (long long __A)
 630:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 631:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi64x (__A, __A);
 632:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 633:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 634:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 635:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set1_epi64 (__m64 __A)
 636:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 637:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi64 (__A, __A);
 638:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 639:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 640:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 641:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set1_epi32 (int __A)
 642:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 643:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi32 (__A, __A, __A, __A);
 644:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 645:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 646:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 647:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set1_epi16 (short __A)
 648:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 649:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi16 (__A, __A, __A, __A, __A, __A, __A, __A);
 650:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 651:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 652:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 653:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_set1_epi8 (char __A)
 654:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 655:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi8 (__A, __A, __A, __A, __A, __A, __A, __A,
 656:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 		       __A, __A, __A, __A, __A, __A, __A, __A);
 657:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 658:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 659:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a vector of Qi, where i is the element number.
 660:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****    The parameter order is reversed from the _mm_set_epi* functions.  */
 661:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 662:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 663:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_setr_epi64 (__m64 __q0, __m64 __q1)
 664:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 665:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi64 (__q1, __q0);
 666:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 667:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 668:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 669:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_setr_epi32 (int __q0, int __q1, int __q2, int __q3)
 670:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 671:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi32 (__q3, __q2, __q1, __q0);
 672:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 673:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 674:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 675:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_setr_epi16 (short __q0, short __q1, short __q2, short __q3,
 676:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 	        short __q4, short __q5, short __q6, short __q7)
 677:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 678:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi16 (__q7, __q6, __q5, __q4, __q3, __q2, __q1, __q0);
 679:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 680:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 681:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 682:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_setr_epi8 (char __q00, char __q01, char __q02, char __q03,
 683:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 	       char __q04, char __q05, char __q06, char __q07,
 684:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 	       char __q08, char __q09, char __q10, char __q11,
 685:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 	       char __q12, char __q13, char __q14, char __q15)
 686:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 687:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi8 (__q15, __q14, __q13, __q12, __q11, __q10, __q09, __q08,
 688:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 		       __q07, __q06, __q05, __q04, __q03, __q02, __q01, __q00);
 689:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 690:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 691:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a vector with element 0 as *P and the rest zero.  */
 692:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 693:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 694:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_load_si128 (__m128i const *__P)
 695:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 696:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return *__P;
 697:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 698:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 699:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 700:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_loadu_si128 (__m128i_u const *__P)
 701:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 702:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return *__P;
 703:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 704:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 705:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 706:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_loadl_epi64 (__m128i_u const *__P)
 707:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 708:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi64 ((__m64)0LL, *(__m64_u *)__P);
 709:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 710:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 711:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 712:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_store_si128 (__m128i *__P, __m128i __B)
 713:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 714:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   *__P = __B;
 715:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 716:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 717:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 718:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_storeu_si128 (__m128i_u *__P, __m128i __B)
 719:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 720:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   *__P = __B;
 721:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 722:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 723:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 724:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_storel_epi64 (__m128i_u *__P, __m128i __B)
 725:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 726:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   *(__m64_u *)__P = (__m64) ((__v2di)__B)[0];
 727:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 728:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 729:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 730:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_movepi64_pi64 (__m128i __B)
 731:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 732:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m64) ((__v2di)__B)[0];
 733:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 734:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 735:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 736:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_movpi64_epi64 (__m64 __A)
 737:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 738:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return _mm_set_epi64 ((__m64)0LL, __A);
 739:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 740:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 741:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 742:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_move_epi64 (__m128i __A)
 743:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 744:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128i)__builtin_ia32_movq128 ((__v2di) __A);
 745:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 746:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 747:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create an undefined vector.  */
 748:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 749:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_undefined_si128 (void)
 750:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 751:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   __m128i __Y = __Y;
 752:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __Y;
 753:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 754:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 755:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Create a vector of zeros.  */
 756:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 757:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_setzero_si128 (void)
 758:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 759:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __extension__ (__m128i)(__v4si){ 0, 0, 0, 0 };
 760:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 761:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 762:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 763:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtepi32_pd (__m128i __A)
 764:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 765:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cvtdq2pd ((__v4si) __A);
 766:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 767:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 768:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 769:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtepi32_ps (__m128i __A)
 770:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 771:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128)__builtin_ia32_cvtdq2ps ((__v4si) __A);
 772:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 773:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 774:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 775:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtpd_epi32 (__m128d __A)
 776:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 777:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128i)__builtin_ia32_cvtpd2dq ((__v2df) __A);
 778:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 779:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 780:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 781:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtpd_pi32 (__m128d __A)
 782:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 783:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m64)__builtin_ia32_cvtpd2pi ((__v2df) __A);
 784:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 785:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 786:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 787:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtpd_ps (__m128d __A)
 788:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 789:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128)__builtin_ia32_cvtpd2ps ((__v2df) __A);
 790:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 791:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 792:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 793:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvttpd_epi32 (__m128d __A)
 794:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 795:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128i)__builtin_ia32_cvttpd2dq ((__v2df) __A);
 796:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 797:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 798:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m64 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 799:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvttpd_pi32 (__m128d __A)
 800:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 801:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m64)__builtin_ia32_cvttpd2pi ((__v2df) __A);
 802:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 803:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 804:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 805:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtpi32_pd (__m64 __A)
 806:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 807:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cvtpi2pd ((__v2si) __A);
 808:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 809:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 810:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 811:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtps_epi32 (__m128 __A)
 812:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 813:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128i)__builtin_ia32_cvtps2dq ((__v4sf) __A);
 814:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 815:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 816:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128i __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 817:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvttps_epi32 (__m128 __A)
 818:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 819:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128i)__builtin_ia32_cvttps2dq ((__v4sf) __A);
 820:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 821:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 822:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 823:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtps_pd (__m128 __A)
 824:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 825:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cvtps2pd ((__v4sf) __A);
 826:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 827:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 828:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 829:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtsd_si32 (__m128d __A)
 830:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 831:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_cvtsd2si ((__v2df) __A);
 832:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 833:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 834:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #ifdef __x86_64__
 835:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Intel intrinsic.  */
 836:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 837:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtsd_si64 (__m128d __A)
 838:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 839:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_cvtsd2si64 ((__v2df) __A);
 840:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 841:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 842:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Microsoft intrinsic.  */
 843:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 844:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtsd_si64x (__m128d __A)
 845:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 846:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_cvtsd2si64 ((__v2df) __A);
 847:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 848:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #endif
 849:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 850:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 851:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvttsd_si32 (__m128d __A)
 852:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 853:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_cvttsd2si ((__v2df) __A);
 854:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 855:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 856:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #ifdef __x86_64__
 857:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Intel intrinsic.  */
 858:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 859:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvttsd_si64 (__m128d __A)
 860:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 861:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_cvttsd2si64 ((__v2df) __A);
 862:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 863:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 864:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Microsoft intrinsic.  */
 865:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline long long __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 866:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvttsd_si64x (__m128d __A)
 867:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 868:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return __builtin_ia32_cvttsd2si64 ((__v2df) __A);
 869:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 870:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #endif
 871:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 872:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 873:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtsd_ss (__m128 __A, __m128d __B)
 874:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 875:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128)__builtin_ia32_cvtsd2ss ((__v4sf) __A, (__v2df) __B);
 876:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 877:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 878:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 879:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtsi32_sd (__m128d __A, int __B)
 880:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 881:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cvtsi2sd ((__v2df) __A, __B);
 882:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 883:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 884:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #ifdef __x86_64__
 885:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Intel intrinsic.  */
 886:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 887:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtsi64_sd (__m128d __A, long long __B)
 888:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 889:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cvtsi642sd ((__v2df) __A, __B);
 890:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 891:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 892:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** /* Microsoft intrinsic.  */
 893:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 894:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtsi64x_sd (__m128d __A, long long __B)
 895:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 896:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cvtsi642sd ((__v2df) __A, __B);
 897:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 898:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #endif
 899:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 900:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 901:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_cvtss_sd (__m128d __A, __m128 __B)
 902:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 903:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_cvtss2sd ((__v2df) __A, (__v4sf)__B);
 904:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 905:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 906:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #ifdef __OPTIMIZE__
 907:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 908:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_shuffle_pd(__m128d __A, __m128d __B, const int __mask)
 909:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 910:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_shufpd ((__v2df)__A, (__v2df)__B, __mask);
 911:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 912:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #else
 913:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #define _mm_shuffle_pd(A, B, N)						\
 914:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   ((__m128d)__builtin_ia32_shufpd ((__v2df)(__m128d)(A),		\
 915:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 				   (__v2df)(__m128d)(B), (int)(N)))
 916:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** #endif
 917:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 918:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 919:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_unpackhi_pd (__m128d __A, __m128d __B)
 920:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 921:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_unpckhpd ((__v2df)__A, (__v2df)__B);
 922:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 923:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 924:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 925:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_unpacklo_pd (__m128d __A, __m128d __B)
 926:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 927:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_unpcklpd ((__v2df)__A, (__v2df)__B);
 928:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 929:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 930:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 931:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_loadh_pd (__m128d __A, double const *__B)
 932:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 933:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_loadhpd ((__v2df)__A, __B);
 987              	 .loc 3 933 0
 988 0228 660F14EF 	 unpcklpd xmm5,xmm7
 989              	.LBE589:
 990              	.LBE588:
 991              	.LBE587:
 992              	.LBE586:
 993              	.LBB941:
 994              	.LBB577:
 995              	.LBB568:
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 996              	 .loc 1 130 0
 997 022c 0F291500 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+256],xmm2
 997      000000
 132:NBodyCppBaseline.cpp ****             }
 998              	 .loc 1 132 0
 999 0233 F2450F5C 	 subsd xmm13,xmm15
 999      EF
 1000 0238 F20F5CE0 	 subsd xmm4,xmm0
 1001              	.LBE568:
 1002              	.LBE577:
 1003              	.LBE941:
 1004              	.LBB942:
 1005              	.LBB931:
 1006              	.LBB596:
 1007              	.LBB597:
 934:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 935:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** 
 936:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** extern __inline __m128d __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 937:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** _mm_loadl_pd (__m128d __A, double const *__B)
 938:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** {
 939:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h ****   return (__m128d)__builtin_ia32_loadlpd ((__v2df)__A, __B);
 1008              	 .loc 3 939 0
 1009 023c F30F7E15 	 movq xmm2,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip]
 1009      00000000 
 1010              	.LBE597:
 1011              	.LBE596:
 1012              	.LBE931:
 1013              	.LBE942:
 1014              	.LBB943:
 1015              	.LBB578:
 1016              	.LBB569:
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 1017              	 .loc 1 130 0
 1018 0244 0F290D00 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+224],xmm1
 1018      000000
 1019              	.LBE569:
 1020              	.LBE578:
 1021              	.LBE943:
 1022              	.LBB944:
 1023              	.LBB932:
 1024              	.LBB603:
 1025              	.LBB604:
 1026              	 .loc 3 939 0
 1027 024b F30F7E0D 	 movq xmm1,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+8]
 1027      00000000 
 1028              	.LBE604:
 1029              	.LBE603:
 1030              	.LBE932:
 1031              	.LBE944:
 1032              	.LBB945:
 1033              	.LBB579:
 1034              	.LBB570:
 132:NBodyCppBaseline.cpp ****             }
 1035              	 .loc 1 132 0
 1036 0253 F2410F5C 	 subsd xmm3,xmm15
 1036      DF
 1037              	.LBE570:
 1038              	.LBE579:
 1039              	.LBE945:
 1040              	.LBB946:
 1041              	.LBB933:
 1042              	.LBB610:
 1043              	.LBB611:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1044              	 .loc 3 271 0
 1045 0258 660F59ED 	 mulpd xmm5,xmm5
 1046              	.LBE611:
 1047              	.LBE610:
 1048              	.LBB616:
 1049              	.LBB617:
 933:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1050              	 .loc 3 933 0
 1051 025c 660F1615 	 movhpd xmm2,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+32]
 1051      00000000 
 1052              	.LBE617:
 1053              	.LBE616:
 1054              	.LBE933:
 1055              	.LBE946:
 1056              	.LBB947:
 1057              	.LBB580:
 1058              	.LBB571:
 132:NBodyCppBaseline.cpp ****             }
 1059              	 .loc 1 132 0
 1060 0264 66490F7E 	 movq r9,xmm6
 1060      F1
 1061 0269 F20F1135 	 movsd QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+240],xmm6
 1061      00000000 
 1062              	.LBE571:
 1063              	.LBE580:
 1064              	.LBE947:
 1065              	.LBB948:
 1066              	.LBB934:
 1067              	.LBB622:
 1068              	.LBB590:
 933:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1069              	 .loc 3 933 0
 1070 0271 66480F6E 	 movq xmm6,rdi
 1070      F7
 1071              	.LBE590:
 1072              	.LBE622:
 1073              	.LBB623:
 1074              	.LBB624:
 1075 0276 660F160D 	 movhpd xmm1,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+40]
 1075      00000000 
 1076              	.LBE624:
 1077              	.LBE623:
 1078              	.LBE934:
 1079              	.LBE948:
 1080              	.LBB949:
 1081              	.LBB581:
 1082              	.LBB572:
 130:NBodyCppBaseline.cpp ****                 r[k].dy = iBody.y - bodies[j].y;
 1083              	 .loc 1 130 0
 1084 027e 440F2905 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+288],xmm8
 1084      00000000 
 1085              	.LBE572:
 1086              	.LBE581:
 1087              	.LBE949:
 1088              	.LBB950:
 161:NBodyCppBaseline.cpp ****             Body& iBody = bodies[i];
 1089              	 .loc 1 161 0
 1090 0286 31FF     	 xor edi,edi
 1091              	.LBE950:
 1092              	.LBB959:
 1093              	.LBB935:
 1094              	.LBB629:
 1095              	.LBB591:
 933:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1096              	 .loc 3 933 0
 1097 0288 664D0F6E 	 movq xmm8,r8
 1097      C0
 1098 028d 66440F14 	 unpcklpd xmm8,xmm6
 1098      C6
 1099              	.LBE591:
 1100              	.LBE629:
 1101              	.LBB630:
 1102              	.LBB631:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1103              	 .loc 3 271 0
 1104 0292 66440F28 	 movapd xmm14,xmm1
 1104      F1
 1105              	.LBE631:
 1106              	.LBE630:
 1107              	.LBB639:
 1108              	.LBB640:
 1109 0297 660F28F2 	 movapd xmm6,xmm2
 1110              	.LBE640:
 1111              	.LBE639:
 1112              	.LBE935:
 1113              	.LBE959:
 1114              	.LBB960:
 1115              	.LBB582:
 1116              	.LBB573:
 132:NBodyCppBaseline.cpp ****             }
 1117              	 .loc 1 132 0
 1118 029b F2440F11 	 movsd QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+304],xmm13
 1118      2D000000 
 1118      00
 1119              	.LBE573:
 1120              	.LBE582:
 1121              	.LBE960:
 1122              	.LBB961:
 1123              	.LBB936:
 1124              	.LBB648:
 1125              	.LBB632:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1126              	 .loc 3 271 0
 1127 02a4 66440F59 	 mulpd xmm14,xmm1
 1127      F1
 1128              	.LBE632:
 1129              	.LBE648:
 1130              	.LBE936:
 1131              	.LBE961:
 1132              	.LBB962:
 1133              	.LBB583:
 1134              	.LBB574:
 132:NBodyCppBaseline.cpp ****             }
 1135              	 .loc 1 132 0
 1136 02a9 F2410F5C 	 subsd xmm0,xmm15
 1136      C7
 1137 02ae 664C0F7E 	 movq rsi,xmm13
 1137      EE
 1138 02b3 F20F1125 	 movsd QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+144],xmm4
 1138      00000000 
 1139              	.LVL97:
 1140              	.LBE574:
 1141              	.LBE583:
 1142              	.LBE962:
 1143              	.LBB963:
 1144              	.LBB937:
 1145              	.LBB649:
 1146              	.LBB641:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1147              	 .loc 3 271 0
 1148 02bb 660F59F2 	 mulpd xmm6,xmm2
 1149              	.LBE641:
 1150              	.LBE649:
 1151              	.LBE937:
 1152              	.LBE963:
 1153              	.LBB964:
 1154              	.LBB584:
 1155              	.LBB575:
 132:NBodyCppBaseline.cpp ****             }
 1156              	 .loc 1 132 0
 1157 02bf F20F111D 	 movsd QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+208],xmm3
 1157      00000000 
 1158              	.LVL98:
 1159              	.LBE575:
 1160              	.LBE584:
 1161              	.LBE964:
 1162              	.LBB965:
 1163              	.LBB951:
 1164              	.LBB952:
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 1165              	 .loc 1 164 0
 1166 02c7 41B80200 	 mov r8d,2
 1166      0000
 1167              	.LBE952:
 1168              	.LBE951:
 1169              	.LBE965:
 1170              	.LBB966:
 1171              	.LBB938:
 1172              	.LBB650:
 1173              	.LBB612:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1174              	 .loc 3 271 0
 1175 02cd 66450F59 	 mulpd xmm8,xmm8
 1175      C0
 1176              	.LBE612:
 1177              	.LBE650:
 1178              	.LBE938:
 1179              	.LBE966:
 1180              	.LBB967:
 1181              	.LBB585:
 1182              	.LBB576:
 132:NBodyCppBaseline.cpp ****             }
 1183              	 .loc 1 132 0
 1184 02d2 F20F1105 	 movsd QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+272],xmm0
 1184      00000000 
 1185              	.LVL99:
 1186              	.LBE576:
 1187              	.LBE585:
 1188              	.LBE967:
 1189              	.LBB968:
 1190              	.LBB939:
 1191              	.LBB651:
 1192              	.LBB652:
 247:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1193              	 .loc 3 247 0
 1194 02da 66410F58 	 addpd xmm6,xmm14
 1194      F6
 1195              	.LBE652:
 1196              	.LBE651:
 1197              	.LBB656:
 1198              	.LBB657:
 1199 02df 66410F58 	 addpd xmm6,xmm8
 1199      F0
 1200              	.LBE657:
 1201              	.LBE656:
 1202              	.LBB662:
 1203              	.LBB663:
 789:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1204              	 .loc 3 789 0
 1205 02e4 66440F5A 	 cvtpd2ps xmm15,xmm6
 1205      FE
 1206              	.LVL100:
 1207              	.LBE663:
 1208              	.LBE662:
 1209              	.LBB668:
 1210              	.LBB669:
 1211              	 .file 4 "/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h"
   1:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Copyright (C) 2002-2017 Free Software Foundation, Inc.
   2:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
   3:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    This file is part of GCC.
   4:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
   5:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    GCC is free software; you can redistribute it and/or modify
   6:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    it under the terms of the GNU General Public License as published by
   7:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    the Free Software Foundation; either version 3, or (at your option)
   8:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    any later version.
   9:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  10:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    GCC is distributed in the hope that it will be useful,
  11:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    but WITHOUT ANY WARRANTY; without even the implied warranty of
  12:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  13:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    GNU General Public License for more details.
  14:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  15:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    Under Section 7 of GPL version 3, you are granted additional
  16:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    permissions described in the GCC Runtime Library Exception, version
  17:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    3.1, as published by the Free Software Foundation.
  18:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  19:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    You should have received a copy of the GNU General Public License and
  20:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    a copy of the GCC Runtime Library Exception along with this program;
  21:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
  22:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    <http://www.gnu.org/licenses/>.  */
  23:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  24:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Implemented from the specification included in the Intel C++ Compiler
  25:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    User Guide and Reference, version 9.0.  */
  26:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  27:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #ifndef _XMMINTRIN_H_INCLUDED
  28:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _XMMINTRIN_H_INCLUDED
  29:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  30:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* We need type definitions from the MMX header file.  */
  31:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #include <mmintrin.h>
  32:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  33:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Get _mm_malloc () and _mm_free ().  */
  34:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #include <mm_malloc.h>
  35:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  36:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Constants for use with _mm_prefetch.  */
  37:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** enum _mm_hint
  38:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
  39:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   /* _MM_HINT_ET is _MM_HINT_T with set 3rd bit.  */
  40:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   _MM_HINT_ET0 = 7,
  41:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   _MM_HINT_ET1 = 6,
  42:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   _MM_HINT_T0 = 3,
  43:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   _MM_HINT_T1 = 2,
  44:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   _MM_HINT_T2 = 1,
  45:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   _MM_HINT_NTA = 0
  46:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** };
  47:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  48:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Loads one cache line from address P to a location "closer" to the
  49:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    processor.  The selector I specifies the type of prefetch operation.  */
  50:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #ifdef __OPTIMIZE__
  51:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__))
  52:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_prefetch (const void *__P, enum _mm_hint __I)
  53:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
  54:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   __builtin_prefetch (__P, (__I & 0x4) >> 2, __I & 0x3);
  55:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
  56:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #else
  57:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _mm_prefetch(P, I) \
  58:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   __builtin_prefetch ((P), ((I & 0x4) >> 2), (I & 0x3))
  59:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #endif
  60:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  61:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #ifndef __SSE__
  62:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #pragma GCC push_options
  63:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #pragma GCC target("sse")
  64:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define __DISABLE_SSE__
  65:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #endif /* __SSE__ */
  66:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  67:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* The Intel API is flexible enough that we must allow aliasing with other
  68:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    vector types, and their scalar components.  */
  69:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** typedef float __m128 __attribute__ ((__vector_size__ (16), __may_alias__));
  70:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  71:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Unaligned version of the same type.  */
  72:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** typedef float __m128_u __attribute__ ((__vector_size__ (16), __may_alias__, __aligned__ (1)));
  73:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  74:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Internal data types for implementing the intrinsics.  */
  75:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** typedef float __v4sf __attribute__ ((__vector_size__ (16)));
  76:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  77:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Create a selector for use with the SHUFPS instruction.  */
  78:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_SHUFFLE(fp3,fp2,fp1,fp0) \
  79:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****  (((fp3) << 6) | ((fp2) << 4) | ((fp1) << 2) | (fp0))
  80:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  81:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Bits in the MXCSR.  */
  82:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_EXCEPT_MASK       0x003f
  83:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_EXCEPT_INVALID    0x0001
  84:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_EXCEPT_DENORM     0x0002
  85:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_EXCEPT_DIV_ZERO   0x0004
  86:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_EXCEPT_OVERFLOW   0x0008
  87:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_EXCEPT_UNDERFLOW  0x0010
  88:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_EXCEPT_INEXACT    0x0020
  89:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  90:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_MASK_MASK         0x1f80
  91:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_MASK_INVALID      0x0080
  92:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_MASK_DENORM       0x0100
  93:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_MASK_DIV_ZERO     0x0200
  94:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_MASK_OVERFLOW     0x0400
  95:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_MASK_UNDERFLOW    0x0800
  96:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_MASK_INEXACT      0x1000
  97:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
  98:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_ROUND_MASK        0x6000
  99:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_ROUND_NEAREST     0x0000
 100:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_ROUND_DOWN        0x2000
 101:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_ROUND_UP          0x4000
 102:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_ROUND_TOWARD_ZERO 0x6000
 103:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 104:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_FLUSH_ZERO_MASK   0x8000
 105:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_FLUSH_ZERO_ON     0x8000
 106:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** #define _MM_FLUSH_ZERO_OFF    0x0000
 107:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 108:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Create an undefined vector.  */
 109:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 110:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_undefined_ps (void)
 111:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 112:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   __m128 __Y = __Y;
 113:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return __Y;
 114:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 115:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 116:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Create a vector of zeros.  */
 117:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 118:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_setzero_ps (void)
 119:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 120:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return __extension__ (__m128){ 0.0f, 0.0f, 0.0f, 0.0f };
 121:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 122:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 123:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Perform the respective operation on the lower SPFP (single-precision
 124:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    floating-point) values of A and B; the upper three SPFP values are
 125:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****    passed through from A.  */
 126:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 127:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 128:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_add_ss (__m128 __A, __m128 __B)
 129:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 130:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_addss ((__v4sf)__A, (__v4sf)__B);
 131:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 132:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 133:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 134:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_sub_ss (__m128 __A, __m128 __B)
 135:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 136:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_subss ((__v4sf)__A, (__v4sf)__B);
 137:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 138:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 139:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 140:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_mul_ss (__m128 __A, __m128 __B)
 141:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 142:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_mulss ((__v4sf)__A, (__v4sf)__B);
 143:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 144:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 145:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 146:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_div_ss (__m128 __A, __m128 __B)
 147:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 148:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_divss ((__v4sf)__A, (__v4sf)__B);
 149:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 150:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 151:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 152:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_sqrt_ss (__m128 __A)
 153:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 154:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_sqrtss ((__v4sf)__A);
 155:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 156:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 157:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 158:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_rcp_ss (__m128 __A)
 159:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 160:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_rcpss ((__v4sf)__A);
 161:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 162:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 163:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 164:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_rsqrt_ss (__m128 __A)
 165:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 166:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_rsqrtss ((__v4sf)__A);
 167:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 168:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 169:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 170:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_min_ss (__m128 __A, __m128 __B)
 171:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 172:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_minss ((__v4sf)__A, (__v4sf)__B);
 173:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 174:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 175:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 176:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_max_ss (__m128 __A, __m128 __B)
 177:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 178:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_maxss ((__v4sf)__A, (__v4sf)__B);
 179:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 180:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 181:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** /* Perform the respective operation on the four SPFP values in A and B.  */
 182:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 183:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 184:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_add_ps (__m128 __A, __m128 __B)
 185:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 186:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) ((__v4sf)__A + (__v4sf)__B);
 187:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 188:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 189:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 190:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_sub_ps (__m128 __A, __m128 __B)
 191:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 192:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) ((__v4sf)__A - (__v4sf)__B);
 193:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 194:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 195:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 196:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_mul_ps (__m128 __A, __m128 __B)
 197:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 198:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) ((__v4sf)__A * (__v4sf)__B);
 199:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 200:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 201:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 202:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_div_ps (__m128 __A, __m128 __B)
 203:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 204:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) ((__v4sf)__A / (__v4sf)__B);
 205:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 206:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 207:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 208:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_sqrt_ps (__m128 __A)
 209:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 210:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_sqrtps ((__v4sf)__A);
 211:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 212:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 213:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 214:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_rcp_ps (__m128 __A)
 215:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 216:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_rcpps ((__v4sf)__A);
 217:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** }
 218:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** 
 219:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))
 220:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** _mm_rsqrt_ps (__m128 __A)
 221:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h **** {
 222:/usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h ****   return (__m128) __builtin_ia32_rsqrtps ((__v4sf)__A);
 1212              	 .loc 4 222 0
 1213 02e9 450F52FF 	 rsqrtps xmm15,xmm15
 1214              	.LVL101:
 1215              	.LBE669:
 1216              	.LBE668:
 1217              	.LBB674:
 1218              	.LBB675:
 1219              	.LBB676:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1220              	 .loc 3 271 0
 1221 02ed 66440F28 	 movapd xmm14,xmm6
 1221      F6
 1222 02f2 66450F59 	 mulpd xmm14,xmm12
 1222      F4
 1223              	.LBE676:
 1224              	.LBE675:
 1225              	.LBE674:
 1226              	.LBB825:
 1227              	.LBB826:
 825:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1228              	 .loc 3 825 0
 1229 02f7 450F5AFF 	 cvtps2pd xmm15,xmm15
 1230              	.LVL102:
 1231              	.LBE826:
 1232              	.LBE825:
 1233              	.LBB831:
 1234              	.LBB681:
 1235              	.LBB682:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1236              	 .loc 3 271 0
 1237 02fb 66450F28 	 movapd xmm13,xmm15
 1237      EF
 1238              	.LBE682:
 1239              	.LBE681:
 1240              	.LBB702:
 1241              	.LBB703:
 1242 0300 66450F28 	 movapd xmm8,xmm15
 1242      C7
 1243              	.LBE703:
 1244              	.LBE702:
 1245              	.LBB723:
 1246              	.LBB683:
 1247 0305 66450F59 	 mulpd xmm13,xmm15
 1247      EF
 1248              	.LBE683:
 1249              	.LBE723:
 1250              	.LBB724:
 1251              	.LBB704:
 1252 030a 66450F59 	 mulpd xmm8,xmm10
 1252      C2
 1253              	.LBE704:
 1254              	.LBE724:
 1255              	.LBB725:
 1256              	.LBB726:
 1257 030f 66450F59 	 mulpd xmm15,xmm13
 1257      FD
 1258              	.LVL103:
 1259              	.LBE726:
 1260              	.LBE725:
 1261              	.LBB736:
 1262              	.LBB737:
 1263 0314 66450F59 	 mulpd xmm15,xmm14
 1263      FE
 1264              	.LBE737:
 1265              	.LBE736:
 1266              	.LBB747:
 1267              	.LBB748:
 259:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1268              	 .loc 3 259 0
 1269 0319 66450F5C 	 subpd xmm8,xmm15
 1269      C7
 1270              	.LVL104:
 1271              	.LBE748:
 1272              	.LBE747:
 1273              	.LBB758:
 1274              	.LBB684:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1275              	 .loc 3 271 0
 1276 031e 66450F28 	 movapd xmm13,xmm8
 1276      E8
 1277              	.LBE684:
 1278              	.LBE758:
 1279              	.LBB759:
 1280              	.LBB705:
 1281 0323 66450F28 	 movapd xmm15,xmm8
 1281      F8
 1282              	.LBE705:
 1283              	.LBE759:
 1284              	.LBB760:
 1285              	.LBB685:
 1286 0328 66450F59 	 mulpd xmm13,xmm8
 1286      E8
 1287              	.LBE685:
 1288              	.LBE760:
 1289              	.LBB761:
 1290              	.LBB706:
 1291 032d 66450F59 	 mulpd xmm15,xmm10
 1291      FA
 1292              	.LBE706:
 1293              	.LBE761:
 1294              	.LBB762:
 1295              	.LBB727:
 1296 0332 66450F59 	 mulpd xmm8,xmm13
 1296      C5
 1297              	.LVL105:
 1298              	.LBE727:
 1299              	.LBE762:
 1300              	.LBB763:
 1301              	.LBB738:
 1302 0337 66450F59 	 mulpd xmm8,xmm14
 1302      C6
 1303              	.LBE738:
 1304              	.LBE763:
 1305              	.LBE831:
 1306              	.LBB832:
 1307              	.LBB833:
 283:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1308              	 .loc 3 283 0
 1309 033c 66450F28 	 movapd xmm14,xmm11
 1309      F3
 1310              	.LVL106:
 1311 0341 66440F5E 	 divpd xmm14,xmm6
 1311      F6
 1312              	.LBE833:
 1313              	.LBE832:
 1314              	.LBB838:
 1315              	.LBB764:
 1316              	.LBB749:
 259:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1317              	 .loc 3 259 0
 1318 0346 66450F5C 	 subpd xmm15,xmm8
 1318      F8
 1319              	.LBE749:
 1320              	.LBE764:
 1321              	.LBE838:
 1322              	.LBB839:
 1323              	.LBB840:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1324              	 .loc 3 271 0
 1325 034b 66450F59 	 mulpd xmm15,xmm14
 1325      FE
 1326              	.LBE840:
 1327              	.LBE839:
 1328              	.LBB845:
 1329              	.LBB846:
 165:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1330              	 .loc 3 165 0
 1331 0350 440F293A 	 movaps XMMWORD PTR [rdx],xmm15
 1332              	.LVL107:
 1333              	.LBE846:
 1334              	.LBE845:
 1335              	.LBB851:
 1336              	.LBB598:
 1337              	 .loc 3 939 0
 1338 0354 660F1215 	 movlpd xmm2,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+64]
 1338      00000000 
 1339              	.LVL108:
 1340              	.LBE598:
 1341              	.LBE851:
 1342              	.LBB852:
 1343              	.LBB605:
 1344 035c 660F120D 	 movlpd xmm1,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+72]
 1344      00000000 
 1345              	.LVL109:
 1346              	.LBE605:
 1347              	.LBE852:
 1348              	.LBB853:
 1349              	.LBB618:
 933:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1350              	 .loc 3 933 0
 1351 0364 660F1615 	 movhpd xmm2,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+96]
 1351      00000000 
 1352              	.LVL110:
 1353              	.LBE618:
 1354              	.LBE853:
 1355              	.LBB854:
 1356              	.LBB625:
 1357 036c 660F160D 	 movhpd xmm1,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+104]
 1357      00000000 
 1358              	.LVL111:
 1359              	.LBE625:
 1360              	.LBE854:
 1361              	.LBB855:
 1362              	.LBB633:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1363              	 .loc 3 271 0
 1364 0374 660F28F9 	 movapd xmm7,xmm1
 1365              	.LBE633:
 1366              	.LBE855:
 1367              	.LBB856:
 1368              	.LBB642:
 1369 0378 660F28F2 	 movapd xmm6,xmm2
 1370              	.LVL112:
 1371              	.LBE642:
 1372              	.LBE856:
 1373              	.LBB857:
 1374              	.LBB634:
 1375 037c 660F59F9 	 mulpd xmm7,xmm1
 1376              	.LBE634:
 1377              	.LBE857:
 1378              	.LBB858:
 1379              	.LBB606:
 1380              	 .loc 3 939 0
 1381 0380 660F120D 	 movlpd xmm1,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+136]
 1381      00000000 
 1382              	.LVL113:
 1383              	.LBE606:
 1384              	.LBE858:
 1385              	.LBB859:
 1386              	.LBB643:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1387              	 .loc 3 271 0
 1388 0388 660F59F2 	 mulpd xmm6,xmm2
 1389              	.LBE643:
 1390              	.LBE859:
 1391              	.LBB860:
 1392              	.LBB653:
 247:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1393              	 .loc 3 247 0
 1394 038c 660F58F7 	 addpd xmm6,xmm7
 1395              	.LBE653:
 1396              	.LBE860:
 1397              	.LBB861:
 1398              	.LBB658:
 1399 0390 660F58EE 	 addpd xmm5,xmm6
 1400              	.LBE658:
 1401              	.LBE861:
 1402              	.LBB862:
 1403              	.LBB664:
 789:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1404              	 .loc 3 789 0
 1405 0394 66440F5A 	 cvtpd2ps xmm8,xmm5
 1405      C5
 1406              	.LVL114:
 1407              	.LBE664:
 1408              	.LBE862:
 1409              	.LBB863:
 1410              	.LBB670:
 1411              	 .loc 4 222 0
 1412 0399 450F52C0 	 rsqrtps xmm8,xmm8
 1413              	.LVL115:
 1414              	.LBE670:
 1415              	.LBE863:
 1416              	.LBB864:
 1417              	.LBB765:
 1418              	.LBB677:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1419              	 .loc 3 271 0
 1420 039d 660F28FD 	 movapd xmm7,xmm5
 1421 03a1 66410F59 	 mulpd xmm7,xmm12
 1421      FC
 1422              	.LBE677:
 1423              	.LBE765:
 1424              	.LBE864:
 1425              	.LBB865:
 1426              	.LBB827:
 825:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1427              	 .loc 3 825 0
 1428 03a6 450F5AC0 	 cvtps2pd xmm8,xmm8
 1429              	.LVL116:
 1430              	.LBE827:
 1431              	.LBE865:
 1432              	.LBB866:
 1433              	.LBB766:
 1434              	.LBB686:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1435              	 .loc 3 271 0
 1436 03aa 66450F28 	 movapd xmm13,xmm8
 1436      E8
 1437              	.LBE686:
 1438              	.LBE766:
 1439              	.LBB767:
 1440              	.LBB707:
 1441 03af 66410F28 	 movapd xmm6,xmm8
 1441      F0
 1442              	.LBE707:
 1443              	.LBE767:
 1444              	.LBB768:
 1445              	.LBB687:
 1446 03b4 66450F59 	 mulpd xmm13,xmm8
 1446      E8
 1447              	.LBE687:
 1448              	.LBE768:
 1449              	.LBB769:
 1450              	.LBB708:
 1451 03b9 66410F59 	 mulpd xmm6,xmm10
 1451      F2
 1452              	.LBE708:
 1453              	.LBE769:
 1454              	.LBB770:
 1455              	.LBB728:
 1456 03be 66450F59 	 mulpd xmm8,xmm13
 1456      C5
 1457              	.LVL117:
 1458              	.LBE728:
 1459              	.LBE770:
 1460              	.LBB771:
 1461              	.LBB739:
 1462 03c3 66440F59 	 mulpd xmm8,xmm7
 1462      C7
 1463              	.LBE739:
 1464              	.LBE771:
 1465              	.LBB772:
 1466              	.LBB750:
 259:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1467              	 .loc 3 259 0
 1468 03c8 66410F5C 	 subpd xmm6,xmm8
 1468      F0
 1469              	.LVL118:
 1470              	.LBE750:
 1471              	.LBE772:
 1472              	.LBB773:
 1473              	.LBB688:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1474              	 .loc 3 271 0
 1475 03cd 66440F28 	 movapd xmm8,xmm6
 1475      C6
 1476              	.LBE688:
 1477              	.LBE773:
 1478              	.LBB774:
 1479              	.LBB709:
 1480 03d2 66440F28 	 movapd xmm14,xmm6
 1480      F6
 1481              	.LBE709:
 1482              	.LBE774:
 1483              	.LBB775:
 1484              	.LBB689:
 1485 03d7 66440F59 	 mulpd xmm8,xmm6
 1485      C6
 1486              	.LBE689:
 1487              	.LBE775:
 1488              	.LBB776:
 1489              	.LBB710:
 1490 03dc 66450F59 	 mulpd xmm14,xmm10
 1490      F2
 1491              	.LBE710:
 1492              	.LBE776:
 1493              	.LBB777:
 1494              	.LBB729:
 1495 03e1 66410F59 	 mulpd xmm6,xmm8
 1495      F0
 1496              	.LVL119:
 1497              	.LBE729:
 1498              	.LBE777:
 1499              	.LBB778:
 1500              	.LBB740:
 1501 03e6 660F59FE 	 mulpd xmm7,xmm6
 1502              	.LVL120:
 1503              	.LBE740:
 1504              	.LBE778:
 1505              	.LBE866:
 1506              	.LBB867:
 1507              	.LBB592:
 933:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1508              	 .loc 3 933 0
 1509 03ea 66490F6E 	 movq xmm6,r10
 1509      F2
 1510 03ef 660F14E6 	 unpcklpd xmm4,xmm6
 1511              	.LBE592:
 1512              	.LBE867:
 1513              	.LBB868:
 1514              	.LBB613:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1515              	 .loc 3 271 0
 1516 03f3 660F59E4 	 mulpd xmm4,xmm4
 1517              	.LBE613:
 1518              	.LBE868:
 1519              	.LBB869:
 1520              	.LBB779:
 1521              	.LBB751:
 259:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1522              	 .loc 3 259 0
 1523 03f7 66440F5C 	 subpd xmm14,xmm7
 1523      F7
 1524              	.LBE751:
 1525              	.LBE779:
 1526              	.LBE869:
 1527              	.LBB870:
 1528              	.LBB834:
 283:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1529              	 .loc 3 283 0
 1530 03fc 66410F28 	 movapd xmm7,xmm11
 1530      FB
 1531 0401 660F5EFD 	 divpd xmm7,xmm5
 1532              	.LBE834:
 1533              	.LBE870:
 1534              	.LBB871:
 1535              	.LBB841:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1536              	 .loc 3 271 0
 1537 0405 66440F59 	 mulpd xmm14,xmm7
 1537      F7
 1538              	.LBE841:
 1539              	.LBE871:
 1540              	.LBB872:
 1541              	.LBB599:
 1542              	 .loc 3 939 0
 1543 040a 660F28FA 	 movapd xmm7,xmm2
 1544 040e 660F123D 	 movlpd xmm7,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+128]
 1544      00000000 
 1545              	.LBE599:
 1546              	.LBE872:
 1547              	.LBB873:
 1548              	.LBB847:
 165:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1549              	 .loc 3 165 0
 1550 0416 440F2935 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE3mag[rip+16],xmm14
 1550      00000000 
 1551              	.LVL121:
 1552              	.LBE847:
 1553              	.LBE873:
 1554              	.LBB874:
 1555              	.LBB619:
 933:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1556              	 .loc 3 933 0
 1557 041e 660F163D 	 movhpd xmm7,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+160]
 1557      00000000 
 1558              	.LVL122:
 1559              	.LBE619:
 1560              	.LBE874:
 1561              	.LBB875:
 1562              	.LBB626:
 1563 0426 660F160D 	 movhpd xmm1,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+168]
 1563      00000000 
 1564              	.LVL123:
 1565              	.LBE626:
 1566              	.LBE875:
 1567              	.LBB876:
 1568              	.LBB635:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1569              	 .loc 3 271 0
 1570 042e 660F28E9 	 movapd xmm5,xmm1
 1571              	.LVL124:
 1572              	.LBE635:
 1573              	.LBE876:
 1574              	.LBB877:
 1575              	.LBB644:
 1576 0432 660F28D7 	 movapd xmm2,xmm7
 1577              	.LVL125:
 1578              	.LBE644:
 1579              	.LBE877:
 1580              	.LBB878:
 1581              	.LBB636:
 1582 0436 660F59E9 	 mulpd xmm5,xmm1
 1583              	.LBE636:
 1584              	.LBE878:
 1585              	.LBB879:
 1586              	.LBB645:
 1587 043a 660F59D7 	 mulpd xmm2,xmm7
 1588              	.LBE645:
 1589              	.LBE879:
 1590              	.LBB880:
 1591              	.LBB600:
 1592              	 .loc 3 939 0
 1593 043e 660F123D 	 movlpd xmm7,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+192]
 1593      00000000 
 1594              	.LVL126:
 1595              	.LBE600:
 1596              	.LBE880:
 1597              	.LBB881:
 1598              	.LBB654:
 247:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1599              	 .loc 3 247 0
 1600 0446 660F58D5 	 addpd xmm2,xmm5
 1601              	.LBE654:
 1602              	.LBE881:
 1603              	.LBB882:
 1604              	.LBB659:
 1605 044a 660F58E2 	 addpd xmm4,xmm2
 1606              	.LBE659:
 1607              	.LBE882:
 1608              	.LBB883:
 1609              	.LBB665:
 789:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1610              	 .loc 3 789 0
 1611 044e 660F5AD4 	 cvtpd2ps xmm2,xmm4
 1612              	.LVL127:
 1613              	.LBE665:
 1614              	.LBE883:
 1615              	.LBB884:
 1616              	.LBB671:
 1617              	 .loc 4 222 0
 1618 0452 0F52D2   	 rsqrtps xmm2,xmm2
 1619              	.LVL128:
 1620              	.LBE671:
 1621              	.LBE884:
 1622              	.LBB885:
 1623              	.LBB780:
 1624              	.LBB678:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1625              	 .loc 3 271 0
 1626 0455 660F28F4 	 movapd xmm6,xmm4
 1627 0459 66410F59 	 mulpd xmm6,xmm12
 1627      F4
 1628              	.LBE678:
 1629              	.LBE780:
 1630              	.LBE885:
 1631              	.LBB886:
 1632              	.LBB828:
 825:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1633              	 .loc 3 825 0
 1634 045e 0F5AD2   	 cvtps2pd xmm2,xmm2
 1635              	.LVL129:
 1636              	.LBE828:
 1637              	.LBE886:
 1638              	.LBB887:
 1639              	.LBB781:
 1640              	.LBB690:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1641              	 .loc 3 271 0
 1642 0461 66440F28 	 movapd xmm8,xmm2
 1642      C2
 1643              	.LBE690:
 1644              	.LBE781:
 1645              	.LBB782:
 1646              	.LBB711:
 1647 0466 660F28EA 	 movapd xmm5,xmm2
 1648              	.LBE711:
 1649              	.LBE782:
 1650              	.LBB783:
 1651              	.LBB691:
 1652 046a 66440F59 	 mulpd xmm8,xmm2
 1652      C2
 1653              	.LBE691:
 1654              	.LBE783:
 1655              	.LBB784:
 1656              	.LBB712:
 1657 046f 66410F59 	 mulpd xmm5,xmm10
 1657      EA
 1658              	.LBE712:
 1659              	.LBE784:
 1660              	.LBB785:
 1661              	.LBB730:
 1662 0474 66410F59 	 mulpd xmm2,xmm8
 1662      D0
 1663              	.LVL130:
 1664              	.LBE730:
 1665              	.LBE785:
 1666              	.LBB786:
 1667              	.LBB741:
 1668 0479 660F59D6 	 mulpd xmm2,xmm6
 1669              	.LBE741:
 1670              	.LBE786:
 1671              	.LBB787:
 1672              	.LBB752:
 259:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1673              	 .loc 3 259 0
 1674 047d 660F5CEA 	 subpd xmm5,xmm2
 1675              	.LVL131:
 1676              	.LBE752:
 1677              	.LBE787:
 1678              	.LBB788:
 1679              	.LBB692:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1680              	 .loc 3 271 0
 1681 0481 66440F28 	 movapd xmm8,xmm5
 1681      C5
 1682              	.LBE692:
 1683              	.LBE788:
 1684              	.LBB789:
 1685              	.LBB713:
 1686 0486 660F28D5 	 movapd xmm2,xmm5
 1687              	.LBE713:
 1688              	.LBE789:
 1689              	.LBB790:
 1690              	.LBB693:
 1691 048a 66440F59 	 mulpd xmm8,xmm5
 1691      C5
 1692              	.LBE693:
 1693              	.LBE790:
 1694              	.LBB791:
 1695              	.LBB714:
 1696 048f 66410F59 	 mulpd xmm2,xmm10
 1696      D2
 1697              	.LBE714:
 1698              	.LBE791:
 1699              	.LBB792:
 1700              	.LBB731:
 1701 0494 66410F59 	 mulpd xmm5,xmm8
 1701      E8
 1702              	.LVL132:
 1703              	.LBE731:
 1704              	.LBE792:
 1705              	.LBB793:
 1706              	.LBB742:
 1707 0499 660F59F5 	 mulpd xmm6,xmm5
 1708              	.LVL133:
 1709              	.LBE742:
 1710              	.LBE793:
 1711              	.LBB794:
 1712              	.LBB753:
 259:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1713              	 .loc 3 259 0
 1714 049d 660F5CD6 	 subpd xmm2,xmm6
 1715              	.LBE753:
 1716              	.LBE794:
 1717              	.LBE887:
 1718              	.LBB888:
 1719              	.LBB835:
 283:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1720              	 .loc 3 283 0
 1721 04a1 66410F28 	 movapd xmm6,xmm11
 1721      F3
 1722 04a6 660F5EF4 	 divpd xmm6,xmm4
 1723              	.LBE835:
 1724              	.LBE888:
 1725              	.LBB889:
 1726              	.LBB601:
 1727              	 .loc 3 939 0
 1728 04aa 660F28E7 	 movapd xmm4,xmm7
 1729              	.LVL134:
 1730              	.LBE601:
 1731              	.LBE889:
 1732              	.LBB890:
 1733              	.LBB593:
 933:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1734              	 .loc 3 933 0
 1735 04ae 66490F6E 	 movq xmm7,r9
 1735      F9
 1736              	.LBE593:
 1737              	.LBE890:
 1738              	.LBB891:
 1739              	.LBB620:
 1740 04b3 660F1625 	 movhpd xmm4,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+224]
 1740      00000000 
 1741              	.LBE620:
 1742              	.LBE891:
 1743              	.LBB892:
 1744              	.LBB594:
 1745 04bb 660F14DF 	 unpcklpd xmm3,xmm7
 1746              	.LBE594:
 1747              	.LBE892:
 1748              	.LBB893:
 1749              	.LBB614:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1750              	 .loc 3 271 0
 1751 04bf 660F59DB 	 mulpd xmm3,xmm3
 1752              	.LBE614:
 1753              	.LBE893:
 1754              	.LBB894:
 1755              	.LBB842:
 1756 04c3 660F59D6 	 mulpd xmm2,xmm6
 1757              	.LBE842:
 1758              	.LBE894:
 1759              	.LBB895:
 1760              	.LBB848:
 165:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1761              	 .loc 3 165 0
 1762 04c7 0F291500 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE3mag[rip+32],xmm2
 1762      000000
 1763              	.LVL135:
 1764              	.LBE848:
 1765              	.LBE895:
 1766              	.LBB896:
 1767              	.LBB607:
 1768              	 .loc 3 939 0
 1769 04ce 660F28D1 	 movapd xmm2,xmm1
 1770              	.LBE607:
 1771              	.LBE896:
 1772              	.LBB897:
 1773              	.LBB646:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1774              	 .loc 3 271 0
 1775 04d2 660F28CC 	 movapd xmm1,xmm4
 1776              	.LVL136:
 1777 04d6 660F59CC 	 mulpd xmm1,xmm4
 1778              	.LBE646:
 1779              	.LBE897:
 1780              	.LBB898:
 1781              	.LBB608:
 1782              	 .loc 3 939 0
 1783 04da 660F1215 	 movlpd xmm2,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+200]
 1783      00000000 
 1784              	.LVL137:
 1785              	.LBE608:
 1786              	.LBE898:
 1787              	.LBB899:
 1788              	.LBB602:
 1789 04e2 660F1225 	 movlpd xmm4,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+256]
 1789      00000000 
 1790              	.LVL138:
 1791              	.LBE602:
 1792              	.LBE899:
 1793              	.LBB900:
 1794              	.LBB627:
 933:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1795              	 .loc 3 933 0
 1796 04ea 660F1615 	 movhpd xmm2,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+232]
 1796      00000000 
 1797              	.LVL139:
 1798              	.LBE627:
 1799              	.LBE900:
 1800              	.LBB901:
 1801              	.LBB621:
 1802 04f2 660F1625 	 movhpd xmm4,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+288]
 1802      00000000 
 1803              	.LBE621:
 1804              	.LBE901:
 1805              	.LBB902:
 1806              	.LBB647:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1807              	 .loc 3 271 0
 1808 04fa 660F59E4 	 mulpd xmm4,xmm4
 1809              	.LBE647:
 1810              	.LBE902:
 1811              	.LBB903:
 1812              	.LBB637:
 1813 04fe 660F28EA 	 movapd xmm5,xmm2
 1814 0502 660F59EA 	 mulpd xmm5,xmm2
 1815              	.LBE637:
 1816              	.LBE903:
 1817              	.LBB904:
 1818              	.LBB609:
 1819              	 .loc 3 939 0
 1820 0506 660F1215 	 movlpd xmm2,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+264]
 1820      00000000 
 1821              	.LVL140:
 1822              	.LBE609:
 1823              	.LBE904:
 1824              	.LBB905:
 1825              	.LBB628:
 933:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1826              	 .loc 3 933 0
 1827 050e 660F1615 	 movhpd xmm2,QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+296]
 1827      00000000 
 1828              	.LBE628:
 1829              	.LBE905:
 1830              	.LBB906:
 1831              	.LBB638:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1832              	 .loc 3 271 0
 1833 0516 660F59D2 	 mulpd xmm2,xmm2
 1834              	.LBE638:
 1835              	.LBE906:
 1836              	.LBB907:
 1837              	.LBB655:
 247:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1838              	 .loc 3 247 0
 1839 051a 660F58CD 	 addpd xmm1,xmm5
 1840 051e 660F58E2 	 addpd xmm4,xmm2
 1841              	.LBE655:
 1842              	.LBE907:
 1843              	.LBB908:
 1844              	.LBB660:
 1845 0522 660F58CB 	 addpd xmm1,xmm3
 1846              	.LBE660:
 1847              	.LBE908:
 1848              	.LBB909:
 1849              	.LBB666:
 789:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1850              	 .loc 3 789 0
 1851 0526 660F5AF1 	 cvtpd2ps xmm6,xmm1
 1852              	.LVL141:
 1853              	.LBE666:
 1854              	.LBE909:
 1855              	.LBB910:
 1856              	.LBB672:
 1857              	 .loc 4 222 0
 1858 052a 0F52F6   	 rsqrtps xmm6,xmm6
 1859              	.LVL142:
 1860              	.LBE672:
 1861              	.LBE910:
 1862              	.LBB911:
 1863              	.LBB795:
 1864              	.LBB679:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1865              	 .loc 3 271 0
 1866 052d 660F28E9 	 movapd xmm5,xmm1
 1867 0531 66410F59 	 mulpd xmm5,xmm12
 1867      EC
 1868              	.LBE679:
 1869              	.LBE795:
 1870              	.LBE911:
 1871              	.LBB912:
 1872              	.LBB829:
 825:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1873              	 .loc 3 825 0
 1874 0536 0F5AF6   	 cvtps2pd xmm6,xmm6
 1875              	.LVL143:
 1876              	.LBE829:
 1877              	.LBE912:
 1878              	.LBB913:
 1879              	.LBB796:
 1880              	.LBB694:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1881              	 .loc 3 271 0
 1882 0539 660F28FE 	 movapd xmm7,xmm6
 1883              	.LBE694:
 1884              	.LBE796:
 1885              	.LBB797:
 1886              	.LBB715:
 1887 053d 660F28DE 	 movapd xmm3,xmm6
 1888              	.LBE715:
 1889              	.LBE797:
 1890              	.LBB798:
 1891              	.LBB695:
 1892 0541 660F59FE 	 mulpd xmm7,xmm6
 1893              	.LBE695:
 1894              	.LBE798:
 1895              	.LBB799:
 1896              	.LBB716:
 1897 0545 66410F59 	 mulpd xmm3,xmm10
 1897      DA
 1898              	.LBE716:
 1899              	.LBE799:
 1900              	.LBB800:
 1901              	.LBB732:
 1902 054a 660F59F7 	 mulpd xmm6,xmm7
 1903              	.LVL144:
 1904              	.LBE732:
 1905              	.LBE800:
 1906              	.LBB801:
 1907              	.LBB743:
 1908 054e 660F59F5 	 mulpd xmm6,xmm5
 1909              	.LBE743:
 1910              	.LBE801:
 1911              	.LBB802:
 1912              	.LBB754:
 259:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1913              	 .loc 3 259 0
 1914 0552 660F5CDE 	 subpd xmm3,xmm6
 1915              	.LVL145:
 1916              	.LBE754:
 1917              	.LBE802:
 1918              	.LBB803:
 1919              	.LBB696:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1920              	 .loc 3 271 0
 1921 0556 660F28F3 	 movapd xmm6,xmm3
 1922              	.LBE696:
 1923              	.LBE803:
 1924              	.LBB804:
 1925              	.LBB717:
 1926 055a 660F28FB 	 movapd xmm7,xmm3
 1927              	.LBE717:
 1928              	.LBE804:
 1929              	.LBB805:
 1930              	.LBB697:
 1931 055e 660F59F3 	 mulpd xmm6,xmm3
 1932              	.LBE697:
 1933              	.LBE805:
 1934              	.LBB806:
 1935              	.LBB718:
 1936 0562 66410F59 	 mulpd xmm7,xmm10
 1936      FA
 1937              	.LBE718:
 1938              	.LBE806:
 1939              	.LBB807:
 1940              	.LBB733:
 1941 0567 660F59DE 	 mulpd xmm3,xmm6
 1942              	.LVL146:
 1943              	.LBE733:
 1944              	.LBE807:
 1945              	.LBB808:
 1946              	.LBB744:
 1947 056b 660F59EB 	 mulpd xmm5,xmm3
 1948              	.LVL147:
 1949              	.LBE744:
 1950              	.LBE808:
 1951              	.LBE913:
 1952              	.LBB914:
 1953              	.LBB836:
 283:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1954              	 .loc 3 283 0
 1955 056f 66410F28 	 movapd xmm3,xmm11
 1955      DB
 1956 0574 660F5ED9 	 divpd xmm3,xmm1
 1957              	.LBE836:
 1958              	.LBE914:
 1959              	.LBB915:
 1960              	.LBB809:
 1961              	.LBB755:
 259:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1962              	 .loc 3 259 0
 1963 0578 660F5CFD 	 subpd xmm7,xmm5
 1964 057c 660F28EF 	 movapd xmm5,xmm7
 1965              	.LBE755:
 1966              	.LBE809:
 1967              	.LBE915:
 1968              	.LBB916:
 1969              	.LBB843:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1970              	 .loc 3 271 0
 1971 0580 660F59EB 	 mulpd xmm5,xmm3
 1972              	.LBE843:
 1973              	.LBE916:
 1974              	.LBB917:
 1975              	.LBB595:
 933:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1976              	 .loc 3 933 0
 1977 0584 66480F6E 	 movq xmm3,rsi
 1977      DE
 1978 0589 4889DE   	 mov rsi,rbx
 1979 058c 660F14C3 	 unpcklpd xmm0,xmm3
 1980              	.LBE595:
 1981              	.LBE917:
 1982              	.LBB918:
 1983              	.LBB615:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1984              	 .loc 3 271 0
 1985 0590 660F59C0 	 mulpd xmm0,xmm0
 1986              	.LBE615:
 1987              	.LBE918:
 1988              	.LBB919:
 1989              	.LBB849:
 165:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1990              	 .loc 3 165 0
 1991 0594 0F292D00 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE3mag[rip+48],xmm5
 1991      000000
 1992              	.LVL148:
 1993              	.LBE849:
 1994              	.LBE919:
 1995              	.LBB920:
 1996              	.LBB661:
 247:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 1997              	 .loc 3 247 0
 1998 059b 660F58C4 	 addpd xmm0,xmm4
 1999              	.LBE661:
 2000              	.LBE920:
 2001              	.LBB921:
 2002              	.LBB667:
 789:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 2003              	 .loc 3 789 0
 2004 059f 660F5AD8 	 cvtpd2ps xmm3,xmm0
 2005              	.LVL149:
 2006              	.LBE667:
 2007              	.LBE921:
 2008              	.LBB922:
 2009              	.LBB673:
 2010              	 .loc 4 222 0
 2011 05a3 0F52DB   	 rsqrtps xmm3,xmm3
 2012              	.LVL150:
 2013              	.LBE673:
 2014              	.LBE922:
 2015              	.LBB923:
 2016              	.LBB810:
 2017              	.LBB680:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 2018              	 .loc 3 271 0
 2019 05a6 660F28D0 	 movapd xmm2,xmm0
 2020 05aa 66410F59 	 mulpd xmm2,xmm12
 2020      D4
 2021              	.LBE680:
 2022              	.LBE810:
 2023              	.LBE923:
 2024              	.LBB924:
 2025              	.LBB830:
 825:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 2026              	 .loc 3 825 0
 2027 05af 0F5ADB   	 cvtps2pd xmm3,xmm3
 2028              	.LVL151:
 2029              	.LBE830:
 2030              	.LBE924:
 2031              	.LBB925:
 2032              	.LBB811:
 2033              	.LBB698:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 2034              	 .loc 3 271 0
 2035 05b2 660F28E3 	 movapd xmm4,xmm3
 2036              	.LBE698:
 2037              	.LBE811:
 2038              	.LBB812:
 2039              	.LBB719:
 2040 05b6 660F28CB 	 movapd xmm1,xmm3
 2041              	.LBE719:
 2042              	.LBE812:
 2043              	.LBB813:
 2044              	.LBB699:
 2045 05ba 660F59E3 	 mulpd xmm4,xmm3
 2046              	.LBE699:
 2047              	.LBE813:
 2048              	.LBB814:
 2049              	.LBB720:
 2050 05be 66410F59 	 mulpd xmm1,xmm10
 2050      CA
 2051              	.LBE720:
 2052              	.LBE814:
 2053              	.LBB815:
 2054              	.LBB734:
 2055 05c3 660F59DC 	 mulpd xmm3,xmm4
 2056              	.LVL152:
 2057              	.LBE734:
 2058              	.LBE815:
 2059              	.LBB816:
 2060              	.LBB745:
 2061 05c7 660F59DA 	 mulpd xmm3,xmm2
 2062              	.LBE745:
 2063              	.LBE816:
 2064              	.LBB817:
 2065              	.LBB756:
 259:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 2066              	 .loc 3 259 0
 2067 05cb 660F5CCB 	 subpd xmm1,xmm3
 2068              	.LVL153:
 2069              	.LBE756:
 2070              	.LBE817:
 2071              	.LBB818:
 2072              	.LBB700:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 2073              	 .loc 3 271 0
 2074 05cf 660F28D9 	 movapd xmm3,xmm1
 2075              	.LBE700:
 2076              	.LBE818:
 2077              	.LBB819:
 2078              	.LBB721:
 2079 05d3 660F28E1 	 movapd xmm4,xmm1
 2080              	.LBE721:
 2081              	.LBE819:
 2082              	.LBB820:
 2083              	.LBB701:
 2084 05d7 660F59D9 	 mulpd xmm3,xmm1
 2085              	.LBE701:
 2086              	.LBE820:
 2087              	.LBB821:
 2088              	.LBB722:
 2089 05db 66410F59 	 mulpd xmm4,xmm10
 2089      E2
 2090              	.LBE722:
 2091              	.LBE821:
 2092              	.LBB822:
 2093              	.LBB735:
 2094 05e0 660F59CB 	 mulpd xmm1,xmm3
 2095              	.LVL154:
 2096              	.LBE735:
 2097              	.LBE822:
 2098              	.LBE925:
 2099              	.LBE939:
 2100              	.LBE968:
 2101              	.LBB969:
 2102              	.LBB956:
 2103              	.LBB953:
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2104              	 .loc 1 164 0
 2105 05e4 F20F109C 	 movsd xmm3,QWORD PTR 312[rsp]
 2105      24380100 
 2105      00
 2106              	.LBE953:
 2107              	.LBE956:
 2108              	.LBE969:
 2109              	.LBB970:
 2110              	.LBB940:
 2111              	.LBB926:
 2112              	.LBB823:
 2113              	.LBB746:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 2114              	 .loc 3 271 0
 2115 05ed 660F59D1 	 mulpd xmm2,xmm1
 2116              	.LVL155:
 2117              	.LBE746:
 2118              	.LBE823:
 2119              	.LBE926:
 2120              	.LBB927:
 2121              	.LBB837:
 283:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 2122              	 .loc 3 283 0
 2123 05f1 66410F28 	 movapd xmm1,xmm11
 2123      CB
 2124 05f6 660F5EC8 	 divpd xmm1,xmm0
 2125              	.LBE837:
 2126              	.LBE927:
 2127              	.LBB928:
 2128              	.LBB824:
 2129              	.LBB757:
 259:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 2130              	 .loc 3 259 0
 2131 05fa 660F5CE2 	 subpd xmm4,xmm2
 2132              	.LBE757:
 2133              	.LBE824:
 2134              	.LBE928:
 2135              	.LBB929:
 2136              	.LBB844:
 271:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 2137              	 .loc 3 271 0
 2138 05fe 660F28C4 	 movapd xmm0,xmm4
 2139              	.LVL156:
 2140 0602 660F59C1 	 mulpd xmm0,xmm1
 2141              	.LBE844:
 2142              	.LBE929:
 2143              	.LBB930:
 2144              	.LBB850:
 165:/usr/lib/gcc/x86_64-linux-gnu/7/include/emmintrin.h **** }
 2145              	 .loc 3 165 0
 2146 0606 0F290500 	 movaps XMMWORD PTR _ZZN11NBodySystem7advanceEdE3mag[rip+64],xmm0
 2146      000000
 2147              	.LVL157:
 2148              	.L64:
 2149              	.LBE850:
 2150              	.LBE930:
 2151              	.LBE940:
 2152              	.LBE970:
 2153              	.LBB971:
 2154              	.LBB957:
 2155              	.LBB954:
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2156              	 .loc 1 164 0
 2157 060d 4989F9   	 mov r9,rdi
 2158 0610 F20F1066 	 movsd xmm4,QWORD PTR 120[rsi]
 2158      78
 2159 0615 F20F1004 	 movsd xmm0,QWORD PTR [rdx+rdi*8]
 2159      FA
 163:NBodyCppBaseline.cpp ****                 iBody.vx -= r[k].dx * bodies[j].mass * mag[k];
 2160              	 .loc 1 163 0
 2161 061a 4C8D5701 	 lea r10,1[rdi]
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2162              	 .loc 1 164 0
 2163 061e 49C1E105 	 sal r9,5
 2164 0622 F20F107E 	 movsd xmm7,QWORD PTR 32[rsi]
 2164      20
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2165              	 .loc 1 165 0
 2166 0627 F20F1076 	 movsd xmm6,QWORD PTR 40[rsi]
 2166      28
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2167              	 .loc 1 164 0
 2168 062c 4901C1   	 add r9,rax
 166:NBodyCppBaseline.cpp **** 
 2169              	 .loc 1 166 0
 2170 062f F2440F10 	 movsd xmm8,QWORD PTR 48[rsi]
 2170      4630
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2171              	 .loc 1 164 0
 2172 0635 F2410F10 	 movsd xmm5,QWORD PTR [r9]
 2172      29
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2173              	 .loc 1 165 0
 2174 063a F2410F10 	 movsd xmm2,QWORD PTR 8[r9]
 2174      5108
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2175              	 .loc 1 164 0
 2176 0640 660F28CD 	 movapd xmm1,xmm5
 2177 0644 F20F59CC 	 mulsd xmm1,xmm4
 2178 0648 F20F59C8 	 mulsd xmm1,xmm0
 2179 064c F20F5CF9 	 subsd xmm7,xmm1
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2180              	 .loc 1 165 0
 2181 0650 660F28CC 	 movapd xmm1,xmm4
 2182 0654 F20F59CA 	 mulsd xmm1,xmm2
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2183              	 .loc 1 164 0
 2184 0658 F20F117E 	 movsd QWORD PTR 32[rsi],xmm7
 2184      20
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2185              	 .loc 1 165 0
 2186 065d F20F59C8 	 mulsd xmm1,xmm0
 2187 0661 F20F5CF1 	 subsd xmm6,xmm1
 166:NBodyCppBaseline.cpp **** 
 2188              	 .loc 1 166 0
 2189 0665 F2410F10 	 movsd xmm1,QWORD PTR 16[r9]
 2189      4910
 2190 066b F20F59E1 	 mulsd xmm4,xmm1
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2191              	 .loc 1 165 0
 2192 066f F20F1176 	 movsd QWORD PTR 40[rsi],xmm6
 2192      28
 166:NBodyCppBaseline.cpp **** 
 2193              	 .loc 1 166 0
 2194 0674 F20F59E0 	 mulsd xmm4,xmm0
 2195 0678 F2440F5C 	 subsd xmm8,xmm4
 2195      C4
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2196              	 .loc 1 168 0
 2197 067d F20F1066 	 movsd xmm4,QWORD PTR 56[rsi]
 2197      38
 2198 0682 F20F59EC 	 mulsd xmm5,xmm4
 169:NBodyCppBaseline.cpp ****                 bodies[j].vz += r[k].dz * iBody.mass * mag[k];
 2199              	 .loc 1 169 0
 2200 0686 F20F59D4 	 mulsd xmm2,xmm4
 166:NBodyCppBaseline.cpp **** 
 2201              	 .loc 1 166 0
 2202 068a F2440F11 	 movsd QWORD PTR 48[rsi],xmm8
 2202      4630
 170:NBodyCppBaseline.cpp ****             }
 2203              	 .loc 1 170 0
 2204 0690 F20F59CC 	 mulsd xmm1,xmm4
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2205              	 .loc 1 168 0
 2206 0694 F20F59E8 	 mulsd xmm5,xmm0
 169:NBodyCppBaseline.cpp ****                 bodies[j].vz += r[k].dz * iBody.mass * mag[k];
 2207              	 .loc 1 169 0
 2208 0698 F20F59D0 	 mulsd xmm2,xmm0
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2209              	 .loc 1 168 0
 2210 069c F20F586E 	 addsd xmm5,QWORD PTR 96[rsi]
 2210      60
 170:NBodyCppBaseline.cpp ****             }
 2211              	 .loc 1 170 0
 2212 06a1 F20F59C1 	 mulsd xmm0,xmm1
 169:NBodyCppBaseline.cpp ****                 bodies[j].vz += r[k].dz * iBody.mass * mag[k];
 2213              	 .loc 1 169 0
 2214 06a5 F20F5856 	 addsd xmm2,QWORD PTR 104[rsi]
 2214      68
 170:NBodyCppBaseline.cpp ****             }
 2215              	 .loc 1 170 0
 2216 06aa F20F5846 	 addsd xmm0,QWORD PTR 112[rsi]
 2216      70
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2217              	 .loc 1 168 0
 2218 06af F20F116E 	 movsd QWORD PTR 96[rsi],xmm5
 2218      60
 169:NBodyCppBaseline.cpp ****                 bodies[j].vz += r[k].dz * iBody.mass * mag[k];
 2219              	 .loc 1 169 0
 2220 06b4 F20F1156 	 movsd QWORD PTR 104[rsi],xmm2
 2220      68
 170:NBodyCppBaseline.cpp ****             }
 2221              	 .loc 1 170 0
 2222 06b9 F20F1146 	 movsd QWORD PTR 112[rsi],xmm0
 2222      70
 2223              	.LVL158:
 163:NBodyCppBaseline.cpp ****                 iBody.vx -= r[k].dx * bodies[j].mass * mag[k];
 2224              	 .loc 1 163 0
 2225 06be 4983F805 	 cmp r8,5
 2226 06c2 0F844802 	 je .L65
 2226      0000
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2227              	 .loc 1 164 0
 2228 06c8 4D89D1   	 mov r9,r10
 2229 06cb F2420F10 	 movsd xmm0,QWORD PTR [rdx+r10*8]
 2229      04D2
 163:NBodyCppBaseline.cpp ****                 iBody.vx -= r[k].dx * bodies[j].mass * mag[k];
 2230              	 .loc 1 163 0
 2231 06d1 4C8D5702 	 lea r10,2[rdi]
 2232              	.LVL159:
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2233              	 .loc 1 164 0
 2234 06d5 F2440F10 	 movsd xmm13,QWORD PTR 184[rsi]
 2234      AEB80000 
 2234      00
 2235 06de 49C1E105 	 sal r9,5
 2236              	.LVL160:
 2237 06e2 4901C1   	 add r9,rax
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2238              	 .loc 1 165 0
 2239 06e5 66410F28 	 movapd xmm2,xmm13
 2239      D5
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2240              	 .loc 1 164 0
 2241 06ea F2410F10 	 movsd xmm5,QWORD PTR [r9]
 2241      29
 2242 06ef 660F28CD 	 movapd xmm1,xmm5
 2243 06f3 F2410F59 	 mulsd xmm1,xmm13
 2243      CD
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2244              	 .loc 1 168 0
 2245 06f8 F20F59EC 	 mulsd xmm5,xmm4
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2246              	 .loc 1 164 0
 2247 06fc F20F59C8 	 mulsd xmm1,xmm0
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2248              	 .loc 1 168 0
 2249 0700 F20F59E8 	 mulsd xmm5,xmm0
 2250 0704 F20F58AE 	 addsd xmm5,QWORD PTR 160[rsi]
 2250      A0000000 
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2251              	 .loc 1 164 0
 2252 070c F20F5CF9 	 subsd xmm7,xmm1
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2253              	 .loc 1 165 0
 2254 0710 F2410F10 	 movsd xmm1,QWORD PTR 8[r9]
 2254      4908
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2255              	 .loc 1 168 0
 2256 0716 F20F11AE 	 movsd QWORD PTR 160[rsi],xmm5
 2256      A0000000 
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2257              	 .loc 1 165 0
 2258 071e F20F59D1 	 mulsd xmm2,xmm1
 169:NBodyCppBaseline.cpp ****                 bodies[j].vz += r[k].dz * iBody.mass * mag[k];
 2259              	 .loc 1 169 0
 2260 0722 F20F59CC 	 mulsd xmm1,xmm4
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2261              	 .loc 1 164 0
 2262 0726 F20F117E 	 movsd QWORD PTR 32[rsi],xmm7
 2262      20
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2263              	 .loc 1 165 0
 2264 072b F20F59D0 	 mulsd xmm2,xmm0
 169:NBodyCppBaseline.cpp ****                 bodies[j].vz += r[k].dz * iBody.mass * mag[k];
 2265              	 .loc 1 169 0
 2266 072f F20F59C8 	 mulsd xmm1,xmm0
 2267 0733 F20F588E 	 addsd xmm1,QWORD PTR 168[rsi]
 2267      A8000000 
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2268              	 .loc 1 165 0
 2269 073b F20F5CF2 	 subsd xmm6,xmm2
 166:NBodyCppBaseline.cpp **** 
 2270              	 .loc 1 166 0
 2271 073f F2410F10 	 movsd xmm2,QWORD PTR 16[r9]
 2271      5110
 169:NBodyCppBaseline.cpp ****                 bodies[j].vz += r[k].dz * iBody.mass * mag[k];
 2272              	 .loc 1 169 0
 2273 0745 F20F118E 	 movsd QWORD PTR 168[rsi],xmm1
 2273      A8000000 
 166:NBodyCppBaseline.cpp **** 
 2274              	 .loc 1 166 0
 2275 074d F2440F59 	 mulsd xmm13,xmm2
 2275      EA
 170:NBodyCppBaseline.cpp ****             }
 2276              	 .loc 1 170 0
 2277 0752 F20F59D4 	 mulsd xmm2,xmm4
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2278              	 .loc 1 165 0
 2279 0756 F20F1176 	 movsd QWORD PTR 40[rsi],xmm6
 2279      28
 166:NBodyCppBaseline.cpp **** 
 2280              	 .loc 1 166 0
 2281 075b F2440F59 	 mulsd xmm13,xmm0
 2281      E8
 170:NBodyCppBaseline.cpp ****             }
 2282              	 .loc 1 170 0
 2283 0760 F20F59C2 	 mulsd xmm0,xmm2
 2284 0764 F20F5886 	 addsd xmm0,QWORD PTR 176[rsi]
 2284      B0000000 
 166:NBodyCppBaseline.cpp **** 
 2285              	 .loc 1 166 0
 2286 076c F2450F5C 	 subsd xmm8,xmm13
 2286      C5
 170:NBodyCppBaseline.cpp ****             }
 2287              	 .loc 1 170 0
 2288 0771 F20F1186 	 movsd QWORD PTR 176[rsi],xmm0
 2288      B0000000 
 166:NBodyCppBaseline.cpp **** 
 2289              	 .loc 1 166 0
 2290 0779 F2440F11 	 movsd QWORD PTR 48[rsi],xmm8
 2290      4630
 2291              	.LVL161:
 163:NBodyCppBaseline.cpp ****                 iBody.vx -= r[k].dx * bodies[j].mass * mag[k];
 2292              	 .loc 1 163 0
 2293 077f 4983F804 	 cmp r8,4
 2294 0783 0F84CF03 	 je .L66
 2294      0000
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2295              	 .loc 1 164 0
 2296 0789 4D89D1   	 mov r9,r10
 2297 078c F2420F10 	 movsd xmm1,QWORD PTR [rdx+r10*8]
 2297      0CD2
 2298 0792 F2440F10 	 movsd xmm13,QWORD PTR 248[rsi]
 2298      AEF80000 
 2298      00
 2299 079b 49C1E105 	 sal r9,5
 2300 079f 4901C1   	 add r9,rax
 2301 07a2 F2410F10 	 movsd xmm5,QWORD PTR [r9]
 2301      29
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2302              	 .loc 1 165 0
 2303 07a7 F2410F10 	 movsd xmm2,QWORD PTR 8[r9]
 2303      5108
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2304              	 .loc 1 164 0
 2305 07ad 660F28C5 	 movapd xmm0,xmm5
 2306 07b1 F2410F59 	 mulsd xmm0,xmm13
 2306      C5
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2307              	 .loc 1 168 0
 2308 07b6 F20F59EC 	 mulsd xmm5,xmm4
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2309              	 .loc 1 164 0
 2310 07ba F20F59C1 	 mulsd xmm0,xmm1
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2311              	 .loc 1 168 0
 2312 07be F20F59E9 	 mulsd xmm5,xmm1
 2313 07c2 F20F58AE 	 addsd xmm5,QWORD PTR 224[rsi]
 2313      E0000000 
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2314              	 .loc 1 164 0
 2315 07ca F20F5CF8 	 subsd xmm7,xmm0
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2316              	 .loc 1 165 0
 2317 07ce 66410F28 	 movapd xmm0,xmm13
 2317      C5
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2318              	 .loc 1 168 0
 2319 07d3 F20F11AE 	 movsd QWORD PTR 224[rsi],xmm5
 2319      E0000000 
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2320              	 .loc 1 165 0
 2321 07db F20F59C2 	 mulsd xmm0,xmm2
 169:NBodyCppBaseline.cpp ****                 bodies[j].vz += r[k].dz * iBody.mass * mag[k];
 2322              	 .loc 1 169 0
 2323 07df F20F59D4 	 mulsd xmm2,xmm4
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2324              	 .loc 1 164 0
 2325 07e3 F20F117E 	 movsd QWORD PTR 32[rsi],xmm7
 2325      20
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2326              	 .loc 1 165 0
 2327 07e8 F20F59C1 	 mulsd xmm0,xmm1
 169:NBodyCppBaseline.cpp ****                 bodies[j].vz += r[k].dz * iBody.mass * mag[k];
 2328              	 .loc 1 169 0
 2329 07ec F20F59D1 	 mulsd xmm2,xmm1
 2330 07f0 F20F5896 	 addsd xmm2,QWORD PTR 232[rsi]
 2330      E8000000 
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2331              	 .loc 1 165 0
 2332 07f8 F20F5CF0 	 subsd xmm6,xmm0
 166:NBodyCppBaseline.cpp **** 
 2333              	 .loc 1 166 0
 2334 07fc F2410F10 	 movsd xmm0,QWORD PTR 16[r9]
 2334      4110
 163:NBodyCppBaseline.cpp ****                 iBody.vx -= r[k].dx * bodies[j].mass * mag[k];
 2335              	 .loc 1 163 0
 2336 0802 4C8D4F03 	 lea r9,3[rdi]
 169:NBodyCppBaseline.cpp ****                 bodies[j].vz += r[k].dz * iBody.mass * mag[k];
 2337              	 .loc 1 169 0
 2338 0806 F20F1196 	 movsd QWORD PTR 232[rsi],xmm2
 2338      E8000000 
 166:NBodyCppBaseline.cpp **** 
 2339              	 .loc 1 166 0
 2340 080e F2440F59 	 mulsd xmm13,xmm0
 2340      E8
 170:NBodyCppBaseline.cpp ****             }
 2341              	 .loc 1 170 0
 2342 0813 F20F59C4 	 mulsd xmm0,xmm4
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2343              	 .loc 1 165 0
 2344 0817 F20F1176 	 movsd QWORD PTR 40[rsi],xmm6
 2344      28
 166:NBodyCppBaseline.cpp **** 
 2345              	 .loc 1 166 0
 2346 081c F2440F59 	 mulsd xmm13,xmm1
 2346      E9
 170:NBodyCppBaseline.cpp ****             }
 2347              	 .loc 1 170 0
 2348 0821 F20F59C1 	 mulsd xmm0,xmm1
 2349 0825 F20F5886 	 addsd xmm0,QWORD PTR 240[rsi]
 2349      F0000000 
 166:NBodyCppBaseline.cpp **** 
 2350              	 .loc 1 166 0
 2351 082d F2450F5C 	 subsd xmm8,xmm13
 2351      C5
 170:NBodyCppBaseline.cpp ****             }
 2352              	 .loc 1 170 0
 2353 0832 F20F1186 	 movsd QWORD PTR 240[rsi],xmm0
 2353      F0000000 
 166:NBodyCppBaseline.cpp **** 
 2354              	 .loc 1 166 0
 2355 083a F2440F11 	 movsd QWORD PTR 48[rsi],xmm8
 2355      4630
 2356              	.LVL162:
 163:NBodyCppBaseline.cpp ****                 iBody.vx -= r[k].dx * bodies[j].mass * mag[k];
 2357              	 .loc 1 163 0
 2358 0840 4983F802 	 cmp r8,2
 2359 0844 0F852603 	 jne .L72
 2359      0000
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2360              	 .loc 1 164 0
 2361 084a F2420F10 	 movsd xmm0,QWORD PTR [rdx+r9*8]
 2361      04CA
 2362 0850 49C1E105 	 sal r9,5
 2363              	.LVL163:
 166:NBodyCppBaseline.cpp **** 
 2364              	 .loc 1 166 0
 2365 0854 660F28F3 	 movapd xmm6,xmm3
 163:NBodyCppBaseline.cpp ****                 iBody.vx -= r[k].dx * bodies[j].mass * mag[k];
 2366              	 .loc 1 163 0
 2367 0858 4883C704 	 add rdi,4
 2368              	.LVL164:
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2369              	 .loc 1 164 0
 2370 085c 4E8D1408 	 lea r10,[rax+r9]
 2371 0860 F20F104C 	 movsd xmm1,QWORD PTR 32[rsp]
 2371      2420
 2372 0866 F2410F10 	 movsd xmm2,QWORD PTR [r10]
 2372      12
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2373              	 .loc 1 165 0
 2374 086b F2410F10 	 movsd xmm5,QWORD PTR 8[r10]
 2374      6A08
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2375              	 .loc 1 164 0
 2376 0871 F20F59D3 	 mulsd xmm2,xmm3
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2377              	 .loc 1 165 0
 2378 0875 F20F59EB 	 mulsd xmm5,xmm3
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2379              	 .loc 1 164 0
 2380 0879 F20F59D0 	 mulsd xmm2,xmm0
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2381              	 .loc 1 165 0
 2382 087d F20F59E8 	 mulsd xmm5,xmm0
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2383              	 .loc 1 164 0
 2384 0881 F20F5CCA 	 subsd xmm1,xmm2
 2385 0885 F20F114C 	 movsd QWORD PTR 32[rsp],xmm1
 2385      2420
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2386              	 .loc 1 165 0
 2387 088b F20F104C 	 movsd xmm1,QWORD PTR 40[rsp]
 2387      2428
 164:NBodyCppBaseline.cpp ****                 iBody.vy -= r[k].dy * bodies[j].mass * mag[k];
 2388              	 .loc 1 164 0
 2389 0891 66420F28 	 movapd xmm2,XMMWORD PTR [rax+r9]
 2389      1408
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2390              	 .loc 1 165 0
 2391 0897 F20F5CCD 	 subsd xmm1,xmm5
 166:NBodyCppBaseline.cpp **** 
 2392              	 .loc 1 166 0
 2393 089b F20F106C 	 movsd xmm5,QWORD PTR 48[rsp]
 2393      2430
 165:NBodyCppBaseline.cpp ****                 iBody.vz -= r[k].dz * bodies[j].mass * mag[k];
 2394              	 .loc 1 165 0
 2395 08a1 F20F114C 	 movsd QWORD PTR 40[rsp],xmm1
 2395      2428
 166:NBodyCppBaseline.cpp **** 
 2396              	 .loc 1 166 0
 2397 08a7 F2410F10 	 movsd xmm1,QWORD PTR 16[r10]
 2397      4A10
 2398 08ad F20F59F1 	 mulsd xmm6,xmm1
 170:NBodyCppBaseline.cpp ****             }
 2399              	 .loc 1 170 0
 2400 08b1 F20F59CC 	 mulsd xmm1,xmm4
 166:NBodyCppBaseline.cpp **** 
 2401              	 .loc 1 166 0
 2402 08b5 F20F59F0 	 mulsd xmm6,xmm0
 2403 08b9 F20F5CEE 	 subsd xmm5,xmm6
 2404 08bd F20F116C 	 movsd QWORD PTR 48[rsp],xmm5
 2404      2430
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2405              	 .loc 1 168 0
 2406 08c3 F20F12EC 	 movddup xmm5,xmm4
 2407 08c7 660F59D5 	 mulpd xmm2,xmm5
 2408 08cb F20F12E8 	 movddup xmm5,xmm0
 170:NBodyCppBaseline.cpp ****             }
 2409              	 .loc 1 170 0
 2410 08cf F20F59C1 	 mulsd xmm0,xmm1
 2411 08d3 F20F5884 	 addsd xmm0,QWORD PTR 304[rsp]
 2411      24300100 
 2411      00
 2412 08dc F20F1184 	 movsd QWORD PTR 304[rsp],xmm0
 2412      24300100 
 2412      00
 168:NBodyCppBaseline.cpp ****                 bodies[j].vy += r[k].dy * iBody.mass * mag[k];
 2413              	 .loc 1 168 0
 2414 08e5 660F59D5 	 mulpd xmm2,xmm5
 2415 08e9 660F5894 	 addpd xmm2,XMMWORD PTR 288[rsp]
 2415      24200100 
 2415      00
 2416 08f2 0F299424 	 movaps XMMWORD PTR 288[rsp],xmm2
 2416      20010000 
 2417              	.LVL165:
 2418              	.L67:
 2419 08fa 4883C640 	 add rsi,64
 2420 08fe 4983C001 	 add r8,1
 2421              	.LVL166:
 2422 0902 E906FDFF 	 jmp .L64
 2422      FF
 2423              	.LVL167:
 2424 0907 660F1F84 	 .p2align 4,,10
 2424      00000000 
 2424      00
 2425              	 .p2align 3
 2426              	.L65:
 2427              	.LBE954:
 2428              	.LBE957:
 2429              	.LBE971:
 2430              	.LBB972:
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2431              	 .loc 1 175 0
 2432 0910 F20F1064 	 movsd xmm4,QWORD PTR 32[rsp]
 2432      2420
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2433              	 .loc 1 176 0
 2434 0916 F20F106C 	 movsd xmm5,QWORD PTR 40[rsp]
 2434      2428
 2435              	.LBE972:
 2436              	.LBE564:
 2437              	.LBE563:
 214:NBodyCppBaseline.cpp ****     for (int i = 0; i < n; ++i)
 2438              	 .loc 1 214 0
 2439 091c 83C101   	 add ecx,1
 2440              	.LVL168:
 2441              	.LBB977:
 2442              	.LBB975:
 2443              	.LBB973:
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2444              	 .loc 1 176 0
 2445 091f F20F1084 	 movsd xmm0,QWORD PTR 168[rsp]
 2445      24A80000 
 2445      00
 177:NBodyCppBaseline.cpp ****         }
 2446              	 .loc 1 177 0
 2447 0928 F20F107C 	 movsd xmm7,QWORD PTR 48[rsp]
 2447      2430
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2448              	 .loc 1 175 0
 2449 092e F20F105C 	 movsd xmm3,QWORD PTR 96[rsp]
 2449      2460
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2450              	 .loc 1 176 0
 2451 0934 F20F1074 	 movsd xmm6,QWORD PTR 104[rsp]
 2451      2468
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2452              	 .loc 1 175 0
 2453 093a F2410F59 	 mulsd xmm4,xmm9
 2453      E1
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2454              	 .loc 1 176 0
 2455 093f F2410F59 	 mulsd xmm0,xmm9
 2455      C1
 177:NBodyCppBaseline.cpp ****         }
 2456              	 .loc 1 177 0
 2457 0944 F20F104C 	 movsd xmm1,QWORD PTR 112[rsp]
 2457      2470
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2458              	 .loc 1 175 0
 2459 094a F20F1094 	 movsd xmm2,QWORD PTR 160[rsp]
 2459      24A00000 
 2459      00
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2460              	 .loc 1 176 0
 2461 0953 F20F5884 	 addsd xmm0,QWORD PTR 136[rsp]
 2461      24880000 
 2461      00
 2462 095c F2410F59 	 mulsd xmm5,xmm9
 2462      E9
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2463              	 .loc 1 175 0
 2464 0961 F20F5824 	 addsd xmm4,QWORD PTR [rsp]
 2464      24
 2465 0966 F2440F10 	 movsd xmm8,QWORD PTR 224[rsp]
 2465      8424E000 
 2465      0000
 177:NBodyCppBaseline.cpp ****         }
 2466              	 .loc 1 177 0
 2467 0970 F2410F59 	 mulsd xmm7,xmm9
 2467      F9
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2468              	 .loc 1 176 0
 2469 0975 F20F586C 	 addsd xmm5,QWORD PTR 8[rsp]
 2469      2408
 2470 097b F2440F10 	 movsd xmm13,QWORD PTR 232[rsp]
 2470      AC24E800 
 2470      0000
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2471              	 .loc 1 175 0
 2472 0985 F2410F59 	 mulsd xmm3,xmm9
 2472      D9
 177:NBodyCppBaseline.cpp ****         }
 2473              	 .loc 1 177 0
 2474 098a F20F587C 	 addsd xmm7,QWORD PTR 16[rsp]
 2474      2410
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2475              	 .loc 1 176 0
 2476 0990 66480F7E 	 movq rdi,xmm0
 2476      C7
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2477              	 .loc 1 175 0
 2478 0995 F20F585C 	 addsd xmm3,QWORD PTR 64[rsp]
 2478      2440
 2479 099b F20F1124 	 movsd QWORD PTR [rsp],xmm4
 2479      24
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2480              	 .loc 1 176 0
 2481 09a0 F20F1184 	 movsd QWORD PTR 136[rsp],xmm0
 2481      24880000 
 2481      00
 2482 09a9 F2410F59 	 mulsd xmm6,xmm9
 2482      F1
 177:NBodyCppBaseline.cpp ****         }
 2483              	 .loc 1 177 0
 2484 09ae F20F1084 	 movsd xmm0,QWORD PTR 176[rsp]
 2484      24B00000 
 2484      00
 2485 09b7 F2410F59 	 mulsd xmm1,xmm9
 2485      C9
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2486              	 .loc 1 176 0
 2487 09bc F20F5874 	 addsd xmm6,QWORD PTR 72[rsp]
 2487      2448
 2488 09c2 F20F116C 	 movsd QWORD PTR 8[rsp],xmm5
 2488      2408
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2489              	 .loc 1 175 0
 2490 09c8 F2410F59 	 mulsd xmm2,xmm9
 2490      D1
 177:NBodyCppBaseline.cpp ****         }
 2491              	 .loc 1 177 0
 2492 09cd F20F584C 	 addsd xmm1,QWORD PTR 80[rsp]
 2492      2450
 2493 09d3 F20F117C 	 movsd QWORD PTR 16[rsp],xmm7
 2493      2410
 2494              	.LVL169:
 2495 09d9 F2410F59 	 mulsd xmm0,xmm9
 2495      C1
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2496              	 .loc 1 175 0
 2497 09de F20F115C 	 movsd QWORD PTR 64[rsp],xmm3
 2497      2440
 2498 09e4 F20F5894 	 addsd xmm2,QWORD PTR 128[rsp]
 2498      24800000 
 2498      00
 2499 09ed F2450F59 	 mulsd xmm8,xmm9
 2499      C1
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2500              	 .loc 1 176 0
 2501 09f2 F20F1174 	 movsd QWORD PTR 72[rsp],xmm6
 2501      2448
 177:NBodyCppBaseline.cpp ****         }
 2502              	 .loc 1 177 0
 2503 09f8 F20F5884 	 addsd xmm0,QWORD PTR 144[rsp]
 2503      24900000 
 2503      00
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2504              	 .loc 1 176 0
 2505 0a01 F2450F59 	 mulsd xmm13,xmm9
 2505      E9
 177:NBodyCppBaseline.cpp ****         }
 2506              	 .loc 1 177 0
 2507 0a06 F20F114C 	 movsd QWORD PTR 80[rsp],xmm1
 2507      2450
 2508              	.LVL170:
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2509              	 .loc 1 175 0
 2510 0a0c F2440F58 	 addsd xmm8,QWORD PTR 192[rsp]
 2510      8424C000 
 2510      0000
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2511              	 .loc 1 176 0
 2512 0a16 F2440F58 	 addsd xmm13,QWORD PTR 200[rsp]
 2512      AC24C800 
 2512      0000
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2513              	 .loc 1 175 0
 2514 0a20 F20F1194 	 movsd QWORD PTR 128[rsp],xmm2
 2514      24800000 
 2514      00
 177:NBodyCppBaseline.cpp ****         }
 2515              	 .loc 1 177 0
 2516 0a29 F20F1184 	 movsd QWORD PTR 144[rsp],xmm0
 2516      24900000 
 2516      00
 2517              	.LVL171:
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2518              	 .loc 1 175 0
 2519 0a32 F2440F11 	 movsd QWORD PTR 192[rsp],xmm8
 2519      8424C000 
 2519      0000
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2520              	 .loc 1 176 0
 2521 0a3c F2440F11 	 movsd QWORD PTR 200[rsp],xmm13
 2521      AC24C800 
 2521      0000
 2522 0a46 664C0F7E 	 movq rsi,xmm13
 2522      EE
 2523 0a4b F2440F10 	 movsd xmm15,QWORD PTR 296[rsp]
 2523      BC242801 
 2523      0000
 177:NBodyCppBaseline.cpp ****         }
 2524              	 .loc 1 177 0
 2525 0a55 F2440F10 	 movsd xmm13,QWORD PTR 240[rsp]
 2525      AC24F000 
 2525      0000
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2526              	 .loc 1 175 0
 2527 0a5f F2440F10 	 movsd xmm14,QWORD PTR 288[rsp]
 2527      B4242001 
 2527      0000
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2528              	 .loc 1 176 0
 2529 0a69 F2450F59 	 mulsd xmm15,xmm9
 2529      F9
 2530 0a6e F2440F58 	 addsd xmm15,QWORD PTR 264[rsp]
 2530      BC240801 
 2530      0000
 177:NBodyCppBaseline.cpp ****         }
 2531              	 .loc 1 177 0
 2532 0a78 F2450F59 	 mulsd xmm13,xmm9
 2532      E9
 2533 0a7d F2440F58 	 addsd xmm13,QWORD PTR 208[rsp]
 2533      AC24D000 
 2533      0000
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2534              	 .loc 1 175 0
 2535 0a87 F2450F59 	 mulsd xmm14,xmm9
 2535      F1
 2536 0a8c F2440F58 	 addsd xmm14,QWORD PTR 256[rsp]
 2536      B4240001 
 2536      0000
 176:NBodyCppBaseline.cpp ****             bodies[i].z += dt * bodies[i].vz;
 2537              	 .loc 1 176 0
 2538 0a96 F2440F11 	 movsd QWORD PTR 264[rsp],xmm15
 2538      BC240801 
 2538      0000
 2539 0aa0 664D0F7E 	 movq r11,xmm15
 2539      FB
 177:NBodyCppBaseline.cpp ****         }
 2540              	 .loc 1 177 0
 2541 0aa5 F2440F10 	 movsd xmm15,QWORD PTR 304[rsp]
 2541      BC243001 
 2541      0000
 2542 0aaf F2440F11 	 movsd QWORD PTR 208[rsp],xmm13
 2542      AC24D000 
 2542      0000
 2543              	.LVL172:
 175:NBodyCppBaseline.cpp ****             bodies[i].y += dt * bodies[i].vy;
 2544              	 .loc 1 175 0
 2545 0ab9 F2440F11 	 movsd QWORD PTR 256[rsp],xmm14
 2545      B4240001 
 2545      0000
 177:NBodyCppBaseline.cpp ****         }
 2546              	 .loc 1 177 0
 2547 0ac3 F2450F59 	 mulsd xmm15,xmm9
 2547      F9
 2548 0ac8 F2440F58 	 addsd xmm15,QWORD PTR 272[rsp]
 2548      BC241001 
 2548      0000
 2549 0ad2 F2440F11 	 movsd QWORD PTR 272[rsp],xmm15
 2549      BC241001 
 2549      0000
 2550              	.LVL173:
 2551              	.LBE973:
 2552              	.LBE975:
 2553              	.LBE977:
 2554              	 .loc 1 214 0
 2555 0adc 39E9     	 cmp ecx,ebp
 2556 0ade 0F8C3CF6 	 jl .L69
 2556      FFFF
 2557              	.LVL174:
 2558              	.L63:
 2559              	.LBE562:
 215:NBodyCppBaseline.cpp ****         bodies.advance(0.01);
 216:NBodyCppBaseline.cpp ****     printf("%.9f\n", bodies.energy());
 2560              	 .loc 1 216 0
 2561 0ae4 4889DF   	 mov rdi,rbx
 2562 0ae7 E8000000 	 call _ZN11NBodySystem6energyEv
 2562      00
 2563              	.LVL175:
 2564              	.LBB979:
 2565              	.LBB980:
 2566              	 .loc 2 104 0
 2567 0aec BF010000 	 mov edi,1
 2567      00
 2568 0af1 B8010000 	 mov eax,1
 2568      00
 2569 0af6 488D3500 	 lea rsi,.LC32[rip]
 2569      000000
 2570 0afd E8000000 	 call __printf_chk@PLT
 2570      00
 2571              	.LVL176:
 2572              	.LBE980:
 2573              	.LBE979:
 217:NBodyCppBaseline.cpp **** 
 218:NBodyCppBaseline.cpp ****     auto end = std::chrono::system_clock::now();
 2574              	 .loc 1 218 0
 2575 0b02 E8000000 	 call _ZNSt6chrono3_V212system_clock3nowEv@PLT
 2575      00
 2576              	.LVL177:
 2577              	.LBB981:
 2578              	.LBB982:
 2579              	.LBB983:
 2580              	.LBB984:
 2581              	.LBB985:
 2582              	 .file 5 "/usr/include/c++/7/chrono"
   1:/usr/include/c++/7/chrono **** // <chrono> -*- C++ -*-
   2:/usr/include/c++/7/chrono **** 
   3:/usr/include/c++/7/chrono **** // Copyright (C) 2008-2017 Free Software Foundation, Inc.
   4:/usr/include/c++/7/chrono **** //
   5:/usr/include/c++/7/chrono **** // This file is part of the GNU ISO C++ Library.  This library is free
   6:/usr/include/c++/7/chrono **** // software; you can redistribute it and/or modify it under the
   7:/usr/include/c++/7/chrono **** // terms of the GNU General Public License as published by the
   8:/usr/include/c++/7/chrono **** // Free Software Foundation; either version 3, or (at your option)
   9:/usr/include/c++/7/chrono **** // any later version.
  10:/usr/include/c++/7/chrono **** 
  11:/usr/include/c++/7/chrono **** // This library is distributed in the hope that it will be useful,
  12:/usr/include/c++/7/chrono **** // but WITHOUT ANY WARRANTY; without even the implied warranty of
  13:/usr/include/c++/7/chrono **** // MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  14:/usr/include/c++/7/chrono **** // GNU General Public License for more details.
  15:/usr/include/c++/7/chrono **** 
  16:/usr/include/c++/7/chrono **** // Under Section 7 of GPL version 3, you are granted additional
  17:/usr/include/c++/7/chrono **** // permissions described in the GCC Runtime Library Exception, version
  18:/usr/include/c++/7/chrono **** // 3.1, as published by the Free Software Foundation.
  19:/usr/include/c++/7/chrono **** 
  20:/usr/include/c++/7/chrono **** // You should have received a copy of the GNU General Public License and
  21:/usr/include/c++/7/chrono **** // a copy of the GCC Runtime Library Exception along with this program;
  22:/usr/include/c++/7/chrono **** // see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
  23:/usr/include/c++/7/chrono **** // <http://www.gnu.org/licenses/>.
  24:/usr/include/c++/7/chrono **** 
  25:/usr/include/c++/7/chrono **** /** @file include/chrono
  26:/usr/include/c++/7/chrono ****  *  This is a Standard C++ Library header.
  27:/usr/include/c++/7/chrono ****  */
  28:/usr/include/c++/7/chrono **** 
  29:/usr/include/c++/7/chrono **** #ifndef _GLIBCXX_CHRONO
  30:/usr/include/c++/7/chrono **** #define _GLIBCXX_CHRONO 1
  31:/usr/include/c++/7/chrono **** 
  32:/usr/include/c++/7/chrono **** #pragma GCC system_header
  33:/usr/include/c++/7/chrono **** 
  34:/usr/include/c++/7/chrono **** #if __cplusplus < 201103L
  35:/usr/include/c++/7/chrono **** # include <bits/c++0x_warning.h>
  36:/usr/include/c++/7/chrono **** #else
  37:/usr/include/c++/7/chrono **** 
  38:/usr/include/c++/7/chrono **** #include <ratio>
  39:/usr/include/c++/7/chrono **** #include <type_traits>
  40:/usr/include/c++/7/chrono **** #include <limits>
  41:/usr/include/c++/7/chrono **** #include <ctime>
  42:/usr/include/c++/7/chrono **** #include <bits/parse_numbers.h> // for literals support.
  43:/usr/include/c++/7/chrono **** 
  44:/usr/include/c++/7/chrono **** #ifdef _GLIBCXX_USE_C99_STDINT_TR1
  45:/usr/include/c++/7/chrono **** 
  46:/usr/include/c++/7/chrono **** namespace std _GLIBCXX_VISIBILITY(default)
  47:/usr/include/c++/7/chrono **** {
  48:/usr/include/c++/7/chrono ****   /**
  49:/usr/include/c++/7/chrono ****    * @defgroup chrono Time
  50:/usr/include/c++/7/chrono ****    * @ingroup utilities
  51:/usr/include/c++/7/chrono ****    *
  52:/usr/include/c++/7/chrono ****    * Classes and functions for time.
  53:/usr/include/c++/7/chrono ****    * @{
  54:/usr/include/c++/7/chrono ****    */
  55:/usr/include/c++/7/chrono **** 
  56:/usr/include/c++/7/chrono ****   /** @namespace std::chrono
  57:/usr/include/c++/7/chrono ****    *  @brief ISO C++ 2011 entities sub-namespace for time and date.
  58:/usr/include/c++/7/chrono ****    */
  59:/usr/include/c++/7/chrono ****   namespace chrono
  60:/usr/include/c++/7/chrono ****   {
  61:/usr/include/c++/7/chrono ****   _GLIBCXX_BEGIN_NAMESPACE_VERSION
  62:/usr/include/c++/7/chrono **** 
  63:/usr/include/c++/7/chrono ****     template<typename _Rep, typename _Period = ratio<1>>
  64:/usr/include/c++/7/chrono ****       struct duration;
  65:/usr/include/c++/7/chrono **** 
  66:/usr/include/c++/7/chrono ****     template<typename _Clock, typename _Dur = typename _Clock::duration>
  67:/usr/include/c++/7/chrono ****       struct time_point;
  68:/usr/include/c++/7/chrono **** 
  69:/usr/include/c++/7/chrono ****   _GLIBCXX_END_NAMESPACE_VERSION
  70:/usr/include/c++/7/chrono ****   }
  71:/usr/include/c++/7/chrono **** 
  72:/usr/include/c++/7/chrono **** _GLIBCXX_BEGIN_NAMESPACE_VERSION
  73:/usr/include/c++/7/chrono **** 
  74:/usr/include/c++/7/chrono ****   // 20.11.4.3 specialization of common_type (for duration, sfinae-friendly)
  75:/usr/include/c++/7/chrono **** 
  76:/usr/include/c++/7/chrono ****   template<typename _CT, typename _Period1, typename _Period2>
  77:/usr/include/c++/7/chrono ****     struct __duration_common_type_wrapper
  78:/usr/include/c++/7/chrono ****     {
  79:/usr/include/c++/7/chrono ****     private:
  80:/usr/include/c++/7/chrono ****       typedef __static_gcd<_Period1::num, _Period2::num> __gcd_num;
  81:/usr/include/c++/7/chrono ****       typedef __static_gcd<_Period1::den, _Period2::den> __gcd_den;
  82:/usr/include/c++/7/chrono ****       typedef typename _CT::type __cr;
  83:/usr/include/c++/7/chrono ****       typedef ratio<__gcd_num::value,
  84:/usr/include/c++/7/chrono ****         (_Period1::den / __gcd_den::value) * _Period2::den> __r;
  85:/usr/include/c++/7/chrono ****     public:
  86:/usr/include/c++/7/chrono ****       typedef __success_type<chrono::duration<__cr, __r>> type;
  87:/usr/include/c++/7/chrono ****     };
  88:/usr/include/c++/7/chrono **** 
  89:/usr/include/c++/7/chrono ****   template<typename _Period1, typename _Period2>
  90:/usr/include/c++/7/chrono ****     struct __duration_common_type_wrapper<__failure_type, _Period1, _Period2>
  91:/usr/include/c++/7/chrono ****     { typedef __failure_type type; };
  92:/usr/include/c++/7/chrono **** 
  93:/usr/include/c++/7/chrono ****   template<typename _Rep1, typename _Period1, typename _Rep2, typename _Period2>
  94:/usr/include/c++/7/chrono ****     struct common_type<chrono::duration<_Rep1, _Period1>,
  95:/usr/include/c++/7/chrono ****              chrono::duration<_Rep2, _Period2>>
  96:/usr/include/c++/7/chrono ****     : public __duration_common_type_wrapper<typename __member_type_wrapper<
  97:/usr/include/c++/7/chrono ****              common_type<_Rep1, _Rep2>>::type, _Period1, _Period2>::type
  98:/usr/include/c++/7/chrono ****     { };
  99:/usr/include/c++/7/chrono **** 
 100:/usr/include/c++/7/chrono ****   // 20.11.4.3 specialization of common_type (for time_point, sfinae-friendly)
 101:/usr/include/c++/7/chrono **** 
 102:/usr/include/c++/7/chrono ****   template<typename _CT, typename _Clock>
 103:/usr/include/c++/7/chrono ****     struct __timepoint_common_type_wrapper
 104:/usr/include/c++/7/chrono ****     {
 105:/usr/include/c++/7/chrono ****       typedef __success_type<chrono::time_point<_Clock, typename _CT::type>>
 106:/usr/include/c++/7/chrono ****         type;
 107:/usr/include/c++/7/chrono ****     };
 108:/usr/include/c++/7/chrono **** 
 109:/usr/include/c++/7/chrono ****   template<typename _Clock>
 110:/usr/include/c++/7/chrono ****     struct __timepoint_common_type_wrapper<__failure_type, _Clock>
 111:/usr/include/c++/7/chrono ****     { typedef __failure_type type; };
 112:/usr/include/c++/7/chrono **** 
 113:/usr/include/c++/7/chrono ****   template<typename _Clock, typename _Duration1, typename _Duration2>
 114:/usr/include/c++/7/chrono ****     struct common_type<chrono::time_point<_Clock, _Duration1>,
 115:/usr/include/c++/7/chrono ****              chrono::time_point<_Clock, _Duration2>>
 116:/usr/include/c++/7/chrono ****     : public __timepoint_common_type_wrapper<typename __member_type_wrapper<
 117:/usr/include/c++/7/chrono ****              common_type<_Duration1, _Duration2>>::type, _Clock>::type
 118:/usr/include/c++/7/chrono ****     { };
 119:/usr/include/c++/7/chrono **** 
 120:/usr/include/c++/7/chrono **** _GLIBCXX_END_NAMESPACE_VERSION
 121:/usr/include/c++/7/chrono **** 
 122:/usr/include/c++/7/chrono ****   namespace chrono
 123:/usr/include/c++/7/chrono ****   {
 124:/usr/include/c++/7/chrono ****   _GLIBCXX_BEGIN_NAMESPACE_VERSION
 125:/usr/include/c++/7/chrono **** 
 126:/usr/include/c++/7/chrono ****     // Primary template for duration_cast impl.
 127:/usr/include/c++/7/chrono ****     template<typename _ToDur, typename _CF, typename _CR,
 128:/usr/include/c++/7/chrono **** 	     bool _NumIsOne = false, bool _DenIsOne = false>
 129:/usr/include/c++/7/chrono ****       struct __duration_cast_impl
 130:/usr/include/c++/7/chrono ****       {
 131:/usr/include/c++/7/chrono **** 	template<typename _Rep, typename _Period>
 132:/usr/include/c++/7/chrono **** 	  static constexpr _ToDur
 133:/usr/include/c++/7/chrono **** 	  __cast(const duration<_Rep, _Period>& __d)
 134:/usr/include/c++/7/chrono **** 	  {
 135:/usr/include/c++/7/chrono **** 	    typedef typename _ToDur::rep			__to_rep;
 136:/usr/include/c++/7/chrono **** 	    return _ToDur(static_cast<__to_rep>(static_cast<_CR>(__d.count())
 137:/usr/include/c++/7/chrono **** 	      * static_cast<_CR>(_CF::num)
 138:/usr/include/c++/7/chrono **** 	      / static_cast<_CR>(_CF::den)));
 139:/usr/include/c++/7/chrono **** 	  }
 140:/usr/include/c++/7/chrono ****       };
 141:/usr/include/c++/7/chrono **** 
 142:/usr/include/c++/7/chrono ****     template<typename _ToDur, typename _CF, typename _CR>
 143:/usr/include/c++/7/chrono ****       struct __duration_cast_impl<_ToDur, _CF, _CR, true, true>
 144:/usr/include/c++/7/chrono ****       {
 145:/usr/include/c++/7/chrono **** 	template<typename _Rep, typename _Period>
 146:/usr/include/c++/7/chrono **** 	  static constexpr _ToDur
 147:/usr/include/c++/7/chrono **** 	  __cast(const duration<_Rep, _Period>& __d)
 148:/usr/include/c++/7/chrono **** 	  {
 149:/usr/include/c++/7/chrono **** 	    typedef typename _ToDur::rep			__to_rep;
 150:/usr/include/c++/7/chrono **** 	    return _ToDur(static_cast<__to_rep>(__d.count()));
 151:/usr/include/c++/7/chrono **** 	  }
 152:/usr/include/c++/7/chrono ****       };
 153:/usr/include/c++/7/chrono **** 
 154:/usr/include/c++/7/chrono ****     template<typename _ToDur, typename _CF, typename _CR>
 155:/usr/include/c++/7/chrono ****       struct __duration_cast_impl<_ToDur, _CF, _CR, true, false>
 156:/usr/include/c++/7/chrono ****       {
 157:/usr/include/c++/7/chrono **** 	template<typename _Rep, typename _Period>
 158:/usr/include/c++/7/chrono **** 	  static constexpr _ToDur
 159:/usr/include/c++/7/chrono **** 	  __cast(const duration<_Rep, _Period>& __d)
 160:/usr/include/c++/7/chrono **** 	  {
 161:/usr/include/c++/7/chrono **** 	    typedef typename _ToDur::rep			__to_rep;
 162:/usr/include/c++/7/chrono **** 	    return _ToDur(static_cast<__to_rep>(
 163:/usr/include/c++/7/chrono **** 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
 2583              	 .loc 5 163 0
 2584 0b07 660FEFC0 	 pxor xmm0,xmm0
 2585              	.LBE985:
 2586              	.LBE984:
 2587              	.LBE983:
 2588              	.LBE982:
 2589              	.LBE981:
 2590              	.LBB994:
 2591              	.LBB995:
 2592              	 .loc 2 104 0
 2593 0b0b BF010000 	 mov edi,1
 2593      00
 2594 0b10 488D3500 	 lea rsi,.LC37[rip]
 2594      000000
 2595              	.LBE995:
 2596              	.LBE994:
 2597              	.LBB998:
 2598              	.LBB999:
 2599              	.LBB1000:
 164:/usr/include/c++/7/chrono **** 	  }
 165:/usr/include/c++/7/chrono ****       };
 166:/usr/include/c++/7/chrono **** 
 167:/usr/include/c++/7/chrono ****     template<typename _ToDur, typename _CF, typename _CR>
 168:/usr/include/c++/7/chrono ****       struct __duration_cast_impl<_ToDur, _CF, _CR, false, true>
 169:/usr/include/c++/7/chrono ****       {
 170:/usr/include/c++/7/chrono **** 	template<typename _Rep, typename _Period>
 171:/usr/include/c++/7/chrono **** 	  static constexpr _ToDur
 172:/usr/include/c++/7/chrono **** 	  __cast(const duration<_Rep, _Period>& __d)
 173:/usr/include/c++/7/chrono **** 	  {
 174:/usr/include/c++/7/chrono **** 	    typedef typename _ToDur::rep			__to_rep;
 175:/usr/include/c++/7/chrono **** 	    return _ToDur(static_cast<__to_rep>(
 176:/usr/include/c++/7/chrono **** 	      static_cast<_CR>(__d.count()) * static_cast<_CR>(_CF::num)));
 177:/usr/include/c++/7/chrono **** 	  }
 178:/usr/include/c++/7/chrono ****       };
 179:/usr/include/c++/7/chrono **** 
 180:/usr/include/c++/7/chrono ****     template<typename _Tp>
 181:/usr/include/c++/7/chrono ****       struct __is_duration
 182:/usr/include/c++/7/chrono ****       : std::false_type
 183:/usr/include/c++/7/chrono ****       { };
 184:/usr/include/c++/7/chrono **** 
 185:/usr/include/c++/7/chrono ****     template<typename _Rep, typename _Period>
 186:/usr/include/c++/7/chrono ****       struct __is_duration<duration<_Rep, _Period>>
 187:/usr/include/c++/7/chrono ****       : std::true_type
 188:/usr/include/c++/7/chrono ****       { };
 189:/usr/include/c++/7/chrono **** 
 190:/usr/include/c++/7/chrono ****     /// duration_cast
 191:/usr/include/c++/7/chrono ****     template<typename _ToDur, typename _Rep, typename _Period>
 192:/usr/include/c++/7/chrono ****       constexpr typename enable_if<__is_duration<_ToDur>::value,
 193:/usr/include/c++/7/chrono **** 				   _ToDur>::type
 194:/usr/include/c++/7/chrono ****       duration_cast(const duration<_Rep, _Period>& __d)
 195:/usr/include/c++/7/chrono ****       {
 196:/usr/include/c++/7/chrono **** 	typedef typename _ToDur::period				__to_period;
 197:/usr/include/c++/7/chrono **** 	typedef typename _ToDur::rep				__to_rep;
 198:/usr/include/c++/7/chrono **** 	typedef ratio_divide<_Period, __to_period> 		__cf;
 199:/usr/include/c++/7/chrono **** 	typedef typename common_type<__to_rep, _Rep, intmax_t>::type
 200:/usr/include/c++/7/chrono **** 	  							__cr;
 201:/usr/include/c++/7/chrono **** 	typedef  __duration_cast_impl<_ToDur, __cf, __cr,
 202:/usr/include/c++/7/chrono **** 				      __cf::num == 1, __cf::den == 1> __dc;
 203:/usr/include/c++/7/chrono **** 	return __dc::__cast(__d);
 204:/usr/include/c++/7/chrono ****       }
 205:/usr/include/c++/7/chrono **** 
 206:/usr/include/c++/7/chrono ****     /// treat_as_floating_point
 207:/usr/include/c++/7/chrono ****     template<typename _Rep>
 208:/usr/include/c++/7/chrono ****       struct treat_as_floating_point
 209:/usr/include/c++/7/chrono ****       : is_floating_point<_Rep>
 210:/usr/include/c++/7/chrono ****       { };
 211:/usr/include/c++/7/chrono **** 
 212:/usr/include/c++/7/chrono **** #if __cplusplus > 201402L
 213:/usr/include/c++/7/chrono ****     template <typename _Rep>
 214:/usr/include/c++/7/chrono ****       inline constexpr bool treat_as_floating_point_v =
 215:/usr/include/c++/7/chrono ****         treat_as_floating_point<_Rep>::value;
 216:/usr/include/c++/7/chrono **** #endif // C++17
 217:/usr/include/c++/7/chrono **** 
 218:/usr/include/c++/7/chrono **** #if __cplusplus >= 201703L
 219:/usr/include/c++/7/chrono **** # define __cpp_lib_chrono 201611
 220:/usr/include/c++/7/chrono **** 
 221:/usr/include/c++/7/chrono ****     template<typename _ToDur, typename _Rep, typename _Period>
 222:/usr/include/c++/7/chrono ****       constexpr enable_if_t<__is_duration<_ToDur>::value, _ToDur>
 223:/usr/include/c++/7/chrono ****       floor(const duration<_Rep, _Period>& __d)
 224:/usr/include/c++/7/chrono ****       {
 225:/usr/include/c++/7/chrono **** 	auto __to = chrono::duration_cast<_ToDur>(__d);
 226:/usr/include/c++/7/chrono **** 	if (__to > __d)
 227:/usr/include/c++/7/chrono **** 	  return __to - _ToDur{1};
 228:/usr/include/c++/7/chrono **** 	return __to;
 229:/usr/include/c++/7/chrono ****       }
 230:/usr/include/c++/7/chrono **** 
 231:/usr/include/c++/7/chrono ****     template<typename _ToDur, typename _Rep, typename _Period>
 232:/usr/include/c++/7/chrono ****       constexpr enable_if_t<__is_duration<_ToDur>::value, _ToDur>
 233:/usr/include/c++/7/chrono ****       ceil(const duration<_Rep, _Period>& __d)
 234:/usr/include/c++/7/chrono ****       {
 235:/usr/include/c++/7/chrono **** 	auto __to = chrono::duration_cast<_ToDur>(__d);
 236:/usr/include/c++/7/chrono **** 	if (__to < __d)
 237:/usr/include/c++/7/chrono **** 	  return __to + _ToDur{1};
 238:/usr/include/c++/7/chrono **** 	return __to;
 239:/usr/include/c++/7/chrono ****       }
 240:/usr/include/c++/7/chrono **** 
 241:/usr/include/c++/7/chrono ****     template <typename _ToDur, typename _Rep, typename _Period>
 242:/usr/include/c++/7/chrono ****       constexpr enable_if_t<
 243:/usr/include/c++/7/chrono **** 	__and_<__is_duration<_ToDur>,
 244:/usr/include/c++/7/chrono **** 	       __not_<treat_as_floating_point<typename _ToDur::rep>>>::value,
 245:/usr/include/c++/7/chrono **** 	_ToDur>
 246:/usr/include/c++/7/chrono ****       round(const duration<_Rep, _Period>& __d)
 247:/usr/include/c++/7/chrono ****       {
 248:/usr/include/c++/7/chrono **** 	_ToDur __t0 = chrono::floor<_ToDur>(__d);
 249:/usr/include/c++/7/chrono **** 	_ToDur __t1 = __t0 + _ToDur{1};
 250:/usr/include/c++/7/chrono **** 	auto __diff0 = __d - __t0;
 251:/usr/include/c++/7/chrono **** 	auto __diff1 = __t1 - __d;
 252:/usr/include/c++/7/chrono **** 	if (__diff0 == __diff1)
 253:/usr/include/c++/7/chrono **** 	{
 254:/usr/include/c++/7/chrono **** 	    if (__t0.count() & 1)
 255:/usr/include/c++/7/chrono **** 		return __t1;
 256:/usr/include/c++/7/chrono **** 	    return __t0;
 257:/usr/include/c++/7/chrono **** 	}
 258:/usr/include/c++/7/chrono **** 	else if (__diff0 < __diff1)
 259:/usr/include/c++/7/chrono **** 	    return __t0;
 260:/usr/include/c++/7/chrono **** 	return __t1;
 261:/usr/include/c++/7/chrono ****       }
 262:/usr/include/c++/7/chrono **** 
 263:/usr/include/c++/7/chrono ****     template<typename _Rep, typename _Period>
 264:/usr/include/c++/7/chrono ****       constexpr
 265:/usr/include/c++/7/chrono ****       enable_if_t<numeric_limits<_Rep>::is_signed, duration<_Rep, _Period>>
 266:/usr/include/c++/7/chrono ****       abs(duration<_Rep, _Period> __d)
 267:/usr/include/c++/7/chrono ****       {
 268:/usr/include/c++/7/chrono **** 	if (__d >= __d.zero())
 269:/usr/include/c++/7/chrono **** 	  return __d;
 270:/usr/include/c++/7/chrono **** 	return -__d;
 271:/usr/include/c++/7/chrono ****       }
 272:/usr/include/c++/7/chrono **** #endif // C++17
 273:/usr/include/c++/7/chrono **** 
 274:/usr/include/c++/7/chrono ****     /// duration_values
 275:/usr/include/c++/7/chrono ****     template<typename _Rep>
 276:/usr/include/c++/7/chrono ****       struct duration_values
 277:/usr/include/c++/7/chrono ****       {
 278:/usr/include/c++/7/chrono **** 	static constexpr _Rep
 279:/usr/include/c++/7/chrono **** 	zero()
 280:/usr/include/c++/7/chrono **** 	{ return _Rep(0); }
 281:/usr/include/c++/7/chrono **** 
 282:/usr/include/c++/7/chrono **** 	static constexpr _Rep
 283:/usr/include/c++/7/chrono **** 	max()
 284:/usr/include/c++/7/chrono **** 	{ return numeric_limits<_Rep>::max(); }
 285:/usr/include/c++/7/chrono **** 
 286:/usr/include/c++/7/chrono **** 	static constexpr _Rep
 287:/usr/include/c++/7/chrono **** 	min()
 288:/usr/include/c++/7/chrono **** 	{ return numeric_limits<_Rep>::lowest(); }
 289:/usr/include/c++/7/chrono ****       };
 290:/usr/include/c++/7/chrono **** 
 291:/usr/include/c++/7/chrono ****     template<typename _Tp>
 292:/usr/include/c++/7/chrono ****       struct __is_ratio
 293:/usr/include/c++/7/chrono ****       : std::false_type
 294:/usr/include/c++/7/chrono ****       { };
 295:/usr/include/c++/7/chrono **** 
 296:/usr/include/c++/7/chrono ****     template<intmax_t _Num, intmax_t _Den>
 297:/usr/include/c++/7/chrono ****       struct __is_ratio<ratio<_Num, _Den>>
 298:/usr/include/c++/7/chrono ****       : std::true_type
 299:/usr/include/c++/7/chrono ****       { };
 300:/usr/include/c++/7/chrono **** 
 301:/usr/include/c++/7/chrono ****     /// duration
 302:/usr/include/c++/7/chrono ****     template<typename _Rep, typename _Period>
 303:/usr/include/c++/7/chrono ****       struct duration
 304:/usr/include/c++/7/chrono ****       {
 305:/usr/include/c++/7/chrono **** 	typedef _Rep						rep;
 306:/usr/include/c++/7/chrono **** 	typedef _Period 					period;
 307:/usr/include/c++/7/chrono **** 
 308:/usr/include/c++/7/chrono **** 	static_assert(!__is_duration<_Rep>::value, "rep cannot be a duration");
 309:/usr/include/c++/7/chrono **** 	static_assert(__is_ratio<_Period>::value,
 310:/usr/include/c++/7/chrono **** 		      "period must be a specialization of ratio");
 311:/usr/include/c++/7/chrono **** 	static_assert(_Period::num > 0, "period must be positive");
 312:/usr/include/c++/7/chrono **** 
 313:/usr/include/c++/7/chrono **** 	// 20.11.5.1 construction / copy / destroy
 314:/usr/include/c++/7/chrono **** 	constexpr duration() = default;
 315:/usr/include/c++/7/chrono **** 
 316:/usr/include/c++/7/chrono **** 	// NB: Make constexpr implicit. This cannot be explicitly
 317:/usr/include/c++/7/chrono **** 	// constexpr, as any UDT that is not a literal type with a
 318:/usr/include/c++/7/chrono **** 	// constexpr copy constructor will be ill-formed.
 319:/usr/include/c++/7/chrono **** 	duration(const duration&) = default;
 320:/usr/include/c++/7/chrono **** 
 321:/usr/include/c++/7/chrono **** 	template<typename _Rep2, typename = typename
 322:/usr/include/c++/7/chrono **** 	       enable_if<is_convertible<_Rep2, rep>::value
 323:/usr/include/c++/7/chrono **** 			 && (treat_as_floating_point<rep>::value
 324:/usr/include/c++/7/chrono **** 			     || !treat_as_floating_point<_Rep2>::value)>::type>
 325:/usr/include/c++/7/chrono **** 	  constexpr explicit duration(const _Rep2& __rep)
 326:/usr/include/c++/7/chrono **** 	  : __r(static_cast<rep>(__rep)) { }
 327:/usr/include/c++/7/chrono **** 
 328:/usr/include/c++/7/chrono **** 	template<typename _Rep2, typename _Period2, typename = typename
 329:/usr/include/c++/7/chrono **** 	       enable_if<treat_as_floating_point<rep>::value
 330:/usr/include/c++/7/chrono **** 			 || (ratio_divide<_Period2, period>::den == 1
 331:/usr/include/c++/7/chrono **** 			     && !treat_as_floating_point<_Rep2>::value)>::type>
 332:/usr/include/c++/7/chrono **** 	  constexpr duration(const duration<_Rep2, _Period2>& __d)
 333:/usr/include/c++/7/chrono **** 	  : __r(duration_cast<duration>(__d).count()) { }
 334:/usr/include/c++/7/chrono **** 
 335:/usr/include/c++/7/chrono **** 	~duration() = default;
 336:/usr/include/c++/7/chrono **** 	duration& operator=(const duration&) = default;
 337:/usr/include/c++/7/chrono **** 
 338:/usr/include/c++/7/chrono **** 	// 20.11.5.2 observer
 339:/usr/include/c++/7/chrono **** 	constexpr rep
 340:/usr/include/c++/7/chrono **** 	count() const
 341:/usr/include/c++/7/chrono **** 	{ return __r; }
 342:/usr/include/c++/7/chrono **** 
 343:/usr/include/c++/7/chrono **** 	// 20.11.5.3 arithmetic
 344:/usr/include/c++/7/chrono **** 	constexpr duration
 345:/usr/include/c++/7/chrono **** 	operator+() const
 346:/usr/include/c++/7/chrono **** 	{ return *this; }
 347:/usr/include/c++/7/chrono **** 
 348:/usr/include/c++/7/chrono **** 	constexpr duration
 349:/usr/include/c++/7/chrono **** 	operator-() const
 350:/usr/include/c++/7/chrono **** 	{ return duration(-__r); }
 351:/usr/include/c++/7/chrono **** 
 352:/usr/include/c++/7/chrono **** 	_GLIBCXX17_CONSTEXPR duration&
 353:/usr/include/c++/7/chrono **** 	operator++()
 354:/usr/include/c++/7/chrono **** 	{
 355:/usr/include/c++/7/chrono **** 	  ++__r;
 356:/usr/include/c++/7/chrono **** 	  return *this;
 357:/usr/include/c++/7/chrono **** 	}
 358:/usr/include/c++/7/chrono **** 
 359:/usr/include/c++/7/chrono **** 	_GLIBCXX17_CONSTEXPR duration
 360:/usr/include/c++/7/chrono **** 	operator++(int)
 361:/usr/include/c++/7/chrono **** 	{ return duration(__r++); }
 362:/usr/include/c++/7/chrono **** 
 363:/usr/include/c++/7/chrono **** 	_GLIBCXX17_CONSTEXPR duration&
 364:/usr/include/c++/7/chrono **** 	operator--()
 365:/usr/include/c++/7/chrono **** 	{
 366:/usr/include/c++/7/chrono **** 	  --__r;
 367:/usr/include/c++/7/chrono **** 	  return *this;
 368:/usr/include/c++/7/chrono **** 	}
 369:/usr/include/c++/7/chrono **** 
 370:/usr/include/c++/7/chrono **** 	_GLIBCXX17_CONSTEXPR duration
 371:/usr/include/c++/7/chrono **** 	operator--(int)
 372:/usr/include/c++/7/chrono **** 	{ return duration(__r--); }
 373:/usr/include/c++/7/chrono **** 
 374:/usr/include/c++/7/chrono **** 	_GLIBCXX17_CONSTEXPR duration&
 375:/usr/include/c++/7/chrono **** 	operator+=(const duration& __d)
 376:/usr/include/c++/7/chrono **** 	{
 377:/usr/include/c++/7/chrono **** 	  __r += __d.count();
 378:/usr/include/c++/7/chrono **** 	  return *this;
 379:/usr/include/c++/7/chrono **** 	}
 380:/usr/include/c++/7/chrono **** 
 381:/usr/include/c++/7/chrono **** 	_GLIBCXX17_CONSTEXPR duration&
 382:/usr/include/c++/7/chrono **** 	operator-=(const duration& __d)
 383:/usr/include/c++/7/chrono **** 	{
 384:/usr/include/c++/7/chrono **** 	  __r -= __d.count();
 385:/usr/include/c++/7/chrono **** 	  return *this;
 386:/usr/include/c++/7/chrono **** 	}
 387:/usr/include/c++/7/chrono **** 
 388:/usr/include/c++/7/chrono **** 	_GLIBCXX17_CONSTEXPR duration&
 389:/usr/include/c++/7/chrono **** 	operator*=(const rep& __rhs)
 390:/usr/include/c++/7/chrono **** 	{
 391:/usr/include/c++/7/chrono **** 	  __r *= __rhs;
 392:/usr/include/c++/7/chrono **** 	  return *this;
 393:/usr/include/c++/7/chrono **** 	}
 394:/usr/include/c++/7/chrono **** 
 395:/usr/include/c++/7/chrono **** 	_GLIBCXX17_CONSTEXPR duration&
 396:/usr/include/c++/7/chrono **** 	operator/=(const rep& __rhs)
 397:/usr/include/c++/7/chrono **** 	{
 398:/usr/include/c++/7/chrono **** 	  __r /= __rhs;
 399:/usr/include/c++/7/chrono **** 	  return *this;
 400:/usr/include/c++/7/chrono **** 	}
 401:/usr/include/c++/7/chrono **** 
 402:/usr/include/c++/7/chrono **** 	// DR 934.
 403:/usr/include/c++/7/chrono **** 	template<typename _Rep2 = rep>
 404:/usr/include/c++/7/chrono **** 	  _GLIBCXX17_CONSTEXPR
 405:/usr/include/c++/7/chrono **** 	  typename enable_if<!treat_as_floating_point<_Rep2>::value,
 406:/usr/include/c++/7/chrono **** 			     duration&>::type
 407:/usr/include/c++/7/chrono **** 	  operator%=(const rep& __rhs)
 408:/usr/include/c++/7/chrono **** 	  {
 409:/usr/include/c++/7/chrono **** 	    __r %= __rhs;
 410:/usr/include/c++/7/chrono **** 	    return *this;
 411:/usr/include/c++/7/chrono **** 	  }
 412:/usr/include/c++/7/chrono **** 
 413:/usr/include/c++/7/chrono **** 	template<typename _Rep2 = rep>
 414:/usr/include/c++/7/chrono **** 	  _GLIBCXX17_CONSTEXPR
 415:/usr/include/c++/7/chrono **** 	  typename enable_if<!treat_as_floating_point<_Rep2>::value,
 416:/usr/include/c++/7/chrono **** 			     duration&>::type
 417:/usr/include/c++/7/chrono **** 	  operator%=(const duration& __d)
 418:/usr/include/c++/7/chrono **** 	  {
 419:/usr/include/c++/7/chrono **** 	    __r %= __d.count();
 420:/usr/include/c++/7/chrono **** 	    return *this;
 421:/usr/include/c++/7/chrono **** 	  }
 422:/usr/include/c++/7/chrono **** 
 423:/usr/include/c++/7/chrono **** 	// 20.11.5.4 special values
 424:/usr/include/c++/7/chrono **** 	static constexpr duration
 425:/usr/include/c++/7/chrono **** 	zero()
 426:/usr/include/c++/7/chrono **** 	{ return duration(duration_values<rep>::zero()); }
 427:/usr/include/c++/7/chrono **** 
 428:/usr/include/c++/7/chrono **** 	static constexpr duration
 429:/usr/include/c++/7/chrono **** 	min()
 430:/usr/include/c++/7/chrono **** 	{ return duration(duration_values<rep>::min()); }
 431:/usr/include/c++/7/chrono **** 
 432:/usr/include/c++/7/chrono **** 	static constexpr duration
 433:/usr/include/c++/7/chrono **** 	max()
 434:/usr/include/c++/7/chrono **** 	{ return duration(duration_values<rep>::max()); }
 435:/usr/include/c++/7/chrono **** 
 436:/usr/include/c++/7/chrono ****       private:
 437:/usr/include/c++/7/chrono **** 	rep __r;
 438:/usr/include/c++/7/chrono ****       };
 439:/usr/include/c++/7/chrono **** 
 440:/usr/include/c++/7/chrono ****     template<typename _Rep1, typename _Period1,
 441:/usr/include/c++/7/chrono **** 	     typename _Rep2, typename _Period2>
 442:/usr/include/c++/7/chrono ****       constexpr typename common_type<duration<_Rep1, _Period1>,
 443:/usr/include/c++/7/chrono **** 				     duration<_Rep2, _Period2>>::type
 444:/usr/include/c++/7/chrono ****       operator+(const duration<_Rep1, _Period1>& __lhs,
 445:/usr/include/c++/7/chrono **** 		const duration<_Rep2, _Period2>& __rhs)
 446:/usr/include/c++/7/chrono ****       {
 447:/usr/include/c++/7/chrono **** 	typedef duration<_Rep1, _Period1>			__dur1;
 448:/usr/include/c++/7/chrono **** 	typedef duration<_Rep2, _Period2>			__dur2;
 449:/usr/include/c++/7/chrono **** 	typedef typename common_type<__dur1,__dur2>::type	__cd;
 450:/usr/include/c++/7/chrono **** 	return __cd(__cd(__lhs).count() + __cd(__rhs).count());
 451:/usr/include/c++/7/chrono ****       }
 452:/usr/include/c++/7/chrono **** 
 453:/usr/include/c++/7/chrono ****     template<typename _Rep1, typename _Period1,
 454:/usr/include/c++/7/chrono **** 	     typename _Rep2, typename _Period2>
 455:/usr/include/c++/7/chrono ****       constexpr typename common_type<duration<_Rep1, _Period1>,
 456:/usr/include/c++/7/chrono **** 				     duration<_Rep2, _Period2>>::type
 457:/usr/include/c++/7/chrono ****       operator-(const duration<_Rep1, _Period1>& __lhs,
 458:/usr/include/c++/7/chrono **** 		const duration<_Rep2, _Period2>& __rhs)
 459:/usr/include/c++/7/chrono ****       {
 460:/usr/include/c++/7/chrono **** 	typedef duration<_Rep1, _Period1>			__dur1;
 461:/usr/include/c++/7/chrono **** 	typedef duration<_Rep2, _Period2>			__dur2;
 462:/usr/include/c++/7/chrono **** 	typedef typename common_type<__dur1,__dur2>::type	__cd;
 463:/usr/include/c++/7/chrono **** 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
 2600              	 .loc 5 463 0
 2601 0b17 4C29E0   	 sub rax,r12
 2602              	.LVL178:
 2603              	.LBE1000:
 2604              	.LBE999:
 2605              	.LBE998:
 2606              	.LBB1001:
 2607              	.LBB992:
 2608              	.LBB990:
 2609              	.LBB988:
 2610              	.LBB986:
 163:/usr/include/c++/7/chrono **** 	  }
 2611              	 .loc 5 163 0
 2612 0b1a F2480F2A 	 cvtsi2sdq xmm0,rax
 2612      C0
 2613              	.LBE986:
 2614              	.LBE988:
 2615              	.LBE990:
 2616              	.LBE992:
 2617              	.LBE1001:
 2618              	.LBB1002:
 2619              	.LBB996:
 2620              	 .loc 2 104 0
 2621 0b1f B8010000 	 mov eax,1
 2621      00
 2622              	.LBE996:
 2623              	.LBE1002:
 2624              	.LBB1003:
 2625              	.LBB993:
 2626              	.LBB991:
 2627              	.LBB989:
 2628              	.LBB987:
 163:/usr/include/c++/7/chrono **** 	  }
 2629              	 .loc 5 163 0
 2630 0b24 F20F5E05 	 divsd xmm0,QWORD PTR .LC36[rip]
 2630      00000000 
 2631              	.LBE987:
 2632              	.LBE989:
 2633              	.LBE991:
 2634              	.LBE993:
 2635              	.LBE1003:
 2636              	.LBB1004:
 2637              	.LBB997:
 2638              	 .loc 2 104 0
 2639 0b2c E8000000 	 call __printf_chk@PLT
 2639      00
 2640              	.LVL179:
 2641              	.LBE997:
 2642              	.LBE1004:
 219:NBodyCppBaseline.cpp ****     std::chrono::duration<double> elapsed_time = end - start;
 220:NBodyCppBaseline.cpp ****     printf("Total time: %.3F\n", elapsed_time.count());
 221:NBodyCppBaseline.cpp **** }
 2643              	 .loc 1 221 0
 2644 0b31 31C0     	 xor eax,eax
 2645 0b33 488B8C24 	 mov rcx,QWORD PTR 328[rsp]
 2645      48010000 
 2646 0b3b 6448330C 	 xor rcx,QWORD PTR fs:40
 2646      25280000 
 2646      00
 2647 0b44 757E     	 jne .L76
 2648 0b46 4881C458 	 add rsp,344
 2648      010000
 2649              	 .cfi_remember_state
 2650              	 .cfi_def_cfa_offset 40
 2651 0b4d 5B       	 pop rbx
 2652              	 .cfi_def_cfa_offset 32
 2653 0b4e 5D       	 pop rbp
 2654              	 .cfi_def_cfa_offset 24
 2655 0b4f 415C     	 pop r12
 2656              	 .cfi_def_cfa_offset 16
 2657              	.LVL180:
 2658 0b51 415D     	 pop r13
 2659              	 .cfi_def_cfa_offset 8
 2660 0b53 C3       	 ret
 2661              	.LVL181:
 2662              	 .p2align 4,,10
 2663 0b54 0F1F4000 	 .p2align 3
 2664              	.L66:
 2665              	 .cfi_restore_state
 2666 0b58 4883C640 	 add rsi,64
 2667              	.LBB1005:
 2668              	.LBB978:
 2669              	.LBB976:
 2670              	.LBB974:
 2671              	.LBB958:
 2672              	.LBB955:
 163:NBodyCppBaseline.cpp ****                 iBody.vx -= r[k].dx * bodies[j].mass * mag[k];
 2673              	 .loc 1 163 0
 2674 0b5c 4C89D7   	 mov rdi,r10
 2675 0b5f 41B80500 	 mov r8d,5
 2675      0000
 2676              	.LVL182:
 2677 0b65 E9A3FAFF 	 jmp .L64
 2677      FF
 2678              	.LVL183:
 2679 0b6a 660F1F44 	 .p2align 4,,10
 2679      0000
 2680              	 .p2align 3
 2681              	.L72:
 2682 0b70 4C89CF   	 mov rdi,r9
 2683 0b73 E982FDFF 	 jmp .L67
 2683      FF
 2684              	.LVL184:
 2685              	.L75:
 2686              	.LBE955:
 2687              	.LBE958:
 2688              	.LBE974:
 2689              	.LBE976:
 2690              	.LBE978:
 2691              	.LBE1005:
 2692              	.LBB1006:
 2693              	.LBB1007:
 2694              	 .file 6 "/usr/include/stdlib.h"
   1:/usr/include/stdlib.h **** /* Copyright (C) 1991-2018 Free Software Foundation, Inc.
   2:/usr/include/stdlib.h ****    This file is part of the GNU C Library.
   3:/usr/include/stdlib.h **** 
   4:/usr/include/stdlib.h ****    The GNU C Library is free software; you can redistribute it and/or
   5:/usr/include/stdlib.h ****    modify it under the terms of the GNU Lesser General Public
   6:/usr/include/stdlib.h ****    License as published by the Free Software Foundation; either
   7:/usr/include/stdlib.h ****    version 2.1 of the License, or (at your option) any later version.
   8:/usr/include/stdlib.h **** 
   9:/usr/include/stdlib.h ****    The GNU C Library is distributed in the hope that it will be useful,
  10:/usr/include/stdlib.h ****    but WITHOUT ANY WARRANTY; without even the implied warranty of
  11:/usr/include/stdlib.h ****    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  12:/usr/include/stdlib.h ****    Lesser General Public License for more details.
  13:/usr/include/stdlib.h **** 
  14:/usr/include/stdlib.h ****    You should have received a copy of the GNU Lesser General Public
  15:/usr/include/stdlib.h ****    License along with the GNU C Library; if not, see
  16:/usr/include/stdlib.h ****    <http://www.gnu.org/licenses/>.  */
  17:/usr/include/stdlib.h **** 
  18:/usr/include/stdlib.h **** /*
  19:/usr/include/stdlib.h ****  *	ISO C99 Standard: 7.20 General utilities	<stdlib.h>
  20:/usr/include/stdlib.h ****  */
  21:/usr/include/stdlib.h **** 
  22:/usr/include/stdlib.h **** #ifndef	_STDLIB_H
  23:/usr/include/stdlib.h **** 
  24:/usr/include/stdlib.h **** #define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
  25:/usr/include/stdlib.h **** #include <bits/libc-header-start.h>
  26:/usr/include/stdlib.h **** 
  27:/usr/include/stdlib.h **** /* Get size_t, wchar_t and NULL from <stddef.h>.  */
  28:/usr/include/stdlib.h **** #define __need_size_t
  29:/usr/include/stdlib.h **** #define __need_wchar_t
  30:/usr/include/stdlib.h **** #define __need_NULL
  31:/usr/include/stdlib.h **** #include <stddef.h>
  32:/usr/include/stdlib.h **** 
  33:/usr/include/stdlib.h **** __BEGIN_DECLS
  34:/usr/include/stdlib.h **** 
  35:/usr/include/stdlib.h **** #define	_STDLIB_H	1
  36:/usr/include/stdlib.h **** 
  37:/usr/include/stdlib.h **** #if (defined __USE_XOPEN || defined __USE_XOPEN2K8) && !defined _SYS_WAIT_H
  38:/usr/include/stdlib.h **** /* XPG requires a few symbols from <sys/wait.h> being defined.  */
  39:/usr/include/stdlib.h **** # include <bits/waitflags.h>
  40:/usr/include/stdlib.h **** # include <bits/waitstatus.h>
  41:/usr/include/stdlib.h **** 
  42:/usr/include/stdlib.h **** /* Define the macros <sys/wait.h> also would define this way.  */
  43:/usr/include/stdlib.h **** # define WEXITSTATUS(status)	__WEXITSTATUS (status)
  44:/usr/include/stdlib.h **** # define WTERMSIG(status)	__WTERMSIG (status)
  45:/usr/include/stdlib.h **** # define WSTOPSIG(status)	__WSTOPSIG (status)
  46:/usr/include/stdlib.h **** # define WIFEXITED(status)	__WIFEXITED (status)
  47:/usr/include/stdlib.h **** # define WIFSIGNALED(status)	__WIFSIGNALED (status)
  48:/usr/include/stdlib.h **** # define WIFSTOPPED(status)	__WIFSTOPPED (status)
  49:/usr/include/stdlib.h **** # ifdef __WIFCONTINUED
  50:/usr/include/stdlib.h **** #  define WIFCONTINUED(status)	__WIFCONTINUED (status)
  51:/usr/include/stdlib.h **** # endif
  52:/usr/include/stdlib.h **** #endif	/* X/Open or XPG7 and <sys/wait.h> not included.  */
  53:/usr/include/stdlib.h **** 
  54:/usr/include/stdlib.h **** /* _FloatN API tests for enablement.  */
  55:/usr/include/stdlib.h **** #include <bits/floatn.h>
  56:/usr/include/stdlib.h **** 
  57:/usr/include/stdlib.h **** /* Returned by `div'.  */
  58:/usr/include/stdlib.h **** typedef struct
  59:/usr/include/stdlib.h ****   {
  60:/usr/include/stdlib.h ****     int quot;			/* Quotient.  */
  61:/usr/include/stdlib.h ****     int rem;			/* Remainder.  */
  62:/usr/include/stdlib.h ****   } div_t;
  63:/usr/include/stdlib.h **** 
  64:/usr/include/stdlib.h **** /* Returned by `ldiv'.  */
  65:/usr/include/stdlib.h **** #ifndef __ldiv_t_defined
  66:/usr/include/stdlib.h **** typedef struct
  67:/usr/include/stdlib.h ****   {
  68:/usr/include/stdlib.h ****     long int quot;		/* Quotient.  */
  69:/usr/include/stdlib.h ****     long int rem;		/* Remainder.  */
  70:/usr/include/stdlib.h ****   } ldiv_t;
  71:/usr/include/stdlib.h **** # define __ldiv_t_defined	1
  72:/usr/include/stdlib.h **** #endif
  73:/usr/include/stdlib.h **** 
  74:/usr/include/stdlib.h **** #if defined __USE_ISOC99 && !defined __lldiv_t_defined
  75:/usr/include/stdlib.h **** /* Returned by `lldiv'.  */
  76:/usr/include/stdlib.h **** __extension__ typedef struct
  77:/usr/include/stdlib.h ****   {
  78:/usr/include/stdlib.h ****     long long int quot;		/* Quotient.  */
  79:/usr/include/stdlib.h ****     long long int rem;		/* Remainder.  */
  80:/usr/include/stdlib.h ****   } lldiv_t;
  81:/usr/include/stdlib.h **** # define __lldiv_t_defined	1
  82:/usr/include/stdlib.h **** #endif
  83:/usr/include/stdlib.h **** 
  84:/usr/include/stdlib.h **** 
  85:/usr/include/stdlib.h **** /* The largest number rand will return (same as INT_MAX).  */
  86:/usr/include/stdlib.h **** #define	RAND_MAX	2147483647
  87:/usr/include/stdlib.h **** 
  88:/usr/include/stdlib.h **** 
  89:/usr/include/stdlib.h **** /* We define these the same for all machines.
  90:/usr/include/stdlib.h ****    Changes from this to the outside world should be done in `_exit'.  */
  91:/usr/include/stdlib.h **** #define	EXIT_FAILURE	1	/* Failing exit status.  */
  92:/usr/include/stdlib.h **** #define	EXIT_SUCCESS	0	/* Successful exit status.  */
  93:/usr/include/stdlib.h **** 
  94:/usr/include/stdlib.h **** 
  95:/usr/include/stdlib.h **** /* Maximum length of a multibyte character in the current locale.  */
  96:/usr/include/stdlib.h **** #define	MB_CUR_MAX	(__ctype_get_mb_cur_max ())
  97:/usr/include/stdlib.h **** extern size_t __ctype_get_mb_cur_max (void) __THROW __wur;
  98:/usr/include/stdlib.h **** 
  99:/usr/include/stdlib.h **** 
 100:/usr/include/stdlib.h **** /* Convert a string to a floating-point number.  */
 101:/usr/include/stdlib.h **** extern double atof (const char *__nptr)
 102:/usr/include/stdlib.h ****      __THROW __attribute_pure__ __nonnull ((1)) __wur;
 103:/usr/include/stdlib.h **** /* Convert a string to an integer.  */
 104:/usr/include/stdlib.h **** extern int atoi (const char *__nptr)
 105:/usr/include/stdlib.h ****      __THROW __attribute_pure__ __nonnull ((1)) __wur;
 106:/usr/include/stdlib.h **** /* Convert a string to a long integer.  */
 107:/usr/include/stdlib.h **** extern long int atol (const char *__nptr)
 108:/usr/include/stdlib.h ****      __THROW __attribute_pure__ __nonnull ((1)) __wur;
 109:/usr/include/stdlib.h **** 
 110:/usr/include/stdlib.h **** #ifdef __USE_ISOC99
 111:/usr/include/stdlib.h **** /* Convert a string to a long long integer.  */
 112:/usr/include/stdlib.h **** __extension__ extern long long int atoll (const char *__nptr)
 113:/usr/include/stdlib.h ****      __THROW __attribute_pure__ __nonnull ((1)) __wur;
 114:/usr/include/stdlib.h **** #endif
 115:/usr/include/stdlib.h **** 
 116:/usr/include/stdlib.h **** /* Convert a string to a floating-point number.  */
 117:/usr/include/stdlib.h **** extern double strtod (const char *__restrict __nptr,
 118:/usr/include/stdlib.h **** 		      char **__restrict __endptr)
 119:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 120:/usr/include/stdlib.h **** 
 121:/usr/include/stdlib.h **** #ifdef	__USE_ISOC99
 122:/usr/include/stdlib.h **** /* Likewise for `float' and `long double' sizes of floating-point numbers.  */
 123:/usr/include/stdlib.h **** extern float strtof (const char *__restrict __nptr,
 124:/usr/include/stdlib.h **** 		     char **__restrict __endptr) __THROW __nonnull ((1));
 125:/usr/include/stdlib.h **** 
 126:/usr/include/stdlib.h **** extern long double strtold (const char *__restrict __nptr,
 127:/usr/include/stdlib.h **** 			    char **__restrict __endptr)
 128:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 129:/usr/include/stdlib.h **** #endif
 130:/usr/include/stdlib.h **** 
 131:/usr/include/stdlib.h **** /* Likewise for '_FloatN' and '_FloatNx'.  */
 132:/usr/include/stdlib.h **** 
 133:/usr/include/stdlib.h **** #if __HAVE_FLOAT16 && __GLIBC_USE (IEC_60559_TYPES_EXT)
 134:/usr/include/stdlib.h **** extern _Float16 strtof16 (const char *__restrict __nptr,
 135:/usr/include/stdlib.h **** 			  char **__restrict __endptr)
 136:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 137:/usr/include/stdlib.h **** #endif
 138:/usr/include/stdlib.h **** 
 139:/usr/include/stdlib.h **** #if __HAVE_FLOAT32 && __GLIBC_USE (IEC_60559_TYPES_EXT)
 140:/usr/include/stdlib.h **** extern _Float32 strtof32 (const char *__restrict __nptr,
 141:/usr/include/stdlib.h **** 			  char **__restrict __endptr)
 142:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 143:/usr/include/stdlib.h **** #endif
 144:/usr/include/stdlib.h **** 
 145:/usr/include/stdlib.h **** #if __HAVE_FLOAT64 && __GLIBC_USE (IEC_60559_TYPES_EXT)
 146:/usr/include/stdlib.h **** extern _Float64 strtof64 (const char *__restrict __nptr,
 147:/usr/include/stdlib.h **** 			  char **__restrict __endptr)
 148:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 149:/usr/include/stdlib.h **** #endif
 150:/usr/include/stdlib.h **** 
 151:/usr/include/stdlib.h **** #if __HAVE_FLOAT128 && __GLIBC_USE (IEC_60559_TYPES_EXT)
 152:/usr/include/stdlib.h **** extern _Float128 strtof128 (const char *__restrict __nptr,
 153:/usr/include/stdlib.h **** 			    char **__restrict __endptr)
 154:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 155:/usr/include/stdlib.h **** #endif
 156:/usr/include/stdlib.h **** 
 157:/usr/include/stdlib.h **** #if __HAVE_FLOAT32X && __GLIBC_USE (IEC_60559_TYPES_EXT)
 158:/usr/include/stdlib.h **** extern _Float32x strtof32x (const char *__restrict __nptr,
 159:/usr/include/stdlib.h **** 			    char **__restrict __endptr)
 160:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 161:/usr/include/stdlib.h **** #endif
 162:/usr/include/stdlib.h **** 
 163:/usr/include/stdlib.h **** #if __HAVE_FLOAT64X && __GLIBC_USE (IEC_60559_TYPES_EXT)
 164:/usr/include/stdlib.h **** extern _Float64x strtof64x (const char *__restrict __nptr,
 165:/usr/include/stdlib.h **** 			    char **__restrict __endptr)
 166:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 167:/usr/include/stdlib.h **** #endif
 168:/usr/include/stdlib.h **** 
 169:/usr/include/stdlib.h **** #if __HAVE_FLOAT128X && __GLIBC_USE (IEC_60559_TYPES_EXT)
 170:/usr/include/stdlib.h **** extern _Float128x strtof128x (const char *__restrict __nptr,
 171:/usr/include/stdlib.h **** 			      char **__restrict __endptr)
 172:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 173:/usr/include/stdlib.h **** #endif
 174:/usr/include/stdlib.h **** 
 175:/usr/include/stdlib.h **** /* Convert a string to a long integer.  */
 176:/usr/include/stdlib.h **** extern long int strtol (const char *__restrict __nptr,
 177:/usr/include/stdlib.h **** 			char **__restrict __endptr, int __base)
 178:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 179:/usr/include/stdlib.h **** /* Convert a string to an unsigned long integer.  */
 180:/usr/include/stdlib.h **** extern unsigned long int strtoul (const char *__restrict __nptr,
 181:/usr/include/stdlib.h **** 				  char **__restrict __endptr, int __base)
 182:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 183:/usr/include/stdlib.h **** 
 184:/usr/include/stdlib.h **** #ifdef __USE_MISC
 185:/usr/include/stdlib.h **** /* Convert a string to a quadword integer.  */
 186:/usr/include/stdlib.h **** __extension__
 187:/usr/include/stdlib.h **** extern long long int strtoq (const char *__restrict __nptr,
 188:/usr/include/stdlib.h **** 			     char **__restrict __endptr, int __base)
 189:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 190:/usr/include/stdlib.h **** /* Convert a string to an unsigned quadword integer.  */
 191:/usr/include/stdlib.h **** __extension__
 192:/usr/include/stdlib.h **** extern unsigned long long int strtouq (const char *__restrict __nptr,
 193:/usr/include/stdlib.h **** 				       char **__restrict __endptr, int __base)
 194:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 195:/usr/include/stdlib.h **** #endif /* Use misc.  */
 196:/usr/include/stdlib.h **** 
 197:/usr/include/stdlib.h **** #ifdef __USE_ISOC99
 198:/usr/include/stdlib.h **** /* Convert a string to a quadword integer.  */
 199:/usr/include/stdlib.h **** __extension__
 200:/usr/include/stdlib.h **** extern long long int strtoll (const char *__restrict __nptr,
 201:/usr/include/stdlib.h **** 			      char **__restrict __endptr, int __base)
 202:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 203:/usr/include/stdlib.h **** /* Convert a string to an unsigned quadword integer.  */
 204:/usr/include/stdlib.h **** __extension__
 205:/usr/include/stdlib.h **** extern unsigned long long int strtoull (const char *__restrict __nptr,
 206:/usr/include/stdlib.h **** 					char **__restrict __endptr, int __base)
 207:/usr/include/stdlib.h ****      __THROW __nonnull ((1));
 208:/usr/include/stdlib.h **** #endif /* ISO C99 or use MISC.  */
 209:/usr/include/stdlib.h **** 
 210:/usr/include/stdlib.h **** /* Convert a floating-point number to a string.  */
 211:/usr/include/stdlib.h **** #if __GLIBC_USE (IEC_60559_BFP_EXT)
 212:/usr/include/stdlib.h **** extern int strfromd (char *__dest, size_t __size, const char *__format,
 213:/usr/include/stdlib.h **** 		     double __f)
 214:/usr/include/stdlib.h ****      __THROW __nonnull ((3));
 215:/usr/include/stdlib.h **** 
 216:/usr/include/stdlib.h **** extern int strfromf (char *__dest, size_t __size, const char *__format,
 217:/usr/include/stdlib.h **** 		     float __f)
 218:/usr/include/stdlib.h ****      __THROW __nonnull ((3));
 219:/usr/include/stdlib.h **** 
 220:/usr/include/stdlib.h **** extern int strfroml (char *__dest, size_t __size, const char *__format,
 221:/usr/include/stdlib.h **** 		     long double __f)
 222:/usr/include/stdlib.h ****      __THROW __nonnull ((3));
 223:/usr/include/stdlib.h **** #endif
 224:/usr/include/stdlib.h **** 
 225:/usr/include/stdlib.h **** #if __HAVE_FLOAT16 && __GLIBC_USE (IEC_60559_TYPES_EXT)
 226:/usr/include/stdlib.h **** extern int strfromf16 (char *__dest, size_t __size, const char * __format,
 227:/usr/include/stdlib.h **** 		       _Float16 __f)
 228:/usr/include/stdlib.h ****      __THROW __nonnull ((3));
 229:/usr/include/stdlib.h **** #endif
 230:/usr/include/stdlib.h **** 
 231:/usr/include/stdlib.h **** #if __HAVE_FLOAT32 && __GLIBC_USE (IEC_60559_TYPES_EXT)
 232:/usr/include/stdlib.h **** extern int strfromf32 (char *__dest, size_t __size, const char * __format,
 233:/usr/include/stdlib.h **** 		       _Float32 __f)
 234:/usr/include/stdlib.h ****      __THROW __nonnull ((3));
 235:/usr/include/stdlib.h **** #endif
 236:/usr/include/stdlib.h **** 
 237:/usr/include/stdlib.h **** #if __HAVE_FLOAT64 && __GLIBC_USE (IEC_60559_TYPES_EXT)
 238:/usr/include/stdlib.h **** extern int strfromf64 (char *__dest, size_t __size, const char * __format,
 239:/usr/include/stdlib.h **** 		       _Float64 __f)
 240:/usr/include/stdlib.h ****      __THROW __nonnull ((3));
 241:/usr/include/stdlib.h **** #endif
 242:/usr/include/stdlib.h **** 
 243:/usr/include/stdlib.h **** #if __HAVE_FLOAT128 && __GLIBC_USE (IEC_60559_TYPES_EXT)
 244:/usr/include/stdlib.h **** extern int strfromf128 (char *__dest, size_t __size, const char * __format,
 245:/usr/include/stdlib.h **** 			_Float128 __f)
 246:/usr/include/stdlib.h ****      __THROW __nonnull ((3));
 247:/usr/include/stdlib.h **** #endif
 248:/usr/include/stdlib.h **** 
 249:/usr/include/stdlib.h **** #if __HAVE_FLOAT32X && __GLIBC_USE (IEC_60559_TYPES_EXT)
 250:/usr/include/stdlib.h **** extern int strfromf32x (char *__dest, size_t __size, const char * __format,
 251:/usr/include/stdlib.h **** 			_Float32x __f)
 252:/usr/include/stdlib.h ****      __THROW __nonnull ((3));
 253:/usr/include/stdlib.h **** #endif
 254:/usr/include/stdlib.h **** 
 255:/usr/include/stdlib.h **** #if __HAVE_FLOAT64X && __GLIBC_USE (IEC_60559_TYPES_EXT)
 256:/usr/include/stdlib.h **** extern int strfromf64x (char *__dest, size_t __size, const char * __format,
 257:/usr/include/stdlib.h **** 			_Float64x __f)
 258:/usr/include/stdlib.h ****      __THROW __nonnull ((3));
 259:/usr/include/stdlib.h **** #endif
 260:/usr/include/stdlib.h **** 
 261:/usr/include/stdlib.h **** #if __HAVE_FLOAT128X && __GLIBC_USE (IEC_60559_TYPES_EXT)
 262:/usr/include/stdlib.h **** extern int strfromf128x (char *__dest, size_t __size, const char * __format,
 263:/usr/include/stdlib.h **** 			 _Float128x __f)
 264:/usr/include/stdlib.h ****      __THROW __nonnull ((3));
 265:/usr/include/stdlib.h **** #endif
 266:/usr/include/stdlib.h **** 
 267:/usr/include/stdlib.h **** 
 268:/usr/include/stdlib.h **** #ifdef __USE_GNU
 269:/usr/include/stdlib.h **** /* Parallel versions of the functions above which take the locale to
 270:/usr/include/stdlib.h ****    use as an additional parameter.  These are GNU extensions inspired
 271:/usr/include/stdlib.h ****    by the POSIX.1-2008 extended locale API.  */
 272:/usr/include/stdlib.h **** # include <bits/types/locale_t.h>
 273:/usr/include/stdlib.h **** 
 274:/usr/include/stdlib.h **** extern long int strtol_l (const char *__restrict __nptr,
 275:/usr/include/stdlib.h **** 			  char **__restrict __endptr, int __base,
 276:/usr/include/stdlib.h **** 			  locale_t __loc) __THROW __nonnull ((1, 4));
 277:/usr/include/stdlib.h **** 
 278:/usr/include/stdlib.h **** extern unsigned long int strtoul_l (const char *__restrict __nptr,
 279:/usr/include/stdlib.h **** 				    char **__restrict __endptr,
 280:/usr/include/stdlib.h **** 				    int __base, locale_t __loc)
 281:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 4));
 282:/usr/include/stdlib.h **** 
 283:/usr/include/stdlib.h **** __extension__
 284:/usr/include/stdlib.h **** extern long long int strtoll_l (const char *__restrict __nptr,
 285:/usr/include/stdlib.h **** 				char **__restrict __endptr, int __base,
 286:/usr/include/stdlib.h **** 				locale_t __loc)
 287:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 4));
 288:/usr/include/stdlib.h **** 
 289:/usr/include/stdlib.h **** __extension__
 290:/usr/include/stdlib.h **** extern unsigned long long int strtoull_l (const char *__restrict __nptr,
 291:/usr/include/stdlib.h **** 					  char **__restrict __endptr,
 292:/usr/include/stdlib.h **** 					  int __base, locale_t __loc)
 293:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 4));
 294:/usr/include/stdlib.h **** 
 295:/usr/include/stdlib.h **** extern double strtod_l (const char *__restrict __nptr,
 296:/usr/include/stdlib.h **** 			char **__restrict __endptr, locale_t __loc)
 297:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 3));
 298:/usr/include/stdlib.h **** 
 299:/usr/include/stdlib.h **** extern float strtof_l (const char *__restrict __nptr,
 300:/usr/include/stdlib.h **** 		       char **__restrict __endptr, locale_t __loc)
 301:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 3));
 302:/usr/include/stdlib.h **** 
 303:/usr/include/stdlib.h **** extern long double strtold_l (const char *__restrict __nptr,
 304:/usr/include/stdlib.h **** 			      char **__restrict __endptr,
 305:/usr/include/stdlib.h **** 			      locale_t __loc)
 306:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 3));
 307:/usr/include/stdlib.h **** 
 308:/usr/include/stdlib.h **** # if __HAVE_FLOAT16
 309:/usr/include/stdlib.h **** extern _Float16 strtof16_l (const char *__restrict __nptr,
 310:/usr/include/stdlib.h **** 			    char **__restrict __endptr,
 311:/usr/include/stdlib.h **** 			    locale_t __loc)
 312:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 3));
 313:/usr/include/stdlib.h **** # endif
 314:/usr/include/stdlib.h **** 
 315:/usr/include/stdlib.h **** # if __HAVE_FLOAT32
 316:/usr/include/stdlib.h **** extern _Float32 strtof32_l (const char *__restrict __nptr,
 317:/usr/include/stdlib.h **** 			    char **__restrict __endptr,
 318:/usr/include/stdlib.h **** 			    locale_t __loc)
 319:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 3));
 320:/usr/include/stdlib.h **** # endif
 321:/usr/include/stdlib.h **** 
 322:/usr/include/stdlib.h **** # if __HAVE_FLOAT64
 323:/usr/include/stdlib.h **** extern _Float64 strtof64_l (const char *__restrict __nptr,
 324:/usr/include/stdlib.h **** 			    char **__restrict __endptr,
 325:/usr/include/stdlib.h **** 			    locale_t __loc)
 326:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 3));
 327:/usr/include/stdlib.h **** # endif
 328:/usr/include/stdlib.h **** 
 329:/usr/include/stdlib.h **** # if __HAVE_FLOAT128
 330:/usr/include/stdlib.h **** extern _Float128 strtof128_l (const char *__restrict __nptr,
 331:/usr/include/stdlib.h **** 			      char **__restrict __endptr,
 332:/usr/include/stdlib.h **** 			      locale_t __loc)
 333:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 3));
 334:/usr/include/stdlib.h **** # endif
 335:/usr/include/stdlib.h **** 
 336:/usr/include/stdlib.h **** # if __HAVE_FLOAT32X
 337:/usr/include/stdlib.h **** extern _Float32x strtof32x_l (const char *__restrict __nptr,
 338:/usr/include/stdlib.h **** 			      char **__restrict __endptr,
 339:/usr/include/stdlib.h **** 			      locale_t __loc)
 340:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 3));
 341:/usr/include/stdlib.h **** # endif
 342:/usr/include/stdlib.h **** 
 343:/usr/include/stdlib.h **** # if __HAVE_FLOAT64X
 344:/usr/include/stdlib.h **** extern _Float64x strtof64x_l (const char *__restrict __nptr,
 345:/usr/include/stdlib.h **** 			      char **__restrict __endptr,
 346:/usr/include/stdlib.h **** 			      locale_t __loc)
 347:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 3));
 348:/usr/include/stdlib.h **** # endif
 349:/usr/include/stdlib.h **** 
 350:/usr/include/stdlib.h **** # if __HAVE_FLOAT128X
 351:/usr/include/stdlib.h **** extern _Float128x strtof128x_l (const char *__restrict __nptr,
 352:/usr/include/stdlib.h **** 				char **__restrict __endptr,
 353:/usr/include/stdlib.h **** 				locale_t __loc)
 354:/usr/include/stdlib.h ****      __THROW __nonnull ((1, 3));
 355:/usr/include/stdlib.h **** # endif
 356:/usr/include/stdlib.h **** #endif /* GNU */
 357:/usr/include/stdlib.h **** 
 358:/usr/include/stdlib.h **** 
 359:/usr/include/stdlib.h **** #ifdef __USE_EXTERN_INLINES
 360:/usr/include/stdlib.h **** __extern_inline int
 361:/usr/include/stdlib.h **** __NTH (atoi (const char *__nptr))
 362:/usr/include/stdlib.h **** {
 363:/usr/include/stdlib.h ****   return (int) strtol (__nptr, (char **) NULL, 10);
 2695              	 .loc 6 363 0 discriminator 1
 2696 0b78 488B7D08 	 mov rdi,QWORD PTR 8[rbp]
 2697 0b7c 31F6     	 xor esi,esi
 2698 0b7e BA0A0000 	 mov edx,10
 2698      00
 2699              	.LBE1007:
 2700              	.LBE1006:
 212:NBodyCppBaseline.cpp ****     printf("%.9f\n", bodies.energy());
 2701              	 .loc 1 212 0 discriminator 1
 2702 0b83 4889E3   	 mov rbx,rsp
 2703              	.LVL185:
 2704              	.LBB1010:
 2705              	.LBB1008:
 2706              	 .loc 6 363 0 discriminator 1
 2707 0b86 E8000000 	 call strtol@PLT
 2707      00
 2708              	.LVL186:
 2709              	.LBE1008:
 2710              	.LBE1010:
 212:NBodyCppBaseline.cpp ****     printf("%.9f\n", bodies.energy());
 2711              	 .loc 1 212 0 discriminator 1
 2712 0b8b 4889DF   	 mov rdi,rbx
 2713              	.LBB1011:
 2714              	.LBB1009:
 2715              	 .loc 6 363 0 discriminator 1
 2716 0b8e 4989C5   	 mov r13,rax
 2717 0b91 89C5     	 mov ebp,eax
 2718              	.LVL187:
 2719              	.LBE1009:
 2720              	.LBE1011:
 212:NBodyCppBaseline.cpp ****     printf("%.9f\n", bodies.energy());
 2721              	 .loc 1 212 0 discriminator 1
 2722 0b93 E8000000 	 call _ZN11NBodySystemC1Ev
 2722      00
 2723              	.LVL188:
 213:NBodyCppBaseline.cpp ****     for (int i = 0; i < n; ++i)
 2724              	 .loc 1 213 0 discriminator 1
 2725 0b98 4889DF   	 mov rdi,rbx
 2726 0b9b E8000000 	 call _ZN11NBodySystem6energyEv
 2726      00
 2727              	.LVL189:
 2728              	.LBB1012:
 2729              	.LBB561:
 2730              	 .loc 2 104 0 discriminator 1
 2731 0ba0 BF010000 	 mov edi,1
 2731      00
 2732 0ba5 B8010000 	 mov eax,1
 2732      00
 2733 0baa 488D3500 	 lea rsi,.LC32[rip]
 2733      000000
 2734 0bb1 E8000000 	 call __printf_chk@PLT
 2734      00
 2735              	.LVL190:
 2736              	.LBE561:
 2737              	.LBE1012:
 2738              	.LBB1013:
 214:NBodyCppBaseline.cpp ****         bodies.advance(0.01);
 2739              	 .loc 1 214 0 discriminator 1
 2740 0bb6 4585ED   	 test r13d,r13d
 2741 0bb9 0F8FA5F4 	 jg .L68
 2741      FFFF
 2742 0bbf E920FFFF 	 jmp .L63
 2742      FF
 2743              	.LVL191:
 2744              	.L76:
 2745              	.LBE1013:
 2746              	 .loc 1 221 0
 2747 0bc4 E8000000 	 call __stack_chk_fail@PLT
 2747      00
 2748              	.LVL192:
 2749              	 .cfi_endproc
 2750              	.LFE6406:
 2752              	 .weak _ZZN11NBodySystem7advanceEdE3mag
 2753              	 .section .bss._ZZN11NBodySystem7advanceEdE3mag,"awG",@nobits,_ZZN11NBodySystem7advanceEdE3mag,comdat
 2754              	 .align 16
 2757              	_ZZN11NBodySystem7advanceEdE3mag:
 2758 0000 00000000 	 .zero 8000
 2758      00000000 
 2758      00000000 
 2758      00000000 
 2758      00000000 
 2759              	 .weak _ZZN11NBodySystem7advanceEdE1r
 2760              	 .section .bss._ZZN11NBodySystem7advanceEdE1r,"awG",@nobits,_ZZN11NBodySystem7advanceEdE1r,comdat
 2761              	 .align 16
 2764              	_ZZN11NBodySystem7advanceEdE1r:
 2765 0000 00000000 	 .zero 32000
 2765      00000000 
 2765      00000000 
 2765      00000000 
 2765      00000000 
 2766              	 .weak _ZGVZN4Body3sunEvE1p
 2767              	 .section .bss._ZGVZN4Body3sunEvE1p,"awG",@nobits,_ZGVZN4Body3sunEvE1p,comdat
 2768              	 .align 8
 2771              	_ZGVZN4Body3sunEvE1p:
 2772 0000 00000000 	 .zero 8
 2772      00000000 
 2773              	 .weak _ZZN4Body3sunEvE1p
 2774              	 .section .bss._ZZN4Body3sunEvE1p,"awG",@nobits,_ZZN4Body3sunEvE1p,comdat
 2775              	 .align 32
 2778              	_ZZN4Body3sunEvE1p:
 2779 0000 00000000 	 .zero 64
 2779      00000000 
 2779      00000000 
 2779      00000000 
 2779      00000000 
 2780              	 .weak _ZGVZN4Body7neptuneEvE1p
 2781              	 .section .bss._ZGVZN4Body7neptuneEvE1p,"awG",@nobits,_ZGVZN4Body7neptuneEvE1p,comdat
 2782              	 .align 8
 2785              	_ZGVZN4Body7neptuneEvE1p:
 2786 0000 00000000 	 .zero 8
 2786      00000000 
 2787              	 .weak _ZZN4Body7neptuneEvE1p
 2788              	 .section .bss._ZZN4Body7neptuneEvE1p,"awG",@nobits,_ZZN4Body7neptuneEvE1p,comdat
 2789              	 .align 32
 2792              	_ZZN4Body7neptuneEvE1p:
 2793 0000 00000000 	 .zero 64
 2793      00000000 
 2793      00000000 
 2793      00000000 
 2793      00000000 
 2794              	 .weak _ZGVZN4Body6uranusEvE1p
 2795              	 .section .bss._ZGVZN4Body6uranusEvE1p,"awG",@nobits,_ZGVZN4Body6uranusEvE1p,comdat
 2796              	 .align 8
 2799              	_ZGVZN4Body6uranusEvE1p:
 2800 0000 00000000 	 .zero 8
 2800      00000000 
 2801              	 .weak _ZZN4Body6uranusEvE1p
 2802              	 .section .bss._ZZN4Body6uranusEvE1p,"awG",@nobits,_ZZN4Body6uranusEvE1p,comdat
 2803              	 .align 32
 2806              	_ZZN4Body6uranusEvE1p:
 2807 0000 00000000 	 .zero 64
 2807      00000000 
 2807      00000000 
 2807      00000000 
 2807      00000000 
 2808              	 .weak _ZGVZN4Body6saturnEvE1p
 2809              	 .section .bss._ZGVZN4Body6saturnEvE1p,"awG",@nobits,_ZGVZN4Body6saturnEvE1p,comdat
 2810              	 .align 8
 2813              	_ZGVZN4Body6saturnEvE1p:
 2814 0000 00000000 	 .zero 8
 2814      00000000 
 2815              	 .weak _ZZN4Body6saturnEvE1p
 2816              	 .section .bss._ZZN4Body6saturnEvE1p,"awG",@nobits,_ZZN4Body6saturnEvE1p,comdat
 2817              	 .align 32
 2820              	_ZZN4Body6saturnEvE1p:
 2821 0000 00000000 	 .zero 64
 2821      00000000 
 2821      00000000 
 2821      00000000 
 2821      00000000 
 2822              	 .weak _ZGVZN4Body7jupiterEvE1p
 2823              	 .section .bss._ZGVZN4Body7jupiterEvE1p,"awG",@nobits,_ZGVZN4Body7jupiterEvE1p,comdat
 2824              	 .align 8
 2827              	_ZGVZN4Body7jupiterEvE1p:
 2828 0000 00000000 	 .zero 8
 2828      00000000 
 2829              	 .weak _ZZN4Body7jupiterEvE1p
 2830              	 .section .bss._ZZN4Body7jupiterEvE1p,"awG",@nobits,_ZZN4Body7jupiterEvE1p,comdat
 2831              	 .align 32
 2834              	_ZZN4Body7jupiterEvE1p:
 2835 0000 00000000 	 .zero 64
 2835      00000000 
 2835      00000000 
 2835      00000000 
 2835      00000000 
 2836              	 .section .rodata.cst8,"aM",@progbits,8
 2837              	 .align 8
 2838              	.LC0:
 2839 0000 DE45BEC9 	 .long 3384690142
 2840 0004 3CBD4340 	 .long 1078181180
 2841              	 .section .rodata.cst16,"aM",@progbits,16
 2842              	 .align 16
 2843              	.LC1:
 2844 0000 2CD93C34 	 .long 876402988
 2845 0004 A05D1340 	 .long 1075010976
 2846 0008 7CDB1FC0 	 .long 3223313276
 2847 000c AB90F2BF 	 .long -1074622293
 2848              	 .section .rodata.cst8
 2849              	 .align 8
 2850              	.LC2:
 2851 0008 F0EB256C 	 .long 1814424560
 2852 000c F986BABF 	 .long -1078294791
 2853              	 .section .rodata.cst16
 2854              	 .align 16
 2855              	.LC3:
 2856 0010 BCCC939B 	 .long 2610154684
 2857 0014 0667E33F 	 .long 1071867654
 2858 0018 9B947DF5 	 .long 4118647963
 2859 001c F27E0640 	 .long 1074167538
 2860              	 .align 16
 2861              	.LC4:
 2862 0020 15075A9A 	 .long 2589591317
 2863 0024 D7D299BF 	 .long -1080438057
 2864 0028 D833ABD9 	 .long 3651875800
 2865 002c 954CA33F 	 .long 1067666581
 2866              	 .align 16
 2867              	.LC5:
 2868 0030 67CA32C3 	 .long 3274885735
 2869 0034 CDAF2040 	 .long 1075883981
 2870 0038 B001DE31 	 .long 836633008
 2871 003c CB7F1040 	 .long 1074823115
 2872              	 .section .rodata.cst8
 2873              	 .align 8
 2874              	.LC6:
 2875 0010 7C46EBE1 	 .long 3790292604
 2876 0014 53D3D9BF 	 .long -1076243629
 2877              	 .section .rodata.cst16
 2878              	 .align 16
 2879              	.LC7:
 2880 0040 429487B8 	 .long 3095893058
 2881 0044 212CF0BF 	 .long -1074779103
 2882 0048 138F1FBF 	 .long 3206516499
 2883 004c E935FD3F 	 .long 1073559017
 2884              	 .align 16
 2885              	.LC8:
 2886 0050 B423115F 	 .long 1594958772
 2887 0054 483C813F 	 .long 1065434184
 2888 0058 37C6070D 	 .long 218613303
 2889 005c 491D873F 	 .long 1065819465
 2890              	 .align 16
 2891              	.LC9:
 2892 0060 CFD9A7CE 	 .long 3467106767
 2893 0064 EAC92940 	 .long 1076480490
 2894 0068 7E6626D6 	 .long 3592840830
 2895 006c E8382EC0 	 .long -1070712600
 2896              	 .section .rodata.cst8
 2897              	 .align 8
 2898              	.LC10:
 2899 0018 A07D25BE 	 .long 3190128032
 2900 001c 5795CCBF 	 .long -1077111465
 2901              	 .section .rodata.cst16
 2902              	 .align 16
 2903              	.LC11:
 2904 0070 EF1B91A9 	 .long 2844859375
 2905 0074 1C53F13F 	 .long 1072780060
 2906 0078 C5BB543E 	 .long 1045740485
 2907 007c 7FCCEB3F 	 .long 1072417919
 2908              	 .align 16
 2909              	.LC12:
 2910 0080 7C3EF2FA 	 .long 4210179708
 2911 0084 6B2F86BF 	 .long -1081725077
 2912 0088 B31EF49C 	 .long 2633244339
 2913 008c D23D5C3F 	 .long 1063009746
 2914              	 .align 16
 2915              	.LC13:
 2916 0090 2A5705A9 	 .long 2835699498
 2917 0094 67C22E40 	 .long 1076806247
 2918 0098 20A2C833 	 .long 868786720
 2919 009c 58EB39C0 	 .long -1069946024
 2920              	 .section .rodata.cst8
 2921              	 .align 8
 2922              	.LC14:
 2923 0020 40E5AB93 	 .long 2477516096
 2924 0024 F3F1C63F 	 .long 1070002675
 2925              	 .section .rodata.cst16
 2926              	 .align 16
 2927              	.LC15:
 2928 00a0 4ABC5916 	 .long 374979658
 2929 00a4 B654EF3F 	 .long 1072649398
 2930 00a8 A3FBC431 	 .long 834993059
 2931 00ac C607E33F 	 .long 1071843270
 2932              	 .align 16
 2933              	.LC16:
 2934 00b0 F6657658 	 .long 1484154358
 2935 00b4 88CBA1BF 	 .long -1079915640
 2936 00b8 AC991753 	 .long 1394055596
 2937 00bc F3A8603F 	 .long 1063299315
 2938              	 .align 16
 2939              	.LC18:
 2940 00c0 00000000 	 .long 0
 2941 00c4 00000080 	 .long -2147483648
 2942 00c8 00000000 	 .long 0
 2943 00cc 00000000 	 .long 0
 2944              	 .align 16
 2945              	.LC19:
 2946 00d0 2CD93C34 	 .quad 4617136985637443884
 2946      A05D1340 
 2947 00d8 7CDB1FC0 	 .quad -4615467600764216452
 2947      AB90F2BF 
 2948              	 .align 16
 2949              	.LC20:
 2950 00e0 BCCC939B 	 .quad 4603636522180398268
 2950      0667E33F 
 2951 00e8 9B947DF5 	 .quad 4613514450253485211
 2951      F27E0640 
 2952              	 .align 16
 2953              	.LC21:
 2954 00f0 15075A9A 	 .quad -4640446117579192555
 2954      D7D299BF 
 2955 00f8 D833ABD9 	 .quad 4585593052079010776
 2955      954CA33F 
 2956              	 .align 16
 2957              	.LC22:
 2958 0100 67CA32C3 	 .quad 4620886515960171111
 2958      CDAF2040 
 2959 0108 B001DE31 	 .quad 4616330128746480048
 2959      CB7F1040 
 2960              	 .align 16
 2961              	.LC23:
 2962 0110 429487B8 	 .quad -4616141094713322430
 2962      212CF0BF 
 2963 0118 138F1FBF 	 .quad 4610900871547424531
 2963      E935FD3F 
 2964              	 .align 16
 2965              	.LC24:
 2966 0120 B423115F 	 .quad 4576004977915405236
 2966      483C813F 
 2967 0128 37C6070D 	 .quad 4577659745833829943
 2967      491D873F 
 2968              	 .align 16
 2969              	.LC25:
 2970 0130 CFD9A7CE 	 .quad 4623448502799161807
 2970      EAC92940 
 2971 0138 7E6626D6 	 .quad -4598675596822288770
 2971      E8382EC0 
 2972              	 .align 16
 2973              	.LC26:
 2974 0140 EF1B91A9 	 .quad 4607555276345777135
 2974      1C53F13F 
 2975 0148 C5BB543E 	 .quad 4605999890795117509
 2975      7FCCEB3F 
 2976              	 .align 16
 2977              	.LC27:
 2978 0150 7C3EF2FA 	 .quad -4645973824767902084
 2978      6B2F86BF 
 2979 0158 B31EF49C 	 .quad 4565592097032511155
 2979      D23D5C3F 
 2980              	 .align 16
 2981              	.LC28:
 2982 0160 2A5705A9 	 .quad 4624847617829197610
 2982      67C22E40 
 2983 0168 20A2C833 	 .quad -4595383180696444384
 2983      58EB39C0 
 2984              	 .align 16
 2985              	.LC29:
 2986 0170 4ABC5916 	 .quad 4606994084859067466
 2986      B654EF3F 
 2987 0178 A3FBC431 	 .quad 4603531791922690979
 2987      C607E33F 
 2988              	 .align 16
 2989              	.LC30:
 2990 0180 F6657658 	 .quad -4638202354754755082
 2990      88CBA1BF 
 2991 0188 AC991753 	 .quad 4566835785178257836
 2991      F3A8603F 
 2992              	 .section .rodata.cst8
 2993              	 .align 8
 2994              	.LC31:
 2995 0028 00000000 	 .long 0
 2996 002c 0000E03F 	 .long 1071644672
 2997              	 .section .rodata.cst16
 2998              	 .align 16
 2999              	.LC33:
 3000 0190 00000000 	 .long 0
 3001 0194 0000E03F 	 .long 1071644672
 3002 0198 00000000 	 .long 0
 3003 019c 0000E03F 	 .long 1071644672
 3004              	 .align 16
 3005              	.LC34:
 3006 01a0 00000000 	 .long 0
 3007 01a4 0000F83F 	 .long 1073217536
 3008 01a8 00000000 	 .long 0
 3009 01ac 0000F83F 	 .long 1073217536
 3010              	 .align 16
 3011              	.LC35:
 3012 01b0 7B14AE47 	 .long 1202590843
 3013 01b4 E17A843F 	 .long 1065646817
 3014 01b8 7B14AE47 	 .long 1202590843
 3015 01bc E17A843F 	 .long 1065646817
 3016              	 .section .rodata.cst8
 3017              	 .align 8
 3018              	.LC36:
 3019 0030 00000000 	 .long 0
 3020 0034 65CDCD41 	 .long 1104006501
 3021              	 .align 8
 3022              	.LC38:
 3023 0038 7B14AE47 	 .long 1202590843
 3024 003c E17A843F 	 .long 1065646817
 3025              	 .text
 3026              	.Letext0:
 3027              	 .file 7 "/usr/include/c++/7/cstdio"
 3028              	 .file 8 "/usr/include/c++/7/cmath"
 3029              	 .file 9 "/usr/include/c++/7/cstdlib"
 3030              	 .file 10 "/usr/include/c++/7/type_traits"
 3031              	 .file 11 "/usr/include/x86_64-linux-gnu/c++/7/bits/c++config.h"
 3032              	 .file 12 "/usr/include/c++/7/cstdint"
 3033              	 .file 13 "/usr/include/c++/7/ctime"
 3034              	 .file 14 "<built-in>"
 3035              	 .file 15 "/usr/include/c++/7/ratio"
 3036              	 .file 16 "/usr/include/c++/7/bits/basic_string.h"
 3037              	 .file 17 "/usr/include/c++/7/bits/stl_pair.h"
 3038              	 .file 18 "/usr/include/c++/7/new"
 3039              	 .file 19 "/usr/include/c++/7/bits/exception_ptr.h"
 3040              	 .file 20 "/usr/include/c++/7/debug/debug.h"
 3041              	 .file 21 "/usr/include/c++/7/cwchar"
 3042              	 .file 22 "/usr/include/c++/7/clocale"
 3043              	 .file 23 "/usr/include/c++/7/array"
 3044              	 .file 24 "/usr/include/c++/7/bits/predefined_ops.h"
 3045              	 .file 25 "/usr/include/c++/7/ext/new_allocator.h"
 3046              	 .file 26 "/usr/include/c++/7/ext/numeric_traits.h"
 3047              	 .file 27 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
 3048              	 .file 28 "/usr/include/x86_64-linux-gnu/bits/types.h"
 3049              	 .file 29 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h"
 3050              	 .file 30 "/usr/include/x86_64-linux-gnu/bits/libio.h"
 3051              	 .file 31 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
 3052              	 .file 32 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h"
 3053              	 .file 33 "/usr/include/x86_64-linux-gnu/bits/_G_config.h"
 3054              	 .file 34 "/usr/include/stdio.h"
 3055              	 .file 35 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
 3056              	 .file 36 "/usr/include/x86_64-linux-gnu/bits/stdio.h"
 3057              	 .file 37 "/usr/include/math.h"
 3058              	 .file 38 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h"
 3059              	 .file 39 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
 3060              	 .file 40 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
 3061              	 .file 41 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
 3062              	 .file 42 "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h"
 3063              	 .file 43 "/usr/include/x86_64-linux-gnu/bits/stdlib.h"
 3064              	 .file 44 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
 3065              	 .file 45 "/usr/include/stdint.h"
 3066              	 .file 46 "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h"
 3067              	 .file 47 "/usr/include/time.h"
 3068              	 .file 48 "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h"
 3069              	 .file 49 "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h"
 3070              	 .file 50 "/usr/include/wchar.h"
 3071              	 .file 51 "/usr/include/x86_64-linux-gnu/bits/wchar2.h"
 3072              	 .file 52 "/usr/include/locale.h"
 3073              	 .file 53 "/usr/include/errno.h"
 3074              	 .file 54 "/usr/include/c++/7/stdlib.h"
 3075              	 .file 55 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
