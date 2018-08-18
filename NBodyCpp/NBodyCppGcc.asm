        mov     rcx, QWORD PTR [rsp+8]
        xor     esi, esi
        mov     rdx, QWORD PTR [rsp+72]
        mov     rax, QWORD PTR [rsp+136]
        mov     rdi, QWORD PTR [rsp+192]
        movsd   xmm2, QWORD PTR [rsp]
        movsd   xmm8, QWORD PTR [rsp+64]
        movsd   xmm5, QWORD PTR [rsp+16]
        movsd   xmm1, QWORD PTR [rsp+80]
        movsd   xmm9, QWORD PTR [rsp+128]
        movsd   xmm0, QWORD PTR [rsp+144]
        movsd   xmm15, QWORD PTR [rsp+200]
        movsd   xmm11, QWORD PTR [rsp+208]
        movsd   xmm12, QWORD PTR [rsp+256]
        movsd   xmm14, QWORD PTR [rsp+264]
        movsd   xmm13, QWORD PTR [rsp+272]
        movapd  xmm7, XMMWORD PTR .LC33[rip]
        movapd  xmm4, XMMWORD PTR .LC34[rip]
        movapd  xmm6, XMMWORD PTR .LC35[rip]
        movsd   xmm3, QWORD PTR .LC36[rip]
