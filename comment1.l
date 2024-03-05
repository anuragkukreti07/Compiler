%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

"//".* { printf("Single-line Comment: %s\n", yytext); }
"/*"(.*\n\t)*.*"*/" { printf("Multi-line Comment: %s\n", yytext); }          
.                     { }

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

