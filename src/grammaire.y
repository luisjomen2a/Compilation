%{
    
 	#include <string.h>
	#include <stdio.h>
	#include <stdlib.h>

	

	void yyerror (char *s) {
    	fprintf (stderr, "%s\n", s);
	}
/*	nodeType *opr(int oper, int nops, ... );	
	nodeType *id(int i);
	nodeType *con(int valeur);
  */  
   //	int ex(nodeType); 
%}


///////MOTS DE RESERVER
%start		compilateur
%token		DEBUTALGO ENDALGO
%token		FINDESCRIPTION FININSTRUCTION	
%token		ACCOUVRE ACCFERME PAROUVRE PARFERME 
%token		EMPTYSET 
%token		CONSTANT INPUT OUTPUT GLOBAL 
%token		LOCAL   
%token		BOOL FLOAT ENTIER
%token		PUISS MULT PLUS MOINS
%token		IDENTIFIANT
%token		OU ET GRANDEGALE PETITEGALE DIFFERENT 
%token 		FALSE TRUE
%token		LEFTARROW 
%token		APPEL
%token 		EGALE
%token 		DOLLAR
%token 		FOR WHILE REPEAT IF EIF
%token 		NOT IN KWTO


 
///////////SYMBOL
%left  '-' '+' '*' '%'
%left  '(' ')' '{' '[' ']' '$' '}'
%left  '\\'


%union{

	//codgen* codegenVal;
	//int valeur;
	//int ENTIER;

	

}






%%

compilateur : 		algorithme compilateur
					|algorithme
					;

algorithme:                  	DEBUTALGO ACCOUVRE IDENTIFIANT ACCFERME func_part ENDALGO {printf("MATCH\n");}
		  			;
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


suite_declaration:        |  declaration ',' suite_declaration
                          |  declaration
                          ;

declaration:                 declaration_val
                          |  declaration_cons
                          ;

declaration_val:           IDENTIFIANT IN type_scalaire ;

type_scalaire:              
			ENTIER PUISS ACCOUVRE ENTIER ACCFERME
			|ENTIER
			;

declaration_cons:            IDENTIFIANT EGALE valeur IN type_scalaire ;


suite_description:       element_desc FININSTRUCTION suite_description
                          |	element_desc
			  ;

element_desc :		  structure_controle
					  | DOLLAR instruction DOLLAR 
					  ;

structure_controle : 				WHILE ACCOUVRE expr_bool ACCFERME  ACCOUVRE suite_description ACCFERME
				   		|FOR ACCOUVRE DOLLAR affectation KWTO DOLLAR ENTIER DOLLAR ACCFERME ACCOUVRE suite_description ACCFERME

						|REPEAT ACCOUVRE expr_bool ACCFERME ACCOUVRE suite_description ACCFERME
						|IF ACCOUVRE expr_bool ACCFERME ACCOUVRE suite_description ACCFERME
						|EIF ACCOUVRE expr_bool ACCFERME ACCOUVRE suite_description ACCFERME
						 ;
affectation 	:				IDENTIFIANT LEFTARROW valeur
						;	

expr_bool	:			DOLLAR operand_bool bool_op operand_bool DOLLAR		
						|DOLLAR  NOT expr_bool DOLLAR
						;

operand_bool 				:	IDENTIFIANT
			   			|valeur
						|PAROUVRE expr_bool PARFERME
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

expression:  			valeur 
		  				| operand operateur operand
						| APPEL ACCOUVRE IDENTIFIANT PAROUVRE expression PARFERME ACCFERME 
						;
operand :				

						valeur
						|IDENTIFIANT
						| PAROUVRE expression PARFERME 
						;
operateur :					MULT 
	  					|PLUS
						|MOINS
						|PUISS
						;
	  
valeur:
						ENTIER
						|TRUE
				 		|FALSE
						;
%%

extern FILE *yyin;

int main(int argc, char** argv){

	FILE *file = fopen(argv[1], "r");
	if(file == NULL){

		printf("File Error!\n");
		return 1;

	}
	yyin = file;
	yyparse();
	fclose(file);

}




