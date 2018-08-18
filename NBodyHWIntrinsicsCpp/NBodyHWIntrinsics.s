	.file	"NBodyHWIntrinsics.cpp"
	.text
	.section	.text._ZN5NBodyC2Ev,"axG",@progbits,_ZN5NBodyC5Ev,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZN5NBodyC2Ev
	.type	_ZN5NBodyC2Ev, @function
_ZN5NBodyC2Ev:
.LFB6332:
	.cfi_startproc
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rdi)
	movups	%xmm0, 16(%rdi)
	movups	%xmm0, 64(%rdi)
	movups	%xmm0, 80(%rdi)
	movups	%xmm0, 128(%rdi)
	movups	%xmm0, 144(%rdi)
	movups	%xmm0, 192(%rdi)
	movups	%xmm0, 208(%rdi)
	movups	%xmm0, 256(%rdi)
	movups	%xmm0, 272(%rdi)
	movups	%xmm0, 320(%rdi)
	movups	%xmm0, 336(%rdi)
	movups	%xmm0, 384(%rdi)
	movups	%xmm0, 400(%rdi)
	ret
	.cfi_endproc
.LFE6332:
	.size	_ZN5NBodyC2Ev, .-_ZN5NBodyC2Ev
	.weak	_ZN5NBodyC1Ev
	.set	_ZN5NBodyC1Ev,_ZN5NBodyC2Ev
	.text
	.align 2
	.p2align 4,,15
	.globl	_ZN5NBodyD2Ev
	.type	_ZN5NBodyD2Ev, @function
_ZN5NBodyD2Ev:
.LFB6338:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE6338:
	.size	_ZN5NBodyD2Ev, .-_ZN5NBodyD2Ev
	.globl	_ZN5NBodyD1Ev
	.set	_ZN5NBodyD1Ev,_ZN5NBodyD2Ev
	.align 2
	.p2align 4,,15
	.globl	_ZN5NBody10InitializeEv
	.type	_ZN5NBody10InitializeEv, @function
_ZN5NBody10InitializeEv:
.LFB6340:
	.cfi_startproc
	movq	%rdi, %rdx
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	andl	$15, %edx
	je	.L8
	leaq	16(%rdi), %rax
	subq	%rdx, %rax
	movq	%rax, %r8
