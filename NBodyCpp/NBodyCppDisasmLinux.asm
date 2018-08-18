; Assembly listing for method NBodySystem:Main(ref)

       41BC80F0FA02         mov      r12d, 0x2FAF080
       E915030000           jmp      G_M62159_IG23

G_M62159_IG09:
       33C0                 xor      eax, eax
       33F6                 xor      esi, esi

G_M62159_IG10:
       4863D0               movsxd   rdx, eax
       48C1E206             shl      rdx, 6
       480355C8             add      rdx, qword ptr [rbp-38H]
       8D4801               lea      ecx, [rax+1]
       83F905               cmp      ecx, 5
       7D4E                 jge      SHORT G_M62159_IG12

G_M62159_IG11:
       4C63C1               movsxd   r8, ecx
       49C1E006             shl      r8, 6
       4C0345C8             add      r8, qword ptr [rbp-38H]
       4C63CE               movsxd   r9, esi
       49C1E105             shl      r9, 5
       4C03CB               add      r9, rbx
       F20F1002             movsd    xmm0, qword ptr [rdx]
       F2410F5C00           subsd    xmm0, qword ptr [r8]
       F2410F1101           movsd    qword ptr [r9], xmm0
       F20F104208           movsd    xmm0, qword ptr [rdx+8]
       F2410F5C4008         subsd    xmm0, qword ptr [r8+8]
       F2410F114108         movsd    qword ptr [r9+8], xmm0
       F20F104210           movsd    xmm0, qword ptr [rdx+16]
       F2410F5C4010         subsd    xmm0, qword ptr [r8+16]
       F2410F114110         movsd    qword ptr [r9+16], xmm0
       FFC1                 inc      ecx
       FFC6                 inc      esi
       83F905               cmp      ecx, 5
       7CB2                 jl       SHORT G_M62159_IG11

G_M62159_IG12:
       FFC0                 inc      eax
       83F804               cmp      eax, 4
       7C98                 jl       SHORT G_M62159_IG10

G_M62159_IG13:
       33C0                 xor      eax, eax

G_M62159_IG14:
       4863F0               movsxd   rsi, eax
       48C1E605             shl      rsi, 5
       4803F3               add      rsi, rbx
       0F57C0               xorps    xmm0, xmm0
       660F1206             movlpd   xmm0, xmmword ptr [rsi]
       488BD6               mov      rdx, rsi
       3912                 cmp      dword ptr [rdx], edx
       4883C208             add      rdx, 8
       0F57C9               xorps    xmm1, xmm1
       660F120A             movlpd   xmm1, xmmword ptr [rdx]
       488BD6               mov      rdx, rsi
       3912                 cmp      dword ptr [rdx], edx
       4883C210             add      rdx, 16
       0F57D2               xorps    xmm2, xmm2
       660F1212             movlpd   xmm2, xmmword ptr [rdx]
       8D7001               lea      esi, [rax+1]
       4863F6               movsxd   rsi, esi
       48C1E605             shl      rsi, 5
       4803F3               add      rsi, rbx
       660F1606             movhpd   xmm0, xmmword ptr [rsi]
       488BD6               mov      rdx, rsi
       3912                 cmp      dword ptr [rdx], edx
       4883C208             add      rdx, 8
       660F160A             movhpd   xmm1, xmmword ptr [rdx]
       488BD6               mov      rdx, rsi
       3912                 cmp      dword ptr [rdx], edx
       4883C210             add      rdx, 16
       660F1612             movhpd   xmm2, xmmword ptr [rdx]
       0F28D8               movaps   xmm3, xmm0
       660F59D8             mulpd    xmm3, xmm0
       0F28C1               movaps   xmm0, xmm1
       660F59C1             mulpd    xmm0, xmm1
       0F28CA               movaps   xmm1, xmm2
       660F59CA             mulpd    xmm1, xmm2
       660F58D8             addpd    xmm3, xmm0
       0F28C3               movaps   xmm0, xmm3
       660F58C1             addpd    xmm0, xmm1
       0F28C8               movaps   xmm1, xmm0
       0F28C1               movaps   xmm0, xmm1
       660F5AC9             cvtpd2ps  xmm1, xmm1
       0F52C9               rsqrtps  xmm1, xmm1
       0F5AC9               cvtps2pd  xmm1, xmm1
       33F6                 xor      esi, esi

