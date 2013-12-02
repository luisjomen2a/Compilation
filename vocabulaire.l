%{
#include <stdlib.h>
#include <stdio.h>

%}


debutAlgo \\begin\{algo\}\{([a-zA-Z0-9])+\} //Debut de l'algorithme

space [\n\t\r ]* //Tout espace tabulation ou autre

identifiant [a-zA-Z]+ //On considère qu'un identifiant est composé que de lettres à changer peut être?

entier [1-9][0-9]+ //Valeur entière

//Il existe trois types déclaration possible, soit c'est un scalaire, c'est à dire qu'il s'agit d'un simple <nom var> \in <type>
//Soit un scalaire constant <nom var> = <valeur> \in <type> 
//Soit un scalaire floatant (un tableau) <nom var> \in <type>^<entier>

scalaire {identifiant}{space}\\in{space}\\{identifiant} //

scalaireTableau {identifiant}{space}\\in{space}\\{identifiant}\^\{{entier}\}

scalaireConstante {identifiant}\={space}\\in{space}\\{identifiant} //à compléter!!

declarationVariable {scalaire}|{scalaireTableau}|{scalaireConstante}

suitedeDeclarations \{\$(\\emptyset|{declarationVariable}({space},{space}{declarationVariable})*)\$\} //les dolars '$' font partie de la grammaire, et il ne faut pas oublier le cas \emptyset.

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