.L5:
	movq	.LC0(%rip), %rbx
	leaq	64(%rax), %r10
	movq	%r8, 448(%rdi)
	pxor	%xmm9, %xmm9
	leaq	320(%rax), %rdx
	movq	%r10, 456(%rdi)
	leaq	128(%rax), %r9
	movq	%rdx, 488(%rdi)
	leaq	192(%rax), %rsi
	movq	%r9, 464(%rdi)
	leaq	256(%rax), %rcx
	movq	%rsi, 472(%rdi)
	leaq	384(%rax), %r11
	movq	%rcx, 480(%rdi)
	movq	%r11, 496(%rdi)
	movq	%rbx, 16(%r8)
	movq	.LC1(%rip), %rbx
	movq	%rbx, 24(%r8)
	movq	.LC2(%rip), %rbx
	movq	%rbx, 32(%r8)
	movq	.LC3(%rip), %rbx
	movq	%rbx, 40(%r8)
	movq	.LC4(%rip), %rbx
	movq	%rbx, 80(%rax)
	movq	.LC5(%rip), %rbx
	movq	%rbx, 88(%rax)
	movq	.LC6(%rip), %rbx
	movq	%rbx, 96(%rax)
	movq	.LC7(%rip), %rbx
	movq	%rbx, 104(%rax)
	movq	.LC8(%rip), %rbx
	movq	%rbx, 144(%rax)
	movq	.LC9(%rip), %rbx
	movq	%rbx, 152(%rax)
	movq	.LC10(%rip), %rbx
	movq	%rbx, 160(%rax)
	movq	.LC11(%rip), %rbx
	movq	%rbx, 168(%rax)
	movq	.LC12(%rip), %rbx
	movq	%rbx, 208(%rax)
	movq	.LC13(%rip), %rbx
	movapd	.LC25(%rip), %xmm4
	movapd	.LC26(%rip), %xmm7
	movq	%rbx, 216(%rax)
	movq	.LC14(%rip), %rbx
	movapd	208(%rax), %xmm1
	movaps	%xmm7, 400(%rax)
	mulpd	%xmm4, %xmm1
	movq	%rbx, 224(%rax)
	movq	.LC15(%rip), %rbx
	movq	%rbx, 232(%rax)
	movq	.LC16(%rip), %rbx
	movq	%rbx, 272(%rax)
	movq	.LC17(%rip), %rbx
	movq	%rbx, 280(%rax)
	movq	.LC18(%rip), %rbx
	movapd	272(%rax), %xmm3
	mulpd	%xmm4, %xmm3
	movq	%rbx, 288(%rax)
	movq	.LC19(%rip), %rbx
	movq	%rbx, 296(%rax)
	movq	.LC20(%rip), %rbx
	movq	%rbx, 336(%rax)
	movq	.LC21(%rip), %rbx
	movq	%rbx, 344(%rax)
	movq	.LC22(%rip), %rbx
	movapd	336(%rax), %xmm2
	mulpd	%xmm4, %xmm2
	movq	%rbx, 352(%rax)
	movq	.LC23(%rip), %rbx
	movq	%rbx, 360(%rax)
	movq	.LC24(%rip), %rbx
	movq	%rbx, 384(%rax)
	movq	472(%rdi), %rax
	movaps	%xmm1, 16(%rax)
	movq	480(%rdi), %rax
	mulpd	%xmm7, %xmm1
	movapd	.LC27(%rip), %xmm6
	movaps	%xmm3, 16(%rax)
	movq	488(%rdi), %rax
	mulpd	%xmm7, %xmm3
	movaps	%xmm2, 16(%rax)
	movq	472(%rdi), %rdx
	mulpd	%xmm7, %xmm2
	movq	496(%rdi), %rax
	movapd	32(%rdx), %xmm8
	movq	480(%rdi), %rdx
	addpd	%xmm9, %xmm2
	mulpd	%xmm4, %xmm8
	movapd	32(%rdx), %xmm5
	movq	488(%rdi), %rdx
	mulpd	%xmm4, %xmm5
	mulpd	32(%rdx), %xmm4
	movaps	%xmm6, 32(%rax)
	movq	472(%rdi), %rax
	movapd	%xmm4, %xmm0
	movaps	%xmm8, 32(%rax)
	movq	480(%rdi), %rax
	mulpd	%xmm6, %xmm0
	mulpd	%xmm6, %xmm8
	movaps	%xmm5, 32(%rax)
	mulpd	%xmm6, %xmm5
	movq	488(%rdi), %rax
	addpd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	movapd	%xmm3, %xmm1
	addpd	%xmm9, %xmm0
	addpd	%xmm9, %xmm1
	movaps	%xmm4, 32(%rax)
	movq	472(%rdi), %rax
	haddpd	%xmm2, %xmm2
	addpd	%xmm8, %xmm0
	addpd	%xmm5, %xmm1
	haddpd	%xmm1, %xmm0
	movapd	.LC28(%rip), %xmm1
	divpd	%xmm1, %xmm2
	divpd	%xmm1, %xmm0
	movlpd	%xmm0, (%rax)
	movq	480(%rdi), %rax
	psrldq	$8, %xmm0
	movlpd	%xmm0, (%rax)
	movq	488(%rdi), %rax
	movlpd	%xmm2, (%rax)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore_state
	movq	%rdi, %rax
	movq	%rdi, %r8
	jmp	.L5
	.cfi_endproc
.LFE6340:
	.size	_ZN5NBody10InitializeEv, .-_ZN5NBody10InitializeEv
	.align 2
	.p2align 4,,15
	.globl	_ZN5NBody6EnergyEv
	.type	_ZN5NBody6EnergyEv, @function
