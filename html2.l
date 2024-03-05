%{
#include<stdio.h>
%}

%%
"<"[^>]*">" { fprintf(yyout, "%s", yytext); }
.  ;
%%

int yywrap(){
    return 1;
}

int main(int argc, char* argv[]) {
    FILE* file = fopen(argv[1], "r");
    FILE* outfile = fopen(argv[2],"w");
    yyin = file;
    yyout = outfile;
    
    yylex();
    fclose(file);
    fclose(outfile);
    return 0;
}
