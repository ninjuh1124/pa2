	.globl	nCr
	.type	nCr, @function
nCr:
	.cfi_startproc
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$12, %rsp
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	cmpl	$0, %esi
	je	.B
	cmpl	%edi, %esi
	jne	.M
.B:
	movl	$1, %eax
	jmp	.R
.M:
	subl	$1, %edi
	subl	$1, %esi
	call	nCr
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %edi
	movl	-12(%rbp), %esi
	subl	$1, %edi
	call	nCr
	addl	-4(%rbp), %eax
.R:
	addq	$12, %rsp
	popq	%rbp
	ret
	.cfi_endproc