.L76:
        movq    xmm10, rcx
        unpcklpd        xmm12, xmm14
        movapd  xmm14, xmm1
        unpcklpd        xmm2, xmm10
        movq    xmm10, rdx
        subsd   xmm14, xmm0
        unpcklpd        xmm8, xmm10
        movapd  xmm10, xmm2
        subpd   xmm10, xmm8
        movsd   QWORD PTR NBodySystem::advance(double)::r[rip+144], xmm14
        movaps  XMMWORD PTR NBodySystem::advance(double)::r[rip], xmm10
        movapd  xmm10, xmm5
        subsd   xmm10, xmm1
        movsd   QWORD PTR NBodySystem::advance(double)::r[rip+16], xmm10
        movq    rdx, xmm10
        movq    xmm10, rax
        unpcklpd        xmm9, xmm10
        movapd  xmm10, xmm2
        subpd   xmm10, xmm9
        movaps  XMMWORD PTR NBodySystem::advance(double)::r[rip+32], xmm10
        movapd  xmm10, xmm5
        subsd   xmm10, xmm0
        movsd   QWORD PTR NBodySystem::advance(double)::r[rip+48], xmm10
        movq    rcx, xmm10
        movq    xmm10, rdi
        unpcklpd        xmm10, xmm15
        movapd  xmm15, xmm2
        subpd   xmm2, xmm12
        subpd   xmm15, xmm10
        movaps  XMMWORD PTR NBodySystem::advance(double)::r[rip+96], xmm2
        movapd  xmm2, xmm8
        movaps  XMMWORD PTR NBodySystem::advance(double)::r[rip+64], xmm15
        subpd   xmm2, xmm9
        movapd  xmm15, xmm5
        subsd   xmm5, xmm13
        subsd   xmm15, xmm11
        movaps  XMMWORD PTR NBodySystem::advance(double)::r[rip+128], xmm2
        movapd  xmm2, xmm8
        subpd   xmm8, xmm12
        movq    r8, xmm5
        movsd   QWORD PTR NBodySystem::advance(double)::r[rip+112], xmm5
        movapd  xmm5, xmm1
        movsd   QWORD PTR NBodySystem::advance(double)::r[rip+80], xmm15
        subsd   xmm1, xmm13
        subsd   xmm5, xmm11
        movaps  XMMWORD PTR NBodySystem::advance(double)::r[rip+192], xmm8
        subpd   xmm2, xmm10
        movapd  xmm8, xmm1
        movsd   QWORD PTR NBodySystem::advance(double)::r[rip+208], xmm1
        movapd  xmm1, xmm9
        subpd   xmm1, xmm10
        movq    rdi, xmm5
        movsd   QWORD PTR NBodySystem::advance(double)::r[rip+176], xmm5
        movapd  xmm5, xmm0
        subpd   xmm9, xmm12
        movaps  XMMWORD PTR NBodySystem::advance(double)::r[rip+160], xmm2
        movq    xmm2, rdx
        xor     edx, edx
        subsd   xmm0, xmm13
        subpd   xmm10, xmm12
        movaps  XMMWORD PTR NBodySystem::advance(double)::r[rip+224], xmm1
        movq    xmm1, QWORD PTR NBodySystem::advance(double)::r[rip]
        movaps  XMMWORD PTR NBodySystem::advance(double)::r[rip+256], xmm9
        subsd   xmm5, xmm11
        movapd  xmm9, xmm0
        movsd   QWORD PTR NBodySystem::advance(double)::r[rip+272], xmm0
        subsd   xmm11, xmm13
        movq    xmm0, QWORD PTR NBodySystem::advance(double)::r[rip+8]
        movhpd  xmm1, QWORD PTR NBodySystem::advance(double)::r[rip+32]
        movaps  XMMWORD PTR NBodySystem::advance(double)::r[rip+288], xmm10
        movhpd  xmm0, QWORD PTR NBodySystem::advance(double)::r[rip+40]
        movapd  xmm10, xmm1
        movq    rax, xmm5
        movsd   QWORD PTR NBodySystem::advance(double)::r[rip+240], xmm5
        mulpd   xmm10, xmm1
        movapd  xmm12, xmm0
        movq    xmm5, rcx
        movsd   QWORD PTR NBodySystem::advance(double)::r[rip+304], xmm11
        mulpd   xmm12, xmm0
        unpcklpd        xmm2, xmm5
        mov     ecx, 2
        movlpd  xmm1, QWORD PTR NBodySystem::advance(double)::r[rip+64]
        mulpd   xmm2, xmm2
        movlpd  xmm0, QWORD PTR NBodySystem::advance(double)::r[rip+72]
        movhpd  xmm1, QWORD PTR NBodySystem::advance(double)::r[rip+96]
        movhpd  xmm0, QWORD PTR NBodySystem::advance(double)::r[rip+104]
        addpd   xmm12, xmm10
        addpd   xmm12, xmm2
        movapd  xmm13, xmm12
        cvtpd2ps        xmm10, xmm12
        rsqrtps xmm10, xmm10
        mulpd   xmm13, xmm7
        cvtps2pd        xmm2, xmm10
        movapd  xmm5, xmm2
        movapd  xmm10, xmm2
        mulpd   xmm5, xmm13
        mulpd   xmm2, xmm2
        mulpd   xmm10, xmm4
        mulpd   xmm2, xmm5
        movapd  xmm5, xmm6
        divpd   xmm5, xmm12
        subpd   xmm10, xmm2
        mulpd   xmm13, xmm10
        movapd  xmm2, xmm10
        mulpd   xmm10, xmm10
        mulpd   xmm2, xmm4
        mulpd   xmm10, xmm13
        subpd   xmm2, xmm10
        movapd  xmm10, xmm1
        mulpd   xmm10, xmm1
        movlpd  xmm1, QWORD PTR NBodySystem::advance(double)::r[rip+128]
        mulpd   xmm2, xmm5
        movq    xmm5, r8
        movaps  XMMWORD PTR NBodySystem::advance(double)::mag[rip], xmm2
        movapd  xmm2, xmm15
        unpcklpd        xmm2, xmm5
        mulpd   xmm2, xmm2
        movapd  xmm5, xmm0
        mulpd   xmm5, xmm0
        movlpd  xmm0, QWORD PTR NBodySystem::advance(double)::r[rip+136]
        addpd   xmm10, xmm5
        addpd   xmm10, xmm2
        movapd  xmm12, xmm10
        cvtpd2ps        xmm2, xmm10
        rsqrtps xmm2, xmm2
        mulpd   xmm12, xmm7
        cvtps2pd        xmm2, xmm2
        movapd  xmm15, xmm2
        movapd  xmm13, xmm2
        mulpd   xmm15, xmm12
        mulpd   xmm2, xmm2
        mulpd   xmm13, xmm4
        mulpd   xmm2, xmm15
        movapd  xmm5, xmm13
        subpd   xmm5, xmm2
        mulpd   xmm12, xmm5
        movapd  xmm2, xmm5
        mulpd   xmm5, xmm5
        mulpd   xmm2, xmm4
        mulpd   xmm5, xmm12
        subpd   xmm2, xmm5
        movapd  xmm5, xmm6
        divpd   xmm5, xmm10
        mulpd   xmm2, xmm5
        movq    xmm5, rdi
        movaps  XMMWORD PTR NBodySystem::advance(double)::mag[rip+16], xmm2
        movhpd  xmm1, QWORD PTR NBodySystem::advance(double)::r[rip+160]
        movapd  xmm2, xmm14
        movhpd  xmm0, QWORD PTR NBodySystem::advance(double)::r[rip+168]
        unpcklpd        xmm2, xmm5
        movapd  xmm10, xmm0
        movapd  xmm5, xmm1
        movapd  xmm14, xmm6
        mulpd   xmm10, xmm0
        movlpd  xmm0, QWORD PTR NBodySystem::advance(double)::r[rip+200]
        mulpd   xmm5, xmm1
        movlpd  xmm1, QWORD PTR NBodySystem::advance(double)::r[rip+192]
        mulpd   xmm2, xmm2
        movhpd  xmm1, QWORD PTR NBodySystem::advance(double)::r[rip+224]
        addpd   xmm5, xmm10
        addpd   xmm5, xmm2
        divpd   xmm14, xmm5
        movapd  xmm10, xmm5
        cvtpd2ps        xmm2, xmm5
        movq    xmm5, rax
        rsqrtps xmm2, xmm2
        mulpd   xmm10, xmm7
        mov     rax, rsp
        cvtps2pd        xmm2, xmm2
        movapd  xmm12, xmm2
        movapd  xmm13, xmm2
        mulpd   xmm12, xmm10
        mulpd   xmm2, xmm2
        mulpd   xmm13, xmm4
        mulpd   xmm12, xmm2
        movapd  xmm2, xmm13
        subpd   xmm2, xmm12
        mulpd   xmm10, xmm2
        movapd  xmm12, xmm2
        mulpd   xmm2, xmm2
        mulpd   xmm12, xmm4
        mulpd   xmm2, xmm10
        subpd   xmm12, xmm2
        movapd  xmm2, xmm12
        mulpd   xmm2, xmm14
        movapd  xmm14, xmm6
        movaps  XMMWORD PTR NBodySystem::advance(double)::mag[rip+32], xmm2
        movapd  xmm2, xmm0
        movapd  xmm0, xmm8
        movhpd  xmm2, QWORD PTR NBodySystem::advance(double)::r[rip+232]
        unpcklpd        xmm0, xmm5
        movapd  xmm5, xmm1
        mulpd   xmm5, xmm1
        movapd  xmm8, xmm2
        movlpd  xmm1, QWORD PTR NBodySystem::advance(double)::r[rip+256]
        mulpd   xmm8, xmm2
        movlpd  xmm2, QWORD PTR NBodySystem::advance(double)::r[rip+264]
        movhpd  xmm1, QWORD PTR NBodySystem::advance(double)::r[rip+288]
        mulpd   xmm0, xmm0
        movhpd  xmm2, QWORD PTR NBodySystem::advance(double)::r[rip+296]
        mulpd   xmm2, xmm2
        mulpd   xmm1, xmm1
        addpd   xmm5, xmm8
        addpd   xmm0, xmm5
        addpd   xmm1, xmm2
        divpd   xmm14, xmm0
        movapd  xmm12, xmm0
        cvtpd2ps        xmm5, xmm0
        rsqrtps xmm5, xmm5
        mulpd   xmm12, xmm7
        cvtps2pd        xmm5, xmm5
        movapd  xmm10, xmm5
        movapd  xmm8, xmm5
        mulpd   xmm10, xmm12
        mulpd   xmm5, xmm5
        mulpd   xmm8, xmm4
        mulpd   xmm5, xmm10
        subpd   xmm8, xmm5
        mulpd   xmm12, xmm8
        movapd  xmm5, xmm8
        movapd  xmm10, xmm8
        mulpd   xmm5, xmm5
        mulpd   xmm10, xmm4
        mulpd   xmm5, xmm12
        subpd   xmm10, xmm5
        movapd  xmm0, xmm14
        mulpd   xmm0, xmm10
        movaps  XMMWORD PTR NBodySystem::advance(double)::mag[rip+48], xmm0
        movapd  xmm0, xmm9
        unpcklpd        xmm0, xmm11
        mulpd   xmm0, xmm0
        addpd   xmm0, xmm1
        movapd  xmm5, xmm0
        cvtpd2ps        xmm1, xmm0
        rsqrtps xmm1, xmm1
        mulpd   xmm5, xmm7
        cvtps2pd        xmm1, xmm1
        movapd  xmm8, xmm1
        movapd  xmm2, xmm1
        mulpd   xmm8, xmm5
        mulpd   xmm1, xmm1
        mulpd   xmm2, xmm4
        mulpd   xmm1, xmm8
        subpd   xmm2, xmm1
        movapd  xmm1, xmm2
        mulpd   xmm5, xmm1
        mulpd   xmm1, xmm1
        mulpd   xmm2, xmm4
        mulpd   xmm1, xmm5
        movapd  xmm5, xmm6
        divpd   xmm5, xmm0
        subpd   xmm2, xmm1
        movapd  xmm0, xmm5
        movsd   xmm5, QWORD PTR [rsp+312]
        mulpd   xmm0, xmm2
        movaps  XMMWORD PTR NBodySystem::advance(double)::mag[rip+64], xmm0
