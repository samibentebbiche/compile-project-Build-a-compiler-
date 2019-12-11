/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_SYNT_TAB_H_INCLUDED
# define YY_YY_SYNT_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    bib = 258,
    mc_algorithme = 259,
    mc_fonction = 260,
    idf = 261,
    mc_var = 262,
    mc_debut = 263,
    mc_fin = 264,
    err = 265,
    guillemet = 266,
    mc_return = 267,
    operateur = 268,
    deuxPoint = 269,
    mc_entier = 270,
    mc_reel = 271,
    mc_chaine = 272,
    string = 273,
    pouvrant = 274,
    pfermant = 275,
    mc_tq = 276,
    mc_faire = 277,
    mc_fait = 278,
    mc_ecrire = 279,
    mc_lire = 280,
    point = 281,
    hashtag = 282,
    nombre = 283,
    mc_const = 284,
    crochouvrant = 285,
    crochfermant = 286,
    aff = 287,
    exp_arthim = 288,
    compar = 289,
    val = 290
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 8 "synt.y" /* yacc.c:1909  */
 int entier ;
   char* str ;
   float reel ; 

#line 95 "synt.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SYNT_TAB_H_INCLUDED  */
