%{                    
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
#include <string>                          
#include <iostream>
#include <iomanip>
#include <fstream>
#include <cstdio>
#include <map>
#include "paslex.h"
#include "pastkn.h"
using namespace std;
//--------------------------------------------------------------------
//Externals
//--------------------------------------------------------------------
extern ofstream t;
//--------------------------------------------------------------------
//Global Variables                                                    
//--------------------------------------------------------------------
static map<string,int> RW;              //RW - Reserve Words
                                        //RW is a table of reserve words
                                        //and their corresponding
                                        //token codes.
int line=1;                             //Current line number
int col=1;                              //Current column number
//--------------------------------------------------------------------
//Functions
//--------------------------------------------------------------------
int TokenMgr(int t);                    //Token post processing
int ReserveWord(char* s);               //Determines if string s is
                                        //a reserve word
void TokenTrace(int t);                 //Records token t in the trace file
void PopulateRWMap(void);               //Create the table of reserve
                                        //words and their token codes.
void ToLower(char* d,char* s);          //Coerce the characters of string s
                                        //to lower case. Put the result
                                        //in string d.
//--------------------------------------------------------------------
//Exceptions
//--------------------------------------------------------------------
struct UnterminatedComment {
    UnterminatedComment()
    {   t << endl;
        t << "An unterminated comment begins on line " 
		  <<  line << " and column " << col;
        t << endl;
    }
};									
%}
%%
[{]							throw UnterminatedComment();
[{][^}]*[}]					{   for (int a=0;a<yyleng;a++) {
									col++;
									if (yytext[a]=='\n')
									{   
										col=1;
										line++;
									}
								}
							}
[ \t]+						{col+=yyleng;}
[\n]						{line++;col=1;}
"+"                                     return TokenMgr(PLUS);
"-"                                     return TokenMgr(MINUS);
"*"                                     return TokenMgr(STAR);
"/"                                     return TokenMgr(SLASH);
":="                                    return TokenMgr(ASSIGN);
"."										return TokenMgr(PERIOD);
","                                     return TokenMgr(COMMA);
";"                                     return TokenMgr(SEMICOLON);
":"										return TokenMgr(COLON);
"="										return TokenMgr(EQU);
"<>"                                    return TokenMgr(NEQ);
"<"                                     return TokenMgr(LES);
"<="                                    return TokenMgr(LEQ);
">"                                     return TokenMgr(GRT);
">="                                    return TokenMgr(GEQ);
"("                                     return TokenMgr(LPAREN);
")"                                     return TokenMgr(RPAREN);
"["                                     return TokenMgr(LBRACKET);
"]"                                     return TokenMgr(RBRACKET);
".."									return TokenMgr(RANGE);
[aA][nN][dD]							return TokenMgr(AND);
[aA][rR][rR][aA][yY]					return TokenMgr(ARRAY);
[bB][eE][gG][iI][nN]					return TokenMgr(BEGAN);
[dD][iI][vV]							return TokenMgr(DIV);
[dD][oO]								return TokenMgr(DO);
[eE][lL][sS][eE]						return TokenMgr(ELSE);
[eE][nN][dD]							return TokenMgr(END);
[fF][uU][nN][cC][tT][iI][oO][nN]		return TokenMgr(FUNCTION);
[iI][fF]								return TokenMgr(IF);
[mM][oO][dD]							return TokenMgr(MOD);
[nN][oO][tT]							return TokenMgr(NOT);
[oO][fF]								return TokenMgr(OF);
[oO][rR]								return TokenMgr(OR);
[pP][rR][oO][cC][dD][uU][rR][eE]		return TokenMgr(PROCEDURE);
[pP][rR][oO][gG][rR][aA][mM]			return TokenMgr(PROGRAM);
[tT][hH][eE][nN]						return TokenMgr(THEN);
[tT][oO]								return TokenMgr(TO);
[tT][yY][pP][eE]						return TokenMgr(TYPE);
[vV][aA][rR]							return TokenMgr(VAR);
[wW][hH][iI][lL][eE]					return TokenMgr(WHILE);
[rR][eE][pP][eE][aA][tT]				return TokenMgr(REPEAT);
[rR][eE][aA][lL]						return TokenMgr(REAL);
[uU][iI][tT][iI][lL]					return TokenMgr(UNTIL);
[0-9]+                                  return TokenMgr(INTLIT);
"'"[^"'"/n]"'"|"''''"					return TokenMgr(CHRLIT);
[0-9]+[\.][0-9]*([eE][+-]?[0-9]+)? 		return TokenMgr(REALIT);
[0-9]*[\.][0-9]+([eE][+-]?[0-9]+)?   	return TokenMgr(REALIT);
[0-9]+[eE][+-]?[0-9]+					return TokenMgr(REALIT);
[_a-zA-Z][_a-zA-Z0-9]*                  return TokenMgr(ID);
.                                       return TokenMgr(ERROR);
%%
//--------------------------------------------------------------------
int yywrap() {return 1;}

