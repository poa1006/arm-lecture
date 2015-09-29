	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r4, r5,r6,r7,lr}
	
	mov r4 ,#0	@ R4 = 0
	mov r5 ,#1	@ R5 = 1
	

	subs r6, r0 ,#1	@ get value -1 to r6
	bgt  .Loop	@ If R6 > 1 goto .Loop or return r0

	pop {r4, r5, r6,r7,pc}		@EPILOG

	@ END CODE MODIFICATION
.Loop:
	add r7, r4, r5	@sum = R4 + R5
	mov r4, r5	@R4 = R5
	mov r5, r7	@R5 = sum
	
	subs r6 , r6 , #1	@R6 = R6 -1
	bgt  .Loop		@if R6 > 1 goto .Loop or return
	
	mov r0, r7 		@R0 = sum

	pop {r4, r5,r6,r7, pc}	@ EPILOG


	.size fibonacci, .-fibonacci
	.end
