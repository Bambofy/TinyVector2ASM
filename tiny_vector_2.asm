.DATA

.CODE
Vector2 STRUCT 
	X QWORD ?
	Y QWORD ?
Vector2 ENDS

;
; 08/03/2019
; http://richardbamford.dev R.G.B
;
; This program was created as a learning excersize with x64 assembly.


; XMM0
; Used as the first parameter vector X component.

; XMM1
; Used as the first parameter vector Y component.

; XMM2
; Used as the second parameter vector X component.

; XMM3
; Used as the second parameter vector Y component.


; RCX bits contains the starting address for the first parameter.
; RDX bits contain the starting address for the second parameter.



; Loading to and from memory.
LOAD_FIRST_PARAMETER:
	vmovsd XMM0, QWORD PTR [RCX + Vector2.X] ; move the value at RCX + Vector2.X Addr to XMM0
	vmovsd XMM1, QWORD PTR [RCX + Vector2.Y] ; move the value at RCX + Vector2.Y Addr to XMM1
	ret
	
WRITE_TO_FIRST_PARAMETER:
	vmovsd QWORD PTR [RCX + Vector2.X], XMM0 ; move the value at XMM0 back to the memory location RCX + Vector2.x
	vmovsd QWORD PTR [RCX + Vector2.Y], XMM1 ; move the value at XMM1 back to the memory location RCX + Vector2.y
	ret

; this function takes the argument registers RCX and RDX. It loads their values into the FPU.
LOAD_BOTH_PARAMETERS:
	vmovsd XMM0, QWORD PTR [RCX + Vector2.X] ; move the value at RCX + Vector2.X Addr to XMM0
	vmovsd XMM1, QWORD PTR [RCX + Vector2.Y] ; move the value at RCX + Vector2.Y Addr to XMM1
	vmovsd XMM2, QWORD PTR [RDX + Vector2.X] ; move the value at RCX + Vector2.X Addr to XMM0
	vmovsd XMM3, QWORD PTR [RDX + Vector2.Y] ; move the value at RCX + Vector2.X Addr to XMM0
	ret


; Operations.
Addition_ proc
	call LOAD_BOTH_PARAMETERS

	vaddsd XMM0, XMM0, XMM2 ; vector1.x = vector1.x + vector2.x
	vaddsd XMM1, XMM1, XMM3 ; vector1.y = vector1.y + vector2.y

	call WRITE_TO_FIRST_PARAMETER
	ret
Addition_ endp

Subtract_ proc
	call LOAD_BOTH_PARAMETERS

	vsubsd XMM0, XMM0, XMM2 ; vector1.x = vector1.x - vector2.x
	vsubsd XMM1, XMM1, XMM3 ; vector1.y = vector1.y - vector2.y

	call WRITE_TO_FIRST_PARAMETER
	ret
Subtract_ endp

Multiply_ proc
	call LOAD_BOTH_PARAMETERS

	vmulsd XMM0, XMM0, XMM2 ; vector1.x = vector1.x * vector2.x
	vmulsd XMM1, XMM1, XMM3 ; vector1.y = vector1.y * vector2.y

	call WRITE_TO_FIRST_PARAMETER
	ret
Multiply_ endp

Divide_ proc
	call LOAD_BOTH_PARAMETERS

	vdivsd XMM0, XMM0, XMM2
	vdivsd XMM1, XMM1, XMM3

	call WRITE_TO_FIRST_PARAMETER
	ret
Divide_ endp
	
Square_ proc
	call LOAD_FIRST_PARAMETER

	; multiply x it by itself
	vmulsd XMM0, XMM0, XMM0 ; vector1.x = vector1.x * vector1.x
	vmulsd XMM1, XMM1, XMM1 ; vector1.y = vector1.y * vector1.y

	call WRITE_TO_FIRST_PARAMETER
	ret
Square_ endp

SquareRoot_ proc
	call LOAD_FIRST_PARAMETER

	; multiply x it by itself
	vmulsd XMM0, XMM0, XMM0 ; vector1.x = vector1.x * vector1.x
	vmulsd XMM1, XMM1, XMM1 ; vector1.y = vector1.y * vector1.y

	vaddsd XMM0, XMM0, XMM1; XMM0 = vector2.x^2 + vector2.y^2

	vsqrtsd XMM0, XMM1, XMM0 ; xmm0 = sqrt(xmm3)

	; to return the value on the stack, we leave it in the XMMX registers.
	ret
SquareRoot_ endp

END