.L72:
        movsd   xmm0, QWORD PTR [rax+120]
        lea     edi, [rdx+1]
        mov     r8d, edx
        mov     r9, r8
        movsd   xmm13, QWORD PTR [rax+32]
        sal     r9, 5
        movsd   xmm12, QWORD PTR [rax+40]
        movsd   xmm8, QWORD PTR NBodySystem::advance(double)::r[r9]
        movsd   xmm9, QWORD PTR NBodySystem::advance(double)::mag[0+r8*8]
        movapd  xmm1, xmm8
        movsd   xmm11, QWORD PTR [rax+48]
        movsd   xmm2, QWORD PTR NBodySystem::advance(double)::r[r9+8]
        mulsd   xmm1, xmm0
        mulsd   xmm1, xmm9
        subsd   xmm13, xmm1
        movapd  xmm1, xmm0
        mulsd   xmm1, xmm2
        movsd   QWORD PTR [rax+32], xmm13
        mulsd   xmm1, xmm9
        subsd   xmm12, xmm1
        movsd   xmm1, QWORD PTR NBodySystem::advance(double)::r[r9+16]
        mulsd   xmm0, xmm1
        movsd   QWORD PTR [rax+40], xmm12
        mulsd   xmm0, xmm9
        subsd   xmm11, xmm0
        movsd   xmm0, QWORD PTR [rax+56]
        mulsd   xmm8, xmm0
        mulsd   xmm2, xmm0
        movsd   QWORD PTR [rax+48], xmm11
        mulsd   xmm1, xmm0
        mulsd   xmm8, xmm9
        mulsd   xmm2, xmm9
        addsd   xmm8, QWORD PTR [rax+96]
        mulsd   xmm1, xmm9
        addsd   xmm2, QWORD PTR [rax+104]
        addsd   xmm1, QWORD PTR [rax+112]
        movsd   QWORD PTR [rax+96], xmm8
        movsd   QWORD PTR [rax+104], xmm2
        movsd   QWORD PTR [rax+112], xmm1
        cmp     ecx, 5
        je      .L73
        movsd   xmm9, QWORD PTR [rax+184]
        mov     r9, rdi
        movsd   xmm10, QWORD PTR NBodySystem::advance(double)::mag[0+rdi*8]
        sal     r9, 5
        movsd   xmm8, QWORD PTR NBodySystem::advance(double)::r[r9]
        lea     edi, [rdx+2]
        movsd   xmm2, QWORD PTR NBodySystem::advance(double)::r[r9+8]
        movapd  xmm1, xmm8
        mulsd   xmm1, xmm9
        mulsd   xmm8, xmm0
        mulsd   xmm1, xmm10
        mulsd   xmm8, xmm10
        addsd   xmm8, QWORD PTR [rax+160]
        movsd   QWORD PTR [rax+160], xmm8
        subsd   xmm13, xmm1
        movapd  xmm1, xmm9
        mulsd   xmm1, xmm2
        mulsd   xmm2, xmm0
        movsd   QWORD PTR [rax+32], xmm13
        mulsd   xmm1, xmm10
        mulsd   xmm2, xmm10
        addsd   xmm2, QWORD PTR [rax+168]
        subsd   xmm12, xmm1
        movsd   QWORD PTR [rax+168], xmm2
        movsd   xmm1, QWORD PTR NBodySystem::advance(double)::r[r9+16]
        mulsd   xmm9, xmm1
        mulsd   xmm1, xmm0
        movsd   QWORD PTR [rax+40], xmm12
        mulsd   xmm9, xmm10
        mulsd   xmm1, xmm10
        addsd   xmm1, QWORD PTR [rax+176]
        subsd   xmm11, xmm9
        movsd   QWORD PTR [rax+176], xmm1
        movsd   QWORD PTR [rax+48], xmm11
        cmp     ecx, 4
        je      .L74
        movsd   xmm10, QWORD PTR [rax+248]
        mov     r9, rdi
        movsd   xmm9, QWORD PTR NBodySystem::advance(double)::mag[0+rdi*8]
        sal     r9, 5
        movsd   xmm8, QWORD PTR NBodySystem::advance(double)::r[r9]
        lea     edi, [rdx+3]
        movsd   xmm2, QWORD PTR NBodySystem::advance(double)::r[r9+8]
        movapd  xmm1, xmm8
        mulsd   xmm1, xmm10
        mulsd   xmm8, xmm0
        mulsd   xmm1, xmm9
        mulsd   xmm8, xmm9
        addsd   xmm8, QWORD PTR [rax+224]
        movsd   QWORD PTR [rax+224], xmm8
        subsd   xmm13, xmm1
        movapd  xmm1, xmm10
        mulsd   xmm1, xmm2
        mulsd   xmm2, xmm0
        movsd   QWORD PTR [rax+32], xmm13
        mulsd   xmm1, xmm9
        mulsd   xmm2, xmm9
        addsd   xmm2, QWORD PTR [rax+232]
        subsd   xmm12, xmm1
        movsd   QWORD PTR [rax+232], xmm2
        movsd   xmm1, QWORD PTR NBodySystem::advance(double)::r[r9+16]
        mulsd   xmm10, xmm1
        mulsd   xmm1, xmm0
        movsd   QWORD PTR [rax+40], xmm12
        mulsd   xmm10, xmm9
        mulsd   xmm1, xmm9
        addsd   xmm1, QWORD PTR [rax+240]
        subsd   xmm11, xmm10
        movsd   QWORD PTR [rax+240], xmm1
        movsd   QWORD PTR [rax+48], xmm11
        cmp     ecx, 2
        jne     .L78
        movsd   xmm2, QWORD PTR NBodySystem::advance(double)::mag[0+rdi*8]
        sal     rdi, 5
        movapd  xmm8, xmm5
        add     edx, 4
        movsd   xmm1, QWORD PTR NBodySystem::advance(double)::r[rdi]
        movsd   xmm9, QWORD PTR NBodySystem::advance(double)::r[rdi+16]
        mulsd   xmm1, xmm5
        mulsd   xmm8, xmm9
        mulsd   xmm1, xmm2
        mulsd   xmm8, xmm2
        subsd   xmm13, xmm1
        movsd   xmm1, QWORD PTR NBodySystem::advance(double)::r[rdi+8]
        subsd   xmm11, xmm8
        movddup xmm8, xmm2
        mulsd   xmm1, xmm5
        movsd   QWORD PTR [rax+32], xmm13
        movapd  xmm10, XMMWORD PTR NBodySystem::advance(double)::r[rdi]
        movsd   QWORD PTR [rax+48], xmm11
        mulsd   xmm1, xmm2
        subsd   xmm12, xmm1
        movddup xmm1, xmm0
        mulsd   xmm0, xmm9
        mulpd   xmm1, xmm10
        movsd   QWORD PTR [rax+40], xmm12
        mulsd   xmm0, xmm2
        addsd   xmm0, QWORD PTR [rsp+304]
        mulpd   xmm1, xmm8
        addpd   xmm1, XMMWORD PTR [rsp+288]
        movsd   QWORD PTR [rsp+304], xmm0
        movaps  XMMWORD PTR [rsp+288], xmm1
