%{
#include<stdio.h>
int cnt = 0,cnt1 = 0;
%}

%%
a*b {cnt++;}
d*e+ {cnt1++;}
.

%%

int yywrap() {
    
}

int main() {
    yylex();
    printf("\nCount is %d\n,d*e+ = %d", cnt,cnt1);
    return 0;
}

