	.file	"NBodyCppBaseline.cpp"
	.intel_syntax noprefix
	.text
	.section	.text._ZN11NBodySystemC2Ev,"axG",@progbits,_ZN11NBodySystemC5Ev,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZN11NBodySystemC2Ev
	.type	_ZN11NBodySystemC2Ev, @function
_ZN11NBodySystemC2Ev:
.LFB6402:
	.cfi_startproc
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movzx	eax, BYTE PTR _ZGVZN4Body3sunEvE1p[rip]
	mov	rbx, rdi
	test	al, al
	je	.L34
.L3:
	mov	rax, QWORD PTR .LC0[rip]
	movdqa	xmm0, XMMWORD PTR _ZZN4Body3sunEvE1p[rip]
	mov	QWORD PTR _ZZN4Body3sunEvE1p[rip+56], rax
	movaps	XMMWORD PTR [rbx], xmm0
	movdqa	xmm0, XMMWORD PTR _ZZN4Body3sunEvE1p[rip+16]
	movaps	XMMWORD PTR 16[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR _ZZN4Body3sunEvE1p[rip+32]
	movaps	XMMWORD PTR 32[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR _ZZN4Body3sunEvE1p[rip+48]
	movaps	XMMWORD PTR 48[rbx], xmm0
	movzx	eax, BYTE PTR _ZGVZN4Body7jupiterEvE1p[rip]
	test	al, al
	je	.L35
.L6:
	movapd	xmm0, XMMWORD PTR .LC1[rip]
	mov	rax, QWORD PTR .LC2[rip]
	movaps	XMMWORD PTR _ZZN4Body7jupiterEvE1p[rip], xmm0
	movapd	xmm0, XMMWORD PTR .LC3[rip]
	movaps	XMMWORD PTR _ZZN4Body7jupiterEvE1p[rip+32], xmm0
	movapd	xmm0, XMMWORD PTR .LC4[rip]
	mov	QWORD PTR _ZZN4Body7jupiterEvE1p[rip+16], rax
	movaps	XMMWORD PTR _ZZN4Body7jupiterEvE1p[rip+48], xmm0
	movdqa	xmm0, XMMWORD PTR .LC19[rip]
	movaps	XMMWORD PTR 64[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR _ZZN4Body7jupiterEvE1p[rip+16]
	movaps	XMMWORD PTR 80[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR .LC20[rip]
	movaps	XMMWORD PTR 96[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR .LC21[rip]
	movaps	XMMWORD PTR 112[rbx], xmm0
	movzx	eax, BYTE PTR _ZGVZN4Body6saturnEvE1p[rip]
	test	al, al
	je	.L36
.L9:
	movapd	xmm0, XMMWORD PTR .LC5[rip]
	mov	rax, QWORD PTR .LC6[rip]
	movaps	XMMWORD PTR _ZZN4Body6saturnEvE1p[rip], xmm0
	movapd	xmm0, XMMWORD PTR .LC7[rip]
	movaps	XMMWORD PTR _ZZN4Body6saturnEvE1p[rip+32], xmm0
	movapd	xmm0, XMMWORD PTR .LC8[rip]
	mov	QWORD PTR _ZZN4Body6saturnEvE1p[rip+16], rax
	movaps	XMMWORD PTR _ZZN4Body6saturnEvE1p[rip+48], xmm0
	movdqa	xmm0, XMMWORD PTR .LC22[rip]
	movaps	XMMWORD PTR 128[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR _ZZN4Body6saturnEvE1p[rip+16]
	movaps	XMMWORD PTR 144[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR .LC23[rip]
	movaps	XMMWORD PTR 160[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR .LC24[rip]
	movaps	XMMWORD PTR 176[rbx], xmm0
	movzx	eax, BYTE PTR _ZGVZN4Body6uranusEvE1p[rip]
	test	al, al
	je	.L37
.L12:
	movapd	xmm0, XMMWORD PTR .LC9[rip]
	mov	rax, QWORD PTR .LC10[rip]
	movaps	XMMWORD PTR _ZZN4Body6uranusEvE1p[rip], xmm0
	movapd	xmm0, XMMWORD PTR .LC11[rip]
	movaps	XMMWORD PTR _ZZN4Body6uranusEvE1p[rip+32], xmm0
	movapd	xmm0, XMMWORD PTR .LC12[rip]
	mov	QWORD PTR _ZZN4Body6uranusEvE1p[rip+16], rax
	movaps	XMMWORD PTR _ZZN4Body6uranusEvE1p[rip+48], xmm0
	movdqa	xmm0, XMMWORD PTR .LC25[rip]
	movaps	XMMWORD PTR 192[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR _ZZN4Body6uranusEvE1p[rip+16]
	movaps	XMMWORD PTR 208[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR .LC26[rip]
	movaps	XMMWORD PTR 224[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR .LC27[rip]
	movaps	XMMWORD PTR 240[rbx], xmm0
	movzx	eax, BYTE PTR _ZGVZN4Body7neptuneEvE1p[rip]
	test	al, al
	je	.L38
.L15:
	movapd	xmm0, XMMWORD PTR .LC13[rip]
	pxor	xmm1, xmm1
	mov	rax, QWORD PTR .LC14[rip]
	movaps	XMMWORD PTR _ZZN4Body7neptuneEvE1p[rip], xmm0
	movapd	xmm0, XMMWORD PTR .LC15[rip]
	movsd	xmm6, QWORD PTR 96[rbx]
	movaps	XMMWORD PTR _ZZN4Body7neptuneEvE1p[rip+32], xmm0
	movapd	xmm0, XMMWORD PTR .LC16[rip]
	mov	QWORD PTR _ZZN4Body7neptuneEvE1p[rip+16], rax
	movsd	xmm5, QWORD PTR 104[rbx]
	movaps	XMMWORD PTR _ZZN4Body7neptuneEvE1p[rip+48], xmm0
	movdqa	xmm0, XMMWORD PTR .LC28[rip]
	movsd	xmm4, QWORD PTR 56[rbx]
	movaps	XMMWORD PTR 256[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR _ZZN4Body7neptuneEvE1p[rip+16]
	movsd	xmm2, QWORD PTR 40[rbx]
	movaps	XMMWORD PTR 272[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR .LC29[rip]
	mulsd	xmm2, xmm4
	movaps	XMMWORD PTR 288[rbx], xmm0
	movdqa	xmm0, XMMWORD PTR .LC30[rip]
	movaps	XMMWORD PTR 304[rbx], xmm0
	movsd	xmm0, QWORD PTR 32[rbx]
	mulsd	xmm0, xmm4
	addsd	xmm2, xmm1
	mulsd	xmm4, QWORD PTR 48[rbx]
	addsd	xmm0, xmm1
	movapd	xmm3, xmm4
	movsd	xmm4, QWORD PTR 120[rbx]
	addsd	xmm3, xmm1
	movsd	xmm1, QWORD PTR 112[rbx]
	mulsd	xmm6, xmm4
	mulsd	xmm5, xmm4
	mulsd	xmm1, xmm4
	movsd	xmm4, QWORD PTR 184[rbx]
	addsd	xmm0, xmm6
	movsd	xmm6, QWORD PTR 160[rbx]
	addsd	xmm2, xmm5
	movsd	xmm5, QWORD PTR 168[rbx]
	mulsd	xmm6, xmm4
	addsd	xmm1, xmm3
	movsd	xmm3, QWORD PTR 248[rbx]
	mulsd	xmm5, xmm4
	mulsd	xmm4, QWORD PTR 176[rbx]
	addsd	xmm6, xmm0
	movsd	xmm0, QWORD PTR 224[rbx]
	addsd	xmm5, xmm2
	movsd	xmm2, QWORD PTR 232[rbx]
	mulsd	xmm0, xmm3
	addsd	xmm1, xmm4
	mulsd	xmm2, xmm3
	mulsd	xmm3, QWORD PTR 240[rbx]
	movapd	xmm4, xmm0
	movsd	xmm0, QWORD PTR 312[rbx]
	addsd	xmm5, xmm2
	movsd	xmm2, QWORD PTR 296[rbx]
	addsd	xmm3, xmm1
	movsd	xmm1, QWORD PTR 304[rbx]
	mulsd	xmm2, xmm0
	addsd	xmm4, xmm6
	mulsd	xmm1, xmm0
	mulsd	xmm0, QWORD PTR 288[rbx]
	addsd	xmm2, xmm5
	addsd	xmm1, xmm3
	movq	xmm3, QWORD PTR .LC18[rip]
	addsd	xmm0, xmm4
	xorpd	xmm2, xmm3
	divsd	xmm2, QWORD PTR .LC0[rip]
	movsd	QWORD PTR 40[rbx], xmm2
	xorpd	xmm1, xmm3
	divsd	xmm1, QWORD PTR .LC0[rip]
	movsd	QWORD PTR 48[rbx], xmm1
	xorpd	xmm0, xmm3
	divsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR 32[rbx], xmm0
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L34:
	.cfi_restore_state
	lea	rdi, _ZGVZN4Body3sunEvE1p[rip]
	call	__cxa_guard_acquire@PLT
	test	eax, eax
	je	.L3
	lea	rdi, _ZGVZN4Body3sunEvE1p[rip]
	call	__cxa_guard_release@PLT
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L38:
	lea	rdi, _ZGVZN4Body7neptuneEvE1p[rip]
	call	__cxa_guard_acquire@PLT
	test	eax, eax
	je	.L15
	lea	rdi, _ZGVZN4Body7neptuneEvE1p[rip]
	call	__cxa_guard_release@PLT
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L37:
	lea	rdi, _ZGVZN4Body6uranusEvE1p[rip]
	call	__cxa_guard_acquire@PLT
	test	eax, eax
	je	.L12
	lea	rdi, _ZGVZN4Body6uranusEvE1p[rip]
	call	__cxa_guard_release@PLT
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L36:
	lea	rdi, _ZGVZN4Body6saturnEvE1p[rip]
	call	__cxa_guard_acquire@PLT
	test	eax, eax
	je	.L9
	lea	rdi, _ZGVZN4Body6saturnEvE1p[rip]
	call	__cxa_guard_release@PLT
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L35:
	lea	rdi, _ZGVZN4Body7jupiterEvE1p[rip]
	call	__cxa_guard_acquire@PLT
	test	eax, eax
	je	.L6
	lea	rdi, _ZGVZN4Body7jupiterEvE1p[rip]
	call	__cxa_guard_release@PLT
	jmp	.L6
	.cfi_endproc
.LFE6402:
	.size	_ZN11NBodySystemC2Ev, .-_ZN11NBodySystemC2Ev
	.weak	_ZN11NBodySystemC1Ev
	.set	_ZN11NBodySystemC1Ev,_ZN11NBodySystemC2Ev
	.section	.text._ZN11NBodySystem6energyEv,"axG",@progbits,_ZN11NBodySystem6energyEv,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZN11NBodySystem6energyEv
	.type	_ZN11NBodySystem6energyEv, @function
_ZN11NBodySystem6energyEv:
.LFB6405:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pxor	xmm3, xmm3
	pxor	xmm6, xmm6
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	ebp, 2
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	sub	rsp, 48
	.cfi_def_cfa_offset 80
	movsd	xmm4, QWORD PTR .LC31[rip]
.L46:
	movsd	xmm1, QWORD PTR 32[rbx]
	lea	r12, -1[rbp]
	movsd	xmm2, QWORD PTR 40[rbx]
	mulsd	xmm1, xmm1
	movsd	xmm0, QWORD PTR 48[rbx]
	mulsd	xmm2, xmm2
	movsd	xmm5, QWORD PTR 56[rbx]
	mulsd	xmm0, xmm0
	addsd	xmm2, xmm1
	movapd	xmm1, xmm5
	mulsd	xmm1, xmm4
	addsd	xmm2, xmm0
	mulsd	xmm1, xmm2
	addsd	xmm1, xmm6
	cmp	rbp, 6
	je	.L39
	mov	rax, r12
	movsd	xmm6, QWORD PTR [rbx]
	sal	rax, 6
	movsd	xmm2, QWORD PTR 8[rbx]
	add	rax, rdi
	movsd	xmm0, QWORD PTR 16[rbx]
	subsd	xmm6, QWORD PTR [rax]
	subsd	xmm2, QWORD PTR 8[rax]
	subsd	xmm0, QWORD PTR 16[rax]
	mulsd	xmm6, xmm6
	mulsd	xmm2, xmm2
	mulsd	xmm0, xmm0
	addsd	xmm2, xmm6
	addsd	xmm0, xmm2
	ucomisd	xmm3, xmm0
	sqrtsd	xmm2, xmm0
	ja	.L57
.L41:
	sal	r12, 6
	movapd	xmm6, xmm1
	movsd	xmm0, QWORD PTR 56[rdi+r12]
	mov	r12d, 6
	mulsd	xmm0, xmm5
	divsd	xmm0, xmm2
	subsd	xmm6, xmm0
	cmp	rbp, 5
	je	.L42
	mov	rax, rbp
	movsd	xmm1, QWORD PTR [rbx]
	sal	rax, 6
	movsd	xmm2, QWORD PTR 8[rbx]
	add	rax, rdi
	movsd	xmm0, QWORD PTR 16[rbx]
	subsd	xmm1, QWORD PTR [rax]
	subsd	xmm2, QWORD PTR 8[rax]
	subsd	xmm0, QWORD PTR 16[rax]
	mulsd	xmm1, xmm1
	mulsd	xmm2, xmm2
	mulsd	xmm0, xmm0
	addsd	xmm2, xmm1
	addsd	xmm0, xmm2
	ucomisd	xmm3, xmm0
	sqrtsd	xmm1, xmm0
	ja	.L58
.L43:
	lea	r12, 1[rbp]
	mov	rax, rbp
	sal	rax, 6
	movsd	xmm0, QWORD PTR 56[rdi+rax]
	mulsd	xmm0, xmm5
	divsd	xmm0, xmm1
	subsd	xmm6, xmm0
	cmp	r12, 5
	je	.L42
	mov	rax, r12
	movsd	xmm2, QWORD PTR [rbx]
	sal	rax, 6
	movsd	xmm1, QWORD PTR 8[rbx]
	add	rax, rdi
	movsd	xmm0, QWORD PTR 16[rbx]
	subsd	xmm2, QWORD PTR [rax]
	subsd	xmm1, QWORD PTR 8[rax]
	subsd	xmm0, QWORD PTR 16[rax]
	mulsd	xmm2, xmm2
	mulsd	xmm1, xmm1
	mulsd	xmm0, xmm0
	addsd	xmm1, xmm2
	addsd	xmm0, xmm1
	ucomisd	xmm3, xmm0
	sqrtsd	xmm1, xmm0
	ja	.L59
.L44:
	mov	rax, r12
	sal	rax, 6
	movsd	xmm0, QWORD PTR 56[rdi+rax]
	mulsd	xmm0, xmm5
	divsd	xmm0, xmm1
	subsd	xmm6, xmm0
	cmp	rbp, 3
	je	.L42
	movsd	xmm2, QWORD PTR [rbx]
	movsd	xmm1, QWORD PTR 8[rbx]
	subsd	xmm2, QWORD PTR 256[rdi]
	subsd	xmm1, QWORD PTR 264[rdi]
	movsd	xmm0, QWORD PTR 16[rbx]
	mulsd	xmm2, xmm2
	subsd	xmm0, QWORD PTR 272[rdi]
	mulsd	xmm1, xmm1
	mulsd	xmm0, xmm0
	addsd	xmm1, xmm2
	addsd	xmm0, xmm1
	ucomisd	xmm3, xmm0
	sqrtsd	xmm1, xmm0
	ja	.L60
.L45:
	mulsd	xmm5, QWORD PTR 312[rdi]
	divsd	xmm5, xmm1
	subsd	xmm6, xmm5
.L42:
	add	rbx, 64
	mov	rbp, r12
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L39:
	add	rsp, 48
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movapd	xmm0, xmm1
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
.L57:
	.cfi_restore_state
	movsd	QWORD PTR 40[rsp], xmm3
	movsd	QWORD PTR 32[rsp], xmm4
	mov	QWORD PTR 24[rsp], rdi
	movsd	QWORD PTR 16[rsp], xmm1
	movsd	QWORD PTR 8[rsp], xmm2
	call	sqrt@PLT
	movsd	xmm5, QWORD PTR 56[rbx]
	movsd	xmm3, QWORD PTR 40[rsp]
	movsd	xmm4, QWORD PTR 32[rsp]
	mov	rdi, QWORD PTR 24[rsp]
	movsd	xmm1, QWORD PTR 16[rsp]
	movsd	xmm2, QWORD PTR 8[rsp]
	jmp	.L41
.L58:
	movsd	QWORD PTR 40[rsp], xmm3
	movsd	QWORD PTR 32[rsp], xmm4
	mov	QWORD PTR 24[rsp], rdi
	movsd	QWORD PTR 16[rsp], xmm1
	movsd	QWORD PTR 8[rsp], xmm6
	call	sqrt@PLT
	movsd	xmm5, QWORD PTR 56[rbx]
	movsd	xmm3, QWORD PTR 40[rsp]
	movsd	xmm4, QWORD PTR 32[rsp]
	mov	rdi, QWORD PTR 24[rsp]
	movsd	xmm1, QWORD PTR 16[rsp]
	movsd	xmm6, QWORD PTR 8[rsp]
	jmp	.L43
.L59:
	movsd	QWORD PTR 40[rsp], xmm3
	movsd	QWORD PTR 32[rsp], xmm4
	mov	QWORD PTR 24[rsp], rdi
	movsd	QWORD PTR 16[rsp], xmm1
	movsd	QWORD PTR 8[rsp], xmm6
	call	sqrt@PLT
	movsd	xmm5, QWORD PTR 56[rbx]
	movsd	xmm3, QWORD PTR 40[rsp]
	movsd	xmm4, QWORD PTR 32[rsp]
	mov	rdi, QWORD PTR 24[rsp]
	movsd	xmm1, QWORD PTR 16[rsp]
	movsd	xmm6, QWORD PTR 8[rsp]
	jmp	.L44
.L60:
	movsd	QWORD PTR 40[rsp], xmm3
	movsd	QWORD PTR 32[rsp], xmm4
	mov	QWORD PTR 24[rsp], rdi
	movsd	QWORD PTR 16[rsp], xmm6
	movsd	QWORD PTR 8[rsp], xmm1
	call	sqrt@PLT
	movsd	xmm5, QWORD PTR 56[rbx]
	movsd	xmm1, QWORD PTR 8[rsp]
	movsd	xmm6, QWORD PTR 16[rsp]
	mov	rdi, QWORD PTR 24[rsp]
	movsd	xmm4, QWORD PTR 32[rsp]
	movsd	xmm3, QWORD PTR 40[rsp]
	jmp	.L45
	.cfi_endproc
.LFE6405:
	.size	_ZN11NBodySystem6energyEv, .-_ZN11NBodySystem6energyEv
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC32:
	.string	"%.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB6406:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	sub	rsp, 336
	.cfi_def_cfa_offset 368
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 328[rsp], rax
	xor	eax, eax
	cmp	edi, 1
	jg	.L75
	mov	rbx, rsp
	mov	ebp, 50000000
	mov	rdi, rbx
	call	_ZN11NBodySystemC1Ev
	mov	rdi, rbx
	call	_ZN11NBodySystem6energyEv
	mov	edi, 1
	mov	eax, 1
	lea	rsi, .LC32[rip]
	call	__printf_chk@PLT
.L68:
	mov	rcx, QWORD PTR 8[rsp]
	xor	r8d, r8d
	mov	rdx, QWORD PTR 136[rsp]
	lea	rsi, _ZZN11NBodySystem7advanceEdE1r[rip]
	mov	rax, QWORD PTR 200[rsp]
	lea	rdi, _ZZN11NBodySystem7advanceEdE3mag[rip]
	movsd	xmm8, QWORD PTR 264[rsp]
	movsd	xmm7, QWORD PTR [rsp]
	movsd	xmm15, QWORD PTR 64[rsp]
	movq	r11, xmm8
	movq	xmm8, rcx
	movsd	xmm2, QWORD PTR 72[rsp]
	movsd	xmm9, QWORD PTR 16[rsp]
	movsd	xmm1, QWORD PTR 80[rsp]
	movsd	xmm11, QWORD PTR 128[rsp]
	movsd	xmm0, QWORD PTR 144[rsp]
	movsd	xmm10, QWORD PTR 192[rsp]
	movsd	xmm12, QWORD PTR 208[rsp]
	movsd	xmm13, QWORD PTR 256[rsp]
	movsd	xmm14, QWORD PTR 272[rsp]
	movapd	xmm6, XMMWORD PTR .LC33[rip]
	movapd	xmm4, XMMWORD PTR .LC34[rip]
	movapd	xmm5, XMMWORD PTR .LC35[rip]
	movsd	xmm3, QWORD PTR .LC36[rip]
	.p2align 4,,10
	.p2align 3
.L69:
	unpcklpd	xmm7, xmm8
	movq	xmm8, rdx
	unpcklpd	xmm15, xmm2
	movapd	xmm2, xmm7
	unpcklpd	xmm11, xmm8
	movapd	xmm8, xmm7
	subpd	xmm2, xmm15
	subpd	xmm8, xmm11
	movaps	XMMWORD PTR [rsi], xmm2
	movapd	xmm2, xmm9
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+32], xmm8
	movapd	xmm8, xmm9
	subsd	xmm2, xmm1
	subsd	xmm8, xmm0
	movsd	QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+16], xmm2
	movsd	QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+48], xmm8
	movq	r9, xmm8
	movq	xmm8, rax
	unpcklpd	xmm10, xmm8
	movapd	xmm8, xmm7
	subpd	xmm8, xmm10
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+64], xmm8
	movapd	xmm8, xmm9
	subsd	xmm9, xmm14
	subsd	xmm8, xmm12
	movsd	QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+112], xmm9
	movsd	QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+80], xmm8
	movq	rax, xmm8
	movq	xmm8, r11
	unpcklpd	xmm13, xmm8
	subpd	xmm7, xmm13
	movapd	xmm8, xmm15
	subpd	xmm8, xmm10
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+96], xmm7
	movapd	xmm7, xmm15
	subpd	xmm15, xmm13
	subpd	xmm7, xmm11
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+160], xmm8
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+192], xmm15
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+128], xmm7
	movapd	xmm7, xmm1
	subsd	xmm7, xmm0
	movq	r10, xmm7
	movsd	QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+144], xmm7
	movapd	xmm7, xmm1
	subsd	xmm1, xmm14
	subsd	xmm7, xmm12
	movq	rcx, xmm1
	movsd	QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+208], xmm1
	movapd	xmm1, xmm11
	subpd	xmm1, xmm10
	movsd	QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+176], xmm7
	subpd	xmm11, xmm13
	subpd	xmm10, xmm13
	movq	xmm13, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip]
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+224], xmm1
	movapd	xmm1, xmm0
	subsd	xmm0, xmm14
	subsd	xmm1, xmm12
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+256], xmm11
	movhpd	xmm13, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+32]
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+288], xmm10
	subsd	xmm12, xmm14
	movapd	xmm15, xmm0
	movsd	QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+272], xmm0
	movq	xmm0, r9
	movq	rdx, xmm1
	movsd	QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+240], xmm1
	unpcklpd	xmm2, xmm0
	movq	xmm1, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+8]
	mulpd	xmm2, xmm2
	movapd	xmm0, xmm13
	movapd	xmm14, xmm12
	movsd	QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+304], xmm12
	mulpd	xmm0, xmm13
	movhpd	xmm1, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+40]
	movapd	xmm8, xmm1
	mulpd	xmm8, xmm1
	addpd	xmm8, xmm0
	addpd	xmm8, xmm2
	cvtpd2ps	xmm0, xmm8
	rsqrtps	xmm0, xmm0
	movapd	xmm11, xmm8
	mulpd	xmm11, xmm6
	cvtps2pd	xmm0, xmm0
	movapd	xmm2, xmm0
	movapd	xmm10, xmm0
	mulpd	xmm2, xmm0
	mulpd	xmm10, xmm4
	mulpd	xmm0, xmm2
	mulpd	xmm0, xmm11
	subpd	xmm10, xmm0
	movapd	xmm0, xmm10
	movapd	xmm2, xmm10
	mulpd	xmm0, xmm10
	mulpd	xmm2, xmm4
	mulpd	xmm10, xmm0
	movq	xmm0, rax
	mov	rax, rbx
	unpcklpd	xmm0, xmm9
	mulpd	xmm0, xmm0
	mulpd	xmm10, xmm11
	subpd	xmm2, xmm10
	movapd	xmm10, xmm5
	divpd	xmm10, xmm8
	mulpd	xmm2, xmm10
	movaps	XMMWORD PTR [rdi], xmm2
	movlpd	xmm1, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+72]
	movlpd	xmm13, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+64]
	movhpd	xmm1, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+104]
	movhpd	xmm13, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+96]
	movapd	xmm8, xmm1
	movapd	xmm12, xmm1
	movapd	xmm2, xmm13
	mulpd	xmm8, xmm1
	movapd	xmm1, xmm13
	movlpd	xmm2, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+128]
	mulpd	xmm1, xmm13
	addpd	xmm8, xmm1
	addpd	xmm8, xmm0
	cvtpd2ps	xmm9, xmm8
	rsqrtps	xmm9, xmm9
	movapd	xmm1, xmm8
	mulpd	xmm1, xmm6
	cvtps2pd	xmm9, xmm9
	movapd	xmm11, xmm9
	movapd	xmm10, xmm9
	mulpd	xmm11, xmm9
	mulpd	xmm10, xmm4
	mulpd	xmm11, xmm9
	mulpd	xmm11, xmm1
	subpd	xmm10, xmm11
	movapd	xmm9, xmm10
	movapd	xmm0, xmm10
	mulpd	xmm10, xmm10
	mulpd	xmm0, xmm4
	mulpd	xmm9, xmm10
	mulpd	xmm9, xmm1
	movapd	xmm1, xmm5
	divpd	xmm1, xmm8
	subpd	xmm0, xmm9
	mulpd	xmm0, xmm1
	movq	xmm1, r10
	unpcklpd	xmm1, xmm7
	mulpd	xmm1, xmm1
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE3mag[rip+16], xmm0
	movapd	xmm0, xmm12
	movlpd	xmm0, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+136]
	movhpd	xmm2, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+160]
	movhpd	xmm0, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+168]
	movapd	xmm7, xmm2
	mulpd	xmm7, xmm2
	movapd	xmm8, xmm0
	movlpd	xmm2, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+192]
	mulpd	xmm8, xmm0
	movlpd	xmm0, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+200]
	movhpd	xmm0, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+232]
	addpd	xmm7, xmm8
	addpd	xmm7, xmm1
	cvtpd2ps	xmm10, xmm7
	rsqrtps	xmm10, xmm10
	movapd	xmm12, xmm7
	mulpd	xmm12, xmm6
	cvtps2pd	xmm10, xmm10
	movapd	xmm11, xmm10
	movapd	xmm9, xmm10
	mulpd	xmm11, xmm10
	mulpd	xmm9, xmm4
	mulpd	xmm10, xmm11
	movapd	xmm8, xmm9
	mulpd	xmm10, xmm12
	subpd	xmm8, xmm10
	movapd	xmm9, xmm8
	movapd	xmm1, xmm8
	mulpd	xmm9, xmm8
	mulpd	xmm1, xmm4
	mulpd	xmm8, xmm9
	mulpd	xmm8, xmm12
	movapd	xmm12, xmm5
	divpd	xmm12, xmm7
	movq	xmm7, rcx
	mov	ecx, 2
	subpd	xmm1, xmm8
	movapd	xmm8, xmm0
	mulpd	xmm8, xmm0
	movlpd	xmm0, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+264]
	movhpd	xmm0, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+296]
	mulpd	xmm0, xmm0
	mulpd	xmm1, xmm12
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE3mag[rip+32], xmm1
	movapd	xmm1, xmm2
	movq	xmm2, rdx
	xor	edx, edx
	movhpd	xmm1, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+224]
	unpcklpd	xmm7, xmm2
	mulpd	xmm7, xmm7
	movapd	xmm2, xmm1
	mulpd	xmm2, xmm1
	movlpd	xmm1, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+256]
	movhpd	xmm1, QWORD PTR _ZZN11NBodySystem7advanceEdE1r[rip+288]
	mulpd	xmm1, xmm1
	addpd	xmm2, xmm8
	addpd	xmm1, xmm0
	addpd	xmm2, xmm7
	cvtpd2ps	xmm9, xmm2
	rsqrtps	xmm9, xmm9
	movapd	xmm11, xmm2
	mulpd	xmm11, xmm6
	cvtps2pd	xmm9, xmm9
	movapd	xmm10, xmm9
	movapd	xmm8, xmm9
	mulpd	xmm10, xmm9
	mulpd	xmm8, xmm4
	mulpd	xmm9, xmm10
	movapd	xmm7, xmm8
	mulpd	xmm9, xmm11
	subpd	xmm7, xmm9
	movapd	xmm8, xmm7
	movapd	xmm9, xmm7
	mulpd	xmm8, xmm7
	mulpd	xmm9, xmm4
	mulpd	xmm7, xmm8
	movapd	xmm8, xmm9
	mulpd	xmm7, xmm11
	subpd	xmm8, xmm7
	movapd	xmm7, xmm5
	divpd	xmm7, xmm2
	movapd	xmm2, xmm8
	mulpd	xmm2, xmm7
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE3mag[rip+48], xmm2
	movapd	xmm2, xmm15
	unpcklpd	xmm2, xmm14
	mulpd	xmm2, xmm2
	addpd	xmm1, xmm2
	cvtpd2ps	xmm7, xmm1
	rsqrtps	xmm7, xmm7
	movapd	xmm2, xmm1
	mulpd	xmm2, xmm6
	cvtps2pd	xmm7, xmm7
	movapd	xmm8, xmm7
	movapd	xmm0, xmm7
	mulpd	xmm8, xmm7
	mulpd	xmm0, xmm4
	mulpd	xmm7, xmm8
	mulpd	xmm7, xmm2
	subpd	xmm0, xmm7
	movapd	xmm7, xmm0
	movapd	xmm8, xmm0
	mulpd	xmm7, xmm0
	mulpd	xmm8, xmm4
	mulpd	xmm0, xmm7
	movapd	xmm7, xmm5
	divpd	xmm7, xmm1
	mulpd	xmm2, xmm0
	movapd	xmm0, xmm8
	movsd	xmm8, QWORD PTR 312[rsp]
	subpd	xmm0, xmm2
	mulpd	xmm0, xmm7
	movaps	XMMWORD PTR _ZZN11NBodySystem7advanceEdE3mag[rip+64], xmm0
