; Assembly listing for method NBodyHWIntrinsics.NBody:Main(ref)
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T04] (  5,  4   )     ref  ->  rsi         class-hnd
;  V01 loc0         [V01,T78] (  2,  2   )    long  ->  rdi        
;  V02 loc1         [V02,T03] (  6,  6   )    long  ->  rbx        
;  V03 loc2         [V03,T00] ( 21, 21   )     ref  ->  r14         class-hnd
;* V04 loc3         [V04    ] (  0,  0   )     int  ->  zero-ref   
;  V05 loc4         [V05,T79] (  2,  2   )    long  ->  rax        
;  V06 loc5         [V06,T01] ( 10, 10   )    long  ->  r15         ld-addr-op
;  V07 loc6         [V07,T119] (  4,  4   )  double  ->  mm6         ld-addr-op
;  V08 OutArgs      [V08    ] (  1,  1   )  lclBlk (32) [rsp+0x00]  
;  V09 tmp1         [V09,T10] (  3,  6   )     ref  ->  r15         class-hnd
;  V10 tmp2         [V10,T59] (  3,  2   )     int  ->  r15        
;  V11 tmp3         [V11,T11] (  3,  6   )     ref  ->  rsi         class-hnd
;  V12 tmp4         [V12,T65] (  2,  2   )     ref  ->  r14         class-hnd exact
;  V13 tmp5         [V13,T02] (  5, 10   )     ref  ->  rax         class-hnd exact
;  V14 tmp6         [V14,T46] (  5,  3.50)     ref  ->  r14         class-hnd exact
;  V15 tmp7         [V15,T05] (  4,  6   )     ref  ->  rcx         class-hnd
;  V16 tmp8         [V16,T36] (  2,  4   )    long  ->  r15        
;* V17 tmp9         [V17    ] (  0,  0   )  struct (16) zero-ref   
;* V18 tmp10        [V18    ] (  0,  0   )  struct (16) zero-ref   
;* V19 tmp11        [V19    ] (  0,  0   )  struct (16) zero-ref   
;* V20 tmp12        [V20    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V21 tmp13        [V21,T48] (  3,  3   )     int  ->  r12        
;  V22 tmp14        [V22,T66] (  2,  2   )   byref  ->  r13        
;* V23 tmp15        [V23    ] (  0,  0   )  struct ( 8) zero-ref   
;* V24 tmp16        [V24    ] (  0,  0   )    bool  ->  zero-ref   
;* V25 tmp17        [V25    ] (  0,  0   )  double  ->  zero-ref   
;  V26 tmp18        [V26,T06] (  4,  6   )     ref  ->  rcx         class-hnd
;  V27 tmp19        [V27,T37] (  2,  4   )    long  ->  r15        
;* V28 tmp20        [V28    ] (  0,  0   )  struct (16) zero-ref   
;* V29 tmp21        [V29    ] (  0,  0   )  struct (16) zero-ref   
;* V30 tmp22        [V30    ] (  0,  0   )  struct (16) zero-ref   
;* V31 tmp23        [V31    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V32 tmp24        [V32,T49] (  3,  3   )     int  ->  r12        
;  V33 tmp25        [V33,T67] (  2,  2   )   byref  ->  r13        
;* V34 tmp26        [V34    ] (  0,  0   )  struct ( 8) zero-ref   
;* V35 tmp27        [V35    ] (  0,  0   )    bool  ->  zero-ref   
;  V36 tmp28        [V36,T17] (  4,  4   )     ref  ->  rcx         class-hnd
;* V37 tmp29        [V37    ] (  0,  0   )  struct (16) zero-ref   
;* V38 tmp30        [V38    ] (  0,  0   )  struct (16) zero-ref   
;* V39 tmp31        [V39    ] (  0,  0   )  struct (16) zero-ref   
;* V40 tmp32        [V40    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V41 tmp33        [V41,T50] (  3,  3   )     int  ->  r15        
;  V42 tmp34        [V42,T68] (  2,  2   )   byref  ->  rsi        
;* V43 tmp35        [V43    ] (  0,  0   )  struct ( 8) zero-ref   
;* V44 tmp36        [V44    ] (  0,  0   )    bool  ->  zero-ref   
;  V45 tmp37        [V45,T07] (  4,  6   )     ref  ->  rcx         class-hnd
;  V46 tmp38        [V46,T38] (  2,  4   )    long  ->  r15        
;* V47 tmp39        [V47    ] (  0,  0   )  struct (16) zero-ref   
;* V48 tmp40        [V48    ] (  0,  0   )  struct (16) zero-ref   
;* V49 tmp41        [V49    ] (  0,  0   )  struct (16) zero-ref   
;* V50 tmp42        [V50    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V51 tmp43        [V51,T51] (  3,  3   )     int  ->  rsi        
;  V52 tmp44        [V52,T69] (  2,  2   )   byref  ->  r12        
;* V53 tmp45        [V53    ] (  0,  0   )  struct ( 8) zero-ref   
;* V54 tmp46        [V54    ] (  0,  0   )    bool  ->  zero-ref   
;* V55 tmp47        [V55    ] (  0,  0   )  double  ->  zero-ref   
;  V56 tmp48        [V56,T08] (  4,  6   )     ref  ->  rcx         class-hnd
;  V57 tmp49        [V57,T39] (  2,  4   )    long  ->  r15        
;* V58 tmp50        [V58    ] (  0,  0   )  struct (16) zero-ref   
;* V59 tmp51        [V59    ] (  0,  0   )  struct (16) zero-ref   
;* V60 tmp52        [V60    ] (  0,  0   )  struct (16) zero-ref   
;* V61 tmp53        [V61    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V62 tmp54        [V62,T52] (  3,  3   )     int  ->  rsi        
;  V63 tmp55        [V63,T70] (  2,  2   )   byref  ->  rbx        
;* V64 tmp56        [V64    ] (  0,  0   )  struct ( 8) zero-ref   
;* V65 tmp57        [V65    ] (  0,  0   )    bool  ->  zero-ref   
;  V66 tmp58        [V66,T09] (  4,  6   )     ref  ->  rcx         class-hnd
;  V67 tmp59        [V67,T40] (  2,  4   )    long  ->  rsi        
;* V68 tmp60        [V68    ] (  0,  0   )  struct (16) zero-ref   
;* V69 tmp61        [V69    ] (  0,  0   )  struct (16) zero-ref   
;* V70 tmp62        [V70    ] (  0,  0   )  struct (16) zero-ref   
;* V71 tmp63        [V71    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V72 tmp64        [V72,T53] (  3,  3   )     int  ->  rdi        
;  V73 tmp65        [V73,T71] (  2,  2   )   byref  ->  rbx        
;* V74 tmp66        [V74    ] (  0,  0   )  struct ( 8) zero-ref   
;* V75 tmp67        [V75    ] (  0,  0   )    bool  ->  zero-ref   
;  V76 tmp68        [V76,T72] (  2,  2   )   byref  ->  r12         V17._pointer(offs=0x00) P-INDEP
;  V77 tmp69        [V77,T80] (  2,  2   )     int  ->  r13         V17._length(offs=0x08) P-INDEP
;  V78 tmp70        [V78,T54] (  3,  2   )   byref  ->  r12         V18._pointer(offs=0x00) P-INDEP
;  V79 tmp71        [V79,T60] (  3,  2   )     int  ->  r13         V18._length(offs=0x08) P-INDEP
;  V80 tmp72        [V80,T85] (  2,  1   )   byref  ->  r13         V19._pointer(offs=0x00) P-INDEP
;  V81 tmp73        [V81,T104] (  2,  1   )     int  ->  rcx         V19._length(offs=0x08) P-INDEP
;  V82 tmp74        [V82,T86] (  2,  1   )   byref  ->  r12         V20._pointer(offs=0x00) P-INDEP
;  V83 tmp75        [V83,T105] (  2,  1   )     int  ->  r13         V20._length(offs=0x08) P-INDEP
;  V84 tmp76        [V84,T87] (  2,  1   )   byref  ->  rcx         V23._value(offs=0x00) P-INDEP
;  V85 tmp77        [V85,T73] (  2,  2   )   byref  ->  r12         V28._pointer(offs=0x00) P-INDEP
;  V86 tmp78        [V86,T81] (  2,  2   )     int  ->  r13         V28._length(offs=0x08) P-INDEP
;  V87 tmp79        [V87,T55] (  3,  2   )   byref  ->  r12         V29._pointer(offs=0x00) P-INDEP
;  V88 tmp80        [V88,T61] (  3,  2   )     int  ->  r13         V29._length(offs=0x08) P-INDEP
;  V89 tmp81        [V89,T88] (  2,  1   )   byref  ->  r13         V30._pointer(offs=0x00) P-INDEP
;  V90 tmp82        [V90,T106] (  2,  1   )     int  ->  rcx         V30._length(offs=0x08) P-INDEP
;  V91 tmp83        [V91,T89] (  2,  1   )   byref  ->  r12         V31._pointer(offs=0x00) P-INDEP
;  V92 tmp84        [V92,T107] (  2,  1   )     int  ->  r13         V31._length(offs=0x08) P-INDEP
;  V93 tmp85        [V93,T90] (  2,  1   )   byref  ->  rcx         V34._value(offs=0x00) P-INDEP
;  V94 tmp86        [V94,T91] (  2,  1   )   byref  ->  rsi         V37._pointer(offs=0x00) P-INDEP
;  V95 tmp87        [V95,T108] (  2,  1   )     int  ->  rax         V37._length(offs=0x08) P-INDEP
;  V96 tmp88        [V96,T92] (  2,  1   )   byref  ->  rsi         V38._pointer(offs=0x00) P-INDEP
;  V97 tmp89        [V97,T109] (  2,  1   )     int  ->  r15         V38._length(offs=0x08) P-INDEP
;  V98 tmp90        [V98,T93] (  2,  1   )   byref  ->  rsi         V39._pointer(offs=0x00) P-INDEP
;  V99 tmp91        [V99,T110] (  2,  1   )     int  ->  rax         V39._length(offs=0x08) P-INDEP
;* V100 tmp92       [V100    ] (  0,  0   )   byref  ->  zero-ref    V40._pointer(offs=0x00) P-INDEP
;* V101 tmp93       [V101    ] (  0,  0   )     int  ->  zero-ref    V40._length(offs=0x08) P-INDEP
;  V102 tmp94       [V102,T94] (  2,  1   )   byref  ->  rax         V43._value(offs=0x00) P-INDEP
;  V103 tmp95       [V103,T74] (  2,  2   )   byref  ->  rsi         V47._pointer(offs=0x00) P-INDEP
;  V104 tmp96       [V104,T82] (  2,  2   )     int  ->  r12         V47._length(offs=0x08) P-INDEP
;  V105 tmp97       [V105,T56] (  3,  2   )   byref  ->  rsi         V48._pointer(offs=0x00) P-INDEP
;  V106 tmp98       [V106,T62] (  3,  2   )     int  ->  r12         V48._length(offs=0x08) P-INDEP
;  V107 tmp99       [V107,T95] (  2,  1   )   byref  ->  r12         V49._pointer(offs=0x00) P-INDEP
;  V108 tmp100      [V108,T111] (  2,  1   )     int  ->  rcx         V49._length(offs=0x08) P-INDEP
;  V109 tmp101      [V109,T96] (  2,  1   )   byref  ->  rsi         V50._pointer(offs=0x00) P-INDEP
;  V110 tmp102      [V110,T112] (  2,  1   )     int  ->  r12         V50._length(offs=0x08) P-INDEP
;  V111 tmp103      [V111,T97] (  2,  1   )   byref  ->  rcx         V53._value(offs=0x00) P-INDEP
;  V112 tmp104      [V112,T75] (  2,  2   )   byref  ->  rsi         V58._pointer(offs=0x00) P-INDEP
;  V113 tmp105      [V113,T83] (  2,  2   )     int  ->  rbx         V58._length(offs=0x08) P-INDEP
;  V114 tmp106      [V114,T57] (  3,  2   )   byref  ->  rsi         V59._pointer(offs=0x00) P-INDEP
;  V115 tmp107      [V115,T63] (  3,  2   )     int  ->  rbx         V59._length(offs=0x08) P-INDEP
;  V116 tmp108      [V116,T98] (  2,  1   )   byref  ->  rbx         V60._pointer(offs=0x00) P-INDEP
;  V117 tmp109      [V117,T113] (  2,  1   )     int  ->  rcx         V60._length(offs=0x08) P-INDEP
;  V118 tmp110      [V118,T99] (  2,  1   )   byref  ->  rsi         V61._pointer(offs=0x00) P-INDEP
;  V119 tmp111      [V119,T114] (  2,  1   )     int  ->  rbx         V61._length(offs=0x08) P-INDEP
;  V120 tmp112      [V120,T100] (  2,  1   )   byref  ->  rcx         V64._value(offs=0x00) P-INDEP
;  V121 tmp113      [V121,T76] (  2,  2   )   byref  ->  rdi         V68._pointer(offs=0x00) P-INDEP
;  V122 tmp114      [V122,T84] (  2,  2   )     int  ->  rbx         V68._length(offs=0x08) P-INDEP
;  V123 tmp115      [V123,T58] (  3,  2   )   byref  ->  rdi         V69._pointer(offs=0x00) P-INDEP
;  V124 tmp116      [V124,T64] (  3,  2   )     int  ->  rbx         V69._length(offs=0x08) P-INDEP
;  V125 tmp117      [V125,T101] (  2,  1   )   byref  ->  rbx         V70._pointer(offs=0x00) P-INDEP
;  V126 tmp118      [V126,T115] (  2,  1   )     int  ->  rcx         V70._length(offs=0x08) P-INDEP
;  V127 tmp119      [V127,T102] (  2,  1   )   byref  ->  rdi         V71._pointer(offs=0x00) P-INDEP
;  V128 tmp120      [V128,T116] (  2,  1   )     int  ->  rbx         V71._length(offs=0x08) P-INDEP
;  V129 tmp121      [V129,T103] (  2,  1   )   byref  ->  rcx         V74._value(offs=0x00) P-INDEP
;  V130 tmp122      [V130,T18] (  2,  4   )     ref  ->  rdx        
;  V131 tmp123      [V131,T19] (  2,  4   )     ref  ->  rdi        
;  V132 tmp124      [V132    ] ( 12, 22   )  struct (16) [rbp+0x18]   do-not-enreg[XSB] must-init addr-exposed
;  V133 tmp125      [V133,T12] (  3,  6   )   byref  ->  rcx         stack-byref
;  V134 tmp126      [V134,T41] (  2,  4   )    long  ->  r15        
;  V135 tmp127      [V135,T20] (  2,  4   )     ref  ->  rdx        
;  V136 tmp128      [V136,T21] (  2,  4   )     ref  ->  [rbp+0x10]  
;  V137 tmp129      [V137,T22] (  2,  4   )     ref  ->   r8        
;  V138 tmp130      [V138,T23] (  2,  4   )     ref  ->  r12        
;  V139 tmp131      [V139,T24] (  2,  4   )     ref  ->  rdx        
;  V140 tmp132      [V140,T13] (  3,  6   )   byref  ->  rdx         stack-byref
;  V141 tmp133      [V141,T42] (  2,  4   )    long  ->  rcx        
;  V142 tmp134      [V142,T25] (  2,  4   )     ref  ->  rdx        
;  V143 tmp135      [V143,T26] (  2,  4   )     ref  ->  [rbp+0x08]  
;  V144 tmp136      [V144,T47] (  3,  3   )   byref  ->  rdx         stack-byref
;  V145 tmp137      [V145,T77] (  2,  2   )     ref  ->   r8        
;  V146 tmp138      [V146,T14] (  3,  6   )   byref  ->  rdx         stack-byref
;  V147 tmp139      [V147,T43] (  2,  4   )    long  ->  rcx        
;  V148 tmp140      [V148,T27] (  2,  4   )     ref  ->  rdx        
;  V149 tmp141      [V149,T28] (  2,  4   )     ref  ->  r13        
;  V150 tmp142      [V150,T29] (  2,  4   )     ref  ->   r8        
;  V151 tmp143      [V151,T30] (  2,  4   )     ref  ->  rbx        
;  V152 tmp144      [V152,T31] (  2,  4   )     ref  ->  rdx        
;  V153 tmp145      [V153,T15] (  3,  6   )   byref  ->  rdx         stack-byref
;  V154 tmp146      [V154,T44] (  2,  4   )    long  ->  rcx        
;  V155 tmp147      [V155,T32] (  2,  4   )     ref  ->  rdx        
;  V156 tmp148      [V156,T33] (  2,  4   )     ref  ->  r14        
;  V157 tmp149      [V157,T16] (  3,  6   )   byref  ->  rdx         stack-byref
;  V158 tmp150      [V158,T45] (  2,  4   )    long  ->  rcx        
;  V159 tmp151      [V159,T34] (  2,  4   )     ref  ->  rdx        
;  V160 tmp152      [V160,T35] (  2,  4   )     ref  ->  r14        
;* V161 GsCookie    [V161    ] (  0,  0   )    long  ->  zero-ref    do-not-enreg[X] must-init addr-exposed
;  V162 LocAllocSP  [V162    ] (  1,  1   )    long  ->  [rbp+0x28]   do-not-enreg[X] must-init addr-exposed
;* V163 cse0        [V163,T117] (  0,  0   )    long  ->  zero-ref   
;* V164 cse1        [V164,T118] (  0,  0   )    long  ->  zero-ref   
;
; Lcl frame size = 104

G_M55983_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       4155                 push     r13
       4154                 push     r12
       57                   push     rdi
       56                   push     rsi
       53                   push     rbx
       4883EC68             sub      rsp, 104
       C5F877               vzeroupper 
       C4E17829742450       vmovaps  qword ptr [rsp+50H], xmm6
       488D6C2420           lea      rbp, [rsp+20H]
       488BF1               mov      rsi, rcx
       488D7D00             lea      rdi, [rbp]
       B90C000000           mov      ecx, 12
       33C0                 xor      rax, rax
       F3AB                 rep stosd 
       488BCE               mov      rcx, rsi
       48896528             mov      qword ptr [rbp+28H], rsp
       48B878563412F0DEBC9A mov      rax, 0x9ABCDEF012345678
       48894500             mov      qword ptr [rbp], rax
       488BF1               mov      rsi, rcx

G_M55983_IG02:
       48B80034EDA3A0010000 mov      rax, 0x1A0A3ED3400
       488B38               mov      rdi, gword ptr [rax]
       E877E6FFFF           call     NBodyHWIntrinsics.NBody:GetNetCoreVersion():ref
       488BD0               mov      rdx, rax
       488BCF               mov      rcx, rdi
       E84414FFFF           call     System.String:Concat(ref,ref):ref
       488BC8               mov      rcx, rax
       E894E7FFFF           call     System.Console:WriteLine(ref)
       E8FFE6FFFF           call     System.Diagnostics.Stopwatch:GetTimestamp():long
       488BF8               mov      rdi, rax
       4883C420             add      rsp, 32
       BB20000000           mov      ebx, 32

G_M55983_IG03:
       6A00                 push     0
       6A00                 push     0
       48FFCB               dec      rbx
       75F7                 jne      SHORT G_M55983_IG03
       4883EC20             sub      rsp, 32
       488D5C2420           lea      rbx, [rsp+20H]
       48896528             mov      qword ptr [rbp+28H], rsp
       48B9E06DF70DFD7F0000 mov      rcx, 0x7FFD0DF76DE0
       BA55000000           mov      edx, 85
       E8397E795F           call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       48B94873F70DFD7F0000 mov      rcx, 0x7FFD0DF77348
       E84A7C795F           call     CORINFO_HELP_NEWSFAST
       33D2                 xor      rdx, rdx
       48895008             mov      qword ptr [rax+8], rdx
       C6401800             mov      byte  ptr [rax+24], 0
       48895010             mov      qword ptr [rax+16], rdx
       4C8BF0               mov      r14, rax
       41807E1800           cmp      byte  ptr [r14+24], 0
       750E                 jne      SHORT G_M55983_IG04
       E89DE6FFFF           call     System.Diagnostics.Stopwatch:GetTimestamp():long
       49894610             mov      qword ptr [r14+16], rax
       41C6461801           mov      byte  ptr [r14+24], 1

G_M55983_IG04:
       33C0                 xor      rax, rax
       49894608             mov      qword ptr [r14+8], rax
       E889E6FFFF           call     System.Diagnostics.Stopwatch:GetTimestamp():long
       49894610             mov      qword ptr [r14+16], rax
       41C6461801           mov      byte  ptr [r14+24], 1
       488BCB               mov      rcx, rbx
       488BD3               mov      rdx, rbx
       E8CDE5FFFF           call     NBodyHWIntrinsics.NBody:Initialize(long):this
       498BCE               mov      rcx, r14
       E835E6FFFF           call     System.Diagnostics.Stopwatch:Stop():this
       498BCE               mov      rcx, r14
       E86DE6FFFF           call     System.Diagnostics.Stopwatch:GetRawElapsedTicks():long:this
       4C8BF8               mov      r15, rax
       48B96046F70DFD7F0000 mov      rcx, 0x7FFD0DF74660
       BA01000000           mov      edx, 1
       E8BE7D795F           call     CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
       48B97829EDA3A0010000 mov      rcx, 0x1A0A3ED2978
       488B09               mov      rcx, gword ptr [rcx]
       4885C9               test     rcx, rcx
       7508                 jne      SHORT G_M55983_IG05
       4533E4               xor      r12, r12
       4533ED               xor      r13d, r13d
       EB42                 jmp      SHORT G_M55983_IG06

G_M55983_IG05:
       4C8D610C             lea      r12, bword ptr [rcx+12]
       4D8BEC               mov      r13, r12
       448B6108             mov      r12d, dword ptr [rcx+8]
       4585E4               test     r12d, r12d
       0F9DC1               setge    cl
       0FB6C9               movzx    rcx, cl
       48BA6030EDA3A0010000 mov      rdx, 0x1A0A3ED3060
       488B12               mov      rdx, gword ptr [rdx]
       49B86030EDA3A0010000 mov      r8, 0x1A0A3ED3060
       4D8B00               mov      r8, gword ptr [r8]
       E85142AE66           call     System.Diagnostics.Debug:Assert(bool,ref,ref)
       498BCD               mov      rcx, r13
       4C8BE9               mov      r13, rcx
       418BCC               mov      ecx, r12d
       4D8BE5               mov      r12, r13
       448BE9               mov      r13d, ecx

G_M55983_IG06:
       48B90834EDA3A0010000 mov      rcx, 0x1A0A3ED3408
       488B01               mov      rax, gword ptr [rcx]
       48894510             mov      gword ptr [rbp+10H], rax
       488D4D18             lea      rcx, bword ptr [rbp+18H]
       4C8921               mov      bword ptr [rcx], r12
       44896908             mov      dword ptr [rcx+8], r13d
       498BCF               mov      rcx, r15
       488D5518             lea      rdx, bword ptr [rbp+18H]
       4533C0               xor      r8, r8
       E89FF9FFFF           call     System.Number:FormatInt64(long,struct,ref):ref
       488BD0               mov      rdx, rax
       488B4D10             mov      rcx, gword ptr [rbp+10H]
       E8F312FFFF           call     System.String:Concat(ref,ref):ref
       488BC8               mov      rcx, rax
       E843E6FFFF           call     System.Console:WriteLine(ref)
       33C0                 xor      rax, rax
       49894608             mov      qword ptr [r14+8], rax
       E8A8E5FFFF           call     System.Diagnostics.Stopwatch:GetTimestamp():long
       49894610             mov      qword ptr [r14+16], rax
       41C6461801           mov      byte  ptr [r14+24], 1
       E83AE9FFFF           call     System.Console:get_Out():ref
       4C8BF8               mov      r15, rax
       488BCB               mov      rcx, rbx
       E8F7E4FFFF           call     NBodyHWIntrinsics.NBody:Energy():double:this
       C4E17828F0           vmovaps  xmm6, xmm0
       48B81034EDA3A0010000 mov      rax, 0x1A0A3ED3410
       4C8B20               mov      r12, gword ptr [rax]
       E82853FFFF           call     System.Globalization.NumberFormatInfo:get_CurrentInfo():ref
       4C8BC0               mov      r8, rax
       498BD4               mov      rdx, r12
       C4E17828C6           vmovaps  xmm0, xmm6
       E8E8F8FFFF           call     System.Number:FormatDouble(double,ref,ref):ref
       488BD0               mov      rdx, rax
       498BCF               mov      rcx, r15
       498B07               mov      rax, qword ptr [r15]
       488B8080000000       mov      rax, qword ptr [rax+128]
       FF5010               call     gword ptr [rax+16]System.IO.TextWriter:WriteLineAsync(ref):ref:this
       498BCE               mov      rcx, r14
       E815E5FFFF           call     System.Diagnostics.Stopwatch:Stop():this
       498BCE               mov      rcx, r14
       E84DE5FFFF           call     System.Diagnostics.Stopwatch:GetRawElapsedTicks():long:this
       4C8BF8               mov      r15, rax
       48B97829EDA3A0010000 mov      rcx, 0x1A0A3ED2978
       488B09               mov      rcx, gword ptr [rcx]
       4885C9               test     rcx, rcx
       7508                 jne      SHORT G_M55983_IG07
       4533E4               xor      r12, r12
       4533ED               xor      r13d, r13d
       EB42                 jmp      SHORT G_M55983_IG08

G_M55983_IG07:
       4C8D610C             lea      r12, bword ptr [rcx+12]
       4D8BEC               mov      r13, r12
       448B6108             mov      r12d, dword ptr [rcx+8]
       4585E4               test     r12d, r12d
       0F9DC1               setge    cl
       0FB6C9               movzx    rcx, cl
       48BA6030EDA3A0010000 mov      rdx, 0x1A0A3ED3060
       488B12               mov      rdx, gword ptr [rdx]
       49B86030EDA3A0010000 mov      r8, 0x1A0A3ED3060
       4D8B00               mov      r8, gword ptr [r8]
       E84541AE66           call     System.Diagnostics.Debug:Assert(bool,ref,ref)
       498BCD               mov      rcx, r13
       4C8BE9               mov      r13, rcx
       418BCC               mov      ecx, r12d
       4D8BE5               mov      r12, r13
       448BE9               mov      r13d, ecx

G_M55983_IG08:
       48B91834EDA3A0010000 mov      rcx, 0x1A0A3ED3418
       488B01               mov      rax, gword ptr [rcx]
       48894508             mov      gword ptr [rbp+08H], rax
       498BCF               mov      rcx, r15
       488D5518             lea      rdx, bword ptr [rbp+18H]
       4C8922               mov      bword ptr [rdx], r12
       44896A08             mov      dword ptr [rdx+8], r13d
       488D5518             lea      rdx, bword ptr [rbp+18H]
       4533C0               xor      r8, r8
       E893F8FFFF           call     System.Number:FormatInt64(long,struct,ref):ref
       488BD0               mov      rdx, rax
       488B4D08             mov      rcx, gword ptr [rbp+08H]
       E8E711FFFF           call     System.String:Concat(ref,ref):ref
       488BC8               mov      rcx, rax
       E837E5FFFF           call     System.Console:WriteLine(ref)
       837E0800             cmp      dword ptr [rsi+8], 0
       7508                 jne      SHORT G_M55983_IG09
       41BF80F0FA02         mov      r15d, 0x2FAF080
       EB7C                 jmp      SHORT G_M55983_IG11

G_M55983_IG09:
       837E0800             cmp      dword ptr [rsi+8], 0
       0F8612030000         jbe      G_M55983_IG21
       488B4E10             mov      rcx, gword ptr [rsi+16]
       4885C9               test     rcx, rcx
       0F84FA020000         je       G_M55983_IG20

G_M55983_IG10:
       4C8D790C             lea      r15, bword ptr [rcx+12]
       498BF7               mov      rsi, r15
       448B7908             mov      r15d, dword ptr [rcx+8]
       4585FF               test     r15d, r15d
       0F9DC1               setge    cl
       0FB6C9               movzx    rcx, cl
       48BA6030EDA3A0010000 mov      rdx, 0x1A0A3ED3060
       488B12               mov      rdx, gword ptr [rdx]
       49B86030EDA3A0010000 mov      r8, 0x1A0A3ED3060
       4D8B00               mov      r8, gword ptr [r8]
       E89F40AE66           call     System.Diagnostics.Debug:Assert(bool,ref,ref)
       488BC6               mov      rax, rsi
       488BF0               mov      rsi, rax
       418BC7               mov      eax, r15d
       448BF8               mov      r15d, eax
       418BC7               mov      eax, r15d
       488D5518             lea      rdx, bword ptr [rbp+18H]
       488932               mov      bword ptr [rdx], rsi
       894208               mov      dword ptr [rdx+8], eax
       E8E151FFFF           call     System.Globalization.NumberFormatInfo:get_CurrentInfo():ref
       4C8BC0               mov      r8, rax
       488D4D18             lea      rcx, bword ptr [rbp+18H]
       BA07000000           mov      edx, 7
       E8F0F6FFFF           call     System.Number:ParseInt32(struct,int,ref):int
       448BF8               mov      r15d, eax

G_M55983_IG11:
       33C0                 xor      rax, rax
       49894608             mov      qword ptr [r14+8], rax
       E812E4FFFF           call     System.Diagnostics.Stopwatch:GetTimestamp():long
       49894610             mov      qword ptr [r14+16], rax
       41C6461801           mov      byte  ptr [r14+24], 1
       C4E17B101590020000   vmovsd   xmm2, qword ptr [reloc @RWD00]
       488BCB               mov      rcx, rbx
       418BD7               mov      edx, r15d
       E86DE3FFFF           call     NBodyHWIntrinsics.NBody:Advance(int,double):this
       498BCE               mov      rcx, r14
       E8B5E3FFFF           call     System.Diagnostics.Stopwatch:Stop():this
       498BCE               mov      rcx, r14
       E8EDE3FFFF           call     System.Diagnostics.Stopwatch:GetRawElapsedTicks():long:this
       4C8BF8               mov      r15, rax
       48B97829EDA3A0010000 mov      rcx, 0x1A0A3ED2978
       488B09               mov      rcx, gword ptr [rcx]
       4885C9               test     rcx, rcx
       7508                 jne      SHORT G_M55983_IG12
       33F6                 xor      rsi, rsi
       4533E4               xor      r12d, r12d
       EB40                 jmp      SHORT G_M55983_IG13

G_M55983_IG12:
       488D710C             lea      rsi, bword ptr [rcx+12]
       4C8BE6               mov      r12, rsi
       8B7108               mov      esi, dword ptr [rcx+8]
       85F6                 test     esi, esi
       0F9DC1               setge    cl
       0FB6C9               movzx    rcx, cl
       48BA6030EDA3A0010000 mov      rdx, 0x1A0A3ED3060
       488B12               mov      rdx, gword ptr [rdx]
       49B86030EDA3A0010000 mov      r8, 0x1A0A3ED3060
       4D8B00               mov      r8, gword ptr [r8]
       E8E83FAE66           call     System.Diagnostics.Debug:Assert(bool,ref,ref)
       498BCC               mov      rcx, r12
       4C8BE1               mov      r12, rcx
       8BCE                 mov      ecx, esi
       498BF4               mov      rsi, r12
       448BE1               mov      r12d, ecx

G_M55983_IG13:
       48B92034EDA3A0010000 mov      rcx, 0x1A0A3ED3420
       4C8B29               mov      r13, gword ptr [rcx]
       498BCF               mov      rcx, r15
       488D5518             lea      rdx, bword ptr [rbp+18H]
       488932               mov      bword ptr [rdx], rsi
       44896208             mov      dword ptr [rdx+8], r12d
       488D5518             lea      rdx, bword ptr [rbp+18H]
       4533C0               xor      r8, r8
       E83BF7FFFF           call     System.Number:FormatInt64(long,struct,ref):ref
       488BD0               mov      rdx, rax
       498BCD               mov      rcx, r13
       E89010FFFF           call     System.String:Concat(ref,ref):ref
       488BC8               mov      rcx, rax
       E8E0E3FFFF           call     System.Console:WriteLine(ref)
       33C0                 xor      rax, rax
       49894608             mov      qword ptr [r14+8], rax
       E845E3FFFF           call     System.Diagnostics.Stopwatch:GetTimestamp():long
       49894610             mov      qword ptr [r14+16], rax
       41C6461801           mov      byte  ptr [r14+24], 1
       E8D7E6FFFF           call     System.Console:get_Out():ref
       488BF0               mov      rsi, rax
       488BCB               mov      rcx, rbx
       E894E2FFFF           call     NBodyHWIntrinsics.NBody:Energy():double:this
       C4E17828F0           vmovaps  xmm6, xmm0
       48B81034EDA3A0010000 mov      rax, 0x1A0A3ED3410
       488B18               mov      rbx, gword ptr [rax]
       E8C550FFFF           call     System.Globalization.NumberFormatInfo:get_CurrentInfo():ref
       4C8BC0               mov      r8, rax
       488BD3               mov      rdx, rbx
       C4E17828C6           vmovaps  xmm0, xmm6
       E885F6FFFF           call     System.Number:FormatDouble(double,ref,ref):ref
       488BD0               mov      rdx, rax
       488BCE               mov      rcx, rsi
       488B06               mov      rax, qword ptr [rsi]
       488B4070             mov      rax, qword ptr [rax+112]
       FF5028               call     qword ptr [rax+40]System.IO.TextWriter:WriteLine(ref):this
       498BCE               mov      rcx, r14
       E8B5E2FFFF           call     System.Diagnostics.Stopwatch:Stop():this
       498BCE               mov      rcx, r14
       E8EDE2FFFF           call     System.Diagnostics.Stopwatch:GetRawElapsedTicks():long:this
       4C8BF8               mov      r15, rax
       48B97829EDA3A0010000 mov      rcx, 0x1A0A3ED2978
       488B09               mov      rcx, gword ptr [rcx]
       4885C9               test     rcx, rcx
       7506                 jne      SHORT G_M55983_IG14
       33F6                 xor      rsi, rsi
       33DB                 xor      ebx, ebx
       EB3E                 jmp      SHORT G_M55983_IG15

G_M55983_IG14:
       488D710C             lea      rsi, bword ptr [rcx+12]
       488BDE               mov      rbx, rsi
       8B7108               mov      esi, dword ptr [rcx+8]
       85F6                 test     esi, esi
       0F9DC1               setge    cl
       0FB6C9               movzx    rcx, cl
       48BA6030EDA3A0010000 mov      rdx, 0x1A0A3ED3060
       488B12               mov      rdx, gword ptr [rdx]
       49B86030EDA3A0010000 mov      r8, 0x1A0A3ED3060
       4D8B00               mov      r8, gword ptr [r8]
       E8E93EAE66           call     System.Diagnostics.Debug:Assert(bool,ref,ref)
       488BCB               mov      rcx, rbx
       488BD9               mov      rbx, rcx
       8BCE                 mov      ecx, esi
       488BF3               mov      rsi, rbx
       8BD9                 mov      ebx, ecx

G_M55983_IG15:
       48B92834EDA3A0010000 mov      rcx, 0x1A0A3ED3428
       4C8B31               mov      r14, gword ptr [rcx]
       498BCF               mov      rcx, r15
       488D5518             lea      rdx, bword ptr [rbp+18H]
       488932               mov      bword ptr [rdx], rsi
       895A08               mov      dword ptr [rdx+8], ebx
       488D5518             lea      rdx, bword ptr [rbp+18H]
       4533C0               xor      r8, r8
       E83EF6FFFF           call     System.Number:FormatInt64(long,struct,ref):ref
       488BD0               mov      rdx, rax
       498BCE               mov      rcx, r14
       E8930FFFFF           call     System.String:Concat(ref,ref):ref
       488BC8               mov      rcx, rax
       E8E3E2FFFF           call     System.Console:WriteLine(ref)
       E84EE2FFFF           call     System.Diagnostics.Stopwatch:GetTimestamp():long
       4C8BF8               mov      r15, rax
       4C2BFF               sub      r15, rdi
       48B97829EDA3A0010000 mov      rcx, 0x1A0A3ED2978
       488B09               mov      rcx, gword ptr [rcx]
       498BF7               mov      rsi, r15
       4885C9               test     rcx, rcx
       7506                 jne      SHORT G_M55983_IG16
       33FF                 xor      rdi, rdi
       33DB                 xor      ebx, ebx
       EB3E                 jmp      SHORT G_M55983_IG17

G_M55983_IG16:
       488D790C             lea      rdi, bword ptr [rcx+12]
       488BDF               mov      rbx, rdi
       8B7908               mov      edi, dword ptr [rcx+8]
       85FF                 test     edi, edi
       0F9DC1               setge    cl
       0FB6C9               movzx    rcx, cl
       48BA6030EDA3A0010000 mov      rdx, 0x1A0A3ED3060
       488B12               mov      rdx, gword ptr [rdx]
       49B86030EDA3A0010000 mov      r8, 0x1A0A3ED3060
       4D8B00               mov      r8, gword ptr [r8]
       E84C3EAE66           call     System.Diagnostics.Debug:Assert(bool,ref,ref)
       488BCB               mov      rcx, rbx
       488BD9               mov      rbx, rcx
       8BCF                 mov      ecx, edi
       488BFB               mov      rdi, rbx
       8BD9                 mov      ebx, ecx

G_M55983_IG17:
       48B93034EDA3A0010000 mov      rcx, 0x1A0A3ED3430
       4C8B31               mov      r14, gword ptr [rcx]
       488BCE               mov      rcx, rsi
       488D5518             lea      rdx, bword ptr [rbp+18H]
       48893A               mov      bword ptr [rdx], rdi
       895A08               mov      dword ptr [rdx+8], ebx
       488D5518             lea      rdx, bword ptr [rbp+18H]
       4533C0               xor      r8, r8
       E8A1F5FFFF           call     System.Number:FormatInt64(long,struct,ref):ref
       488BD0               mov      rdx, rax
       498BCE               mov      rcx, r14
       E8F60EFFFF           call     System.String:Concat(ref,ref):ref
       488BC8               mov      rcx, rax
       E846E2FFFF           call     System.Console:WriteLine(ref)
       48B978563412F0DEBC9A mov      rcx, 0x9ABCDEF012345678
       48394D00             cmp      qword ptr [rbp], rcx
       7405                 je       SHORT G_M55983_IG18
       E8E1B0305F           call     CORINFO_HELP_FAIL_FAST

G_M55983_IG18:
       90                   nop      

G_M55983_IG19:
       C4E178287530         vmovaps  xmm6, qword ptr [rbp+30H]
       488D6548             lea      rsp, [rbp+48H]
       5B                   pop      rbx
       5E                   pop      rsi
       5F                   pop      rdi
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret      

G_M55983_IG20:
       B945000000           mov      ecx, 69
       E857F7FFFF           call     System.ThrowHelper:ThrowArgumentNullException(int)
       CC                   int3     

G_M55983_IG21:
       E89951315F           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3     

; Total bytes of code 1528, prolog size 68 for method NBodyHWIntrinsics.NBody:Main(ref)
; ============================================================
Running on .NETCoreApp: 
; Assembly listing for method NBodyHWIntrinsics.NBody:Initialize(long):this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T15] (  3,  3   )   byref  ->  rcx         this
;  V01 arg1         [V01,T16] (  3,  3   )    long  ->  rdx        
;  V02 loc0         [V02,T21] (  3,  2.50)    long  ->  rcx        
;* V03 loc1         [V03    ] (  0,  0   )    long  ->  zero-ref    ptr
;* V04 loc2         [V04    ] (  0,  0   )    long  ->  zero-ref    ptr
;  V05 loc3         [V05,T06] ( 11, 17   )  simd16  ->  mm0        
;  V06 loc4         [V06,T12] (  4, 10   )  simd16  ->  mm1        
;  V07 loc5         [V07,T09] (  9, 15   )  simd16  ->  mm2        
;  V08 loc6         [V08,T10] (  4, 13   )  simd16  ->  mm3        
;  V09 loc7         [V09,T14] (  4,  7   )  simd16  ->  mm4        
;  V10 loc8         [V10,T17] (  2,  5   )    long  ->  rax        
;  V11 loc9         [V11,T07] (  5, 17   )     int  ->  rcx        
;  V12 loc10        [V12,T03] (  5, 20   )  simd16  ->  mm5        
;  V13 loc11        [V13,T04] (  5, 20   )  simd16  ->  mm6        
;  V14 loc12        [V14,T05] (  5, 20   )  simd16  ->  mm7        
;  V15 loc13        [V15,T02] (  8, 32   )  simd16  ->  mm8        
;# V16 OutArgs      [V16    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V17 tmp1         [V17,T13] (  9,  8   )    long  ->  rax        
;  V18 tmp2         [V18    ] (  1,  1   )     blk (32) [rsp+0x00]   do-not-enreg[X] must-init addr-exposed ptr unsafe-buffer
;  V19 tmp3         [V19,T11] (  6, 12   )    long  ->  rax        
;  V20 tmp4         [V20,T19] (  3,  3   )  simd16  ->  mm3        
;  V21 tmp5         [V21,T20] (  3,  3   )  simd16  ->  mm4        
;* V22 tmp6         [V22    ] (  0,  0   )    long  ->  zero-ref   
;  V23 tmp7         [V23,T08] (  2, 16   )    long  ->   r8        
;  V24 tmp8         [V24    ] (  1,  8   )  simd16  ->  [rsp+0x20]   do-not-enreg[SB] ptr
;  V25 tmp9         [V25    ] (  1,  8   )    long  ->  [rsp+0x20]   do-not-enreg[] V24._00(offs=0x00) P-DEP
;  V26 tmp10        [V26    ] (  1,  8   )    long  ->  [rsp+0x28]   do-not-enreg[] V24._01(offs=0x08) P-DEP
;* V27 GsCookie     [V27    ] (  0,  0   )    long  ->  zero-ref    do-not-enreg[X] must-init addr-exposed
;  V28 tmp12        [V28,T00] ( 43, 64   )   byref  ->  rdx         this
;  V29 tmp13        [V29,T18] (  4,  3   )    long  ->  rax        
;  V30 cse0         [V30,T01] (  9, 36   )    long  ->   r9        
;
; Lcl frame size = 136

G_M2790_IG01:
       57                   push     rdi
       56                   push     rsi
       4881EC88000000       sub      rsp, 136
       C5F877               vzeroupper 
       C4E17829742470       vmovaps  qword ptr [rsp+70H], xmm6
       C4E178297C2460       vmovaps  qword ptr [rsp+60H], xmm7
       C4617829442450       vmovaps  qword ptr [rsp+50H], xmm8
       C46178294C2440       vmovaps  qword ptr [rsp+40H], xmm9
       488BF1               mov      rsi, rcx
       488D3C24             lea      rdi, [rsp]
       B910000000           mov      ecx, 16
       33C0                 xor      rax, rax
       F3AB                 rep stosd 
       488BCE               mov      rcx, rsi
       48B878563412F0DEBC9A mov      rax, 0x9ABCDEF012345678
       4889442438           mov      qword ptr [rsp+38H], rax

G_M2790_IG02:
       488BC2               mov      rax, rdx
       488BD1               mov      rdx, rcx
       488BC8               mov      rcx, rax
       4883E10F             and      rcx, 15
       4885C9               test     rcx, rcx
       740A                 je       SHORT G_M2790_IG03
       48F7D9               neg      rcx
       488D440110           lea      rax, [rcx+rax+16]
       EB00                 jmp      SHORT G_M2790_IG03

G_M2790_IG03:
       488982C0010000       mov      qword ptr [rdx+448], rax
       488D4840             lea      rcx, [rax+64]
       48898AC8010000       mov      qword ptr [rdx+456], rcx
       488D8880000000       lea      rcx, [rax+128]
       48898AD0010000       mov      qword ptr [rdx+464], rcx
       488D88C0000000       lea      rcx, [rax+192]
       48898AD8010000       mov      qword ptr [rdx+472], rcx
       488D8800010000       lea      rcx, [rax+256]
       48898AE0010000       mov      qword ptr [rdx+480], rcx
       488D8840010000       lea      rcx, [rax+320]
       48898AE8010000       mov      qword ptr [rdx+488], rcx
       480580010000         add      rax, 384
       488982F0010000       mov      qword ptr [rdx+496], rax
       488B82C0010000       mov      rax, qword ptr [rdx+448]
       C4E17B1005FB030000   vmovsd   xmm0, qword ptr [reloc @RWD00]
       C4E17B114010         vmovsd   qword ptr [rax+16], xmm0
       488B82C0010000       mov      rax, qword ptr [rdx+448]
       C4E17B1005ED030000   vmovsd   xmm0, qword ptr [reloc @RWD08]
       C4E17B114018         vmovsd   qword ptr [rax+24], xmm0
       488B82C0010000       mov      rax, qword ptr [rdx+448]
       C4E17B1005DF030000   vmovsd   xmm0, qword ptr [reloc @RWD16]
       C4E17B114020         vmovsd   qword ptr [rax+32], xmm0
       488B82C0010000       mov      rax, qword ptr [rdx+448]
       C4E17B1005D1030000   vmovsd   xmm0, qword ptr [reloc @RWD24]
       C4E17B114028         vmovsd   qword ptr [rax+40], xmm0
       488B82C8010000       mov      rax, qword ptr [rdx+456]
       C4E17B1005C3030000   vmovsd   xmm0, qword ptr [reloc @RWD32]
       C4E17B114010         vmovsd   qword ptr [rax+16], xmm0
       488B82C8010000       mov      rax, qword ptr [rdx+456]
       C4E17B1005B5030000   vmovsd   xmm0, qword ptr [reloc @RWD40]
       C4E17B114018         vmovsd   qword ptr [rax+24], xmm0
       488B82C8010000       mov      rax, qword ptr [rdx+456]
       C4E17B1005A7030000   vmovsd   xmm0, qword ptr [reloc @RWD48]
       C4E17B114020         vmovsd   qword ptr [rax+32], xmm0
       488B82C8010000       mov      rax, qword ptr [rdx+456]
       C4E17B100599030000   vmovsd   xmm0, qword ptr [reloc @RWD56]
       C4E17B114028         vmovsd   qword ptr [rax+40], xmm0
       488B82D0010000       mov      rax, qword ptr [rdx+464]
       C4E17B10058B030000   vmovsd   xmm0, qword ptr [reloc @RWD64]
       C4E17B114010         vmovsd   qword ptr [rax+16], xmm0
       488B82D0010000       mov      rax, qword ptr [rdx+464]
       C4E17B10057D030000   vmovsd   xmm0, qword ptr [reloc @RWD72]
       C4E17B114018         vmovsd   qword ptr [rax+24], xmm0
       488B82D0010000       mov      rax, qword ptr [rdx+464]
       C4E17B10056F030000   vmovsd   xmm0, qword ptr [reloc @RWD80]
       C4E17B114020         vmovsd   qword ptr [rax+32], xmm0
       488B82D0010000       mov      rax, qword ptr [rdx+464]
       C4E17B100561030000   vmovsd   xmm0, qword ptr [reloc @RWD88]
       C4E17B114028         vmovsd   qword ptr [rax+40], xmm0
       488B82D8010000       mov      rax, qword ptr [rdx+472]
       C4E17B100553030000   vmovsd   xmm0, qword ptr [reloc @RWD96]
       C4E17B114010         vmovsd   qword ptr [rax+16], xmm0
       488B82D8010000       mov      rax, qword ptr [rdx+472]
       C4E17B100545030000   vmovsd   xmm0, qword ptr [reloc @RWD104]
       C4E17B114018         vmovsd   qword ptr [rax+24], xmm0
       488B82D8010000       mov      rax, qword ptr [rdx+472]
       C4E17B100537030000   vmovsd   xmm0, qword ptr [reloc @RWD112]
       C4E17B114020         vmovsd   qword ptr [rax+32], xmm0
       488B82D8010000       mov      rax, qword ptr [rdx+472]

G_M2790_IG04:
       C4E17B100529030000   vmovsd   xmm0, qword ptr [reloc @RWD120]
       C4E17B114028         vmovsd   qword ptr [rax+40], xmm0
       488B82E0010000       mov      rax, qword ptr [rdx+480]
       C4E17B10051B030000   vmovsd   xmm0, qword ptr [reloc @RWD128]
       C4E17B114010         vmovsd   qword ptr [rax+16], xmm0
       488B82E0010000       mov      rax, qword ptr [rdx+480]
       C4E17B10050D030000   vmovsd   xmm0, qword ptr [reloc @RWD136]
       C4E17B114018         vmovsd   qword ptr [rax+24], xmm0
       488B82E0010000       mov      rax, qword ptr [rdx+480]
       C4E17B1005FF020000   vmovsd   xmm0, qword ptr [reloc @RWD144]
       C4E17B114020         vmovsd   qword ptr [rax+32], xmm0
       488B82E0010000       mov      rax, qword ptr [rdx+480]
       C4E17B1005F1020000   vmovsd   xmm0, qword ptr [reloc @RWD152]
       C4E17B114028         vmovsd   qword ptr [rax+40], xmm0
       488B82E8010000       mov      rax, qword ptr [rdx+488]
       C4E17B1005E3020000   vmovsd   xmm0, qword ptr [reloc @RWD160]
       C4E17B114010         vmovsd   qword ptr [rax+16], xmm0
       488B82E8010000       mov      rax, qword ptr [rdx+488]
       C4E17B1005D5020000   vmovsd   xmm0, qword ptr [reloc @RWD168]
       C4E17B114018         vmovsd   qword ptr [rax+24], xmm0
       488B82E8010000       mov      rax, qword ptr [rdx+488]
       C4E17B1005C7020000   vmovsd   xmm0, qword ptr [reloc @RWD176]
       C4E17B114020         vmovsd   qword ptr [rax+32], xmm0
       488B82E8010000       mov      rax, qword ptr [rdx+488]
       C4E17B1005B9020000   vmovsd   xmm0, qword ptr [reloc @RWD184]
       C4E17B114028         vmovsd   qword ptr [rax+40], xmm0
       488B82F0010000       mov      rax, qword ptr [rdx+496]
       C4E17B1005AB020000   vmovsd   xmm0, qword ptr [reloc @RWD192]
       C4E17B1100           vmovsd   qword ptr [rax], xmm0
       C4E17957C0           vxorpd   xmm0, xmm0, xmm0
       C4E17157C9           vxorpd   xmm1, xmm1, xmm1
       C4E16957D2           vxorpd   xmm2, xmm2, xmm2
       C4E17B101D96020000   vmovsd   xmm3, qword ptr [reloc @RWD200]
       C4E17928E3           vmovapd  xmm4, xmm3
       C4E16157DB           vxorpd   xmm3, xmm3, xmm3
       C4E16310DC           vmovsd   xmm3, xmm3, xmm4
       C4E16114DB           vunpcklpd xmm3, xmm3, xmm3
       C4E17B102581020000   vmovsd   xmm4, qword ptr [reloc @RWD208]
       C4E17928EC           vmovapd  xmm5, xmm4
       C4E15957E4           vxorpd   xmm4, xmm4, xmm4
       C4E15B10E5           vmovsd   xmm4, xmm4, xmm5
       C4E15914E4           vunpcklpd xmm4, xmm4, xmm4
       488D0424             lea      rax, bword ptr [rsp]
       C4E17B102D68020000   vmovsd   xmm5, qword ptr [reloc @RWD216]
       C4E17B1128           vmovsd   qword ptr [rax], xmm5
       C4E17B102D62020000   vmovsd   xmm5, qword ptr [reloc @RWD224]
       C4E17B116808         vmovsd   qword ptr [rax+8], xmm5
       C4E17B102D5B020000   vmovsd   xmm5, qword ptr [reloc @RWD232]
       C4E17B116810         vmovsd   qword ptr [rax+16], xmm5
       C4E17B102D54020000   vmovsd   xmm5, qword ptr [reloc @RWD240]
       C4E17B116818         vmovsd   qword ptr [rax+24], xmm5
       B902000000           mov      ecx, 2

G_M2790_IG05:
       4C8B82D8010000       mov      r8, qword ptr [rdx+472]
       4C63C9               movsxd   r9, ecx
       49C1E103             shl      r9, 3
       4D03C1               add      r8, r9
       C4C1792828           vmovapd  xmm5, xmmword ptr [r8]
       4D8BC1               mov      r8, r9
       4C0382E0010000       add      r8, qword ptr [rdx+480]
       C4C1792830           vmovapd  xmm6, xmmword ptr [r8]
       4D8BC1               mov      r8, r9
       4C0382E8010000       add      r8, qword ptr [rdx+488]
       C4C1792838           vmovapd  xmm7, xmmword ptr [r8]
       C4E15159EB           vmulpd   xmm5, xmm5, xmm3
       C4E14959F3           vmulpd   xmm6, xmm6, xmm3
       C4E14159FB           vmulpd   xmm7, xmm7, xmm3
       C42179104408F0       vmovupd  xmm8, xmmword ptr [rax+r9-16]
       C4613959C4           vmulpd   xmm8, xmm8, xmm4
       C4613959CD           vmulpd   xmm9, xmm8, xmm5
       C4C17958C1           vaddpd   xmm0, xmm0, xmm9
       C4613959CE           vmulpd   xmm9, xmm8, xmm6
       C4C17158C9           vaddpd   xmm1, xmm1, xmm9
       C4613959CF           vmulpd   xmm9, xmm8, xmm7
       C4C16958D1           vaddpd   xmm2, xmm2, xmm9
       4D8BC1               mov      r8, r9
       4C0382F0010000       add      r8, qword ptr [rdx+496]
       C4617929442420       vmovapd  xmmword ptr [rsp+20H], xmm8
       C441791100           vmovupd  xmmword ptr [r8], xmm8
       4D8BC1               mov      r8, r9
       4C0382D8010000       add      r8, qword ptr [rdx+472]
       C4C1792928           vmovapd  xmmword ptr [r8], xmm5
       4D8BC1               mov      r8, r9
       4C0382E0010000       add      r8, qword ptr [rdx+480]
       C4C1792930           vmovapd  xmmword ptr [r8], xmm6
       4C038AE8010000       add      r9, qword ptr [rdx+488]
       C4C1792939           vmovapd  xmmword ptr [r9], xmm7
       83C102               add      ecx, 2
       83F906               cmp      ecx, 6
       0F8C47FFFFFF         jl       G_M2790_IG05

G_M2790_IG06:
       C4E1797CC1           vhaddpd  xmm0, xmm0, xmm1
       C4E1795EC4           vdivpd   xmm0, xmm0, xmm4
       C4E1697CD2           vhaddpd  xmm2, xmm2, xmm2
       C4E1695ED4           vdivpd   xmm2, xmm2, xmm4
       488B82D8010000       mov      rax, qword ptr [rdx+472]
       C4E17B10C8           vmovsd   xmm1, xmm0
       C4E17B1108           vmovsd   qword ptr [rax], xmm1
       C4E17973D808         vpsrldq  xmm0, xmm0, 8
       488B82E0010000       mov      rax, qword ptr [rdx+480]
       C4E17B1100           vmovsd   qword ptr [rax], xmm0
       488B82E8010000       mov      rax, qword ptr [rdx+488]
       C4E17B1110           vmovsd   qword ptr [rax], xmm2
       48B978563412F0DEBC9A mov      rcx, 0x9ABCDEF012345678
       48394C2438           cmp      qword ptr [rsp+38H], rcx
       7405                 je       SHORT G_M2790_IG07
       E8CF63305F           call     CORINFO_HELP_FAIL_FAST

G_M2790_IG07:
       90                   nop      

G_M2790_IG08:
       C4E17828742470       vmovaps  xmm6, qword ptr [rsp+70H]
       C4E178287C2460       vmovaps  xmm7, qword ptr [rsp+60H]
       C4617828442450       vmovaps  xmm8, qword ptr [rsp+50H]
       C46178284C2440       vmovaps  xmm9, qword ptr [rsp+40H]
       4881C488000000       add      rsp, 136
       5E                   pop      rsi
       5F                   pop      rdi
       C3                   ret      

; Total bytes of code 1192, prolog size 74 for method NBodyHWIntrinsics.NBody:Initialize(long):this
; ============================================================
Elapsed Initialize: 367ÿ727
; Assembly listing for method NBodyHWIntrinsics.NBody:Energy():double:this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T48] (  9,  9   )   byref  ->  rcx         this
;  V01 loc0         [V01,T40] (  4, 13   )    long  ->  [rsp+0x18]  
;  V02 loc1         [V02,T41] (  4, 13   )    long  ->   r9        
;  V03 loc2         [V03,T42] (  4, 13   )    long  ->  r11        
;  V04 loc3         [V04,T43] (  4, 13   )    long  ->  rsi        
;  V05 loc4         [V05,T44] (  4, 13   )    long  ->  rdi        
;  V06 loc5         [V06,T45] (  4, 13   )    long  ->  [rsp+0x10]  
;  V07 loc6         [V07,T46] (  4, 13   )    long  ->  rbp        
;  V08 loc7         [V08,T27] (  9, 45   )  simd16  ->  mm0        
;  V09 loc8         [V09,T49] (  2,  5   )  simd16  ->  [rsp+0x00]  
;  V10 loc9         [V10,T47] (  4, 13   )     int  ->  r14        
;  V11 loc10        [V11,T26] (  5, 57   )     int  ->  r15        
;  V12 loc11        [V12,T28] (  6, 40   )  simd16  ->  mm2        
;  V13 loc12        [V13,T18] ( 16, 84   )  simd16  ->  mm3        
;  V14 loc13        [V14,T35] (  5, 20   )  simd16  ->  mm4        
;  V15 loc14        [V15,T36] (  5, 20   )  simd16  ->  mm5        
;  V16 loc15        [V16,T37] (  2, 20   )  simd16  ->  mm4        
;  V17 loc16        [V17,T38] (  2, 20   )  simd16  ->  mm5        
;  V18 loc17        [V18,T39] (  2, 20   )  simd16  ->  mm6        
;  V19 loc18        [V19,T19] (  6, 84   )     int  ->  r12        
;# V20 OutArgs      [V20    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V21 tmp1         [V21,T50] (  3,  3   )  simd16  ->  mm1        
;  V22 tmp2         [V22,T03] (  7,192   )     int  ->  r13        
;  V23 tmp3         [V23,T04] (  7,192   )  simd16  ->  mm10        
;  V24 tmp4         [V24,T00] ( 12,384   )  simd16  ->  mm11        
;  V25 tmp5         [V25,T01] (  9,288   )  simd16  ->  mm12        
;  V26 tmp6         [V26,T02] (  7,224   )  simd16  ->  mm13        
;  V27 tmp7         [V27,T14] (  2, 96   )  simd16  ->  mm7        
;  V28 tmp8         [V28,T15] (  2, 96   )  simd16  ->  mm8        
;  V29 tmp9         [V29,T16] (  2, 96   )  simd16  ->  mm9        
;  V30 tmp10        [V30,T17] (  2, 96   )  simd16  ->  mm3        
;  V31 tmp11        [V31,T51] (  2, 32   )  double  ->  mm1        
;  V32 tmp12        [V32,T05] (  6,192   )  simd16  ->  mm0        
;  V33 tmp13        [V33,T20] (  2, 64   )  simd16  ->  mm1        
;  V34 tmp14        [V34,T09] (  2,128   )  simd16  ->  mm12        
;  V35 tmp15        [V35,T21] (  2, 64   )  simd16  ->  mm13        
;  V36 tmp16        [V36,T22] (  2, 64   )  simd16  ->  mm14        
;  V37 tmp17        [V37,T23] (  2, 64   )  simd16  ->  mm1        
;* V38 tmp18        [V38    ] (  0,  0   )  simd16  ->  zero-ref   
;  V39 tmp19        [V39,T06] (  5,160   )  simd16  ->  mm15        
;  V40 tmp20        [V40,T07] (  5,160   )  simd16  ->  mm11        
;  V41 tmp21        [V41,T24] (  2, 64   )  simd16  ->  mm12        
;  V42 tmp22        [V42,T25] (  2, 64   )  simd16  ->  mm1        
;  V43 tmp23        [V43,T10] (  3, 96   )  simd16  ->  mm12        
;  V44 tmp24        [V44,T11] (  3, 96   )  simd16  ->  mm13        
;  V45 tmp25        [V45,T12] (  3, 96   )  simd16  ->  mm14        
;  V46 tmp26        [V46,T13] (  3, 96   )  simd16  ->  mm15        
;  V47 tmp27        [V47,T33] (  2, 32   )  simd16  ->  mm1        
;  V48 tmp28        [V48,T34] (  2, 32   )  simd16  ->  mm10        
;  V49 cse0         [V49,T08] (  5,160   )    long  ->  rdx        
;  V50 cse1         [V50,T29] (  3, 34   )    long  ->  rcx        
;  V51 cse2         [V51,T30] (  3, 34   )    long  ->  rax        
;  V52 cse3         [V52,T31] (  3, 34   )    long  ->   r8        
;  V53 cse4         [V53,T32] (  3, 34   )    long  ->  r10        
;
; Lcl frame size = 200

G_M55664_IG01:
       4157                 push     r15
       4156                 push     r14
       4155                 push     r13
       4154                 push     r12
       57                   push     rdi
       56                   push     rsi
       55                   push     rbp
       53                   push     rbx
       4881ECC8000000       sub      rsp, 200
       C5F877               vzeroupper 
       C4E17829B424B0000000 vmovaps  qword ptr [rsp+B0H], xmm6
       C4E17829BC24A0000000 vmovaps  qword ptr [rsp+A0H], xmm7
       C4617829842490000000 vmovaps  qword ptr [rsp+90H], xmm8
       C46178298C2480000000 vmovaps  qword ptr [rsp+80H], xmm9
       C4617829542470       vmovaps  qword ptr [rsp+70H], xmm10
       C46178295C2460       vmovaps  qword ptr [rsp+60H], xmm11
       C4617829642450       vmovaps  qword ptr [rsp+50H], xmm12
       C46178296C2440       vmovaps  qword ptr [rsp+40H], xmm13
       C4617829742430       vmovaps  qword ptr [rsp+30H], xmm14
       C46178297C2420       vmovaps  qword ptr [rsp+20H], xmm15

G_M55664_IG02:
       488B81C0010000       mov      rax, qword ptr [rcx+448]
       488BD0               mov      rdx, rax
       4C8B81C8010000       mov      r8, qword ptr [rcx+456]
       4D8BC8               mov      r9, r8
       4C8B91D0010000       mov      r10, qword ptr [rcx+464]
       4D8BDA               mov      r11, r10
       488BB1D8010000       mov      rsi, qword ptr [rcx+472]
       488BB9E0010000       mov      rdi, qword ptr [rcx+480]
       488B99E8010000       mov      rbx, qword ptr [rcx+488]
       488B89F0010000       mov      rcx, qword ptr [rcx+496]
       488BE9               mov      rbp, rcx
       C4E17957C0           vxorpd   xmm0, xmm0, xmm0
       C4E17B100DDD020000   vmovsd   xmm1, qword ptr [reloc @RWD00]
       C4E17928D1           vmovapd  xmm2, xmm1
       C4E17157C9           vxorpd   xmm1, xmm1, xmm1
       C4E17310CA           vmovsd   xmm1, xmm1, xmm2
       C4E17114C9           vunpcklpd xmm1, xmm1, xmm1
       4533F6               xor      r14d, r14d
       41BF02000000         mov      r15d, 2

G_M55664_IG03:
       C4E179285500         vmovapd  xmm2, xmmword ptr [rbp]
       C4E179281E           vmovapd  xmm3, xmmword ptr [rsi]
       C4E1792827           vmovapd  xmm4, xmmword ptr [rdi]
       C4E179282B           vmovapd  xmm5, xmmword ptr [rbx]
       C4E16159DB           vmulpd   xmm3, xmm3, xmm3
       C4E15959E4           vmulpd   xmm4, xmm4, xmm4
       C4E15159ED           vmulpd   xmm5, xmm5, xmm5
       C4E16158DC           vaddpd   xmm3, xmm3, xmm4
       C4E16158DD           vaddpd   xmm3, xmm3, xmm5
       C4E16159DA           vmulpd   xmm3, xmm3, xmm2
       C4E17159DB           vmulpd   xmm3, xmm1, xmm3
       C4E17958C3           vaddpd   xmm0, xmm0, xmm3
       C4E1792822           vmovapd  xmm4, xmmword ptr [rdx]
       C4C1792829           vmovapd  xmm5, xmmword ptr [r9]
       C4C1792833           vmovapd  xmm6, xmmword ptr [r11]
       4533E4               xor      r12d, r12d

G_M55664_IG04:
       4183FC01             cmp      r12d, 1
       750A                 jne      SHORT G_M55664_IG05
       4183FF03             cmp      r15d, 3
       0F84C4010000         je       G_M55664_IG12

G_M55664_IG05:
       4585E4               test     r12d, r12d
       7507                 jne      SHORT G_M55664_IG06
       C4E16914DA           vunpcklpd xmm3, xmm2, xmm2
       EB05                 jmp      SHORT G_M55664_IG07

G_M55664_IG06:
       C4E16915DA           vunpckhpd xmm3, xmm2, xmm2

G_M55664_IG07:
       C4E17828FC           vmovaps  xmm7, xmm4
       C4617828C5           vmovaps  xmm8, xmm5
       C4617828CE           vmovaps  xmm9, xmm6
       458BEF               mov      r13d, r15d
       4183FD06             cmp      r13d, 6
       0F8D87010000         jge      G_M55664_IG11
       4889542418           mov      qword ptr [rsp+18H], rdx
       48895C2410           mov      qword ptr [rsp+10H], rbx
       C4E179290C24         vmovapd  xmmword ptr [rsp], xmm1

G_M55664_IG08:
       4963D5               movsxd   rdx, r13d
       48C1E203             shl      rdx, 3
       488D1C11             lea      rbx, [rcx+rdx]
       C461791013           vmovupd  xmm10, xmmword ptr [rbx]
       488D1C10             lea      rbx, [rax+rdx]
       C46179101B           vmovupd  xmm11, xmmword ptr [rbx]
       498D1C10             lea      rbx, [r8+rdx]
       C461791023           vmovupd  xmm12, xmmword ptr [rbx]
       4903D2               add      rdx, r10
       C46179102A           vmovupd  xmm13, xmmword ptr [rdx]
       C441415CDB           vsubpd   xmm11, xmm7, xmm11
       C441395CE4           vsubpd   xmm12, xmm8, xmm12
       C441315CED           vsubpd   xmm13, xmm9, xmm13
       C4612959D3           vmulpd   xmm10, xmm10, xmm3
       C4412159DB           vmulpd   xmm11, xmm11, xmm11
       C4411959E4           vmulpd   xmm12, xmm12, xmm12
       C4411159ED           vmulpd   xmm13, xmm13, xmm13
       C4412158DC           vaddpd   xmm11, xmm11, xmm12
       C4411158DB           vaddpd   xmm11, xmm13, xmm11
       C4617B1025CC010000   vmovsd   xmm12, qword ptr [reloc @RWD08]
       C4417928EC           vmovapd  xmm13, xmm12
       C4411957E4           vxorpd   xmm12, xmm12, xmm12
       C4411B10E5           vmovsd   xmm12, xmm12, xmm13
       C4411914E4           vunpcklpd xmm12, xmm12, xmm12
       C4617B102DB7010000   vmovsd   xmm13, qword ptr [reloc @RWD16]
       C4417928F5           vmovapd  xmm14, xmm13
       C4411157ED           vxorpd   xmm13, xmm13, xmm13
       C4411310EE           vmovsd   xmm13, xmm13, xmm14
       C4411114ED           vunpcklpd xmm13, xmm13, xmm13
       C4617B1035A2010000   vmovsd   xmm14, qword ptr [reloc @RWD24]
       C4417928FE           vmovapd  xmm15, xmm14
       C4410957F6           vxorpd   xmm14, xmm14, xmm14
       C4410B10F7           vmovsd   xmm14, xmm14, xmm15
       C4410914F6           vunpcklpd xmm14, xmm14, xmm14
       C4617B103D8D010000   vmovsd   xmm15, qword ptr [reloc @RWD32]
       C4C17928CF           vmovapd  xmm1, xmm15
       C4410157FF           vxorpd   xmm15, xmm15, xmm15
       C4610310F9           vmovsd   xmm15, xmm15, xmm1
       C4C10114CF           vunpcklpd xmm1, xmm15, xmm15
       C441795AFB           vcvtpd2ps xmm15, xmm11
       C4417852FF           vrsqrtps xmm15, xmm15
       C441785AFF           vcvtps2pd xmm15, xmm15
       C4412159DF           vmulpd   xmm11, xmm11, xmm15
       C4412159DF           vmulpd   xmm11, xmm11, xmm15
       C441195CDB           vsubpd   xmm11, xmm12, xmm11
       C4410959E3           vmulpd   xmm12, xmm14, xmm11
       C4411958E5           vaddpd   xmm12, xmm12, xmm13
       C4412159EB           vmulpd   xmm13, xmm11, xmm11
       C4E11159C9           vmulpd   xmm1, xmm13, xmm1
       C4C17158CC           vaddpd   xmm1, xmm1, xmm12
       C4410159DB           vmulpd   xmm11, xmm15, xmm11
       C4E12159C9           vmulpd   xmm1, xmm11, xmm1
       C4417158E7           vaddpd   xmm12, xmm1, xmm15
       C4412959D4           vmulpd   xmm10, xmm10, xmm12
       4183FD05             cmp      r13d, 5
       740B                 je       SHORT G_M55664_IG09
       C4C1795CC2           vsubpd   xmm0, xmm0, xmm10
       EB36                 jmp      SHORT G_M55664_IG10

G_M55664_IG09:
       C4C12B10CA           vmovsd   xmm1, xmm10
       C4617928D1           vmovapd  xmm10, xmm1
       C4E17157C9           vxorpd   xmm1, xmm1, xmm1
       C4C17310CA           vmovsd   xmm1, xmm1, xmm10
       C4412857D2           vxorps   xmm10, xmm10
       C4417928DA           vmovapd  xmm11, xmm10
       C4412957D2           vxorpd   xmm10, xmm10, xmm10
       C4412B10D3           vmovsd   xmm10, xmm10, xmm11
       C4E12914C9           vunpcklpd xmm1, xmm10, xmm1
       C4E1795CC1           vsubpd   xmm0, xmm0, xmm1

G_M55664_IG10:
       4183C502             add      r13d, 2
       4183FD06             cmp      r13d, 6
       0F8C9DFEFFFF         jl       G_M55664_IG08
       488B542418           mov      rdx, qword ptr [rsp+18H]
       488B5C2410           mov      rbx, qword ptr [rsp+10H]
       C4E179280C24         vmovapd  xmm1, xmmword ptr [rsp]

G_M55664_IG11:
       41FFC4               inc      r12d
       41FFC7               inc      r15d
       4183FC02             cmp      r12d, 2
       0F8C30FEFFFF         jl       G_M55664_IG04

G_M55664_IG12:
       4183C602             add      r14d, 2
       4883C510             add      rbp, 16
       4883C610             add      rsi, 16
       4883C710             add      rdi, 16
       4883C310             add      rbx, 16
       4883C210             add      rdx, 16
       4983C110             add      r9, 16
       4983C310             add      r11, 16
       4183FE06             cmp      r14d, 6
       0F8CB7FDFFFF         jl       G_M55664_IG03

G_M55664_IG13:
       C4E1797CC0           vhaddpd  xmm0, xmm0, xmm0

G_M55664_IG14:
       C4E17828B424B0000000 vmovaps  xmm6, qword ptr [rsp+B0H]
       C4E17828BC24A0000000 vmovaps  xmm7, qword ptr [rsp+A0H]
       C4617828842490000000 vmovaps  xmm8, qword ptr [rsp+90H]
       C46178288C2480000000 vmovaps  xmm9, qword ptr [rsp+80H]
       C4617828542470       vmovaps  xmm10, qword ptr [rsp+70H]
       C46178285C2460       vmovaps  xmm11, qword ptr [rsp+60H]
       C4617828642450       vmovaps  xmm12, qword ptr [rsp+50H]
       C46178286C2440       vmovaps  xmm13, qword ptr [rsp+40H]
       C4617828742430       vmovaps  xmm14, qword ptr [rsp+30H]
       C46178287C2420       vmovaps  xmm15, qword ptr [rsp+20H]
       4881C4C8000000       add      rsp, 200
       5B                   pop      rbx
       5D                   pop      rbp
       5E                   pop      rsi
       5F                   pop      rdi
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       C3                   ret      

; Total bytes of code 900, prolog size 104 for method NBodyHWIntrinsics.NBody:Energy():double:this
; ============================================================
-0,169074641
Elapsed Enenrgy origin: 194ÿ921
; Assembly listing for method NBodyHWIntrinsics.NBody:Advance(int,double):this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rsp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T19] ( 12,208   )   byref  ->  rcx         this
;  V01 arg1         [V01,T58] (  4, 18   )     int  ->  [rsp+0x138]  
;  V02 arg2         [V02,T60] (  3,  3   )  double  ->  mm2        
;  V03 loc0         [V03,T42] (  5,113   )  simd16  ->  [rsp+0x30]  
;  V04 loc1         [V04,T51] (  5, 66   )    long  ->   r8        
;  V05 loc2         [V05,T52] (  5, 66   )    long  ->  r10        
;  V06 loc3         [V06,T53] (  5, 66   )    long  ->  rsi        
;  V07 loc4         [V07,T43] (  7, 98   )    long  ->  [rsp+0x28]  
;  V08 loc5         [V08,T54] (  4, 50   )    long  ->  [rsp+0x20]  
;  V09 loc6         [V09,T55] (  4, 50   )    long  ->  [rsp+0x18]  
;  V10 loc7         [V10,T56] (  4, 50   )    long  ->  r15        
;  V11 loc8         [V11,T46] (  6, 74   )     int  ->  r12        
;  V12 loc9         [V12,T44] (  7, 98   )     int  ->  r13        
;  V13 loc10        [V13,T45] (  2, 80   )  simd16  ->  [rsp+0x00]  
;  V14 loc11        [V14,T31] (  6,144   )  simd16  ->  mm2        
;  V15 loc12        [V15,T32] (  6,144   )  simd16  ->  mm3        
;  V16 loc13        [V16,T33] (  6,144   )  simd16  ->  mm4        
;  V17 loc14        [V17,T11] ( 10,256   )  simd16  ->  mm5        
;  V18 loc15        [V18,T29] (  4,160   )  simd16  ->  mm6        
;  V19 loc16        [V19,T30] (  4,160   )  simd16  ->  mm7        
;  V20 loc17        [V20,T10] (  6,288   )     int  ->  rdx        
;  V21 loc18        [V21,T05] (  7,448   )  simd16  ->  mm8        
;  V22 loc19        [V22,T06] (  7,448   )  simd16  ->  mm9        
;  V23 loc20        [V23,T07] (  7,448   )  simd16  ->  mm10        
;  V24 loc21        [V24,T00] ( 10,640   )  simd16  ->  mm13        
;  V25 loc22        [V25,T12] (  4,256   )  simd16  ->  mm11        
;  V26 loc23        [V26,T13] (  4,256   )  simd16  ->  mm11        
;# V27 OutArgs      [V27    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V28 tmp1         [V28,T57] (  3, 48   )     int  ->  rax        
;  V29 tmp2         [V29,T15] (  2,256   )  simd16  ->  mm11        
;  V30 tmp3         [V30,T16] (  2,256   )  simd16  ->  mm0        
;  V31 tmp4         [V31,T59] (  3,  3   )  simd16  ->  mm1        
;  V32 tmp5         [V32,T02] (  4,512   )  simd16  ->  mm11        
;  V33 tmp6         [V33,T17] (  2,256   )  simd16  ->  mm12        
;  V34 tmp7         [V34,T03] (  4,512   )  simd16  ->  mm13        
;* V35 tmp8         [V35    ] (  0,  0   )  simd16  ->  zero-ref   
;  V36 tmp9         [V36,T20] (  3,192   )  simd16  ->  mm12        
;  V37 tmp10        [V37,T04] (  4,512   )  simd16  ->  mm11        
;  V38 tmp11        [V38,T14] (  4,256   )  simd16  ->  mm14        
;  V39 tmp12        [V39,T34] (  2,128   )  simd16  ->  mm15        
;  V40 tmp13        [V40,T35] (  2,128   )  simd16  ->  mm14        
;  V41 tmp14        [V41,T36] (  2,128   )  simd16  ->  mm11        
;  V42 tmp15        [V42,T21] (  3,192   )  simd16  ->  mm11        
;  V43 tmp16        [V43,T18] (  2,256   )  simd16  ->  mm12        
;  V44 tmp17        [V44,T37] (  2,128   )  simd16  ->  mm14        
;  V45 tmp18        [V45,T38] (  2,128   )  simd16  ->  mm0        
;  V46 tmp19        [V46,T39] (  2,128   )  simd16  ->  mm1        
;* V47 tmp20        [V47    ] (  0,  0   )  simd16  ->  zero-ref   
;  V48 tmp21        [V48,T08] (  5,320   )  simd16  ->  mm15        
;  V49 tmp22        [V49,T09] (  5,320   )  simd16  ->  mm12        
;  V50 tmp23        [V50,T40] (  2,128   )  simd16  ->  mm0        
;  V51 tmp24        [V51,T41] (  2,128   )  simd16  ->  mm0        
;  V52 tmp25        [V52,T22] (  3,192   )  simd16  ->  mm12        
;  V53 tmp26        [V53,T23] (  3,192   )  simd16  ->  mm14        
;  V54 tmp27        [V54,T24] (  3,192   )  simd16  ->  mm15        
;  V55 tmp28        [V55,T25] (  3,192   )  simd16  ->  mm15        
;  V56 cse0         [V56,T26] (  3,192   )    long  ->  rbp        
;  V57 cse1         [V57,T27] (  3,192   )    long  ->  rbp        
;  V58 cse2         [V58,T28] (  3,192   )    long  ->  rbp        
;  V59 cse3         [V59,T01] (  8,512   )    long  ->  rbx        
;  V60 cse4         [V60,T47] (  3, 68   )    long  ->  rdi        
;  V61 cse5         [V61,T48] (  3, 68   )    long  ->  rax        
;  V62 cse6         [V62,T49] (  3, 68   )    long  ->   r9        
;  V63 cse7         [V63,T50] (  3, 68   )    long  ->  r11        
;
; Lcl frame size = 232

G_M31513_IG01:
       4157                 push     r15
       4156                 push     r14
       4155                 push     r13
       4154                 push     r12
       57                   push     rdi
       56                   push     rsi
       55                   push     rbp
       53                   push     rbx
       4881ECE8000000       sub      rsp, 232
       C5F877               vzeroupper 
       C4E17829B424D0000000 vmovaps  qword ptr [rsp+D0H], xmm6
       C4E17829BC24C0000000 vmovaps  qword ptr [rsp+C0H], xmm7
       C46178298424B0000000 vmovaps  qword ptr [rsp+B0H], xmm8
       C46178298C24A0000000 vmovaps  qword ptr [rsp+A0H], xmm9
       C4617829942490000000 vmovaps  qword ptr [rsp+90H], xmm10
       C46178299C2480000000 vmovaps  qword ptr [rsp+80H], xmm11
       C4617829642470       vmovaps  qword ptr [rsp+70H], xmm12
       C46178296C2460       vmovaps  qword ptr [rsp+60H], xmm13
       C4617829742450       vmovaps  qword ptr [rsp+50H], xmm14
       C46178297C2440       vmovaps  qword ptr [rsp+40H], xmm15

G_M31513_IG02:
       C4E17157C9           vxorpd   xmm1, xmm1, xmm1
       C4E17310CA           vmovsd   xmm1, xmm1, xmm2
       C4E17114C1           vunpcklpd xmm0, xmm1, xmm1
       E960030000           jmp      G_M31513_IG09

G_M31513_IG03:
       488B81C0010000       mov      rax, qword ptr [rcx+448]
       4C8BC0               mov      r8, rax
       4C8B89C8010000       mov      r9, qword ptr [rcx+456]
       4D8BD1               mov      r10, r9
       4C8B99D0010000       mov      r11, qword ptr [rcx+464]
       498BF3               mov      rsi, r11
       488BB9D8010000       mov      rdi, qword ptr [rcx+472]
       488BDF               mov      rbx, rdi
       488BA9E0010000       mov      rbp, qword ptr [rcx+480]
       4C8BB1E8010000       mov      r14, qword ptr [rcx+488]
       4C8BB9F0010000       mov      r15, qword ptr [rcx+496]
       4533E4               xor      r12d, r12d
       41BD02000000         mov      r13d, 2

G_M31513_IG04:
       C4C17B120F           vmovddup xmm1, xmmword ptr [r15]
       C4E179290C24         vmovapd  xmmword ptr [rsp], xmm1
       C4C17B1210           vmovddup xmm2, xmmword ptr [r8]
       C4C17B121A           vmovddup xmm3, xmmword ptr [r10]
       C4E17B1226           vmovddup xmm4, xmmword ptr [rsi]
       C4E17B122B           vmovddup xmm5, xmmword ptr [rbx]
       C4E17B127500         vmovddup xmm6, xmmword ptr [rbp]
       4C89742418           mov      qword ptr [rsp+18H], r14
       C4C17B123E           vmovddup xmm7, xmmword ptr [r14]
       418BD5               mov      edx, r13d
       C1EA1F               shr      edx, 31
       4103D5               add      edx, r13d
       83E2FE               and      edx, -2
       458BF5               mov      r14d, r13d
       442BF2               sub      r14d, edx
       418BD5               mov      edx, r13d
       412BD6               sub      edx, r14d
       83FA06               cmp      edx, 6
       0F8D2D020000         jge      G_M31513_IG07
       C4E17929442430       vmovapd  xmmword ptr [rsp+30H], xmm0
       48895C2428           mov      qword ptr [rsp+28H], rbx
       48896C2420           mov      qword ptr [rsp+20H], rbp

G_M31513_IG05:
       4863DA               movsxd   rbx, edx
       48C1E303             shl      rbx, 3
       488D2C18             lea      rbp, [rax+rbx]
       C46179284500         vmovapd  xmm8, xmmword ptr [rbp]
       498D2C19             lea      rbp, [r9+rbx]
       C46179284D00         vmovapd  xmm9, xmmword ptr [rbp]
       498D2C1B             lea      rbp, [r11+rbx]
       C46179285500         vmovapd  xmm10, xmmword ptr [rbp]
       C4613959C2           vmulpd   xmm8, xmm8, xmm2
       C4613159CB           vmulpd   xmm9, xmm9, xmm3
       C4612959D4           vmulpd   xmm10, xmm10, xmm4
       C4413959D8           vmulpd   xmm11, xmm8, xmm8
       C4413159E1           vmulpd   xmm12, xmm9, xmm9
       C4412959EA           vmulpd   xmm13, xmm10, xmm10
       C4412158DC           vaddpd   xmm11, xmm11, xmm12
       C4412158ED           vaddpd   xmm13, xmm11, xmm13
       C4617B101DF1020000   vmovsd   xmm11, qword ptr [reloc @RWD00]
       C4417928E3           vmovapd  xmm12, xmm11
       C4412157DB           vxorpd   xmm11, xmm11, xmm11
       C4412310DC           vmovsd   xmm11, xmm11, xmm12
       C441795AE5           vcvtpd2ps xmm12, xmm13
       C4417853E4           vrcpps   xmm12, xmm12
       C441785AE4           vcvtps2pd xmm12, xmm12
       C4412114DB           vunpcklpd xmm11, xmm11, xmm11
       C4411159F4           vmulpd   xmm14, xmm13, xmm12
       C441215CF6           vsubpd   xmm14, xmm11, xmm14
       C4410959FE           vmulpd   xmm15, xmm14, xmm14
       C4412158F6           vaddpd   xmm14, xmm11, xmm14
       C4412158DF           vaddpd   xmm11, xmm11, xmm15
       C4410959DB           vmulpd   xmm11, xmm14, xmm11
       C4412159DC           vmulpd   xmm11, xmm11, xmm12
       C4617B1025AA020000   vmovsd   xmm12, qword ptr [reloc @RWD08]
       C4417928F4           vmovapd  xmm14, xmm12
       C4411957E4           vxorpd   xmm12, xmm12, xmm12
       C4411B10E6           vmovsd   xmm12, xmm12, xmm14
       C4411914E4           vunpcklpd xmm12, xmm12, xmm12
       C4617B103595020000   vmovsd   xmm14, qword ptr [reloc @RWD16]
       C4417928FE           vmovapd  xmm15, xmm14
       C4410957F6           vxorpd   xmm14, xmm14, xmm14
       C4410B10F7           vmovsd   xmm14, xmm14, xmm15
       C4410914F6           vunpcklpd xmm14, xmm14, xmm14
       C4617B103D80020000   vmovsd   xmm15, qword ptr [reloc @RWD24]
       C4C17928C7           vmovapd  xmm0, xmm15
       C4410157FF           vxorpd   xmm15, xmm15, xmm15
       C4610310F8           vmovsd   xmm15, xmm15, xmm0
       C4C10114C7           vunpcklpd xmm0, xmm15, xmm15
       C4617B103D6B020000   vmovsd   xmm15, qword ptr [reloc @RWD32]
       C4C17928CF           vmovapd  xmm1, xmm15
       C4410157FF           vxorpd   xmm15, xmm15, xmm15
       C4610310F9           vmovsd   xmm15, xmm15, xmm1
       C4C10114CF           vunpcklpd xmm1, xmm15, xmm15
       C441795AFD           vcvtpd2ps xmm15, xmm13
       C4417852FF           vrsqrtps xmm15, xmm15
       C441785AFF           vcvtps2pd xmm15, xmm15
       C4411159EF           vmulpd   xmm13, xmm13, xmm15
       C4411159EF           vmulpd   xmm13, xmm13, xmm15
       C441195CE5           vsubpd   xmm12, xmm12, xmm13
       C4C17959C4           vmulpd   xmm0, xmm0, xmm12
       C4C17958C6           vaddpd   xmm0, xmm0, xmm14
       C4411959EC           vmulpd   xmm13, xmm12, xmm12
       C4E11159C9           vmulpd   xmm1, xmm13, xmm1
       C4E17158C0           vaddpd   xmm0, xmm1, xmm0
       C4C10159CC           vmulpd   xmm1, xmm15, xmm12

G_M31513_IG06:
       C4E17159C0           vmulpd   xmm0, xmm1, xmm0
       C4C17958C7           vaddpd   xmm0, xmm0, xmm15
       C4612159E8           vmulpd   xmm13, xmm11, xmm0
       C4E17928442430       vmovapd  xmm0, xmmword ptr [rsp+30H]
       C4611159E8           vmulpd   xmm13, xmm13, xmm0
       C4E179280C24         vmovapd  xmm1, xmmword ptr [rsp]
       C4417159DD           vmulpd   xmm11, xmm1, xmm13
       488D2C1F             lea      rbp, [rdi+rbx]
       C4412159E0           vmulpd   xmm12, xmm11, xmm8
       C46179287500         vmovapd  xmm14, xmmword ptr [rbp]
       C441095CE4           vsubpd   xmm12, xmm14, xmm12
       C46179296500         vmovapd  xmmword ptr [rbp], xmm12
       488BEB               mov      rbp, rbx
       4803A9E0010000       add      rbp, qword ptr [rcx+480]
       C4412159E1           vmulpd   xmm12, xmm11, xmm9
       C46179287500         vmovapd  xmm14, xmmword ptr [rbp]
       C441095CE4           vsubpd   xmm12, xmm14, xmm12
       C46179296500         vmovapd  xmmword ptr [rbp], xmm12
       488BEB               mov      rbp, rbx
       4803A9E8010000       add      rbp, qword ptr [rcx+488]
       C4412159DA           vmulpd   xmm11, xmm11, xmm10
       C46179286500         vmovapd  xmm12, xmmword ptr [rbp]
       C441195CDB           vsubpd   xmm11, xmm12, xmm11
       C46179295D00         vmovapd  xmmword ptr [rbp], xmm11
       480399F0010000       add      rbx, qword ptr [rcx+496]
       C46179281B           vmovapd  xmm11, xmmword ptr [rbx]
       C4412159DD           vmulpd   xmm11, xmm11, xmm13
       C4412159C0           vmulpd   xmm8, xmm11, xmm8
       C4C15158E8           vaddpd   xmm5, xmm5, xmm8
       C4412159C1           vmulpd   xmm8, xmm11, xmm9
       C4C14958F0           vaddpd   xmm6, xmm6, xmm8
       C4412159C2           vmulpd   xmm8, xmm11, xmm10
       C4C14158F8           vaddpd   xmm7, xmm7, xmm8
       83C202               add      edx, 2
       83FA06               cmp      edx, 6
       C4E179290C24         vmovapd  xmmword ptr [rsp], xmm1
       0F8C27010000         jl       G_M31513_IG11
       488B5C2428           mov      rbx, qword ptr [rsp+28H]
       488B6C2420           mov      rbp, qword ptr [rsp+20H]

G_M31513_IG07:
       C4E1517CCD           vhaddpd  xmm1, xmm5, xmm5
       C4E17B110B           vmovsd   xmmword ptr [rbx], xmm1
       C4E1517CCD           vhaddpd  xmm1, xmm5, xmm5
       C4E17B110B           vmovsd   xmmword ptr [rbx], xmm1
       C4E1517CCD           vhaddpd  xmm1, xmm5, xmm5
       C4E17B110B           vmovsd   xmmword ptr [rbx], xmm1
       C4E15159E8           vmulpd   xmm5, xmm5, xmm0
       C4E16958D5           vaddpd   xmm2, xmm2, xmm5
       C4E14959C8           vmulpd   xmm1, xmm6, xmm0
       C4E16158D9           vaddpd   xmm3, xmm3, xmm1
       C4E14159C8           vmulpd   xmm1, xmm7, xmm0
       C4E15958E1           vaddpd   xmm4, xmm4, xmm1
       C4E1697CD2           vhaddpd  xmm2, xmm2, xmm2
       C4C17B1110           vmovsd   xmmword ptr [r8], xmm2
       C4E1617CDB           vhaddpd  xmm3, xmm3, xmm3
       C4C17B111A           vmovsd   xmmword ptr [r10], xmm3
       C4E1597CE4           vhaddpd  xmm4, xmm4, xmm4
       C4E17B1126           vmovsd   xmmword ptr [rsi], xmm4
       4585E4               test     r12d, r12d
       7506                 jne      SHORT G_M31513_IG08
       41BC01000000         mov      r12d, 1

G_M31513_IG08:
       41FFC4               inc      r12d
       41FFC5               inc      r13d
       4983C708             add      r15, 8
       4883C308             add      rbx, 8
       4883C508             add      rbp, 8
       4C8B742418           mov      r14, qword ptr [rsp+18H]
       4983C608             add      r14, 8
       4983C008             add      r8, 8
       4983C208             add      r10, 8
       4883C608             add      rsi, 8
       4183FC06             cmp      r12d, 6
       0F8CF2FCFFFF         jl       G_M31513_IG04
       8B942438010000       mov      edx, dword ptr [rsp+138H]

G_M31513_IG09:
       8BC2                 mov      eax, edx
       8D50FF               lea      edx, [rax-1]
       89942438010000       mov      dword ptr [rsp+138H], edx
       85C0                 test     eax, eax
       0F8F91FCFFFF         jg       G_M31513_IG03

G_M31513_IG10:
       C4E17828B424D0000000 vmovaps  xmm6, qword ptr [rsp+D0H]
       C4E17828BC24C0000000 vmovaps  xmm7, qword ptr [rsp+C0H]
       C46178288424B0000000 vmovaps  xmm8, qword ptr [rsp+B0H]
       C46178288C24A0000000 vmovaps  xmm9, qword ptr [rsp+A0H]
       C4617828942490000000 vmovaps  xmm10, qword ptr [rsp+90H]
       C46178289C2480000000 vmovaps  xmm11, qword ptr [rsp+80H]
       C4617828642470       vmovaps  xmm12, qword ptr [rsp+70H]
       C46178286C2460       vmovaps  xmm13, qword ptr [rsp+60H]
       C4617828742450       vmovaps  xmm14, qword ptr [rsp+50H]
       C46178287C2440       vmovaps  xmm15, qword ptr [rsp+40H]
       4881C4E8000000       add      rsp, 232
       5B                   pop      rbx
       5D                   pop      rbp
       5E                   pop      rsi
       5F                   pop      rdi
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       C3                   ret      

G_M31513_IG11:
       C4E17929442430       vmovapd  xmmword ptr [rsp+30H], xmm0
       E9C0FCFFFF           jmp      G_M31513_IG05

; Total bytes of code 1129, prolog size 110 for method NBodyHWIntrinsics.NBody:Advance(int,double):this
; ============================================================
Elapsed Advance: 81ÿ481ÿ899
NaN
Elapsed Enenrgy target: 323ÿ104
Elapsed total time: 82ÿ413ÿ011
