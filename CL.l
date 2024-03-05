%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9] { printf("Number: %s\n", yytext); }
"if"|"else"|"while"|"for"|"int"|"float"|"double"|"char"|"void"   { printf("Keyword: %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9_]*   { printf("Valid Identifier: %s\n", yytext); }
[0-9]+[a-zA-Z0-9_]*     { printf("Invalid Identifier: %s\n", yytext); }
"+"|"-"|"*"|"/"    { printf("Arithmetic Operator: %s\n", yytext); }
"="     { printf("Assignment Operator: %s\n", yytext); }
"=="|"!="|"<"|"<="|">"|">="  { printf("Comparison Operator: %s\n", yytext); }
"++"|"--"            { printf("Unary Operator: %s\n", yytext); }
"&&"|"||"                { printf("Logical Operator: %s\n", yytext); }
"!"                     { printf("Negation Operator: %s\n", yytext); }
"("                     { printf("Left Parenthesis\n"); }
")"                     { printf("Right Parenthesis\n"); }
"{"                     { printf("Left Brace\n"); }
"}"                     { printf("Right Brace\n"); }
","|";"                     { printf("Delimiter\n"); }
[ \t\n]+                
.                       { printf("Unrecognized token: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main(int argc, char* argv[]) {
    FILE* file = fopen(argv[1], "r");
    yyin = file;
    yylex();
    fclose(file);
    return 0;
}

