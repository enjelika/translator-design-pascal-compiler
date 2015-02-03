#ifndef pastkn_h 
#define pastkn_h 1
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
// CRN:		27419 Spring 2015
// Project:	p01
// Due:		January 21, 2015
// Account:	ttXXX
//--------------------------------------------------------------------
//--------------------------------------------------------------------
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   enum yytokentype {
	NOTOKEN = 258,
	PLUS = 259,
	MINUS = 260,
	STAR = 261,
	SLASH = 262,
	ASSIGN = 263,
	PERIOD = 264,
	COMMA = 265,
	SEMICOLON = 266,
	COLON = 267,
     	EQU = 268,
     	NEQ = 269,
     	LES = 270,
     	LEQ = 271,
     	GRT = 272,
     	GEQ = 273,
     	LPAREN = 274,
     	RPAREN = 275,
     	LBRACKET = 276,
     	RBRACKET = 277,
     	RANGE = 278,
     	AND = 279,
     	ARRAY = 280,
     	BEGAN = 281,
     	DIV = 282,
     	DO = 283,
     	ELSE = 284,
     	END = 285,
     	FUNCTION = 286,
     	IF = 287,
     	INTEGER = 288,
     	MOD = 289,
     	NOT = 290,
     	OF = 291,
	OR = 292,
	PROCEDURE = 293,
	PROGRAM = 294,
	REPEAT = 295,
	THEN = 296,
     	TO = 297,
	TYPE = 298,
    	VAR = 299,
    	REAL = 300,
     	INTLIT = 301,
     	CHRLIT = 302,
     	FOR = 303,
     	UNTIL = 304,
     	WHILE = 305,
     	COMMENT = 306,
     	REALLIT = 307,
     	ID = 308,
     	ERROR = 309,
	WRITE = 310,
	READ = 311
   };
#endif

//--------------------------------------------------------------------
//Token definitions
//--------------------------------------------------------------------
#define NOTOKEN 258
#define PLUS 259
#define MINUS 260
#define STAR 261
#define SLASH 262
#define ASSIGN 263
#define PERIOD 264
#define COMMA 265
#define SEMICOLON 266
#define COLON 267
#define EQU 268
#define NEQ 269
#define LES 270
#define LEQ 271
#define GRT 272
#define GEQ 273
#define LPAREN 274
#define RPAREN 275
#define LBRACKET 276
#define RBRACKET 277
#define RANGE 278
#define AND 279
#define ARRAY 280
#define BEGAN 281
#define DIV 282
#define DO 283
#define ELSE 284
#define END 285
#define FUNCTION 286
#define IF 287
#define INTEGER 288
#define MOD 289
#define NOT 290
#define OF 291
#define OR 292
#define PROCEDURE 293
#define PROGRAM 294
#define REPEAT 295
#define THEN 296
#define TO 297
#define TYPE 298
#define VAR 299
#define REAL 300
#define INTLIT 301
#define CHRLIT 302
#define FOR 303
#define UNTIL 304
#define WHILE 305
#define COMMENT 306
#define REALLIT 307
#define ID 308
#define ERROR 309
#define WRITE 310
#define READ 311

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;
#endif