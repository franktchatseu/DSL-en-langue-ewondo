%{
#include<stdio.h> 
#include "simple.h"
#include "syntaxe.tab.h"
void error();
%}

nombre    [0-9]+
type      "entier"|"caractere"|"chaine"
/*operateur  \+|\*|\-|\/|\=|\!=|\<=|\>=*/
operateur  plus|moins|fois|div|egale
affectation recoit
variable   \#[a-zA-Z0-9]+
fonction   [a-zA-Z_][0-9a-zA-Z_]*
boucle     pour|tantque
condition  si|sinon|sinon_si
comparaison sup|inf|diff|sup_egal|inf_egal|egale
symbole     \(|\)
sepvar       ,
sepinstr     ;
%%
ewondo:       {printf("<type: %s>",yytext); return DEBUTPROGRAMME;}
:ewondo       {printf("<type: %s>",yytext); return FINPROGRAMME;}
{sepvar}      {printf("<sepvar: %c>",yytext[0]); return SEPVAR;}
{sepinstr}    {printf("<sepinstr: %c>",yytext[0]); return SEPINSTR;}
{symbole}     {printf("<symbole: %c>",yytext[0]); return SYMBOLE;}
{type}        {printf("<type: %s>",yytext); return TYPE;}
faire         {printf("<debut: %s>",yytext); return FAIRE;}
fait          {printf("<fin: %s>",yytext); return FAIT;}
alors         {printf("<alors: %s>",yytext); return ALORS;}
si            {printf("<condition: %s>",yytext); return SI;}
fsi           {printf("<condition: %s>",yytext); return FSI;}
{boucle}      {printf("<boucle: %s>",yytext); return BOUCLE;}
{condition}   {printf("<condition: %s>",yytext); return COND;}
{nombre}      {printf("<nombre: %d>",atoi(yytext)); return NOMBRE;}
{comparaison} {printf("<comparaison: %s>",yytext); return COMPARAISON;}
{operateur}   {printf("<operateur: %s>",yytext); return OPERATEUR;}
{affectation} {printf("<affectation: %s>",yytext); return AFFECTATION;}
{variable}    {printf("<variable: %s>",yytext);  return VARIABLE;}
{fonction}    {printf("<fonction: %s>",yytext); return IDFONCTION;}

. ;
%%
void error(){
      printf("ca ne marche pas");
}