_ZN5NBody6EnergyEv:
.LFB6341:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%edx, %edx
	movapd	.LC29(%rip), %xmm4
	movl	$2, %eax
	movapd	.LC30(%rip), %xmm10
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pxor	%xmm1, %xmm1
	movapd	.LC31(%rip), %xmm9
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	448(%rdi), %r11
	movq	456(%rdi), %r10
	movq	464(%rdi), %r9
	movq	472(%rdi), %r12
	movq	480(%rdi), %rbp
	movq	488(%rdi), %rbx
	movq	496(%rdi), %r8
	movapd	.LC32(%rip), %xmm8
.L18:
	movapd	(%r12,%rdx), %xmm0
	leal	1(%rax), %esi
	movapd	0(%rbp,%rdx), %xmm5
	mulpd	%xmm0, %xmm0
	movapd	(%rbx,%rdx), %xmm3
	mulpd	%xmm5, %xmm5
	movapd	(%r8,%rdx), %xmm2
	mulpd	%xmm3, %xmm3
	movapd	(%r10,%rdx), %xmm6
	movapd	(%r9,%rdx), %xmm7
	addpd	%xmm5, %xmm0
	movapd	(%r11,%rdx), %xmm5
	addpd	%xmm3, %xmm0
	movapd	%xmm2, %xmm3
	unpcklpd	%xmm2, %xmm3
	mulpd	%xmm2, %xmm0
	mulpd	%xmm4, %xmm0
	addpd	%xmm0, %xmm1
	cmpl	$5, %eax
	jg	.L11
	movl	$1, %edi
.L12:
	movslq	%eax, %rcx
	movapd	%xmm5, %xmm12
	movapd	%xmm7, %xmm11
	movupd	(%r11,%rcx,8), %xmm0
	movupd	(%r10,%rcx,8), %xmm14
	subpd	%xmm0, %xmm12
	movapd	%xmm6, %xmm0
	movupd	(%r9,%rcx,8), %xmm15
	subpd	%xmm14, %xmm0
	subpd	%xmm15, %xmm11
	mulpd	%xmm12, %xmm12
	mulpd	%xmm0, %xmm0
	mulpd	%xmm11, %xmm11
	addpd	%xmm12, %xmm0
	addpd	%xmm0, %xmm11
	cvtpd2ps	%xmm11, %xmm0
	rsqrtps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm12
	mulpd	%xmm12, %xmm11
	movapd	%xmm10, %xmm0
	mulpd	%xmm12, %xmm11
	subpd	%xmm11, %xmm0
	movapd	%xmm0, %xmm11
	mulpd	%xmm0, %xmm0
	movapd	%xmm11, %xmm13
	mulpd	%xmm8, %xmm13
	mulpd	%xmm12, %xmm11
	mulpd	%xmm9, %xmm0
	addpd	%xmm4, %xmm13
	addpd	%xmm13, %xmm0
	mulpd	%xmm11, %xmm0
	movupd	(%r8,%rcx,8), %xmm11
	mulpd	%xmm3, %xmm11
	addpd	%xmm12, %xmm0
	mulpd	%xmm11, %xmm0
	cmpl	$5, %eax
	je	.L16
	addl	$2, %eax
	subpd	%xmm0, %xmm1
	cmpl	$6, %eax
	je	.L15
	movslq	%eax, %rcx
	movapd	%xmm5, %xmm0
	movapd	%xmm6, %xmm12
	movupd	(%r11,%rcx,8), %xmm14
	movapd	%xmm7, %xmm11
	movupd	(%r10,%rcx,8), %xmm15
	subpd	%xmm14, %xmm0
	movupd	(%r9,%rcx,8), %xmm14
	subpd	%xmm15, %xmm12
	subpd	%xmm14, %xmm11
	mulpd	%xmm0, %xmm0
	mulpd	%xmm12, %xmm12
	mulpd	%xmm11, %xmm11
	addpd	%xmm12, %xmm0
	addpd	%xmm0, %xmm11
	cvtpd2ps	%xmm11, %xmm0
	rsqrtps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm12
	mulpd	%xmm12, %xmm11
	movapd	%xmm10, %xmm0
	mulpd	%xmm12, %xmm11
	subpd	%xmm11, %xmm0
	movapd	%xmm0, %xmm11
	mulpd	%xmm8, %xmm0
	movapd	%xmm11, %xmm13
	mulpd	%xmm11, %xmm13
	mulpd	%xmm12, %xmm11
	addpd	%xmm4, %xmm0
	mulpd	%xmm9, %xmm13
	addpd	%xmm13, %xmm0
	mulpd	%xmm11, %xmm0
	movupd	(%r8,%rcx,8), %xmm11
	mulpd	%xmm11, %xmm3
	addpd	%xmm12, %xmm0
	mulpd	%xmm3, %xmm0
	cmpl	$5, %eax
	je	.L16
