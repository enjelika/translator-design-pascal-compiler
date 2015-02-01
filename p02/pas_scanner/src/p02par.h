#ifndef exppar_h
#define exppar_h 1

#ifdef __cplusplus
extern "C" 
#endif

/*
Author: Gordon Klundt                                           
E-Mail: gklundt@uco.edu
Author: Komes Adrian Kovatana 
E-mail: kkovatana1@uco.edu	                                        
Date:   November 5, 2014 
*/

int yyparse (void);
class Parser: public Lexer {
public:
  Parser(FILE* i):Lexer(i){};
  ~Parser();
  int Parse();
};
#endif

