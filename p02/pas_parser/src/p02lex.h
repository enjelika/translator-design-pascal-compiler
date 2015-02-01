/* 
Author: Gordon Klundt                                           
E-Mail: gklundt@uco.edu
Author: Komes Adrian Kovatana 
E-mail: kkovatana1@uco.edu	                                        
Date:   November 5, 2014 
*/

#ifndef p02lex_h
#define p02lex_h 1

#include <cstdio>
#include <fstream>
#include <iostream>

using namespace std;

#ifdef __cplusplus
extern "C" 
#endif

int yylex (void);

class Lexer {
public:
  Lexer(FILE* i);                //Constructor used to redirect the keyboard (stdin) to file i.
  int Scan();
};

#endif
