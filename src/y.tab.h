/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     DEBUTALGO = 258,
     ENDALGO = 259,
     FINDESCRIPTION = 260,
     FININSTRUCTION = 261,
     ACCOUVRE = 262,
     ACCFERME = 263,
     PAROUVRE = 264,
     PARFERME = 265,
     EMPTYSET = 266,
     CONSTANT = 267,
     INPUT = 268,
     OUTPUT = 269,
     GLOBAL = 270,
     LOCAL = 271,
     BOOL = 272,
     FLOAT = 273,
     ENTIER = 274,
     PUISS = 275,
     MULT = 276,
     PLUS = 277,
     MOINS = 278,
     IDENTIFIANT = 279,
     OU = 280,
     ET = 281,
     GRANDEGALE = 282,
     PETITEGALE = 283,
     DIFFERENT = 284,
     FALSE = 285,
     TRUE = 286,
     LEFTARROW = 287,
     APPEL = 288,
     EGALE = 289,
     DOLLAR = 290,
     FOR = 291,
     WHILE = 292,
     REPEAT = 293,
     IF = 294,
     EIF = 295,
     NOT = 296,
     IN = 297,
     KWTO = 298
   };
#endif
/* Tokens.  */
#define DEBUTALGO 258
#define ENDALGO 259
#define FINDESCRIPTION 260
#define FININSTRUCTION 261
#define ACCOUVRE 262
#define ACCFERME 263
#define PAROUVRE 264
#define PARFERME 265
#define EMPTYSET 266
#define CONSTANT 267
#define INPUT 268
#define OUTPUT 269
#define GLOBAL 270
#define LOCAL 271
#define BOOL 272
#define FLOAT 273
#define ENTIER 274
#define PUISS 275
#define MULT 276
#define PLUS 277
#define MOINS 278
#define IDENTIFIANT 279
#define OU 280
#define ET 281
#define GRANDEGALE 282
#define PETITEGALE 283
#define DIFFERENT 284
#define FALSE 285
#define TRUE 286
#define LEFTARROW 287
#define APPEL 288
#define EGALE 289
#define DOLLAR 290
#define FOR 291
#define WHILE 292
#define REPEAT 293
#define IF 294
#define EIF 295
#define NOT 296
#define IN 297
#define KWTO 298




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 2068 of yacc.c  */
#line 51 "src/grammaire.y"


  char* string;
  int value;
  struct symbol* symbol;
  struct {
    struct symbol* addr;
    struct quad* code;
  } codegen;	
		




/* Line 2068 of yacc.c  */
#line 151 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


