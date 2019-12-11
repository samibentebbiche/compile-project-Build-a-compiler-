%{  
  
#include"tabl_symb.c"
   int yyerror(){
   };  
   %}
   
   %union
   { int entier ;
   char* str ;
   float reel ; }

%token bib mc_algorithme mc_fonction <str>idf mc_var mc_debut mc_fin err guillemet mc_return operateur  deuxPoint mc_entier mc_reel mc_chaine string pouvrant pfermant mc_tq mc_faire mc_fait mc_ecrire mc_lire point hashtag <entier>nombre mc_const crochouvrant crochfermant  aff exp_arthim compar val
%%

 S: bib mc_algorithme idf DECL CORPS{printf("syntaxe correcte");          	            YYACCEPT;}
 ;
 DECL: mc_var SUIT_FONCT BLOC_VAR
     |mc_var FONCT
     |mc_var BLOC_VAR
     |mc_var
     |
 ;
SUIT_FONCT: FONCT SUIT_FONCT
           |FONCT
 ;
 FONCT:mc_fonction idf pouvrant LIST_PAR_FONC pfermant deuxPoint mc_entier mc_var
 BLOC_VAR CORPS
        |mc_fonction idf pouvrant LIST_PAR_FONC pfermant deuxPoint mc_reel mc_var
     BLOC_VAR CORPS
        |mc_fonction idf pouvrant LIST_PAR_FONC pfermant deuxPoint mc_chaine mc_var
     BLOC_VAR CORPS
 ;
 
 TAB:idf crochouvrant nombre crochfermant
 ;
 BLOC_VAR:IDF_VAR BLOC_VAR
          |IDF_VAR
          |
 ;
 IDF_VAR: idf VARIABLE
          |TAB VARIABLE
          |mc_const idf VARIABLE
 ;
 VARIABLE: point IDF_VAR
          |deuxPoint mc_reel hashtag
          |deuxPoint mc_entier hashtag
          |deuxPoint mc_chaine hashtag
 ;
 LIST_PAR_FONC: idf deuxPoint mc_entier point LIST_PAR_FONC
                |idf deuxPoint mc_reel point LIST_PAR_FONC
                |idf deuxPoint mc_chaine point LIST_PAR_FONC
               |idf deuxPoint mc_entier
               |idf deuxPoint mc_reel
               |idf deuxPoint mc_chaine
               |
 ;
 AFFECTATION:idf aff TRAITEMENT hashtag
             |TAB aff TRAITEMENT hashtag
 ;
 TRAITEMENT: TRAITEMENT operateur TRAITEMENT
           |nombre
           |idf
 ;

 TPYE_INST: AFFECTATION
           |BOUCLE
           |ECRIRE
           |LIRE
           |NOM_FONCTION
           |RETURN
 ;
 BOUCLE: mc_tq pouvrant compar pfermant mc_faire INSTRUCTION mc_fait
;
ECRIRE: mc_ecrire pouvrant string pfermant hashtag
;
LIRE: mc_lire pouvrant LISTE_VAR pfermant hashtag
;
LISTE_VAR: idf point LISTE_VAR
          |idf
          |
;
NOM_FONCTION: idf pouvrant LISTE_VAR pfermant hashtag
;
RETURN: mc_return idf hashtag
;

 INSTRUCTION: TPYE_INST INSTRUCTION
             |TPYE_INST
             |
 ;
 CORPS: mc_debut INSTRUCTION mc_fin
 
%%
main () 
{
yyparse();
afficher();
}
yywrap()
{}
