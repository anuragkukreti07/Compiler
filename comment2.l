%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

"//".* ;
"/*"(.*\n)*.*"*/"  ;
. { fprintf(yyout, "%s", yytext); }


%%

int yywrap() {
    return 1;
}

int main(int argc, char* argv[]) {
    FILE* file = fopen(argv[1], "r");
    yyin = file;
    yyout = fopen(argv[2], "w");
    // if (!yyout) {
    //     printf("Error: Couldn't open output file %s\n", argv[2]);
    //     fclose(file);
    //     return 1;
    // }
    yylex();
    fclose(file);
    return 0;
}