.L64:
	movsd	xmm7, QWORD PTR 120[rax]
	lea	r10, 1[rdx]
	mov	r9, rdx
	sal	r9, 5
	movsd	xmm2, QWORD PTR [rdi+rdx*8]
	add	r9, rsi
	movsd	xmm11, QWORD PTR 32[rax]
	movsd	xmm9, QWORD PTR [r9]
	movsd	xmm1, QWORD PTR 8[r9]
	movapd	xmm0, xmm9
	movsd	xmm10, QWORD PTR 40[rax]
	mulsd	xmm0, xmm7
	movsd	xmm12, QWORD PTR 48[rax]
	mulsd	xmm0, xmm2
	subsd	xmm11, xmm0
	movapd	xmm0, xmm7
	mulsd	xmm0, xmm1
	movsd	QWORD PTR 32[rax], xmm11
	mulsd	xmm0, xmm2
	subsd	xmm10, xmm0
	movsd	xmm0, QWORD PTR 16[r9]
	mulsd	xmm7, xmm0
	movsd	QWORD PTR 40[rax], xmm10
	mulsd	xmm7, xmm2
	subsd	xmm12, xmm7
	movsd	xmm7, QWORD PTR 56[rax]
	mulsd	xmm9, xmm7
	mulsd	xmm1, xmm7
	movsd	QWORD PTR 48[rax], xmm12
	mulsd	xmm0, xmm7
	mulsd	xmm9, xmm2
	mulsd	xmm1, xmm2
	addsd	xmm9, QWORD PTR 96[rax]
	mulsd	xmm0, xmm2
	addsd	xmm1, QWORD PTR 104[rax]
	addsd	xmm0, QWORD PTR 112[rax]
	movsd	QWORD PTR 96[rax], xmm9
	movsd	QWORD PTR 104[rax], xmm1
	movsd	QWORD PTR 112[rax], xmm0
	cmp	rcx, 5
	je	.L65
	mov	r9, r10
	movsd	xmm1, QWORD PTR [rdi+r10*8]
	movsd	xmm13, QWORD PTR 184[rax]
	lea	r10, 2[rdx]
	sal	r9, 5
	add	r9, rsi
	movsd	xmm9, QWORD PTR [r9]
	movsd	xmm2, QWORD PTR 8[r9]
	movapd	xmm0, xmm9
	mulsd	xmm0, xmm13
	mulsd	xmm9, xmm7
	mulsd	xmm0, xmm1
	mulsd	xmm9, xmm1
	addsd	xmm9, QWORD PTR 160[rax]
	movsd	QWORD PTR 160[rax], xmm9
	subsd	xmm11, xmm0
	movapd	xmm0, xmm13
	mulsd	xmm0, xmm2
	mulsd	xmm2, xmm7
	movsd	QWORD PTR 32[rax], xmm11
	mulsd	xmm0, xmm1
	mulsd	xmm2, xmm1
	addsd	xmm2, QWORD PTR 168[rax]
	subsd	xmm10, xmm0
	movsd	xmm0, QWORD PTR 16[r9]
	movsd	QWORD PTR 168[rax], xmm2
	mulsd	xmm13, xmm0
	mulsd	xmm0, xmm7
	movsd	QWORD PTR 40[rax], xmm10
	mulsd	xmm13, xmm1
	mulsd	xmm0, xmm1
	addsd	xmm0, QWORD PTR 176[rax]
	subsd	xmm12, xmm13
	movsd	QWORD PTR 176[rax], xmm0
	movsd	QWORD PTR 48[rax], xmm12
	cmp	rcx, 4
	je	.L66
	mov	r9, r10
	movsd	xmm1, QWORD PTR [rdi+r10*8]
	movsd	xmm13, QWORD PTR 248[rax]
	sal	r9, 5
	add	r9, rsi
	movsd	xmm9, QWORD PTR [r9]
	movsd	xmm2, QWORD PTR 8[r9]
	movapd	xmm0, xmm9
	mulsd	xmm0, xmm13
	mulsd	xmm9, xmm7
	mulsd	xmm0, xmm1
	mulsd	xmm9, xmm1
	addsd	xmm9, QWORD PTR 224[rax]
	movsd	QWORD PTR 224[rax], xmm9
	subsd	xmm11, xmm0
	movapd	xmm0, xmm13
	mulsd	xmm0, xmm2
	mulsd	xmm2, xmm7
	movsd	QWORD PTR 32[rax], xmm11
	mulsd	xmm0, xmm1
	mulsd	xmm2, xmm1
	addsd	xmm2, QWORD PTR 232[rax]
	subsd	xmm10, xmm0
	movsd	xmm0, QWORD PTR 16[r9]
	movsd	QWORD PTR 232[rax], xmm2
	lea	r9, 3[rdx]
	mulsd	xmm13, xmm0
	mulsd	xmm0, xmm7
	movsd	QWORD PTR 40[rax], xmm10
	mulsd	xmm13, xmm1
	mulsd	xmm0, xmm1
	addsd	xmm0, QWORD PTR 240[rax]
	subsd	xmm12, xmm13
	movsd	QWORD PTR 240[rax], xmm0
	movsd	QWORD PTR 48[rax], xmm12
	cmp	rcx, 2
	jne	.L72
	movsd	xmm0, QWORD PTR [rdi+r9*8]
	sal	r9, 5
	movapd	xmm10, xmm8
	add	rdx, 4
	lea	r10, [rsi+r9]
	movsd	xmm1, QWORD PTR 32[rsp]
	movsd	xmm2, QWORD PTR [r10]
	movsd	xmm9, QWORD PTR 8[r10]
	mulsd	xmm2, xmm8
	mulsd	xmm9, xmm8
	mulsd	xmm2, xmm0
	mulsd	xmm9, xmm0
	subsd	xmm1, xmm2
	movsd	QWORD PTR 32[rsp], xmm1
	movsd	xmm1, QWORD PTR 40[rsp]
	movapd	xmm2, XMMWORD PTR [rsi+r9]
	subsd	xmm1, xmm9
	movsd	xmm9, QWORD PTR 48[rsp]
	movsd	QWORD PTR 40[rsp], xmm1
	movsd	xmm1, QWORD PTR 16[r10]
	mulsd	xmm10, xmm1
	mulsd	xmm1, xmm7
	mulsd	xmm10, xmm0
	subsd	xmm9, xmm10
	movsd	QWORD PTR 48[rsp], xmm9
	movddup	xmm9, xmm7
	mulpd	xmm2, xmm9
	movddup	xmm9, xmm0
	mulsd	xmm0, xmm1
	addsd	xmm0, QWORD PTR 304[rsp]
	movsd	QWORD PTR 304[rsp], xmm0
	mulpd	xmm2, xmm9
	addpd	xmm2, XMMWORD PTR 288[rsp]
	movaps	XMMWORD PTR 288[rsp], xmm2
