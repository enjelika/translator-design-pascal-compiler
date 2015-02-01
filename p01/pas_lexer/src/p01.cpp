/********************************************************************
 * File p01.cpp contains functions which process command line        *
 * arguments and invoke the scanner, repeatedly to find all the		*
 * tokens in the input source file.            						*
 *********************************************************************
 * Author1: Gordon Klundt                                            *
 * UCOID: *20336928                                                  *
 * E-Mail: gklundt@uco.edu                                           *
 * Author2: Komes Adrian Kovatana			                        *
 * UCOID: *20367535					                                *
 * E-Mail: kkovatana1@uco.edu	        		                    *
 * Course: CMSC 4023, Programming Languages		                    *
 * CRN: 12105, Autumn, 2014				                            *
 * Assignment: p01					                                *
 * Date: September 29, 2014                                          *
 ********************************************************************/
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <cstdio>
#include "p01lex.h"
#include "string.h"
using namespace std;

void ScanMgr(FILE* i, FILE* o) {
	Lexer L(i, o);
	for (; L.Scan();)
		;
}

int main(int argc, char* argv[]) {
	char ifn[255];
	char ofn[255];
	unsigned pos;
	switch (argc) {
	case 1:
		cout << "Enter the input file name: ";
		cin >> ifn;
		break;
	case 2:
		strcpy(ifn, argv[1]);
		break;
	default:
		exit(EXIT_FAILURE);
	}
	strncpy(ofn, ifn, strlen(ifn) - 4);
	strcat(ofn, ".trc");
	FILE* i = fopen(ifn, "r");
	FILE* o = fopen(ofn, "w");
	ScanMgr(i, o);
	fclose(i);
	fclose(o);
	return 0;
}