G_M62159_IG15:
       F20F101513030000     movsd    xmm2, qword ptr [reloc @RWD00]
       660F28DA             movapd   xmm3, xmm2
       660F57D2             xorpd    xmm2, xmm2
       F20F10D3             movsd    xmm2, xmm3
       0F28DA               movaps   xmm3, xmm2
       660F14DA             unpcklpd  xmm3, xmm2
       F20F101500030000     movsd    xmm2, qword ptr [reloc @RWD08]
       660F28E2             movapd   xmm4, xmm2
       660F57D2             xorpd    xmm2, xmm2
       F20F10D4             movsd    xmm2, xmm4
       0F28E2               movaps   xmm4, xmm2
       660F14E2             unpcklpd  xmm4, xmm2
       0F28D1               movaps   xmm2, xmm1
       660F59D3             mulpd    xmm2, xmm3
       0F28DC               movaps   xmm3, xmm4
       660F59D8             mulpd    xmm3, xmm0
       660F59D9             mulpd    xmm3, xmm1
       660F59D9             mulpd    xmm3, xmm1
       660F59D9             mulpd    xmm3, xmm1
       0F28CA               movaps   xmm1, xmm2
       660F5CCB             subpd    xmm1, xmm3
       FFC6                 inc      esi
       83FE02               cmp      esi, 2
       7CA2                 jl       SHORT G_M62159_IG15

G_M62159_IG16:
       F20F1015C5020000     movsd    xmm2, qword ptr [reloc @RWD16]
       660F28DA             movapd   xmm3, xmm2
       660F57D2             xorpd    xmm2, xmm2
       F20F10D3             movsd    xmm2, xmm3
       0F28DA               movaps   xmm3, xmm2
       660F14DA             unpcklpd  xmm3, xmm2
       0F28D3               movaps   xmm2, xmm3
       660F5ED0             divpd    xmm2, xmm0
       0F28C2               movaps   xmm0, xmm2
       660F59C1             mulpd    xmm0, xmm1
       4863F0               movsxd   rsi, eax
       498D34F7             lea      rsi, [r15+8*rsi]
       660F2906             movapd   xmmword ptr [rsi], xmm0
       83C002               add      eax, 2
       83F80A               cmp      eax, 10
       0F8CD4FEFFFF         jl       G_M62159_IG14

G_M62159_IG17:
       4533E4               xor      r12d, r12d
       4533ED               xor      r13d, r13d

G_M62159_IG18:
       4963C4               movsxd   rax, r12d
       48C1E006             shl      rax, 6
       480345C8             add      rax, qword ptr [rbp-38H]
       418D742401           lea      esi, [r12+1]
       83FE05               cmp      esi, 5
       0F8DF1000000         jge      G_M62159_IG20