.L43:
	subpd	%xmm0, %xmm1
.L15:
	cmpl	$2, %edi
	jne	.L44
.L13:
	addq	$16, %rdx
	cmpq	$48, %rdx
	je	.L45
	movl	%esi, %eax
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L44:
	cmpl	$3, %esi
	jne	.L23
	testb	$1, %dil
	jne	.L21
.L23:
	movl	%esi, %eax
	addl	$1, %edi
	addl	$1, %esi
.L19:
	movapd	%xmm2, %xmm3
	unpckhpd	%xmm2, %xmm3
	cmpl	$5, %eax
	jle	.L12
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L45:
	haddpd	%xmm1, %xmm1
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	pxor	%xmm3, %xmm3
	unpcklpd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L21:
	movl	$3, %esi
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L11:
	cmpl	$3, %esi
	je	.L13
	leal	2(%rax), %ecx
	movl	$2, %edi
	movl	%esi, %eax
	movl	%ecx, %esi
	jmp	.L19
	.cfi_endproc
.LFE6341:
	.size	_ZN5NBody6EnergyEv, .-_ZN5NBody6EnergyEv
	.align 2
	.p2align 4,,15
	.globl	_ZN5NBody11EnergyInnerEDv2_diS0_S0_S0_S0_
	.type	_ZN5NBody11EnergyInnerEDv2_diS0_S0_S0_S0_, @function
_ZN5NBody11EnergyInnerEDv2_diS0_S0_S0_S0_:
.LFB6342:
	.cfi_startproc
	cmpl	$5, %esi
	jg	.L46
	movq	496(%rdi), %r9
	movslq	%esi, %rax
	movq	448(%rdi), %r8
	movq	456(%rdi), %rcx
	movq	464(%rdi), %rdx
	movl	$5, %edi
	subq	%rsi, %rdi
	movapd	.LC30(%rip), %xmm10
	movq	%rdi, %rsi
	movapd	.LC31(%rip), %xmm7
	movapd	.LC32(%rip), %xmm9
	andl	$4294967294, %esi
	movapd	.LC29(%rip), %xmm8
	leaq	2(%rax,%rsi), %rsi
	.p2align 4,,10
	.p2align 3
.L49:
	movupd	(%r8,%rax,8), %xmm5
	movapd	%xmm2, %xmm6
	movapd	%xmm3, %xmm11
	movupd	(%rdx,%rax,8), %xmm13
	subpd	%xmm5, %xmm6
	movupd	(%rcx,%rax,8), %xmm5
	subpd	%xmm5, %xmm11
	movapd	%xmm4, %xmm5
	subpd	%xmm13, %xmm5
	mulpd	%xmm6, %xmm6
	mulpd	%xmm11, %xmm11
	mulpd	%xmm5, %xmm5
	addpd	%xmm11, %xmm6
	movapd	%xmm10, %xmm11
	addpd	%xmm6, %xmm5
	cvtpd2ps	%xmm5, %xmm6
	rsqrtps	%xmm6, %xmm6
	cvtps2pd	%xmm6, %xmm6
	mulpd	%xmm6, %xmm5
	mulpd	%xmm6, %xmm5
	subpd	%xmm5, %xmm11
	movapd	%xmm11, %xmm12
	movapd	%xmm11, %xmm5
	mulpd	%xmm11, %xmm12
	mulpd	%xmm9, %xmm5
	mulpd	%xmm6, %xmm11
	mulpd	%xmm7, %xmm12
	addpd	%xmm8, %xmm5
	addpd	%xmm12, %xmm5
	mulpd	%xmm11, %xmm5
	addpd	%xmm6, %xmm5
	movupd	(%r9,%rax,8), %xmm6
	mulpd	%xmm1, %xmm6
	mulpd	%xmm6, %xmm5
	cmpl	$5, %eax
	je	.L48
	addq	$2, %rax
	subpd	%xmm5, %xmm0
	cmpq	%rax, %rsi
	jne	.L49
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	pxor	%xmm7, %xmm7
	unpcklpd	%xmm5, %xmm7
	subpd	%xmm7, %xmm0