.L75:
        add     rax, 64
        add     ecx, 1
        jmp     .L72
.L73:
        movsd   xmm0, QWORD PTR [rsp+40]
        add     esi, 1
        movsd   xmm2, QWORD PTR [rsp+32]
        mulsd   xmm0, xmm3
        movsd   xmm5, QWORD PTR [rsp+48]
        addsd   xmm0, QWORD PTR [rsp+8]
        mulsd   xmm2, xmm3
        movsd   xmm8, QWORD PTR [rsp+96]
        mulsd   xmm5, xmm3
        movsd   xmm1, QWORD PTR [rsp+112]
        movsd   QWORD PTR [rsp+8], xmm0
        movq    rcx, xmm0
        movsd   xmm0, QWORD PTR [rsp+104]
        movsd   xmm9, QWORD PTR [rsp+160]
        mulsd   xmm8, xmm3
        mulsd   xmm0, xmm3
        addsd   xmm2, QWORD PTR [rsp]
        addsd   xmm0, QWORD PTR [rsp+72]
        mulsd   xmm1, xmm3
        movsd   xmm10, QWORD PTR [rsp+224]
        mulsd   xmm9, xmm3
        movsd   xmm15, QWORD PTR [rsp+232]
        movsd   QWORD PTR [rsp], xmm2
        movsd   QWORD PTR [rsp+72], xmm0
        mulsd   xmm10, xmm3
        movq    rdx, xmm0
        movsd   xmm0, QWORD PTR [rsp+168]
        mulsd   xmm15, xmm3
        addsd   xmm5, QWORD PTR [rsp+16]
        mulsd   xmm0, xmm3
        addsd   xmm8, QWORD PTR [rsp+64]
        addsd   xmm0, QWORD PTR [rsp+136]
        addsd   xmm10, QWORD PTR [rsp+192]
        movsd   QWORD PTR [rsp+16], xmm5
        addsd   xmm1, QWORD PTR [rsp+80]
        movsd   QWORD PTR [rsp+64], xmm8
        movsd   QWORD PTR [rsp+136], xmm0
        movq    rax, xmm0
        movsd   xmm0, QWORD PTR [rsp+176]
        addsd   xmm9, QWORD PTR [rsp+128]
        movq    rdi, xmm10
        movsd   QWORD PTR [rsp+192], xmm10
        mulsd   xmm0, xmm3
        movsd   QWORD PTR [rsp+80], xmm1
        addsd   xmm15, QWORD PTR [rsp+200]
        addsd   xmm0, QWORD PTR [rsp+144]
        movsd   QWORD PTR [rsp+128], xmm9
        movsd   QWORD PTR [rsp+144], xmm0
        movsd   QWORD PTR [rsp+200], xmm15
        movsd   xmm11, QWORD PTR [rsp+240]
        movsd   xmm12, QWORD PTR [rsp+288]
        movsd   xmm14, QWORD PTR [rsp+296]
        mulsd   xmm11, xmm3
        movsd   xmm13, QWORD PTR [rsp+304]
        mulsd   xmm12, xmm3
        addsd   xmm11, QWORD PTR [rsp+208]
        mulsd   xmm14, xmm3
        addsd   xmm12, QWORD PTR [rsp+256]
        mulsd   xmm13, xmm3
        addsd   xmm14, QWORD PTR [rsp+264]
        addsd   xmm13, QWORD PTR [rsp+272]
        movsd   QWORD PTR [rsp+208], xmm11
        movsd   QWORD PTR [rsp+256], xmm12
        movsd   QWORD PTR [rsp+264], xmm14
        movsd   QWORD PTR [rsp+272], xmm13
        cmp     esi, ebx
        jne     .L76