G_M62159_IG19:
       4963D5               movsxd   rdx, r13d
       48C1E205             shl      rdx, 5
       4803D3               add      rdx, rbx
       4863CE               movsxd   rcx, esi
       48C1E106             shl      rcx, 6
       48034DC8             add      rcx, qword ptr [rbp-38H]
       4C8D4020             lea      r8, bword ptr [rax+32]
       F2410F1000           movsd    xmm0, qword ptr [r8]
       F20F100A             movsd    xmm1, qword ptr [rdx]
       F20F594938           mulsd    xmm1, qword ptr [rcx+56]
       4D63CD               movsxd   r9, r13d
       F2430F590CCF         mulsd    xmm1, qword ptr [r15+8*r9]
       F20F5CC1             subsd    xmm0, xmm1
       F2410F1100           movsd    qword ptr [r8], xmm0
       4C8D4028             lea      r8, bword ptr [rax+40]
       F2410F1000           movsd    xmm0, qword ptr [r8]
       F20F104A08           movsd    xmm1, qword ptr [rdx+8]
       F20F594938           mulsd    xmm1, qword ptr [rcx+56]
       4D63CD               movsxd   r9, r13d
       F2430F590CCF         mulsd    xmm1, qword ptr [r15+8*r9]
       F20F5CC1             subsd    xmm0, xmm1
       F2410F1100           movsd    qword ptr [r8], xmm0
       4C8D4030             lea      r8, bword ptr [rax+48]
       F2410F1000           movsd    xmm0, qword ptr [r8]
       F20F104A10           movsd    xmm1, qword ptr [rdx+16]
       F20F594938           mulsd    xmm1, qword ptr [rcx+56]
       4D63CD               movsxd   r9, r13d
       F2430F590CCF         mulsd    xmm1, qword ptr [r15+8*r9]
       F20F5CC1             subsd    xmm0, xmm1
       F2410F1100           movsd    qword ptr [r8], xmm0
       4C8D4120             lea      r8, bword ptr [rcx+32]
       F20F1002             movsd    xmm0, qword ptr [rdx]
       F20F594038           mulsd    xmm0, qword ptr [rax+56]
       4D63CD               movsxd   r9, r13d
       F2430F5904CF         mulsd    xmm0, qword ptr [r15+8*r9]
       F2410F5800           addsd    xmm0, qword ptr [r8]
       F2410F1100           movsd    qword ptr [r8], xmm0
       4C8D4128             lea      r8, bword ptr [rcx+40]
       F20F104208           movsd    xmm0, qword ptr [rdx+8]
       F20F594038           mulsd    xmm0, qword ptr [rax+56]
       4D63CD               movsxd   r9, r13d
       F2430F5904CF         mulsd    xmm0, qword ptr [r15+8*r9]
       F2410F5800           addsd    xmm0, qword ptr [r8]
       F2410F1100           movsd    qword ptr [r8], xmm0
       4883C130             add      rcx, 48
       F20F104210           movsd    xmm0, qword ptr [rdx+16]
       F20F594038           mulsd    xmm0, qword ptr [rax+56]
       4963D5               movsxd   rdx, r13d
       F2410F5904D7         mulsd    xmm0, qword ptr [r15+8*rdx]
       F20F5801             addsd    xmm0, qword ptr [rcx]
       F20F1101             movsd    qword ptr [rcx], xmm0
       FFC6                 inc      esi
       41FFC5               inc      r13d
       83FE05               cmp      esi, 5
       0F8C0FFFFFFF         jl       G_M62159_IG19

G_M62159_IG20:
       41FFC4               inc      r12d
       4183FC04             cmp      r12d, 4
       0F8CE9FEFFFF         jl       G_M62159_IG18

G_M62159_IG21:
       33C0                 xor      eax, eax

G_M62159_IG22:
       4863F0               movsxd   rsi, eax
       48C1E606             shl      rsi, 6
       480375C8             add      rsi, qword ptr [rbp-38H]
       F20F104620           movsd    xmm0, qword ptr [rsi+32]
       F20F59055E010000     mulsd    xmm0, qword ptr [reloc @RWD24]
       F20F5806             addsd    xmm0, qword ptr [rsi]
       F20F1106             movsd    qword ptr [rsi], xmm0
       488D5608             lea      rdx, bword ptr [rsi+8]
       F20F104628           movsd    xmm0, qword ptr [rsi+40]
       F20F59054D010000     mulsd    xmm0, qword ptr [reloc @RWD32]
       F20F5802             addsd    xmm0, qword ptr [rdx]
       F20F1102             movsd    qword ptr [rdx], xmm0
       488D5610             lea      rdx, bword ptr [rsi+16]
       F20F104630           movsd    xmm0, qword ptr [rsi+48]
       F20F59053C010000     mulsd    xmm0, qword ptr [reloc @RWD40]
       F20F5802             addsd    xmm0, qword ptr [rdx]
       F20F1102             movsd    qword ptr [rdx], xmm0
       FFC0                 inc      eax
       83F805               cmp      eax, 5
       7CA7                 jl       SHORT G_M62159_IG22
       448BE7               mov      r12d, edi

G_M62159_IG23:
       418D7C24FF           lea      edi, [r12-1]
       4585E4               test     NaN r12d, r12d
       0F8FDDFCFFFF         jg       G_M62159_IG09
