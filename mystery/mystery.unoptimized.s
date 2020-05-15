	.file	"mystery.c"
	.comm	n,800,32
	.text
	.globl	compute_fib
	.type	compute_fib, @function
compute_fib:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$1, -4(%rbp)
	jg	.L2
	movl	-4(%rbp), %eax
	cltq
	movl	$1, n(,%rax,4)
	jmp	.L4
.L2:
	movl	-4(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	n(,%rax,4), %edx
	movl	-4(%rbp), %eax
	subl	$2, %eax
	cltq
	movl	n(,%rax,4), %eax
	addl	%eax, %edx
	movl	-4(%rbp), %eax
	cltq
	movl	%edx, n(,%rax,4)
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	compute_fib, .-compute_fib
	.section	.rodata
.LC0:
	.string	"Value: %d\n"
.LC1:
	.string	"Value: 0"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	atoi
	movl	%eax, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L6
.L7:
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	compute_fib
	addl	$1, -4(%rbp)
.L6:
	cmpl	$199, -4(%rbp)
	jle	.L7
	cmpl	$0, -8(%rbp)
	js	.L8
	cmpl	$199, -8(%rbp)
	jg	.L8
	movl	-8(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	n(,%rax,4), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	jmp	.L9
.L8:
	movl	$.LC1, %edi
	call	puts
.L9:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-16)"
	.section	.note.GNU-stack,"",@progbits
