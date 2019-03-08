#pragma once

struct Vector2
{
	double X, Y;
};

extern "C" void Addition_(Vector2* pA, Vector2* pB);
extern "C" void Subtract_(Vector2* pA, Vector2* pB);
extern "C" void Multiply_(Vector2* pA, Vector2* pB);
extern "C" void Divide_(Vector2* pA, Vector2* pB);
extern "C" void Square_(Vector2* pA);
extern "C" double SquareRoot_(Vector2* pA);