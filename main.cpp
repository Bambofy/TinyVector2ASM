#include <iostream>
#include "tiny_vector_2.h"

/*
	Tiny vector2 is 64 bit only.
	Use MASM x64 to compile the tiny_vector_2.asm.
*/

int main()
{
	Vector2 a, b;
	a.X = 1.0;
	a.Y = 1.0;

	// Add_(Vector2* a, Vector2* b) -> a = a + b
	// Subtract_(Vector2* a, Vector2* b) -> a = a - b
	// Multiply_(Vector2* a, Vector2* b) -> a = a * b
	// Divide_(Vector2* a, Vector2* b) -> a = a / b
	// Square_(&a); -> a = a * a
	// double v = SquareRoot_(&a); -> v = sqrt(a)

	char ci;
	std::cin >> ci;

	return 0;
}