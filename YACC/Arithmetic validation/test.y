%{
#include "y.tab.h"
#include <stdio.h>

int yylex(void);
void yyerror(char const *s);

int valid = 1;
%}

%token num id op LPAREN RPAREN

%%

start : s
      ;

s    : s op s
      | num
      | LPAREN s RPAREN
      ;

%%

void yyerror(char const *s) {
    valid = 0;
    printf("Invalid Expression: %s\n", s);
}

int main() {
    printf("\nEnter the expression:\n");
    yyparse();

    if (valid) {
        printf("\nValid expression!\n");
    }
}

