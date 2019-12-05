# compile-project-Build-a-compiler-
this repo is a project  to build a basic compiler with flex and bison

to compile the project 
flex lexical.l
bison -d synt.y
gcc lex.yy.c synt.tab.c -lfl -ly -o Compiler
