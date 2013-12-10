%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
int debut = 0;

%}


debutAlgo \\begin\{algo\}

space [\n\t\r ]*


lettres [a-zA-Z]+

identifiant {lettres}

parOuvre "("
parFerme ")"
accOuvre "{"
accFerme "}"
dollar "$"


entier [0-9]+
float {entier}\.[0-9]+
bool true|false

scalaire {identifiant}{space}\\in{space}

constant \\Constant
input \\Input
output \\Output
global \\Global
local \\Local

finDeclarations \\BlankLine

leftarrow \\leftarrow

finInstruction \\;

while \\While 
repeat \\Repeat
for \\For
if \\If
elseIf \\eIf 

kwto \\KwTo

false \\false
true \\true

integer \\Integer
boolean \\Boolean
complex \\Complex

ou \\vee
et \\wedge
not \\neg
GrandEgale \\geq
PetitEgale \\leq
different \\neq

mult \\times
plus \+
moins -
puiss \^
egale \=
appel \\mbox

in \\in

emptyset \\emptyset

endAlgo \\end\{algo\}

%%

{debutAlgo} {debut = 1;printf("DEBUT ALGO\n");return DEBUTALGO;}

{false} {if(debut){printf("FALSE\n");return FALSE;}}
{true} {if(debut){printf("true\n");return TRUE;}}
{boolean} {if(debut){printf("booolean\n");return BOOL;}}
{integer} {if(debut){printf("integer\n");return ENTIER;}}
{complex} {if(debut){printf("complex\n");return FLOAT;}}

{in} {if(debut){printf("in\n");return IN;}}
{kwto} {if(debut){printf("kwto\n");return KWTO;}}

{ou} {if(debut){printf("ou\n");return OU;}}
{et} {if(debut){printf("et\n");return ET;}}
{not} {if(debut){printf("not\n");return NOT;}}
{GrandEgale} {if(debut){printf("grandegale\n");return GRANDEGALE;}}
{PetitEgale} {if(debut){printf("petitegale\n");return PETITEGALE;}}
{different} {if(debut){printf("different\n");return DIFFERENT;}}

{emptyset} {if(debut){printf("Emptyset\n");return EMPTYSET;}}


{parOuvre} {if(debut){printf("parouvre\n");return PAROUVRE;}}
{parFerme} {if(debut){printf("parferme\n");return PARFERME;}}
{accOuvre} {if(debut){printf("accouvre\n");return ACCOUVRE;}}
{accFerme} {if(debut){printf("accFerme\n");return ACCFERME;}}
{dollar} {if(debut){printf("dollar\n");return DOLLAR;}}



{constant} {if(debut){printf("constant\n");return CONSTANT;}}
{input} {if(debut){printf("intput\n");return INPUT;}}
{output} {if(debut){printf("output\n");return OUTPUT;}}
{global} {if(debut){printf("global\n");return GLOBAL;}}
{local} {if(debut){printf("local\n");return LOCAL;}}

{finDeclarations} {if(debut){printf("FinDeclaration\n");return FINDESCRIPTION;}}

{while}  {if(debut){printf("while\n");return WHILE;}}
{repeat} {if(debut){printf("repaet\n");return REPEAT;}}
{for}    {if(debut){printf("for\n");return FOR;}}
{if}     {if(debut){printf("if\n");return IF;}}
{elseIf} {if(debut){printf("elseif\n");return EIF;}}

{mult}  {if(debut){printf("mult\n");return MULT;}}
{plus}  {if(debut){printf("plus\n");return PLUS;}}
{moins} {if(debut){printf("moins\n");return MOINS;}}
{puiss} {if(debut){printf("puiss\n");return PUISS;}}
{egale} {if(debut){printf("egale\n");return EGALE;}}

{appel} {if(debut){printf("appel\n");return APPEL;}}

{entier} {if(debut){printf("entier\n");return ENTIER;}}
{float} {if(debut){printf("float\n");return FLOAT;}}
{bool}  {if(debut){printf("bool\n");return BOOL;}}

{identifiant} {if(debut){printf("identifiant\n");return IDENTIFIANT;}}

{leftarrow} {if(debut){printf("leftarrow\n");return LEFTARROW;}}

{finInstruction} {if(debut){printf("fininstruction\n");return FININSTRUCTION;}}


. {printf("%s",yytext);}

{endAlgo} { debut =0;printf("END ALGO\n");return ENDALGO;}
%%


/*
int main(int argc, char** argv){

	FILE * file = fopen(argv[1],"r");

	if(file == NULL){

		return 1;
	
	}

	yyin=file;

	yylex();


}
*/
