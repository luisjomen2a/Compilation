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
egale \=
appel \\mbox

in \\in

endAlgo \\end\{algo\}

%%

{debutAlgo} {debut = 1;return DEBUTALGO;}

{false} {return FALSE;}
{true} {return TRUE;}
{boolean} {return BOOL;}
{integer} {return ENTIER;}
{complex} {return FLOAT;}

{in} {return IN;}
{kwto} {return KWTO;}

{ou} {return OU;}
{et} {return ET;}
{not} {return NOT}
{GrandEgale} {return GRANDEGALE;}
{PetitEgale} {return PETITEGALE;}
{different} {return DIFFERTENT;}



{parOuvre} {if(debut==1)return PAROUVRE;}
{parFerme} {if(debut==1)return PARFERME;}
{accOuvre} {if(debut==1)return ACCOUVRE;}
{accFerme} {if(debut==1)return ACCFERME;}
{dollar} {if(debut==1)return DOLLAR;}



{constant} {return CONSTANT;}
{input} {return INPUT;}
{output} {return OUTPUT;}
{global} {return GLOBAL;}
{local} {return LOCAL;}

{finDeclarations} {return FINDECLARATION}

{while}  {if(debut==1)return WHILE;}
{repeat} {if(debut==1)return REPEAT;}
{for}    {if(debut==1)return FOR;}
{if}     {if(debut==1)return IF;}
{elseIf} {if(debut==1)return EIF;}

{mult}  {if(debut==1)return MULT;}
{plus}  {if(debut==1)return PLUS;}
{moins} {if(debut==1)return MOINS;}
{puiss} {if(debut==1)return PUISS;}
{egale} {if(debut==1)return EGALE;}

{appel} {if(debut==1)return APPEL;}

{entier} {if(debut==1)return ENTIER;}
{float} {if(debut==1)return FLOAT;}
{bool}  {if(debut==1)return BOOL;}

{identifiant} {if(debut==1)return IDENTIFIANT;}

{leftarrow} {return LEFTARROW;}

{finInstruction} {return FININSTRUCTION;}

. {printf("%s",yytext);}

{endAlgo} { debut =0; return ENDALGO;}
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
