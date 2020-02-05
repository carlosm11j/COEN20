//Carlos Mercado
//January 28, 2020
//copy.s
//COEN 20 Lab 3

		.syntax		unified
		.cpu 		cortex-m4
		.text
	
		.global		UseLDRB
		.thumb_func
	//void UseLDRB(void *dst, void *src);
	UseLDRB:
		.REPT 512 //512/1 bytes per loop = 512
		LDRB R2, [R1], 1 //Load R1 byte to R2 and shift 1 byte (8 bits) using post indexing 
		STRB R2, [R0], 1 //Store byte in R2 to memory address R0  
		.ENDR
		BX LR
	
		.global		UseLDRH
		.thumb_func
	//void UseLDRH(void *dst, void *src);
	UseLDRH:
		.REPT 256 //512/2 bytes per loop = 256
		LDRH R2, [R1], 2 //Load half word R1 into R2 and shift 2 bytes (16 bits) using post indexing 
		STRH R2, [R0], 2 //Store byte in R2 to memory address in R1
		.ENDR
		BX LR
	
		.global		UseLDR
		.thumb_func
	//void UseLDR(void *dst, void *src);
	UseLDR:
		.REPT 128 //512/4 bytes per loop = 128
		LDR R2, [R1], 4 //Load word R1 to R2 and shift 4 bytes (32 bits) using post indexing 
		STR R2, [R0], 4 //Store byte in R2 to memory address in R1
		.ENDR
		BX LR
		
		.global		UseLDRD
		.thumb_func
	//void UseLDRD(void *dst, void *src);
	UseLDRD:
		.REPT 64 //512/8 bytes per loop = 64
		LDRD R2, R3, [R1], 8 //Load double word in R1 to R2 and R3 and shift 8 bytes (64 bites) using post indexing
		STRD R2, R3, [R0], 8 //Store bytes in R2 and R3 to memory address in R0
		.ENDR
		BX LR
		
		.global		UseLDM
		.thumb_func
	//void UseLDM(void *dst, void *src);
	UseLDM:
		PUSH {R4-R9} //Push the contents of R4-R11 to the Stack to preserve
		.REPT 16 //32 bytes * 8 registers = 512 bytes (anymore and LDMIA will grab what we dont need, thus leaving 28 bytes)
		LDMIA R1!, {R2-R9}  //Load 32 bytes into R2-R9 (32 bytes / 4 bytes = 8 registers)
		STMIA R0!, {R2-R9} //Store 32 bytes in R2-R9 to memory address in R0
		.ENDR
		POP {R4-R9} //Pop the original contents from R4-R11
		BX LR
		
		.end
		
	