	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0"
	.file	"main.ll"
	.globl	_start                          # -- Begin function _start
	.p2align	2
	.type	_start,@function
_start:                                 # @_start
	.cfi_startproc
# %bb.0:                                # %end
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)                      # 4-byte Folded Spill
	sw	s0, 40(sp)                      # 4-byte Folded Spill
	sw	s1, 36(sp)                      # 4-byte Folded Spill
	sw	s2, 32(sp)                      # 4-byte Folded Spill
	sw	s3, 28(sp)                      # 4-byte Folded Spill
	sw	s4, 24(sp)                      # 4-byte Folded Spill
	sw	s5, 20(sp)                      # 4-byte Folded Spill
	sw	s6, 16(sp)                      # 4-byte Folded Spill
	sw	s7, 12(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	.cfi_offset s5, -28
	.cfi_offset s6, -32
	.cfi_offset s7, -36
	lui	a0, %hi(str)
	addi	s0, a0, %lo(str)
	li	a2, 4
	li	a0, 0
	mv	a1, s0
	call	read
	li	a2, 1
	li	a0, 0
	li	a1, 0
	call	read
	mv	a0, s0
	call	atoi
	mv	s3, a0
	addi	s1, s0, 5
	li	a2, 4
	li	a0, 0
	mv	a1, s1
	call	read
	li	a2, 1
	li	a0, 0
	li	a1, 0
	call	read
	mv	a0, s1
	call	atoi
	mv	s5, a0
	addi	s2, s0, 10
	li	a2, 4
	li	a0, 0
	mv	a1, s2
	call	read
	li	a2, 1
	li	a0, 0
	li	a1, 0
	call	read
	mv	a0, s2
	call	atoi
	mv	s6, a0
	addi	s4, s0, 15
	li	a2, 4
	li	a0, 0
	mv	a1, s4
	call	read
	li	a2, 1
	li	a0, 0
	li	a1, 0
	call	read
	mv	a0, s4
	call	atoi
	mv	s7, a0
	mv	a0, s3
	call	sqrt
	mv	a1, s0
	call	itoa
	mv	a0, s5
	call	sqrt
	mv	a1, s1
	call	itoa
	mv	a0, s6
	call	sqrt
	mv	a1, s2
	call	itoa
	mv	a0, s7
	call	sqrt
	mv	a1, s4
	call	itoa
	li	a0, 1
	li	a2, 25
	mv	a1, s0
	call	write
	li	a0, 0
	lw	ra, 44(sp)                      # 4-byte Folded Reload
	lw	s0, 40(sp)                      # 4-byte Folded Reload
	lw	s1, 36(sp)                      # 4-byte Folded Reload
	lw	s2, 32(sp)                      # 4-byte Folded Reload
	lw	s3, 28(sp)                      # 4-byte Folded Reload
	lw	s4, 24(sp)                      # 4-byte Folded Reload
	lw	s5, 20(sp)                      # 4-byte Folded Reload
	lw	s6, 16(sp)                      # 4-byte Folded Reload
	lw	s7, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	_start, .Lfunc_end0-_start
	.cfi_endproc
                                        # -- End function
	.globl	itoa                            # -- Begin function itoa
	.p2align	2
	.type	itoa,@function
itoa:                                   # @itoa
	.cfi_startproc
# %bb.0:                                # %entry
	li	a2, 0
	li	a3, 3
	lui	a4, 419430
	addi	a4, a4, 1639
	li	a5, 10
.LBB1_1:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	sub	a6, a3, a2
	slli	a7, a2, 24
	srai	a7, a7, 24
	slli	a6, a6, 24
	srai	a6, a6, 24
	add	a6, a1, a6
	mulh	t0, a0, a4
	srli	t1, t0, 31
	srai	t0, t0, 2
	add	t0, t0, t1
	mul	t1, t0, a5
	sub	a0, a0, t1
	addi	a0, a0, 48
	sb	a0, 0(a6)
	addi	a2, a2, 1
	mv	a0, t0
	blt	a7, a3, .LBB1_1
# %bb.2:                                # %break
	ret
.Lfunc_end1:
	.size	itoa, .Lfunc_end1-itoa
	.cfi_endproc
                                        # -- End function
	.globl	atoi                            # -- Begin function atoi
	.p2align	2
	.type	atoi,@function
atoi:                                   # @atoi
	.cfi_startproc
# %bb.0:                                # %start
	li	a2, 0
	li	a5, 0
	li	a3, 10
	li	a4, 4
.LBB2_1:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	slli	a1, a2, 24
	srai	a6, a1, 24
	add	a1, a0, a6
	lbu	a7, 0(a1)
	mv	a1, a5
	mul	a5, a5, a3
	add	a5, a7, a5
	addi	a5, a5, -48
	addi	a2, a2, 1
	blt	a6, a4, .LBB2_1
# %bb.2:                                # %end
	mv	a0, a1
	ret
.Lfunc_end2:
	.size	atoi, .Lfunc_end2-atoi
	.cfi_endproc
                                        # -- End function
	.globl	sqrt                            # -- Begin function sqrt
	.p2align	2
	.type	sqrt,@function
sqrt:                                   # @sqrt
	.cfi_startproc
# %bb.0:                                # %entry
	srli	a1, a0, 31
	add	a1, a0, a1
	srai	a1, a1, 1
	li	a2, -1
	li	a3, 20
.LBB3_1:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	div	a4, a0, a1
	add	a1, a4, a1
	srli	a4, a1, 31
	add	a1, a1, a4
	addi	a2, a2, 1
	srai	a1, a1, 1
	blt	a2, a3, .LBB3_1
# %bb.2:                                # %break
	mv	a0, a1
	ret
.Lfunc_end3:
	.size	sqrt, .Lfunc_end3-sqrt
	.cfi_endproc
                                        # -- End function
	.type	str,@object                     # @str
	.data
	.globl	str
str:
	.asciz	"0000 0000 0000 0000\n"
	.size	str, 21

	.section	".note.GNU-stack","",@progbits
