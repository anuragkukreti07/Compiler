%{
#include<stdio.h>
%}
%s A
%%
<INITIAL>1 BEGIN INITIAL; 
<INITIAL>0 BEGIN A; 
<INITIAL>\n printf("Accepted\n"); 
<A>0 BEGIN INITIAL; 
<A>1 BEGIN A; 
<A>\n printf("Not Accepted\n"); BEGIN INITIAL;

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}

