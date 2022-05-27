%{

  #include<string.h>
  /*Global Variables*/
  int lineNo = 1;
  int symIndex = 0;
  int error = 0;
  int result;
  char *symTable[100] = {};
  char *errorSym[100] = {};

%}

%%

#.* {printf("%d  %s  Preprocessor Statement\n",lineNo, yytext);}  /*Preprocessor Statement*/

[" "]* ; /*Ignore Whitespace*/
[\t]*  ;

[, | ; | (|) | {|} | . | _] {fprintf(yyout, "%d  %s  Delimiter\n",lineNo, yytext);}/*Delim*/

("int")|("float")|("char")|("double")|("while")|("for")|("struct")|("typedef")|("do")|("if")|("break")|("continue")|("void")|("switch")|("return")|("else")|("goto") {
fprintf(yyout, "%d  %s  Keyword\n",lineNo, yytext);} 		/*Keywords*/

[a-zA-Z_][a-zA-Z0-9_]* {

symTable[symIndex] = strdup(yytext);
symIndex++;
fprintf(yyout, "%d  %s  Identifier\n",lineNo, yytext);}  /*Identifiers*/

\n ++lineNo; /*Line Number*/

[-][0-9]*"."[0-9]+ {fprintf(yyout, "%d  %s  Constant\n",lineNo, yytext);}
[0-9]*"."[0-9]+ {fprintf(yyout, "%d  %s  Constant\n",lineNo, yytext);}		/*Constants*/
[0-9]+ {fprintf(yyout, "%d  %s  Constant\n",lineNo, yytext);}
"-"[0-9]+ {fprintf(yyout, "%d  %s  Constant\n",lineNo, yytext);}

"="|"<="|"<"|">="|">"|"!="|"=="|"+"|"-"|"*"|"/" {
fprintf(yyout, "%d  %s  Operators\n", lineNo, yytext);}			/*Operators*/

[0-9]+[a-zA-Z_][a-zA-Z0-9_]* {
errorSym[error] = strdup(yytext);
error++;
} /*Error Detection*/

%%

int yywrap() { }
int main(int argc, char *argv[])
{
  yyin = fopen(argv[1], "r");
  remove("output.txt");
  yyout = fopen("output.txt","wb");
  yylex();

  printf("\n[+]Tokens Successfully Generated In Output File\n");
  
  printf("\n[+]Symbol Table Created\n");
  printf("\tSYMBOL TABLE - \n");
  for(int i =0;i<symIndex;i++)
  {
  	printf("\t%d %s\n", (i+1), symTable[i]);
  }
  if(error > 0)
  {
    printf("\n[-]Error's Generated\n");
    printf("\tERROR ARE - \n");
    for(int i =0;i<error;i++)
    {
  	printf("\t%d %s\n", (i+1), errorSym[i]);
    }
  }

fclose(yyin);
fclose(yyout);

return 0;
}