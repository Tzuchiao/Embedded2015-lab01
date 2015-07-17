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
	@no subroutine so we don't need pop and push

	mov r3, #-1	@previous = -1
	mov r4, #1	@result = 1
	mov r5, #0	@i=0
	mov r6, #0	@sum=0

.loop:
	add r6, r4, r3	@sum = previos + result
	mov r3, r4	@previous = result
	mov r4, r6	@result = sum
	add r5, #1	@i++

	cmp r0, r5	@if(x>r5) , continue the loop , else return sum to r0
	bgt .loop
	mov r0, r6

	bx lr
	.size fibonacci, .-fibonacci
	.end
