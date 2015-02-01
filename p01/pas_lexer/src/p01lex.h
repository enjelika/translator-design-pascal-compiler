#ifndef explex_h
#define explex_h
/********************************************************
* File p01lex.h defines the interface to the 			*
* Subset Pascal scanner. 								*
*********************************************************
* Author1: Gordon Klundt								*
* UCOID: *20336928										*
* E-Mail: gklundt@uco.edu								*
* Author2: Komes Adrian Kovatana						*
* UCOID: *20367535										*
* E-Mail: kkovatana1@uco.edu							*
* Course: CMSC 4023, Programming Languages				*
* CRN: 12105, Autumn, 2014								*
* Assignment: p01										*
* Date: September 29, 2014								*
********************************************************/
#include <cstdio>
#include <iostream>
#include <iostream>

using namespace std;

#ifndef _cplusplus
extern "C"
#endif
int yylex (void);

class Lexer
{
public:
   Lexer(FILE* i,FILE* o);
    int Scan(void);
};

#endif