.L46:
	ret
	.cfi_endproc
.LFE6342:
	.size	_ZN5NBody11EnergyInnerEDv2_diS0_S0_S0_S0_, .-_ZN5NBody11EnergyInnerEDv2_diS0_S0_S0_S0_
	.align 2
	.p2align 4,,15
	.globl	_ZN5NBody7AdvanceEid
	.type	_ZN5NBody7AdvanceEid, @function
_ZN5NBody7AdvanceEid:
.LFB6343:
	.cfi_startproc
	movapd	.LC30(%rip), %xmm15
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%esi, %r15d
	movddup	%xmm0, %xmm4
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$5, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movaps	%xmm4, -56(%rsp)
	testl	%r15d, %r15d
	jle	.L51
	.p2align 4,,10
	.p2align 3
.L62:
	movq	448(%rdi), %rbx
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	movq	456(%rdi), %rsi
	movq	464(%rdi), %r11
	movq	472(%rdi), %r10
	movq	480(%rdi), %r13
	movq	488(%rdi), %r12
	movq	496(%rdi), %rbp
	.p2align 4,,10
	.p2align 3
.L53:
	leal	2(%rcx), %edx
	movddup	0(%rbp,%rcx,8), %xmm3
	movddup	(%rbx,%rcx,8), %xmm14
	movaps	%xmm3, -40(%rsp)
	andl	$-2, %edx
	movddup	(%rsi,%rcx,8), %xmm13
	movddup	(%r11,%rcx,8), %xmm12
	movddup	(%r10,%rcx,8), %xmm9
	movddup	0(%r13,%rcx,8), %xmm11
	movddup	(%r12,%rcx,8), %xmm10
	cmpl	$5, %edx
	jg	.L54
	movslq	%edx, %r8
	leaq	0(,%r8,8), %rax
	movq	%rax, -16(%rsp)
	movq	%r14, %rax
	subq	%rdx, %rax
	movq	%rax, %rdx
	movq	-16(%rsp), %rax
	andl	$4294967294, %edx
	leaq	2(%r8,%rdx), %r8
	salq	$3, %r8
	.p2align 4,,10
	.p2align 3
