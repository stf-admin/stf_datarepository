%{
#include <stdio.h>
#include <stdlib.h>
#include <test.tab.h>
%}

%option noyywrap

%%
TRAFFIC {
	return(TOK_TRAFFIC); 
}

GREEN_LIGHT {
            return(TOK_GREEN_LIGHT);
}

RED_LIGHT {
          return(TOK_RED_LIGHT);
}

YELLOW_LIGHT {
             return(TOK_YELLOW_LIGHT);
}

[0-9]{10} {
          return (TOK_PHONE_NUMBER);
}

[ \t\n]		/* ignore whitespace */

SMS         return(TOK_SMS);
;           return(TOK_END);
%%