.L67:
	add	rax, 64
	add	rcx, 1
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L65:
	movsd	xmm0, QWORD PTR 168[rsp]
	add	r8d, 1
	movsd	xmm7, QWORD PTR 32[rsp]
	mulsd	xmm0, xmm3
	movsd	xmm8, QWORD PTR 40[rsp]
	addsd	xmm0, QWORD PTR 136[rsp]
	mulsd	xmm7, xmm3
	movsd	xmm9, QWORD PTR 48[rsp]
	mulsd	xmm8, xmm3
	movsd	xmm15, QWORD PTR 96[rsp]
	movsd	xmm2, QWORD PTR 104[rsp]
	movq	rdx, xmm0
	movsd	QWORD PTR 136[rsp], xmm0
	movsd	xmm1, QWORD PTR 112[rsp]
	mulsd	xmm9, xmm3
	movsd	xmm11, QWORD PTR 160[rsp]
	mulsd	xmm15, xmm3
	movsd	xmm0, QWORD PTR 176[rsp]
	mulsd	xmm2, xmm3
	movsd	xmm10, QWORD PTR 224[rsp]
	mulsd	xmm1, xmm3
	movsd	xmm12, QWORD PTR 232[rsp]
	mulsd	xmm11, xmm3
	mulsd	xmm0, xmm3
	addsd	xmm7, QWORD PTR [rsp]
	mulsd	xmm10, xmm3
	addsd	xmm8, QWORD PTR 8[rsp]
	mulsd	xmm12, xmm3
	addsd	xmm9, QWORD PTR 16[rsp]
	addsd	xmm12, QWORD PTR 200[rsp]
	movsd	QWORD PTR [rsp], xmm7
	addsd	xmm15, QWORD PTR 64[rsp]
	movsd	QWORD PTR 8[rsp], xmm8
	addsd	xmm2, QWORD PTR 72[rsp]
	movsd	QWORD PTR 16[rsp], xmm9
	addsd	xmm1, QWORD PTR 80[rsp]
	movq	rax, xmm12
	addsd	xmm0, QWORD PTR 144[rsp]
	movsd	QWORD PTR 64[rsp], xmm15
	addsd	xmm11, QWORD PTR 128[rsp]
	movsd	QWORD PTR 72[rsp], xmm2
	addsd	xmm10, QWORD PTR 192[rsp]
	movsd	QWORD PTR 80[rsp], xmm1
	movsd	QWORD PTR 144[rsp], xmm0
	movsd	QWORD PTR 128[rsp], xmm11
	movsd	QWORD PTR 192[rsp], xmm10
	movsd	QWORD PTR 200[rsp], xmm12
	movsd	xmm14, QWORD PTR 296[rsp]
	movsd	xmm12, QWORD PTR 240[rsp]
	movsd	xmm13, QWORD PTR 288[rsp]
	mulsd	xmm14, xmm3
	addsd	xmm14, QWORD PTR 264[rsp]
	mulsd	xmm12, xmm3
	addsd	xmm12, QWORD PTR 208[rsp]
	mulsd	xmm13, xmm3
	addsd	xmm13, QWORD PTR 256[rsp]
	movsd	QWORD PTR 264[rsp], xmm14
	movq	r11, xmm14
	movsd	xmm14, QWORD PTR 304[rsp]
	movsd	QWORD PTR 208[rsp], xmm12
	movsd	QWORD PTR 256[rsp], xmm13
	mulsd	xmm14, xmm3
	addsd	xmm14, QWORD PTR 272[rsp]
	movsd	QWORD PTR 272[rsp], xmm14
	cmp	r8d, ebp
	jl	.L69
