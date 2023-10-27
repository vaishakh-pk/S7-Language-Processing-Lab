%{
int id = 0,key=0,ass=0,rel=0,integer=0,statement=0;
%}
TYPE if|else|switch|int|float|for|while|char|void|return|include

%%
{TYPE} {key++;}
(<stdio.h>) {;}
(%[a-z]) {;}
= {ass++;}
(<|>|<=|>=|==) {rel++;}
[a-zA-Z_][a-zA-Z0-9_]* {id++;}
[0-9]+ {integer++;}
; {statement++;}

%%
int yywrap(){
return 1;
}
int main(int argc, char* argv[])
{
extern FILE *yyin;
yyin = fopen("test.txt", "r");
yylex();

printf("The number of keywords=%d\n",key);
printf("The number of identifier=%d\n",id);
printf("The number of assignment=%d\n",ass);
printf("The number of relational op=%d\n",rel);
printf("The number of Integer=%d\n",integer);
printf("The number of statements =%d\n",statement);
fclose(yyin);



}
