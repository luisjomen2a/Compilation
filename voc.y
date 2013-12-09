%{
    #include <stdlib.h>
    #include <stdio.h>
    #include <string.h>
    #include "lex.yy.c"
    
    int yylex(void);
    void yyerror(char *);
    
%}

%union{
    
	codgen* codgenVal;
    
}
///////MOTS DE RESERVER
%start		algorithme
%token		DEBUTALGO ENDALGO
%token		FINDESCRIPTION FININSTRUCTION	
%token		ACCOUVRE ACCFERME PAROUVRE PARFERME 
%token		EMPTYSET 
%token		CONSTANT INPUT OUTPUT GLOBAL 
%token		LOCAL  
%token		SCALAIRE 
%token		BOOL FLOAT ENTIER
%token		PUISS MULT PLUS MOINS
%token		IDENTIFIANT
%token		OU ET GRANDEGALE PETITEGALE DIFFERENT 
%token		LEFTARROW 
%token		APPEL
%token 		EGALE
%token 		DOLLAR
%token 		FOR WHILE REPEAT IF EIF
%token 		NOT IN KWTO


 
////////////SYMBOL
%left  '-' '+' '*' '%'
%left  '(' ')' '{' '[' ']' '$' '}'
%left  '\\'









%%
algorithme:                  	DEBUTALGO func_part ENDALGO

func_part:                   	declaration_list FINDESCRIPTION suite_description ;

declaration_list:            	constant_list input_list output_list global_list local_list ;

constant_list:            	 CONSTANT constantbis 
				;

constantbis:			declaration
				|ACCOUVRE DOLLAR EMPTYSET DOLLAR ACCFERME;


input_list: 	            	INPUT inputbis
				;

inputbis:			declaration  
		  		|ACCOUVRE DOLLAR EMPTYSET DOLLAR ACCFERME;

output_list:			OUTPUT outputbis
				;                	

outputbis:			 declaration
		  		|ACCOUVRE DOLLAR EMPTYSET DOLLAR ACCFERME;
				

global_list:                	GLOBAL globalbis
				;

globalbis:			declaration
		   		|ACCOUVRE DOLLAR EMPTYSET DOLLAR ACCFERME;

local_list:                 	LOCAL localbis;

localbis:			declaration 
		  		|ACCOUVRE DOLLAR EMPTYSET DOLLAR ACCFERME;

declaration :		ACCOUVRE DOLLAR suite_declaration DOLLAR ACCFERME
			;


suite_declaration:        |  declaration ',' suite_description
                          |  declaration
                          ;

declaration:                 declaration_val
                          |  declaration_cons
                          ;

declaration_val:             SCALAIRE type_scalaire ;

type_scalaire:              
					ENTIER PUISS ACCOUVRE ENTIER ACCFERME
					| FLOAT PUISS ACCOUVRE ENTIER ACCFERME

                    | BOOL PUISS ACCOUVRE ENTIER ACCFERME
                    ;

declaration_cons:            IDENTIFIANT EGALE valeur IN type_scalaire ;

suite_description:        structure_controle suite_desc
                          | DOLLAR instruction DOLLAR FININSTRUCTION suite_desc
			  ;
suite_desc :		  suite_description
			  |
			  ;

structure_controle : 				WHILE ACCOUVRE expr_bool ACCFERME  ACCOUVRE suite_description ACCFERME
				   		|FOR ACCOUVRE DOLLAR affectation KWTO DOLLAR ENTIER DOLLAR ACCFERME ACCOUVRE suite_description ACCFERME

						|REPEAT ACCOUVRE expr_bool ACCFERME ACCOUVRE suite_description ACCFERME
						|IF ACCOUVRE expr_bool ACCFERME ACCOUVRE suite_description ACCFERME
						|EIF ACCOUVRE expr_bool ACCFERME ACCOUVRE suite_description ACCFERME
						 ;
affectation 	:				IDENTIFIANT LEFTARROW valeur
						;	

expr_bool	:				operand_bool bool_op operand_bool		
						|NOT expr_bool	
						;

operand_bool 				:	IDENTIFIANT
			   			|valeur
						|expr_bool
						;

bool_op 		:			OU
		 				|ET
						|GRANDEGALE
						|PETITEGALE
						|DIFFERENT
						;
						
instruction : 			
						IDENTIFIANT LEFTARROW expression
						;

expression:  					valeur
		  				| operand operateur operand
						| APPEL ACCOUVRE IDENTIFIANT PAROUVRE expression PARFERME ACCFERME 
						;
operand :				

						valeur
						|IDENTIFIANT
						|expression
						;
operateur :					MULT
	  					|PLUS
						|MOINS
						|PUISS
						;	  
valeur:
						BOOL
						|FLOAT
						|ENTIER
						;
%%

int main(void)
    {
                        yylex();
    }

yylex()
    {
                        int c;
                        c=getchar();
                        if(isdigit(c))
                            {
                                yylval=c-'0';
                                return CHIFFRE;
                            }
                        return c;
    
    }