.L63:
	mov	rdi, rbx
	call	_ZN11NBodySystem6energyEv
	mov	edi, 1
	mov	eax, 1
	lea	rsi, .LC32[rip]
	call	__printf_chk@PLT
	xor	eax, eax
	mov	rbx, QWORD PTR 328[rsp]
	xor	rbx, QWORD PTR fs:40
	jne	.L76
	add	rsp, 336
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L66:
	.cfi_restore_state
	add	rax, 64
	mov	rdx, r10
	mov	ecx, 5
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L72:
	mov	rdx, r9
	jmp	.L67
.L75:
	mov	rdi, QWORD PTR 8[rsi]
	mov	edx, 10
	xor	esi, esi
	mov	rbx, rsp
	call	strtol@PLT
	mov	rdi, rbx
	mov	r12, rax
	mov	ebp, eax
	call	_ZN11NBodySystemC1Ev
	mov	rdi, rbx
	call	_ZN11NBodySystem6energyEv
	mov	edi, 1
	mov	eax, 1
	lea	rsi, .LC32[rip]
	call	__printf_chk@PLT
	test	r12d, r12d
	jg	.L68
	jmp	.L63
.L76:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6406:
	.size	main, .-main
	.weak	_ZZN11NBodySystem7advanceEdE3mag
	.section	.bss._ZZN11NBodySystem7advanceEdE3mag,"awG",@nobits,_ZZN11NBodySystem7advanceEdE3mag,comdat
	.align 16
	.type	_ZZN11NBodySystem7advanceEdE3mag, @gnu_unique_object
	.size	_ZZN11NBodySystem7advanceEdE3mag, 8000
