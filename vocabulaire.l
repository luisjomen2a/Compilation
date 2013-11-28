%{


%}

debutAlgo \\begin\{algo\}\{([a-zA-z])+\}

declarationVariable ([a-zA-Z])+ \\in \\([a-zA-Z])+

declarationConstante ([a-zA-Z])+ \\in \\([a-zA-Z])

suitedeDeclarations (\\emptyset)|(declarationVariable)|(declarationConstante)

constant \\Constant\{\${suitedeDeclarations}\$\}

input \\Input\{\${suitedeDeclarations}\$\}

output \\Output\{\${suitedeDeclarations}\$\}

global \\Global\{\${suitedeDeclarations}\$\}

local \\Local\{\${suitedeDeclarations}\$\}

endAlgo \\end\{algo\}

%%

{debutAlgo} {printf("debutAlgo\n");}

{constant} {printf("Constante\n");}

{input} {printf("Input\n");}

{output} {printf("Output\n");}

{global} {printf("Global\n");}

{local} {printf("Local\n");}

{endAlgo} {printf("EndAlgo\n");}

%%

int main(){

	return 0;

}
