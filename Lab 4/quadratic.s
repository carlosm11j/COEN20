//Carlos Mercado
//Febuary 4, 2020
//quadratic.s
//COEN 20 Lab 4

		.syntax		unified
		.cpu 		cortex-m4
		.text
		
		.global		Discriminant
		.thumb_func
	//int32_t Discriminant(int32_t a, int32_t b, int32_t c);
	Discriminant:
		MUL R1, R1, R1 //R1 <- b^2
		LSL R0, R0, 2 //R0 <- 4*a
		MLS R0, R0, R2, R1 //R0 <- b^2 - 4*a*c
		BX LR
	
		.global		Root1
		.thumb_func
	//int32_t Root1(int32_t a, int32_t b, int32_t c);
	Root1:
		PUSH {R4, R5, LR}
		MOV R4, R0 //R4 <- a
		MOV R5, R1 //R5 <- b
		BL Discriminant //R0 <- Discriminant
		BL SquareRoot //R0 <- SquareRoot
		NEG R1, R5 //R1 <- -b
		ADD R0, R0, R1 //R0 <- -b + SquareRoot(Discriminant)
		LSL R4, R4, 1 //R3 <- 2*a
		SDIV R0, R0, R4 //R0 <- (-b+SquareRoot(Discriminant)) / (2*a)
		POP {R4, R5, LR}
		BX LR
	
		.global		Root2
		.thumb_func
	//int32_t Root2(int32_t a, int32_t b, int32_t c);
	Root2:
		PUSH {R4, R5, LR}
		MOV R4, R0 //R4 <- a
		MOV R5, R1 //R5 <- b
		BL Discriminant //R0 <- Discriminant
		BL SquareRoot //R0 <- SquareRoot(Discriminant)
		NEG R1, R5 //R1 <- -b
		NEG R0, R0 //R0 <- -(SquareRoot(Discriminant))
		ADD R0, R0, R1 //R0 <- -b + -(SquareRoot(Discriminant))
		LSL R3, R4, 1 //R3 <- 2*a
		SDIV R0, R0, R3 //R0 <- (-b+SquareRoot(Discriminant)) / (2*a)\
		POP {R4, R5, LR}
		BX LR
		
		.global		Quadratic
		.thumb_func
	//int32_t Quadratic(int32_t x, int32_t a, int32_t b, int32_t c);
	Quadratic:
		PUSH {R4}
		MOV R4, R0
		MUL R0, R0, R0 //R0 <- x^2
		MUL R0, R0, R1 //R0 <- a*x^2
		MUL R2, R2, R4 //R2 <- b*x
		ADD R0, R0, R2 //R0 <- a*x^2 + b*x
		ADD R0, R0, R3 //R0 <- a*x^2 + b*x + c
		POP {R4} 
		BX LR
		
		.end