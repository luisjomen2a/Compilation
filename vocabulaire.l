%{
#include <stdlib.h>
#include <stdio.h>

%}


debutAlgo \\begin\{algo\}\{([a-zA-Z0-9])+\}

space [\n\t\r ]*

identifiant [a-zA-Z]+

entier [1-9][0-9]+

scalaire {identifiant}{space}\\in{space}\\{identifiant}

scalaireTableau {identifiant}{space}\\in{space}\\{identifiant}\^\{{entier}\}

scalaireConstante {identifiant}\={space}\\in{space}\\{identifiant}

declarationVariable {scalaire}|{scalaireTableau}|{scalaireConstante}

suitedeDeclarations \{\$(\\emptyset|{declarationVariable}({space},{space}{declarationVariable})*)\$\}

constant \\Constant

input \\Input

output \\Output

global \\Global

local \\Local

endAlgo \\end\{algo\}

finDeclarations \\BlankLine

%%

{suitedeDeclarations} {printf("suiteDeDeclarations\n");}

{debutAlgo} {printf("debutAlgo\n");}

{constant} {printf("Constante\n");}

{input} {printf("Input\n");}

{output} {printf("Output\n");}

{global} {printf("Global\n");}

{local} {printf("Local\n");}

{endAlgo} {printf("EndAlgo\n");}

{finDeclarations} {printf("FinDecration\n");}

{identifiant} {printf("Identifiant");}

. {printf("%s",yytext);}

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