_ZZN11NBodySystem7advanceEdE3mag:
	.zero	8000
	.weak	_ZZN11NBodySystem7advanceEdE1r
	.section	.bss._ZZN11NBodySystem7advanceEdE1r,"awG",@nobits,_ZZN11NBodySystem7advanceEdE1r,comdat
	.align 16
	.type	_ZZN11NBodySystem7advanceEdE1r, @gnu_unique_object
	.size	_ZZN11NBodySystem7advanceEdE1r, 32000
_ZZN11NBodySystem7advanceEdE1r:
	.zero	32000
	.weak	_ZGVZN4Body3sunEvE1p
	.section	.bss._ZGVZN4Body3sunEvE1p,"awG",@nobits,_ZGVZN4Body3sunEvE1p,comdat
	.align 8
	.type	_ZGVZN4Body3sunEvE1p, @gnu_unique_object
	.size	_ZGVZN4Body3sunEvE1p, 8
_ZGVZN4Body3sunEvE1p:
	.zero	8
	.weak	_ZZN4Body3sunEvE1p
	.section	.bss._ZZN4Body3sunEvE1p,"awG",@nobits,_ZZN4Body3sunEvE1p,comdat
	.align 32
	.type	_ZZN4Body3sunEvE1p, @gnu_unique_object
	.size	_ZZN4Body3sunEvE1p, 64
