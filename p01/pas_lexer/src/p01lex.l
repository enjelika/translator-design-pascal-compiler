%{
/****************************************************************
* File p01lex.l contains functions that accept the tokens of a 	*
* Subset Pascal program.                   						*
*****************************************************************
* Author1: Gordon Klundt                                       	*
* UCOID: *20336928                                             	*
* E-Mail: gklundt@uco.edu                                      	*
* Author2: Komes Adrian Kovatana			                   	*
* UCOID: *20367535					                           	*
* E-Mail: kkovatana1@uco.edu	        		               	*
* Course: CMSC 4023, Programming Languages		               	*
* CRN: 12105, Autumn, 2014				                       	*
* Assignment: p01					                           	*
* Date: September 29, 2014                                     	* 
****************************************************************/

#include <string>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <cstdio>

#include "p01lex.h"
#include "p01tkn.h"

using namespace std;

int TokenMgr(int t);
void TokenPrint( int t);

static string spelling[] = {"NOTOKEN", "AND", "ARRAY", "ASSIGNOP", "BEGAN", "CHARLIT", "COLON", "COMMA", "DIV", "DO", "ELSE", "END", "EQU",
			    "FOR", "FUNCTION", "IF", "INTEGER", "GEQ", "GRT", "LBRACKET", "LPAREN",  "LEQ", "LES",
			    "MINUS", "MOD", "NEQ", "NOT",  "OF", "OR", "PERIOD", "PLUS", "PROCEDURE", "PROGRAM", 
			    "RANGE", "REAL", "REALIT", "REPEAT", "RBRACKET", "RPAREN", "SEMICOLON", "SLASH", "STAR", "THEN", 
                            "TO", "UNTIL", "VAR", "WHILE", "ID", "COMMENT"};

%}

%x CMNT
%x errors

%%
[ \t\n]+				;
(?i:and)			return TokenMgr(AND);
(?i:array)			return TokenMgr(ARRAY);
":="		return TokenMgr(ASSIGNOP);
(?i:begin)			return TokenMgr(BEGAN);
"'"[^"'"/n]"'"|"''''"			return TokenMgr(CHARLIT);
":"				return TokenMgr(COLON);
","				return TokenMgr(COMMA);
(?i:div)			return TokenMgr(DIV);
(?i:do)			return TokenMgr(DO);
(?i:else)			return TokenMgr(ELSE);
(?i:end)			return TokenMgr(END);
"="				return TokenMgr(EQU);
(?i:for)			return TokenMgr(FOR);
(?i:function)		return TokenMgr(FUNCTION);
(?i:if)			return TokenMgr(IF);
[0-9]+			return TokenMgr(INTEGER);
">="			return TokenMgr(GEQ);
">"				return TokenMgr(GRT);
"["				return TokenMgr(LBRACKET);
"("				return TokenMgr(LPAREN);
"<="			return TokenMgr(LEQ);
"<"				return TokenMgr(LES);
"-"				return TokenMgr(MINUS);
(?i:mod)			return TokenMgr(MOD);
"<>"			return TokenMgr(NEQ);
(?i:not)			return TokenMgr(NOT);
(?i:of)			return TokenMgr(OF);
(?i:or)			return TokenMgr(OR);
"."				return TokenMgr(PERIOD);
"+"				return TokenMgr(PLUS);
(?i:procedure)		return TokenMgr(PROCEDURE);
(?i:program)		return TokenMgr(PROGRAM);
\.{2}			return TokenMgr(RANGE);
(?i:real)			return TokenMgr(REAL);
[0-9]+\.[0-9]*([Ee][+-]?[0-9]+)?|[0-9]*\.[0-9]+([Ee][+-]?[0-9]+)?|[0-9]+[Ee][+-]?[0-9]+	return TokenMgr(REALIT);
(?i:repeat)		return TokenMgr(REPEAT);
"]"				return TokenMgr(RBRACKET);
")"				return TokenMgr(RPAREN);
";"				return TokenMgr(SEMICOLON);
"/"				return TokenMgr(SLASH);
"*"				return TokenMgr(STAR);
(?i:then)			return TokenMgr(THEN);
(?i:to)			return TokenMgr(TO);
(?i:until)			return TokenMgr(UNTIL);
(?i:var)			return TokenMgr(VAR);
(?i:while)			return TokenMgr(WHILE);
"'"?[_a-zA-Z"'"][_a-zA-Z0-9"'"]*"'"?  return TokenMgr(ID);

"{" BEGIN(CMNT);
<CMNT>[^"}"]* return TokenMgr(COMMENT);
<CMNT>"}" BEGIN(INITIAL);

%%

int yywrap()
{
    return 1;
}

int TokenMgr(int t)
{
    TokenPrint(t);
    return t;
}

void TokenPrint( int t)
{
    string str = spelling[t-NOTOKEN];
    char cStr[255];
    strcpy(cStr,str.c_str());
    fprintf(yyout,"\nToken: Code = %d Name =%10s  Spelling = \"%s\" ",t,str.c_str(),yytext);
}

Lexer::Lexer(FILE* i,FILE* o)
{
    yyin = i;
    yyout = o;
}

int Lexer::Scan(void)
{
    return yylex();
}
