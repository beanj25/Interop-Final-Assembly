// AsmInCpp.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
using namespace std;


extern "C" void introduction2(char* str1); 

int main()
{
	char str1[] = "we have asm in cpp";
	
	introduction2(str1);

	return 0;
}
