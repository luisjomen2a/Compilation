%{
    #include <stdlib.h>
    #include <stdio.h>
    #include <string.h>
    #include "lex.yy.c"
    
    int yylex(void);
    void yyerror(char *);
    
%}

%union{
    
	
    
}
///////MOTS DE RESERVER
/*%start        algorithme
%token        <Begin>         begin
%token        <Algo>          algo
%token        <Emptyset>      emptyset
%token        <Blinkline>     blinkLine
%token        <Input>         input
%token        <Output>        output
%token        <Global>        global
%token        <Local>         local
%token        <While>         while
%token        <If>            if
%token        <eIf>           eif
%token        <Repeat>        repeat
%token        <Constant>      constant
%token        <End>           end
%token        <In>            in
%token        <Leftarrow>     leftarrow
%token        <Mbox>          mbox
%token        <Int>           int
%token        <Real>          real
%token        <Complex>       complex
%token        <Times>         times
%token        <Vee>           vee
%token        <Neg>           neg
%token        <Geq>           geq
%token        <Leq>           leq
%token        <Neq>           neq
%token        <Wedge>         wedge

%token       <entier>         valeur
%token       <identifiant>    ID
*/
////////////SYMBOL
%left  '-' '+' '*' '%'
%left  '(' ')' '{' '[' ']' '$' '}'
%left  '\\'









%%
algorithme:                  DEBUTALGO func_part ENDALGO

func_part:                   declaration_list FINDESCRIPTION suite_description ;

declaration_list:            constant_list input_list output_list global_list local_list ;

constant_list:              CONSTANT ACCOUVRE DOLLAR suite_declaration DOLLAR ACCFERME 
			 				|CONSTANT ACCOUVRE DOLLAR EMPTYSET DOLLAR ACCFERME;

input_list: 	            INPUT ACCOUVRE DOLLAR suite_declaration DOLLAR ACCFERME  
		  					|INPUT ACCOUVRE DOLLAR EMPTYSET DOLLAR ACCFERME;

output_list:                OUTPUT ACCOUVRE DOLLAR suite_declaration DOLLAR ACCFERME
		  					|OUTPUT ACCOUVRE DOLLAR EMPTYSET DOLLAR ACCFERME;

global_list:                GLOBAL ACCOUVRE DOLLAR suite_declaration DOLLAR ACCFERME 
		   					|GLOBAL ACCOUVRE DOLLAR EMPTYSET DOLLAR ACCFERME;

local_list:                 LOCAL ACCOUCRE DOLLAR suite_declaration DOLLAR ACCFERME 
		  					|LOCAL ACCOUVRE DOLLAR EMPTYSET DOLLAR ACCFERME;

suite_declaration:        |  declaration ',' suite_description
                          |  declaration
                          ;

declaration:                 declaration_val
                          |  declaration_cons
                          ;

declaration_val:             SCALAIRE type_scalaire ;

type_scalaire:              
					INT PUISS ACCOUVRE ENTIER ACCFERME
					| COMPLEX PUISS ACCOUVRE ENTIER ACCFERME

                    | BOOL PUISS ACCOUVRE ENTIER ACCFERME
                    ;

declaration_cons:            IDENTIFIANT EGALE valeur IN type_scalaire ;

suite_description:           structure_controle suite_description
                          | DOLLAR instruction DOLLAR FININSTRUCTION suite_description
						  |  
                          ;

structure_controle : 	WHILE ACCOUVRE expr_bool ACCFERME  ACCOUVRE suite_description ACCFERME
				   		|FOR ACCOUVRE DOLLAR affectation KWTO DOLLAR ENTIER DOLLAR ACCFERME ACCOUVRE suite_description ACCFERME

						|REPEAT ACCOUVRE expr_bool ACCFERME ACCOUVRE suite_description ACCFERME
						|IF ACCOUVRE expr_bool ACCFERME ACCOUVRE suite_description ACCFERME
						|eIF ACCOUVRE expr_bool ACCFERME ACCOUVRE suite_description ACCFERME
						 ;
expr_bool	:			operand_bool bool_op operand_bool		
						|NOT expr_bool	
						;
operand_bool 		:	IDENTIFIANT
			   			|valeur
						|expr_bool
						;

bool_op 	:			OU
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
						|expression
						;
operateur :				MULT
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




