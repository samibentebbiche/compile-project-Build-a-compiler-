#include <stdio.h>
#include <stdlib.h>
#include<string.h>


typedef struct
{
char NomEntite[20];
char CodeEntite[20];
char TypeEntite[20];
} TypeTS;

int recherche(char entite[]);

void inserer(char entite[], char code[]);

void afficher();