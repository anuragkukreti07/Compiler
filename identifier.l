%{
#include <stdio.h>
%}

%%
"if"|"else"|"while"|"for"|"int"|"float"|"double"|"char"|"void"   {printf("Keyword: %s\n", yytext);}
[a-zA-Z][a-zA-Z0-9_]*   {printf("Valid Identifier\n");}
[0-9][a-z A-Z 0-9 _]*   {printf("Invalid Identifier\n");}
[a-zA-Z]+[ \t\n]+[a-zA-Z]+   {printf("Invalid Identifier\n");}
.                         
%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    return 0;
}

