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
#include <iostream>
#include <fstream>
#include <iomanip>
#include "paslex.h"
#include "paspar.h"
//---------------------------------------------------------------------
//Function prototypes
//---------------------------------------------------------------------
void yyerror(const char* m);
//---------------------------------------------------------------------
//Externals
//---------------------------------------------------------------------
extern char* yytext;
extern ofstream t;
extern int line;
extern int column;
//---------------------------------------------------------------------
%}
%union {
	string* token;
}
%token NOTOKEN
%token PLUS
%token MINUS
%token STAR
%token SLASH
%token ASSIGN
%token PERIOD
%token COMMA
%token SEMICOLON
%token COLON
%token EQU
%token NEQ
%token LES
%token LEQ
%token GRT
%token GEQ
%token LPAREN
%token RPAREN
%token LBRACKET
%token RBRACKET
%token RANGE
%token AND
%token ARRAY
%token BEGAN
%token DIV
%token DO
%token ELSE
%token END
%token FUNCTION
%token IF
%token INTEGER
%token MOD
%token NOT
%token OF
%token OR
%token PROCEDURE
%token PROGRAM
%token REPEAT
%token THEN
%token TO
%token TYPE
%token VAR
%token REAL
%token INTLIT
%token CHRLIT
%token FOR
%token UNTIL
%token WHILE
%token COMMENT
%token REALIT
%token ID
%token ERROR
%token WRITE
%token READ
%%
program : program_head program_declarations program_body
  { t << endl << "program -> program_head program_declarations program_body";
  }
program_head : PROGRAM ID program_parameters SEMICOLON
  { t << endl << "program_head -> program id program_parameters ;";
  }
program_declarations : declarations subprogram_declarations
  { t << endl << "program_declarations -> declarations subprogram_declarations";
  }
program_body : compound_statement PERIOD
  { t << endl << "program_body -> compound_statement .";
  }
program_parameters : /*empty*/
  {}
  | LPAREN program_parameter_list RPAREN
  { t << endl << "program_parameters -> ( program_parameter_list )";
  }
program_parameter_list : identifier_list
  { t << endl << "program_parameter_list -> identifier_list";
  }
identifier_list : ID
  { t << endl << "identifier_list -> ID";
  }
  | identifier_list COMMA ID
  { t << endl << "identifier_list -> identifier_list, ID";
  }
declarations : /*empty*/
  {}
  | declarations VAR identifier_list COLON type SEMICOLON
  { t << endl << "declarations -> declarations var identifier_list : type ;";
  }
type : standard_type
  { t << endl << "type -> standard_type";
  }
  | ARRAY LBRACKET INTLIT RANGE INTLIT OF standard_type
  { t << endl << "type -> array [ intlit .. intlit ] of standard_type";
  }
standard_type : ID
  { t << endl << "standard_type -> id";
  }
subprogram_declarations : /*empty*/
  {}
  | subprogram_declarations subprogram_declaration SEMICOLON
  { t << endl << "subprogram_declarations -> subprogram_declarations subprogram_declaration ;";
  }
subprogram_declaration : subprogram_head declarations compound_statement
  { t << endl << "subprogram_declaration -> subprogram_head declarations compound_statement";
  }
subprogram_head : FUNCTION ID subprogram_parameters COLON standard_type SEMICOLON
  { t << endl << "subprogram_head -> function id subprogram_parameters : standard_type;";
  }
  | PROCEDURE ID subprogram_parameters
  { t << endl << "subprogram_head -> procedure id subprogram_parameters;";
  }
subprogram_parameters : /*empty*/
  {}
  | LPAREN parameter_list RPAREN
  { t << endl << "subprogram_parameters -> ( parameter_list )";
  }
parameter_list : identifier_list COLON TYPE
  { t << endl << "parameter_list -> identifier_list : type";
  }
  | parameter_list SEMICOLON identifier_list COLON TYPE
  { t << endl << "parameter_list -> parameter_list ; identifier_list : type";
  }
