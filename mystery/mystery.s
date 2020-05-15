	.file	"mystery.c"
	.text
	.globl	compute_fib
	.type	compute_fib, @function
compute_fib:
.LFB25:
	.cfi_startproc
	cmpl	$1, %edi
	jg	.L2
	movslq	%edi, %rdi
	movl	$1, n(,%rdi,4)
	ret
.L2:
	movslq	%edi, %rax
	leal	-1(%rdi), %edx
	movslq	%edx, %rdx
	subl	$2, %edi
	movslq	%edi, %rdi
	movl	n(,%rdx,4), %edx
	addl	n(,%rdi,4), %edx
	movl	%edx, n(,%rax,4)
	ret
	.cfi_endproc
.LFE25:
	.size	compute_fib, .-compute_fib
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Value: %d\n"
.LC1:
	.string	"Value: 0"
	.text
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	8(%rsi), %rdi
	movl	$0, %eax
	call	atoi
	movl	%eax, %ebp
	movl	$0, %ebx
.L7:
	movl	%ebx, %edi
	call	compute_fib
	addl	$1, %ebx
	cmpl	$200, %ebx
	jne	.L7
	cmpl	$199, %ebp
	ja	.L8
	leal	-1(%rbp), %eax
	cltq
	movl	n(,%rax,4), %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	jmp	.L9
.L8:
	movl	$.LC1, %edi
	call	puts
.L9:
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.comm	n,800,32
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-16)"
	.section	.note.GNU-stack,"",@progbits
