%{
#include <stdio.h>
#include "synt.tab.h" 
extern YYSTYPE yylval;   
int nb_ligne=1;

%}

MC_ENTIER (E|e)(N|n)(T|t)(I|i)(E|e)(R|r)
MC_REEL (R|r)(E|e)(E|e)(L|l)
MC_CHAINE (C|c)(H|h)(A|a)(I|i)(N|n)(E|e)
MC_INCLUDE (i|I)(n|N)(c|C)(l|L)(u|U)(d|D)(e|E)
MC_TANTQUE (t|T)(a|A)(n|N)(t|T)(q|Q)(u|U)(e|E)
MC_FAIRE (F|f)(A|a)(I|i)(R|r)(E|e)
MC_FAIT (F|f)(A|a)(I|i)(T|t)
MC_ECRIRE (E|e)(C|c)(R|r)(I|i)(R|r)(E|e)
MC_LIRE (L|l)(I|i)(R|r)(E|e)
MC_RETURN (r|R)(e|E)(t|T)(u|U)(r|R)(n|N)
MC_FONCTION (F|f)(O|o)(N|n)(C|c)(T|t)(I|i)(O|o)(N|n)
MC_FIN (F|f)(I|i)(N|n)
MC_VAR (V|v)(A|a)(R|r)
MC_DEBUT (D|d)(E|e)(B|b)(U|u)(T|t)

BIBLIOTHEQUE ({INOUT}|{ARITHME})*
INOUT $${MC_INCLUDE}<InOut>(\n)*
ARITHME $${MC_INCLUDE}<Arithme>(\n)*
lettre [a-zA-Z]
CHIFFRE [0-9]
NOMBRE {CHIFFRE}+
IDF {lettre}([_]?{lettre}|[_]?{CHIFFRE})*
MC_CONST (c|C)(o|O)(n|N)(s|S)(t|T)
OPERATEUR [+*/-]
OPR_COMPAR [\<\>\=]|(<=)|(>=)|(!=)
EXPRESSION_ARITHMETIQUE ({NOMBRE}|{IDF})({OPERATEUR}({NOMBRE}|{IDF}))+
COMPARAISON ({NOMBRE}|{IDF}){OPR_COMPAR}({NOMBRE}|{IDF})
OPERANDE {NOMBRE}|{IDF}
IDFCOMMENT "/*"[^/]*"*/"
STRING \"[^"]*\"

%%
{BIBLIOTHEQUE} {return bib;
                 nb_ligne++;}
ALGORITHME return mc_algorithme;
{MC_VAR} return mc_var;
{MC_FONCTION} return mc_fonction;
{MC_DEBUT} return mc_debut;
{EXPRESSION_ARITHMETIQUE} return exp_arthim; 
{COMPARAISON} return compar;
{MC_FIN} return mc_fin;
{MC_TANTQUE} return mc_tq;
{MC_FAIRE} return mc_faire;
{MC_FAIT} return mc_fait;
{MC_ECRIRE} return mc_ecrire;
{MC_LIRE} return mc_lire;
{MC_RETURN} return mc_return;
{MC_ENTIER} {yylval.str=strdup(yytext);  return mc_entier;}
{MC_REEL} {yylval.str=strdup(yytext);  return mc_reel;}
{MC_CHAINE} return mc_chaine;
{STRING} return string;
{MC_CONST} return mc_const;
{IDF} {yylval.str=strdup(yytext);   inserer(yytext,"idf");  
    yylval.str=strdup(yytext); 
    if(yyleng<=12) return idf;
    else printf("erreur le nom du langage ne doit pas dépssé 12 caractère");
}
{NOMBRE} {yylval.entier=atoi(yytext); return nombre;}	
{OPERATEUR} return operateur;
# return hashtag;
\( return pouvrant;
\) return pfermant;
\" return guillemet;
: return deuxPoint;
\. return point;
\[ return crochouvrant;
\] return crochfermant;
:= return aff;
[ \t] 
{IDFCOMMENT}
\n   {nb_ligne++;}
. {printf("erreur lexicale a la ligne %d \n",nb_ligne) ; return err;}

