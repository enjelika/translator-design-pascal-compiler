/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    NOTOKEN = 258,
    INTLIT = 259,
    PLUS = 260,
    MINUS = 261,
    STAR = 262,
    SLASH = 263,
    LPAREN = 264,
    RPAREN = 265,
    RBRACKET = 266,
    LBRACKET = 267,
    COLON = 268,
    SEMICOLON = 269,
    COMMA = 270,
    PERIOD = 271,
    RANGE = 272,
    ASSIGNOP = 273,
    EQU = 274,
    NEQ = 275,
    LES = 276,
    GRT = 277,
    GEQ = 278,
    CHRLIT = 279,
    REALIT = 280,
    ID = 281,
    AND = 282,
    ARRAY = 283,
    BEGAN = 284,
    DIV = 285,
    DO = 286,
    ELSE = 287,
    END = 288,
    FOR = 289,
    FUNCTION = 290,
    IF = 291,
    INTEGER = 292,
    MOD = 293,
    NOT = 294,
    OF = 295,
    OR = 296,
    PROCEDURE = 297,
    PROGRAM = 298,
    REAL = 299,
    REPEAT = 300,
    THEN = 301,
    TO = 302,
    UNTIL = 303,
    VAR = 304,
    WHILE = 305,
    LEQ = 306,
    ERROR = 307
  };
#endif
/* Tokens.  */
#define NOTOKEN 258
#define INTLIT 259
#define PLUS 260
#define MINUS 261
#define STAR 262
#define SLASH 263
#define LPAREN 264
#define RPAREN 265
#define RBRACKET 266
#define LBRACKET 267
#define COLON 268
#define SEMICOLON 269
#define COMMA 270
#define PERIOD 271
#define RANGE 272
#define ASSIGNOP 273
#define EQU 274
#define NEQ 275
#define LES 276
#define GRT 277
#define GEQ 278
#define CHRLIT 279
#define REALIT 280
#define ID 281
#define AND 282
#define ARRAY 283
#define BEGAN 284
#define DIV 285
#define DO 286
#define ELSE 287
#define END 288
#define FOR 289
#define FUNCTION 290
#define IF 291
#define INTEGER 292
#define MOD 293
#define NOT 294
#define OF 295
#define OR 296
#define PROCEDURE 297
#define PROGRAM 298
#define REAL 299
#define REPEAT 300
#define THEN 301
#define TO 302
#define UNTIL 303
#define VAR 304
#define WHILE 305
#define LEQ 306
#define ERROR 307

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
