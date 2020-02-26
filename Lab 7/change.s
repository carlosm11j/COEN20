//Carlos Mercado
//February 25, 2020
//copy.s
//COEN 20 Lab 7b

		.syntax		unified
		.cpu 		cortex-m4
		.text
	
		.global		Bills
		.thumb_func
	//void Bills(uint32_t dollars, BILLS *paper);
	Bills:
        //20 
		LDR R3, =214748365 //R3 <- 2^32 / 20
		SMMUL R2, R0, R3
		STR R2, [R1] //paper[twenties] <- quotient
		LSL R3, R2, 4 //R3 <- 16 * count
		ADD R3, R3, R2, LSL 2 //R3 <- 20 * count
		SUB R0, R0, R3 //R0 <- remainder
		
		B DivideForRest
		
	DivideForRest:
		//10
		LDR R3, =429496730 //R3 <- 2^32 / 10
		SMMUL R2, R0, R3
		STR R2, [R1, 4] //struct[tens] <- quotient
		LSL R3, R2, 3 //R3 <- 8 * count
		ADD R3, R3, R2, LSL 1 //R3 <- 10 * count
		SUB R0, R0, R3 //R0 <- remainder
		
		//5
		LDR R3, =858993459 //R3 <- 2^32 / 5
		SMMUL R2, R0, R3
		STR R2, [R1, 8] //struct[fives] <- quotient
		LSL R3, R2, 2 //R3 <- 4 * count
		ADD R3, R3, R2, LSL 0 //R3 <- 5 * count
		SUB R0, R0, R3 //R0 <- remainder
		
		//1
		STR R0, [R1, 12] //struct[ones] <- remainder
		
		BX LR
		
		.global		Coins
		.thumb_func
	//void Coins(uint32_t cents, COINS *coins);
	Coins:
		//25 
		LDR R3, =171798692 //R3 <- 2^32 / 25
		SMMUL R2, R0, R3
		STR R2, [R1] //coins[twenties] <- quotient
		LSL R3, R2, 4 //R3 <- 16 * count
		ADD R3, R3, R2, LSL 3 //R3 <- 24 * count
		ADD R3, R3, R2, LSL 0 //R3 <- 25 * count
		SUB R0, R0, R3 //R0 <- remainder
		
		B DivideForRest
		
		.end