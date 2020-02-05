/*
Carlos Mercado
01/14/2000
COEN 20 Lab1 
*/

#include <stdint.h>
#include <math.h>

//Converts the given array of bits to UNSIGNED int
uint32_t Bits2Unsigned(int8_t bits[8]) {
	uint32_t result = 0;
	for(int i=0; i<8; i++) {
		result += (pow(2, i) * bits[i]); 
	}
	return result;
}

//Converts the given array of bits to SIGNED int
int32_t Bits2Signed(int8_t bits[8]) {
	int32_t result = 0;
	result -= (pow(2, 7) * bits[7]);
	for(int i=0; i<7; i++) {
		result += (pow(2, i) * bits[i]);
	}
	return result;
}

//Increments the given array of bits by 1
void Increment(int8_t bits[8]) {
	for(int i=0; i<8; i++) {
		if(bits[i] == 0) {
			bits[i] = 1;
			break;
		}
		bits[i] = 0;
	}
}

//Converts the given UNSIGNED n value to an array of bits
void Unsigned2Bits(uint32_t n, int8_t bits[8]) {
	for(int i=0; i<8; i++) {
		bits[i] = n%2;
		n = n/2;
	}
}