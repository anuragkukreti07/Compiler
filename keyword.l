%{
#include <stdio.h>
%}

%%

"if"|"else"|"while"|"for"|"int"|"float"|"double"|"char"|"void"   {printf("Keyword: %s\n", yytext);}
[a-zA-Z][a-zA-Z0-9_]*   {printf("Valid Identifier :%s\n",yytext);}
[0-9]+[a-zA-Z0-9_]*   {printf("Invalid Identifier :%s\n",yytext);}
%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    return 0;
}

