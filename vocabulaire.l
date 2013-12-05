%{
#include <stdlib.h>
#include <stdio.h>

int debut = 0;

%}


debutAlgo \\begin\{algo\}\{([a-zA-Z0-9])+\}

space [\n\t\r ]*

lettres [a-zA-Z]+

identifiant ("_"{lettres}|{lettres})[{entier}{lettres}]*

parOuvre "("
parFerme ")"
accOuvre "{"
accFerme "}"
dollar "$"

entier [1-9][0-9]+

scalaire {identifiant}{space}\\in{space}\\{identifiant}

scalaireTableau {identifiant}{space}\\in{space}\\{identifiant}\^{accOuvre}{entier}{accFerme}

scalaireConstante {identifiant}\={space}\\in{space}\\{identifiant}

declarationVariable {scalaire}|{scalaireTableau}|{scalaireConstante}

suitedeDeclarations {accOuvre}{dollar}(\\emptyset|{declarationVariable}({space},{space}{declarationVariable})*){dollar}{accFerme}

constant \\Constant
input \\Input
output \\Output
global \\Global
local \\Local

finDeclarations \\BlankLine

leftarrow \\leftarrow

finInstruction \;

while \\While 
repeat \\Repeat
for \\For
if \\If
elseIf \\eIf 

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

appel mbox

endAlgo \\end\{algo\}

%%

{parOuvre} {if(debut==1)printf("parOuvre");}
{parFerme} {if(debut==1)printf("parFerme");}
{accOuvre} {if(debut==1)printf("accOuvre");}
{accFerme} {if(debut==1)printf("accFerme");}
{dollar}   {if(debut==1)printf("dollar");}

{suitedeDeclarations} {printf("suiteDeDeclarations\n");}

{debutAlgo} { debut = 1; printf("debutAlgo\n");}
{constant} {printf("Constante\n");}
{input} {printf("Input\n");}
{output} {printf("Output\n");}
{global} {printf("Global\n");}
{local} {printf("Local\n");}

{finDeclarations} {printf("FinDecration\n");}

{while}  {if(debut==1)printf("while");}
{repeat} {if(debut==1)printf("repeat");}
{for}    {if(debut==1)printf("for");}
{if}     {if(debut==1)printf("if");}
{elseIf} {if(debut==1)printf("elseIF");}

{mult}  {if(debut==1)printf("mult");}
{plus}  {if(debut==1)printf("plus");}
{moins} {if(debut==1)printf("moins");}
{puiss} {if(debut==1)printf(" puiss ");}

appel {if(debut==1)printf( "function");}


{identifiant} {if(debut==1)printf("Identifiant");}

{leftarrow} {printf("<-");}

{finInstruction} {printf(" finInstruction ");}

. {printf("%s",yytext);}

{endAlgo} {printf("EndAlgo\n"); debut =0;}
%%

int main(int argc, char * argv[]){

	yyin=fopen(argv[1] ,"r");

	if(yyin == NULL){

		printf("File: error\n");
		exit(1);
	}
	printf("Testing...");
	yylex();

	return 0;

}