int ReserveWord(char* s)
{
    int t = RW[(string)s];
    if (t > 0) return t; 
	else return ID;
}

void ToLower(char* d,char* s)
{
	strcpy(d,s);
    for (int a = 0;a < strlen(d);a++) d[a] = tolower(d[a]);
}

int TokenMgr(int t)
{   
	col += yyleng;                      //Add the length of the current
                                      //Token to the column position
    if (t == ID) 
    {   char* s=new char[yyleng];     //Create storage for a lower case
                                      //version of the token
        ToLower(s,yytext);            //Coerce the token to lower case
        t=ReserveWord(s);             //Determie if the ID is a reserve word
    }
    TokenTrace(t);                    //Record the current token in the trace file
}

void TokenTrace(int tkn)
{   
	static const char* TokenName[]=
        {"NOTOKEN", "PLUS", "MINUS", "STAR", "SLASH", "ASSIGN", 
			"PERIOD", "COMMA", "SEMICOLON", "COLON", "EQU", "NEQ", 
			"LES", "LEQ", "GRT", "GEQ", "LPAREN", "RPAREN", "LBRACKET", 
			"RBRACKET", "RANGE", "AND", "ARRAY", "BEGAN", "DIV", "DO", 
			"ELSE", "END", "FUNCTION", "IF", "INTEGER", "MOD", "NOT", 
			"OF", "OR", "PROCEDURE", "PROGRAM", "REPEAT", "THEN", "TO", 
			"TYPE", "VAR", "REAL", "INTLIT", "CHRLIT", "FOR", "UNTIL",
			"WHILE", "COMMENT", "REALLIT", "ID", "ERROR", "WRITE", "READ"};
    t << endl;
    t << "Token:Code=" << setw(3) << tkn << " ";
    t << "Name=" << setw(10) << TokenName[tkn-258] << " ";
    t << "line= " << setw(4) << line << " ";
    t << "col= " << setw(4) << col-yyleng << " ";
    t << "Spelling=\"" << yytext << "\"";
}

void PopulateRWMap(void)
{   
	RW["begin"] = BEGAN;
    RW["end"  ] = END;
    RW["read" ] = READ;
    RW["write"] = WRITE;
    RW["and"  ] = AND;
    RW["array" ] = ARRAY;
    RW["div"] = DIV;
    RW["do"] = DO;
    RW["else"  ] = ELSE;
    RW["function" ] = FUNCTION;
    RW["if"] = IF;
    RW["integer"] = INTEGER;
    RW["mod"  ] = MOD;
    RW["not" ] = NOT;
    RW["of"] = OF;
    RW["procedure"] = PROCEDURE;
    RW["program"] = PROGRAM;
    RW["repeat"  ] = REPEAT;
    RW["then" ] = THEN;
    RW["to"] = TO;
    RW["type"] = TYPE;
    RW["var"  ] = VAR;
    RW["real" ] = REAL;
    RW["for"] = FOR;
    RW["until"] = UNTIL;
    RW["while"  ] = WHILE;
}

Lexer::Lexer(FILE* i) 
{   
	yyin = i; 
    PopulateRWMap();
}

int Lexer::Lex(void)
{   
	tokencode = yylex();
    return tokencode;
}

int Lexer::FetchLength(void)
{
	return yyleng;
}

char* Lexer::FetchSpelling(void)
{
    return (char*)yytext;
}

int Lexer::FetchTokenCode(void)
{  
	return tokencode;
}

void Lexer::StoreTokenCode(int T)
{  
	tokencode = T;
}
//-----------------------End of Lex Definition------------------------
