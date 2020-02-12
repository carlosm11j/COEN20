//Carlos Mercado
//Febuary 11, 2020
//quadratic.s
//COEN 20 Lab 5

		.syntax		unified
		.cpu 		cortex-m4
		.text
		
		.global		CopyCell
		.thumb_func
	//void CopyCell(RGB_PXL *dst, RGB_PXL *src);
	CopyCell:
		PUSH {R4}
        LDR R2, =0 //R2 = row
	outerLoop:  
		LDR R3, =0 //R3 = col
        CMP R2, 60 //Compare R2 (row) and 60
        BHS Done //If R2 >= 60 go to Done
	innerLoop:  
        CMP R3, 60 //Compare R3 (col) and 60
        BHS innerDone //If R3 (col) >= 60 go to innerDone
        LDR R4, [R1, R3, LSL 2] //R4 <- src[col]
        STR R4, [R0, R3, LSL 2] //R4 -> dst[col]
        ADD R3, R3, 1 //R3 (col) <- R3 (col) + 1
        B innerLoop
	innerDone:  
        ADD R2, R2, 1 //R2 (row) <- R2 (row) + 1
		ADD R0, R0, 960 //240 * 4 (bytes) = 960
        ADD R1, R1, 960 //240 * 4 (bytes) = 960
        B outerLoop
	Done:   
        POP {R4}
		BX LR
		
		.global		FillCell
		.thumb_func
	//void FillCell(RGB_PXL *dst, uint32_t pixel);
	FillCell:
		LDR R2, =0 //R2 = row
	fouterLoop:  
		LDR R3, =0 //R3 = col
        CMP R2, 60 //Compare R2 (row) and 60
        BHS fDone //If R2 >= 60 go to fDone
	finnerLoop:  
        CMP R3, 60 //Compare R3 (col) and 60
        BHS finnerDone //If R3 (col) >= 60 go to finnerDone
        STR R1, [R0, R3, LSL 2] //dst[col] -> pixel
        ADD R3, R3, 1 //R3 (col) <- R3 (col) + 1
        B finnerLoop
	finnerDone:
        ADD R2, R2, 1 //R2 (row) <- R2 (row) + 1
		ADD R0, R0, 960 //R0 (dst) <- R0 (dst) + 960 //240 * 4 (bytes) = 960
        B fouterLoop
	fDone:   	
        BX LR
		
		.end