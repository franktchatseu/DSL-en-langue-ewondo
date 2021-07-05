%{
#include<stdio.h>
int yylex();
int yyerror(char* s);   
%}
%token DEBUTPROGRAMME FINPROGRAMME NOMBRE OPERATEUR VARIABLE IDFONCTION FAIRE FAIT ALORS BOUCLE COND SEPVAR SEPINSTR SYMBOLE TYPE AFFECTATION SI FSI COMPARAISON

%%
prog:
            DEBUTPROGRAMME corps FINPROGRAMME
;
corps:
            expr corps
            |expr
expr:   
            binst
            |binstsi
binst:
            DA SEPINSTR
            |DA SEPINSTR binst
DA:   
            VARIABLE
            |VARIABLE AFFECTATION SECONDMEMBRE
SECONDMEMBRE:
            TERME
            |TERME OPERATEUR SECONDMEMBRE
TERME:      
            VARIABLE
            |NOMBRE
binstsi:
            SI CONDITION ALORS expr FSI
CONDITION:
            SECONDMEMBRE COMPARAISON SECONDMEMBRE

%%
int yyerror(char *s)
{
	printf("Syntax Error on line %s\n", s);
	return 0;
}

int main()
{
    yyparse();
    return 0;
}