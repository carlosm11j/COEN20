//Carlos Mercado
//Febuary 4, 2020
//floating_point.s
//COEN 20 Lab 8b

		.syntax		unified
		.cpu 		cortex-m4
		.text
		
		.global		Discriminant
		.thumb_func
	//float Discriminant(float a, float b, float c);
	Discriminant:
		VMUL.F32 S1, S1, S1 //S1 <- b^2
		VMOV S3, 4.0
		VMUL.F32 S0, S0, S3 //S0 <- 4.0*a
		VMLS.F32 S1, S0, S2 //S0 <- b^2 - 4*a*c
		VMOV S0, S1
		BX LR
	
		.global		Root1
		.thumb_func
	//float Root1(float a, float b, float c);
	Root1:
		PUSH {R4, R5, LR}
		VMOV R4, S0 //R4 <- a
		VMOV R5, S1 //R5 <- b
		BL Discriminant //S0 <- Discriminant
		VMOV S4, R4 //S4 <- a
		VMOV S1, R5 //S1 <- b
		VSQRT.F32 S0, S0 //S0 <- SquareRoot(Discriminant)
		VNEG.F32 S1, S1 //S1 <- -b
		VADD.F32 S0, S0, S1 //S0 <- -b + SquareRoot(Discriminant)
		VMOV S2, 2.0
		VMUL.F32 S2, S2, S4 //S2 <- 2.0*a
		VDIV.F32 S0, S0, S2 //S0 <- (-b+SquareRoot(Discriminant)) / (2*a)
		POP {R4, R5, LR}
		BX LR
	
		.global		Root2
		.thumb_func
	//float Root2(float a, float b, float c);
	Root2:
		PUSH {R4, R5, LR}
		VMOV R4, S0 //R4 <- a
		VMOV R5, S1 //R5 <- b
		BL Discriminant //S0 <- Discriminant
		VMOV S4, R4 //S4 <- a
		VMOV S1, R5 //S1 <- b
		VSQRT.F32 S0, S0 //S0 <- SquareRoot(Discriminant)
		VNEG.F32 S0, S0 //S0 <- -(SquareRoot(Discriminant))
		VNEG.F32 S1, S1 //S1 <- -b
		VADD.F32 S0, S0, S1 //S0 <- -b + -(SquareRoot(Discriminant))
		VMOV S2, 2.0
		VMUL.F32 S2, S2, S4 //S3 <- 2.0*a
		VDIV.F32 S0, S0, S2 //S0 <- (-b+SquareRoot(Discriminant)) / (2*a)
		POP {R4, R5, LR}
		BX LR
		
		.global		Quadratic
		.thumb_func
	//float Quadratic(float x, float a, float b, float c);
	Quadratic:
		VMOV S4, S0
		VMUL.F32 S0, S0, S0 //S0 <- x^2
		VMUL.F32 S0, S0, S1 //S0 <- a*x^2
		VMUL.F32 S2, S2, S4 //S2 <- b*x
		VADD.F32 S0, S0, S2 //S0 <- a*x^2 + b*x
		VADD.F32 S0, S0, S3 //S0 <- a*x^2 + b*x + c
		BX LR
		
		.end