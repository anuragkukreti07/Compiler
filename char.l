%{
#include<stdio.h>
int cnt = 0,cnt1 = 0;
%}

%%
[0-9a-zA-Z] {cnt++;}
.

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    printf("\nCount of characters is %d\n", cnt);
    return 0;
}

