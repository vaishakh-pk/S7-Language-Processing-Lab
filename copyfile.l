%{
#include <stdio.h>
%}

%option noyywrap

%%
"{" { fputs("begin", yyout); }
"}" { fputs("end", yyout); }
. { putc(yytext[0], yyout); }

%%

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_file> <output_file>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        perror("fopen input");
        return 1;
    }

    yyout = fopen(argv[2], "w");
    if (yyout == NULL) {
        perror("fopen output");
        fclose(yyin);
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);
    return 0;
}

