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
appel \\mbox

in \\in

endAlgo \\end\{algo\}

%%

{debutAlgo} {debut = 1; printf("Debut algo");}

{false} {printf(" false ");}
{true} {printf(" true ");}
{boolean} {printf(" boolean ");}
{integer} {printf(" Integer ");}
{complex} {printf(" complexe ");}

{in} {printf("in");}
{kwto} {prinf(" KWTO ")}

{ou} {printf("||");}
{et} {printf("&&");}
{not} {printf("!");}
{GrandEgale} {printf(">=");}
{PetitEgale} {printf("<=");}
{different} {printf("!=");}

{egale} {printf("EGALE");}

{parOuvre} {if(debut==1)printf("parOuvre");}
{parFerme} {if(debut==1)printf("parFerme");}
{accOuvre} {if(debut==1)printf("accOuvre");}
{accFerme} {if(debut==1)printf("accFerme");}
{dollar} {if(debut==1)printf("dollar");}

{suitedeDeclarations} {printf(" SuiteDeclarations ");}

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

{appel} {if(debut==1)printf( " function");}

{entier} {if(debut==1)printf(" entier ");}
{float} {if(debut==1)printf(" float ");}
{bool}  {if(debut==1)printf(" bool ");}

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
