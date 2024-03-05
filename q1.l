%{
#include<stdio.h>
int cnt = 0, tab = 0, space = 0, lines = 1;
%}

%%
[ ]      { space++; }
[\n]     { lines++; word++;}
[\t]     { tab++; word++;}
[0-9a-zA-Z] { cnt++; }
.

%%

int yywrap() {}

int main() {
    yylex();
    printf("\nCount of characters is %d\nNumber of tabs is %d\nNumber of spaces is %d\nNumber of lines is %d\n", cnt, tab, space, lines);
    return 0;
}

