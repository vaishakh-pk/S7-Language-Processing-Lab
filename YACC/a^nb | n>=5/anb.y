%{
/* Definition section */
#include<stdio.h>
#include<stdlib.h>
%}

%token A B NL

/* Rule Section */
%%
stmt: S B NL { printf("valid string\n");
              exit(0); }
;

S: A S | A A A A A
;

%%

int yyerror(char *msg)
{
    printf("invalid string\n");
    exit(0);
}

// Driver code
int main()
{
    printf("enter the string\n");
    yyparse();
    return 0;
}

