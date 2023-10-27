%{
#include <stdio.h>
#include <ctype.h>
int charCount = 0;
int wordCount = 0;
int lineCount = 0;
int inWord = 0;
%}

%%
[a-zA-Z]+ {wordCount++; charCount += yyleng; inWord=1;}
\n 	  {lineCount++; inWord = 0;}
. 	  {if(!isspace(yytext[0]) && !inWord){
		   wordCount++;
		   inWord=1;
		}
         	
          } 
%%
int yywrap(){
return 1;
}
int main(int argc, char *argv[]){
if(argc != 2){
fprintf(stderr, "Usage: %s<input_file>\n", argv[0]);
return 1;
}

FILE *inputFile = fopen(argv[1], "r");
if(inputFile == NULL){
perror("Error opening file");
return 1;
}

yyin = inputFile;
yylex();

printf("Character count: %d\n", charCount);
printf("Word count: %d\n",wordCount);
printf("Line count: %d\n",lineCount);

fclose(inputFile);
return 0;
}