_ZZN4Body3sunEvE1p:
	.zero	64
	.weak	_ZGVZN4Body7neptuneEvE1p
	.section	.bss._ZGVZN4Body7neptuneEvE1p,"awG",@nobits,_ZGVZN4Body7neptuneEvE1p,comdat
	.align 8
	.type	_ZGVZN4Body7neptuneEvE1p, @gnu_unique_object
	.size	_ZGVZN4Body7neptuneEvE1p, 8
_ZGVZN4Body7neptuneEvE1p:
	.zero	8
	.weak	_ZZN4Body7neptuneEvE1p
	.section	.bss._ZZN4Body7neptuneEvE1p,"awG",@nobits,_ZZN4Body7neptuneEvE1p,comdat
	.align 32
	.type	_ZZN4Body7neptuneEvE1p, @gnu_unique_object
	.size	_ZZN4Body7neptuneEvE1p, 64
_ZZN4Body7neptuneEvE1p:
	.zero	64
	.weak	_ZGVZN4Body6uranusEvE1p
	.section	.bss._ZGVZN4Body6uranusEvE1p,"awG",@nobits,_ZGVZN4Body6uranusEvE1p,comdat
	.align 8
	.type	_ZGVZN4Body6uranusEvE1p, @gnu_unique_object
	.size	_ZGVZN4Body6uranusEvE1p, 8
