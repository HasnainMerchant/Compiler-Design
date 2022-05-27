%{

  #include<string.h>
    
int count = 0;
%}


%%


#.* ;


[" "]* ; /*Ignore Whitespace*/

[\t]*  ;



[, | ; | (|) | {|} | . | _] ;

("int")|("float")|("char")|("double")|("while")|("for")|("struct")|("typedef")|("do")|("if")|("break")|("continue")|("void")|("switch")|("return")|("else")|("goto") ;

[a-zA-Z_][a-zA-Z0-9_]* {count++;}



\n ;



[-][0-9]*"."[0-9]+ ;

[0-9]*"."[0-9]+ ;
[0-9]+ ;

"-"[0-9]+ ;



"="|"<="|"<"|">="|">"|"!="|"=="|"+"|"-"|"*"|"/" ;

[0-9]+[a-zA-Z_][a-zA-Z0-9_]* ;



%%



int yywrap() {return 1;}

int main(int argc, char *argv[])

{

int i;
yyin = fopen(argv[1], "r"); 
  
yylex();

  
printf("Number Of Identifiers = %d", count);
fclose(yyin);



return 0;

}