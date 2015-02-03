#ifndef p02par_h
#define p02par_h 1
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
#ifdef __cplusplus
extern "C" 
#endif
int yyparse (void);
#endif
class Parser: public Lexer {
public:
  Parser(FILE* i):Lexer(i){}
  int Parser(void) {return yyparse();} //error here?
};