.L55:
	movq	448(%rdi), %rdx
	movapd	%xmm15, %xmm6
	movapd	.LC32(%rip), %xmm8
	movapd	(%rdx,%rax), %xmm4
	movq	456(%rdi), %rdx
	mulpd	%xmm14, %xmm4
	movapd	(%rdx,%rax), %xmm3
	movq	464(%rdi), %rdx
	mulpd	%xmm13, %xmm3
	movapd	%xmm4, %xmm7
	mulpd	%xmm4, %xmm7
	movapd	(%rdx,%rax), %xmm2
	movq	472(%rdi), %rdx
	mulpd	%xmm12, %xmm2
	movapd	%xmm3, %xmm0
	mulpd	%xmm3, %xmm0
	addq	%rax, %rdx
	addpd	%xmm0, %xmm7
	movapd	%xmm2, %xmm0
	mulpd	%xmm2, %xmm0
	addpd	%xmm0, %xmm7
	cvtpd2ps	%xmm7, %xmm1
	rsqrtps	%xmm1, %xmm5
	rcpps	%xmm1, %xmm1
	cvtps2pd	%xmm5, %xmm5
	movapd	%xmm5, %xmm0
	mulpd	%xmm7, %xmm0
	cvtps2pd	%xmm1, %xmm1
	mulpd	%xmm1, %xmm7
	mulpd	%xmm5, %xmm0
	subpd	%xmm0, %xmm6
	movapd	%xmm15, %xmm0
	subpd	%xmm7, %xmm0
	mulpd	%xmm6, %xmm8
	addpd	.LC29(%rip), %xmm8
	movapd	%xmm0, %xmm7
	movapd	%xmm6, %xmm0
	mulpd	%xmm6, %xmm0
	mulpd	.LC31(%rip), %xmm0
	mulpd	%xmm5, %xmm6
	addpd	%xmm8, %xmm0
	mulpd	%xmm6, %xmm0
	movapd	%xmm4, %xmm6
	addpd	%xmm0, %xmm5
	movapd	%xmm7, %xmm0
	mulpd	%xmm7, %xmm0
	addpd	%xmm15, %xmm7
	addpd	%xmm15, %xmm0
	mulpd	%xmm0, %xmm7
	movapd	-40(%rsp), %xmm0
	mulpd	%xmm7, %xmm1
	mulpd	%xmm1, %xmm5
	movapd	(%rdx), %xmm1
	mulpd	-56(%rsp), %xmm5
	mulpd	%xmm5, %xmm0
	mulpd	%xmm0, %xmm6
	subpd	%xmm6, %xmm1
	movapd	%xmm3, %xmm6
	mulpd	%xmm0, %xmm6
	mulpd	%xmm2, %xmm0
	movaps	%xmm1, (%rdx)
	movq	480(%rdi), %rdx
	addq	%rax, %rdx
	movapd	(%rdx), %xmm1
	subpd	%xmm6, %xmm1
	movaps	%xmm1, (%rdx)
	movq	488(%rdi), %rdx
	addq	%rax, %rdx
	movapd	(%rdx), %xmm1
	subpd	%xmm0, %xmm1
	movaps	%xmm1, (%rdx)
	movq	496(%rdi), %rdx
	mulpd	(%rdx,%rax), %xmm5
	addq	$16, %rax
	mulpd	%xmm5, %xmm4
	mulpd	%xmm5, %xmm3
	mulpd	%xmm5, %xmm2
	addpd	%xmm4, %xmm9
	addpd	%xmm3, %xmm11
	addpd	%xmm2, %xmm10
	cmpq	%rax, %r8
	jne	.L55
.L54:
	movapd	-56(%rsp), %xmm2
	movapd	%xmm9, %xmm0
	haddpd	%xmm9, %xmm0
	mulpd	%xmm2, %xmm11
	mulpd	%xmm2, %xmm9
	mulpd	%xmm2, %xmm10
	movlpd	%xmm0, (%r10,%rcx,8)
	addpd	%xmm11, %xmm13
	addpd	%xmm9, %xmm14
	addpd	%xmm10, %xmm12
	haddpd	%xmm13, %xmm13
	haddpd	%xmm14, %xmm14
	haddpd	%xmm12, %xmm12
	movlpd	%xmm14, (%rbx,%rcx,8)
	movlpd	%xmm13, (%rsi,%rcx,8)
	movlpd	%xmm12, (%r11,%rcx,8)
	testl	%r9d, %r9d
	je	.L58
	addl	$1, %r9d
	cmpl	$6, %r9d
	je	.L61
.L56:
	addq	$1, %rcx
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L58:
	movl	$2, %r9d
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L61:
	subl	$1, %r15d
	testl	%r15d, %r15d
	jg	.L62
