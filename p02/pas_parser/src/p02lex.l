%{
/*
Author: Gordon Klundt                                           
E-Mail: gklundt@uco.edu
Author: Komes Adrian Kovatana 
E-mail: kkovatana1@uco.edu	                                        
Date:   November 5, 2014 
*/

// Standard C and C++ Library Include Files                                     

#include <string>                          
#include <iostream>
#include <iomanip>
#include <fstream>
#include <cstdio>
#include <locale>

using namespace std;

// Application Includes                                               
#include "p02lex.h"
#include "p02tkn.h"

//Function prototypes and variable definitions
int lineNo = 1;
int colNo = 1;
int TokenMgr(int t);
void TokenPrint(int t);

//Global Variables                                                    

static string spelling[]=
  {"NOTOKEN","INTLIT","PLUS","MINUS","STAR","SLASH","LPAREN","RPAREN",
	"LBRACKET","RBRACKET","COLON","SEMICOLON","COMMA","PERIOD",
	"RANGE","ASSIGNOP","EQU","NEQ","LES","GRT","GEQ","CHRLIT",
	"REALIT","ID","AND","ARRAY","BEGAN","DIV","DO","ELSE","END","FOR",
	"FUNCTION","IF","INTEGER","MOD","NOT","OF","OR","PROCEDURE",
	"PROGRAM","REAL","REPEAT","THEN","TO","UNTIL","VAR","WHILE",
	"LEQ","ERROR"
  };
%}
%%

\n		{lineNo++; colNo = 1;}
[ \t]+		{colNo++;}
[{][^{]*[}]	;/*comments*/
"+"	return TokenMgr(PLUS);
"-"	return TokenMgr(MINUS);
"*"	return TokenMgr(STAR);
"/"	return TokenMgr(SLASH);
"("	return TokenMgr(LPAREN);
")"	return TokenMgr(RPAREN);
"["	return TokenMgr(LBRACKET);
"]"	return TokenMgr(RBRACKET);
":"	return TokenMgr(COLON);
";"	return TokenMgr(SEMICOLON);
","	return TokenMgr(COMMA);
"."	return TokenMgr(PERIOD);
"="	return TokenMgr(EQU);
"<"	return TokenMgr(LES);
">"	return TokenMgr(GRT);
".."	return TokenMgr(RANGE);
":="	return TokenMgr(ASSIGNOP);
"<>"	return TokenMgr(NEQ);
"<="	return TokenMgr(LEQ);
">="	return TokenMgr(GEQ);
(?i:and)	return TokenMgr(AND);
(?i:array)	return TokenMgr(ARRAY);
(?i:begin)	return TokenMgr(BEGAN);
(?i:div)	return TokenMgr(DIV);
(?i:do)		return TokenMgr(DO);
(?i:else)	return TokenMgr(ELSE);
(?i:end)	return TokenMgr(END);
(?i:for)	return TokenMgr(FOR);
(?i:function)	return TokenMgr(FUNCTION);
(?i:if)		return TokenMgr(IF);
(?i:integer)	return TokenMgr(INTEGER);
(?i:mod)	return TokenMgr(MOD);
(?i:not)	return TokenMgr(NOT);
(?i:of)		return TokenMgr(OF);
(?i:procedure)	return TokenMgr(PROCEDURE);
(?i:program)	return TokenMgr(PROGRAM);
(?i:real)	return TokenMgr(REAL);
(?i:repeat)	return TokenMgr(REPEAT);
(?i:then)	return TokenMgr(THEN);
(?i:to)		return TokenMgr(TO);
(?i:until)	return TokenMgr(UNTIL);
(?i:var)	return TokenMgr(VAR);
(?i:while)	return TokenMgr(WHILE);
[0-9]+		return TokenMgr(INTLIT);
[0-9]+\.[0-9]*([Ee][+-]?[0-9]+)?|[0-9]*\.[0-9]+([Ee][+-]?[0-9]+)?|[0-9]+[Ee][+-]?[0-9]+	return TokenMgr(REALIT);
"'"?[_a-zA-Z"'"][_a-zA-Z0-9"'"]*"'"?  	return TokenMgr(ID);
\'[^{\n]\'|''''				return TokenMgr(CHRLIT);
.	return TokenMgr(ERROR);
%%

int yywrap() {
	return 1;
}

int TokenMgr(int t) {
  TokenPrint(t);
  colNo+= strlen(yytext); 
  return t;
}

void TokenPrint(int t) {   

	std::locale loc;
	for (std::string::size_type i=0; i < strlen(yytext); ++i)
		yytext[i] = std::tolower(yytext[i],loc);

	cout << endl;
	cout << "Token:Code=" << t;
	cout << " Name = " << setw(10) << right << spelling[t-NOTOKEN];
	cout << " line = " << lineNo;
	cout << " col = " << setw(3) << right << colNo ;
	cout << " Spelling = \"" << yytext << "\"";
}

Lexer::Lexer(FILE* i) {
	yyin=i;
}
int Lexer::Scan(void) {
    return yylex();
}
     