_ZGVZN4Body6uranusEvE1p:
	.zero	8
	.weak	_ZZN4Body6uranusEvE1p
	.section	.bss._ZZN4Body6uranusEvE1p,"awG",@nobits,_ZZN4Body6uranusEvE1p,comdat
	.align 32
	.type	_ZZN4Body6uranusEvE1p, @gnu_unique_object
	.size	_ZZN4Body6uranusEvE1p, 64
_ZZN4Body6uranusEvE1p:
	.zero	64
	.weak	_ZGVZN4Body6saturnEvE1p
	.section	.bss._ZGVZN4Body6saturnEvE1p,"awG",@nobits,_ZGVZN4Body6saturnEvE1p,comdat
	.align 8
	.type	_ZGVZN4Body6saturnEvE1p, @gnu_unique_object
	.size	_ZGVZN4Body6saturnEvE1p, 8
_ZGVZN4Body6saturnEvE1p:
	.zero	8
	.weak	_ZZN4Body6saturnEvE1p
	.section	.bss._ZZN4Body6saturnEvE1p,"awG",@nobits,_ZZN4Body6saturnEvE1p,comdat
	.align 32
	.type	_ZZN4Body6saturnEvE1p, @gnu_unique_object
	.size	_ZZN4Body6saturnEvE1p, 64