.L51:
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6343:
	.size	_ZN5NBody7AdvanceEid, .-_ZN5NBody7AdvanceEid
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC34:
	.string	"%.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB6344:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$50000000, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$520, %rsp
	.cfi_def_cfa_offset 544
	movq	%fs:40, %rax
	movq	%rax, 504(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L64
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %ebp
.L64:
	movq	%rsp, %rbx
	movq	%rbx, %rdi
	call	_ZN5NBodyC1Ev
	movq	%rbx, %rdi
	call	_ZN5NBody10InitializeEv
	call	_ZN5NBody6EnergyEv
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC34(%rip), %rsi
	call	__printf_chk@PLT
	movsd	.LC35(%rip), %xmm0
	movl	%ebp, %esi
	movq	%rbx, %rdi
	call	_ZN5NBody7AdvanceEid
	call	_ZN5NBody6EnergyEv
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC34(%rip), %rsi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	504(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L69
	addq	$520, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L69:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6344:
	.size	main, .-main
	.p2align 4,,15
	.type	_GLOBAL__sub_I__ZN5NBodyD2Ev, @function
_GLOBAL__sub_I__ZN5NBodyD2Ev:
.LFB6825:
	.cfi_startproc
	leaq	_ZStL8__ioinit(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE6825:
	.size	_GLOBAL__sub_I__ZN5NBodyD2Ev, .-_GLOBAL__sub_I__ZN5NBodyD2Ev
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__ZN5NBodyD2Ev
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	876402988
	.long	1075010976
	.align 8
.LC1:
	.long	3274885735
	.long	1075883981
	.align 8
.LC2:
	.long	3467106767
	.long	1076480490
	.align 8
.LC3:
	.long	2835699498
	.long	1076806247
	.align 8
.LC4:
	.long	3223313276
	.long	-1074622293
	.align 8
.LC5:
	.long	836633008
	.long	1074823115
	.align 8
.LC6:
	.long	3592840830
	.long	-1070712600
	.align 8
.LC7:
	.long	868786720
	.long	-1069946024
	.align 8
.LC8:
	.long	1814424560
	.long	-1078294791
	.align 8
.LC9:
	.long	3790292604
	.long	-1076243629
	.align 8
.LC10:
	.long	3190128032
	.long	-1077111465
	.align 8
.LC11:
	.long	2477516096
	.long	1070002675
	.align 8
.LC12:
	.long	3102511625
	.long	1062941405
	.align 8
.LC13:
	.long	177085814
	.long	-1083790410
	.align 8
.LC14:
	.long	1049090388
	.long	1063799096
	.align 8
.LC15:
	.long	3843769120
	.long	1063646665
	.align 8
.LC16:
	.long	2482401462
	.long	1065322751
	.align 8
.LC17:
	.long	628455608
	.long	1064597846
	.align 8
.LC18:
	.long	1254141153
	.long	1063484420
	.align 8
.LC19:
	.long	916037000
	.long	1062907223
	.align 8
.LC20:
	.long	1189002624
	.long	-1089332839
	.align 8
.LC21:
	.long	2628602560
	.long	1056450871
	.align 8
.LC22:
	.long	4275829408
	.long	-1090578045
	.align 8
.LC23:
	.long	192911184
	.long	-1088884217
	.align 8
.LC24:
	.long	3384690142
	.long	1078181180
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC25:
	.long	171798692
	.long	1081529303
	.long	171798692
	.long	1081529303
	.align 16
.LC26:
	.long	3651875800
	.long	1067666581
	.long	218613303
	.long	1065819465
	.align 16
.LC27:
	.long	2633244339
	.long	1063009746
	.long	1394055596
	.long	1063299315
	.align 16
.LC28:
	.long	3384690142
	.long	1078181180
	.long	3384690142
	.long	1078181180
	.align 16
.LC29:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 16
.LC30:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 16
.LC31:
	.long	0
	.long	1070858240
	.long	0
	.long	1070858240
	.align 16
.LC32:
	.long	0
	.long	1071120384
	.long	0
	.long	1071120384
	.section	.rodata.cst8
	.align 8
.LC35:
	.long	1202590843
	.long	1065646817
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