compound_statement : BEGAN optional_statements END
  { t << endl << "compound_statement -> begin optional_statements end";
  }
optional_statements : /*empty*/
  {}
  | statement_list
  { t << endl << "optional_statements -> statement_list";
  }
statement_list : statement
  { t << endl << "statement_list -> statement";
  }
  | statement_list SEMICOLON statement
  { t << endl << "statement_list -> statement_list ; statement";
  }
statement : variable ASSIGN expression
  { t << endl << "statement -> variable := expression";
  }
  | procedure_statement
  { t << endl << "statement -> procedure_statement";
  }
  | compound_statement
  { t << endl << "statement -> compound_statement";
  }
  | IF expression THEN statement ELSE statement
  { t << endl << "statement -> if expression then statement else statement";
  }
  | WHILE expression DO statement
  { t << endl << "statement -> while expression do statement";
  }
variable : ID
  { t << endl << "variable -> id";
  }
  | ID LBRACKET expression RBRACKET
  { t << endl << "variable -> id [ expression ]";
  }
procedure_statement : ID
  { t << endl << "procedure_statement -> id";  
  }
  | ID LPAREN expression_list RPAREN
  { t << endl << "procedure_statement -> id ( expression_list )";  
  }
expression_list : expression
  { t << endl << "expression_list -> expression";
  }  
  | expression_list COMMA expression
  { t << endl << "expression_list -> expression_list , expression";
  }  
expression : simple_expression
  { t << endl << "expression -> simple_expression"; 
  }
  | simple_expression relop simple_expression
  { t << endl << "expression -> simple_expression relop simple_expression";
  }
relop : EQU
  { t << endl << "relop -> =";
  }
  | NEQ 
  { t << endl << "relop -> <>"; 
  }
  | LES
  { t << endl << "relop -> <";
  }
  | LEQ
  { t << endl << "relop -> <=";
  }
  | GRT
  { t << endl << "relop -> >";
  }
  | GEQ
  { t << endl << "relop -> >=";
  }
simple_expression : term
  { t << endl << "simple_expression -> term";
  }
  | sign term
  { t << endl << "simple_expression -> sign term";
  }
  | simple_expression addop term
  { t << endl << "simple_expression -> simple_expression addop term";
  }
sign : PLUS
  { t << endl << "sign -> +";
  }
  | MINUS
  { t << endl << "sign -> -";
  }
addop : PLUS
  { t << endl << "addop -> +";
  } 
  | MINUS
  { t << endl << "addop -> -";
  }
  | OR
  { t << endl << "addop -> or";
  }  
term : factor
  { t << endl << "term -> factor";
  }
  | term mulop factor
  { t << endl << "term -> term mulop factor";
  }
mulop : STAR
  { t << endl << "mulop -> *";
  }
  | SLASH
  { t << endl << "mulop -> /";
  }
  | DIV
  { t << endl << "mulop -> div";
  } 
  | MOD
  { t << endl << "mulop -> mod";
  } 
  | AND
  { t << endl << "mulop -> and";
  }
factor : ID
  { t << endl << "factor -> id";
  }
  | ID LBRACKET expression RBRACKET
  { t << endl << "factor -> id [ expression ]";
  }
  | ID LPAREN expression_list RPAREN
  { t << endl << "factor -> id ( expression_list )";
  }
  | LPAREN expression RPAREN
  { t << endl << "factor -> ( expression )";
  }
  | NOT factor
  { t << endl << "factor -> not factor";
  } 
  | INTLIT
  { t << endl << "factor -> intlit";
  }
  | REALIT
  { t << endl << "factor -> realit";
  } 
  | CHRLIT
  { t << endl << "factor -> chrlit";
  }
%%
//---------------------------------------------------------------------
//Function yyerror
//---------------------------------------------------------------------
void yyerror(const char* m)
{   cout << endl 
		 << "line(" << line << ") col(" << column << ") " << m << endl;
    cout << endl;
}
//---------------------------------------------------------------------
//End of paspar.y
//---------------------------------------------------------------------