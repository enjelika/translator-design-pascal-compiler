#ifndef paslex_h
#define paslex_h 1
//--------------------------------------------------------------------
// Author 1:	Mrs. Debra Hogue
// Student ID:	*20343220
// E-Mail:		dhogue1@uco.edu
// Author 2: 	Mr. Gordon Klundt
// Student ID:	*20336928
// E-Mail:		gklundt@uco.edu
// Author 3:	Mr. William McLain
// Student ID:	*10066002
// E-Mail:		wmclain@uco.edu
// Author 4: 	Mr. Noah Sefcik
// Student ID:	*20309262
// E-Mail:		nsefcik@uco.edu
// Course:		CMSC 4173 - Translator Design
// CRN:			27419 Spring 2015
// Project:		p02
// Due:			February 4, 2015
// Account:		ttXXX
//--------------------------------------------------------------------
//--------------------------------------------------------------------
#include <cstdio>
#include <fstream>
#include <iostream>
using namespace std;                                                         
//--------------------------------------------------------------------
#ifdef __cplusplus
extern "C" 
#endif
int yylex (void);
//--------------------------------------------------------------------
class Lexer {
  int tokencode;
 public:
  Lexer(FILE* i);
  int Lex(void);
  
  int FetchTokenCode(void);
  void StoreTokenCode(int T);
  char* FetchSpelling(void);
  int FetchLength(void);
};
#endif