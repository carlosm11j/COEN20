// Carlos Mercado
// January 21, 2020
// functions.s
// Lab2a COEN 20

		.syntax	unified
		.cpu	cortex-m4
		.text
	
	// int32_t Add(int32_t a, int32_t b);
		.global	Add
		.thumb_func
	Add:
		ADD R0, R0, R1
		BX LR
		
	
	// int32_t Less1(int32_t a);
		.global Less1
		.thumb_func
	Less1:
		SUB R0, 1
		BX LR
	
	// int32_t Square2x(int32_t x);
		.global	Square2x
		.thumb_func
	Square2x:
		//Pushing Link Register onto Stack
		PUSH {LR}
		//Adding R0 + R0 and setting it to R0
		ADD R0, R0, R0
		BL Square
		//Popping Link Register
		POP {LR}
		BX LR
	
	// int32_t Last(int32_t x);
		.global Last
		.thumb_func
	Last:
		//Pushing LR and R4 onto stack
		PUSH {R4, LR}
		//Copying R0 onto R4
		MOV R4, R0
		BL SquareRoot
		//Adding R4 and R0 and saving it to R0
		ADD R0, R4, R0
		POP {R4, LR}
		BX LR
		
	
		.end
		