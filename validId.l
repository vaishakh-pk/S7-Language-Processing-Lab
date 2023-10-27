%{
#include <stdio.h>
%}

%%
^[a-zA-Z_][a-zA-Z0-9_]* {printf("Valid identifier\n");exit(0);}
\n {printf("invalid identifier\n"); exit(0);}
%%
int yywrap(){
return 1;
}
int main(){
yylex();
return 0;
}

