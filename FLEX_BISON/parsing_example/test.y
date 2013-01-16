%{
    #include <stdio.h>

    int yylex(void);
    void yyerror(char *);
%}
%token TOK_TRAFFIC TOK_GREEN_LIGHT TOK_RED_LIGHT TOK_END TOK_PHONE_NUMBER TOK_SMS TOK_YELLOW_LIGHT
%start Input 
%%
Input:
          /* Empty */
        | Input Line
        ;
Line:
          TOK_END                                 	      {printf("end\n"); }
	  | TOK_SMS TOK_END                                   {printf("tok_sms\n");}
	  | TOK_PHONE_NUMBER TOK_END                          {printf("tok_phone_number\n");}
	  | TOK_TRAFFIC TOK_GREEN_LIGHT TOK_END               {printf("tok_green_light\n");}
	  | TOK_TRAFFIC TOK_RED_LIGHT TOK_END                 {printf("tok_yellow_light\n");}
	  | TOK_TRAFFIC TOK_YELLOW_LIGHT TOK_END              {printf("tok_red_light\n");}
          ;
%%

void yyerror(char* s) {
//    fprintf(stderr, "%s\n", s);
}
int main(void) {
    yyparse();
    return 0;
}
