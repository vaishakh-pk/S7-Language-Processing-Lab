%{
#include "y.tab.h"
%}

%%

[a-zA-Z_][a-zA-Z_0-9]*    { return id; }
[0-9]+(\.[0-9]*)?         { return num; }
[-+*/]                    { return op; }
"("                       { return LPAREN; }
")"                       { return RPAREN; }
.                         {
                             printf("Invalid character: %c\n", yytext[0]);
                             return 0;
                           }
\n                        return 0;

%%

int yywrap() {
    return 1;
}