_ZZN4Body6saturnEvE1p:
	.zero	64
	.weak	_ZGVZN4Body7jupiterEvE1p
	.section	.bss._ZGVZN4Body7jupiterEvE1p,"awG",@nobits,_ZGVZN4Body7jupiterEvE1p,comdat
	.align 8
	.type	_ZGVZN4Body7jupiterEvE1p, @gnu_unique_object
	.size	_ZGVZN4Body7jupiterEvE1p, 8
_ZGVZN4Body7jupiterEvE1p:
	.zero	8
	.weak	_ZZN4Body7jupiterEvE1p
	.section	.bss._ZZN4Body7jupiterEvE1p,"awG",@nobits,_ZZN4Body7jupiterEvE1p,comdat
	.align 32
	.type	_ZZN4Body7jupiterEvE1p, @gnu_unique_object
	.size	_ZZN4Body7jupiterEvE1p, 64
_ZZN4Body7jupiterEvE1p:
	.zero	64
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	3384690142
	.long	1078181180
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	876402988
	.long	1075010976
	.long	3223313276
	.long	-1074622293
	.section	.rodata.cst8
	.align 8
.LC2:
	.long	1814424560
	.long	-1078294791
	.section	.rodata.cst16
	.align 16
.LC3:
	.long	2610154684
	.long	1071867654
	.long	4118647963
	.long	1074167538
	.align 16
.LC4:
	.long	2589591317
	.long	-1080438057
	.long	3651875800
	.long	1067666581
	.align 16
.LC5:
	.long	3274885735
	.long	1075883981
	.long	836633008
	.long	1074823115
	.section	.rodata.cst8
	.align 8
.LC6:
	.long	3790292604
	.long	-1076243629
	.section	.rodata.cst16
	.align 16
.LC7:
	.long	3095893058
	.long	-1074779103
	.long	3206516499
	.long	1073559017
	.align 16
.LC8:
	.long	1594958772
	.long	1065434184
	.long	218613303
	.long	1065819465
	.align 16
.LC9:
	.long	3467106767
	.long	1076480490
	.long	3592840830
	.long	-1070712600
	.section	.rodata.cst8
	.align 8
.LC10:
	.long	3190128032
	.long	-1077111465
	.section	.rodata.cst16
	.align 16
.LC11:
	.long	2844859375
	.long	1072780060
	.long	1045740485
	.long	1072417919
	.align 16
.LC12:
	.long	4210179708
	.long	-1081725077
	.long	2633244339
	.long	1063009746
	.align 16
.LC13:
	.long	2835699498
	.long	1076806247
	.long	868786720
	.long	-1069946024
	.section	.rodata.cst8
	.align 8
.LC14:
	.long	2477516096
	.long	1070002675
	.section	.rodata.cst16
	.align 16
.LC15:
	.long	374979658
	.long	1072649398
	.long	834993059
	.long	1071843270
	.align 16
.LC16:
	.long	1484154358
	.long	-1079915640
	.long	1394055596
	.long	1063299315
	.align 16
.LC18:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 16
.LC19:
	.quad	4617136985637443884
	.quad	-4615467600764216452
	.align 16
.LC20:
	.quad	4603636522180398268
	.quad	4613514450253485211
	.align 16
.LC21:
	.quad	-4640446117579192555
	.quad	4585593052079010776
	.align 16
.LC22:
	.quad	4620886515960171111
	.quad	4616330128746480048
	.align 16
.LC23:
	.quad	-4616141094713322430
	.quad	4610900871547424531
	.align 16
.LC24:
	.quad	4576004977915405236
	.quad	4577659745833829943
	.align 16
.LC25:
	.quad	4623448502799161807
	.quad	-4598675596822288770
	.align 16
.LC26:
	.quad	4607555276345777135
	.quad	4605999890795117509
	.align 16
.LC27:
	.quad	-4645973824767902084
	.quad	4565592097032511155
	.align 16
.LC28:
	.quad	4624847617829197610
	.quad	-4595383180696444384
	.align 16
.LC29:
	.quad	4606994084859067466
	.quad	4603531791922690979
	.align 16
.LC30:
	.quad	-4638202354754755082
	.quad	4566835785178257836
	.section	.rodata.cst8
	.align 8
.LC31:
	.long	0
	.long	1071644672
	.section	.rodata.cst16
	.align 16
.LC33:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 16
.LC34:
	.long	0
	.long	1073217536
	.long	0
	.long	1073217536
	.align 16
.LC35:
	.long	1202590843
	.long	1065646817
	.long	1202590843
	.long	1065646817
	.section	.rodata.cst8
	.align 8
.LC36:
	.long	1202590843
	.long	1065646817
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
