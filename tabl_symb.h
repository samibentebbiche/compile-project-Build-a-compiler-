#include <stdio.h>
#include <stdlib.h>
#include<string.h>
typedef struct
{
char NomEntite[20];
char CodeEntite[20];
char TypeEntite[20];
} TypeTS;

TypeTS ts[100];
int CpTabSym=0;

int recherche(char entite[])
{
int i=0;
while(i<CpTabSym)
{
if (strcmp(entite,ts[i].NomEntite)==0) return i;
i++;
}

return -1;
}
void inserer(char entite[], char code[])
{

if ( recherche(entite)==-1)
{
strcpy(ts[CpTabSym].NomEntite,entite);
strcpy(ts[CpTabSym].CodeEntite,code);

CpTabSym++;
}
}
void afficher ()
{
printf("\n/***************Table des symboles ******************/\n");
printf("________________________________________________________\n");
printf("\t| NomEntite |  CodeEntite |  TypeEntite\n");
printf("________________________________________________________\n");
int i=0;
  while(i<CpTabSym)
  {
    printf("\t|%10s |%12s  |\n",ts[i].NomEntite,ts[i].CodeEntite);
     i++;
   }
}


