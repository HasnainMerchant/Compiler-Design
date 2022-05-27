%{

#include<stdio.h>
#include<math.h>
void yyerror(char *);

%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'

%%

expr: E{
printf("Result = %d\n", $1);
return 0;
};

E: E'+'E { $$ = $1 + $3; }
 | E'-'E { $$ = $1 - $3; }
 | E'*'E { $$ = $1 * $3; }
 | E'/'E { if($3 == 0){ printf("Divide By Zero Error\n"); return 0;}
	   else {$$ = $1 / $3; }
	 }
 | NUMBER { $$ = $1; }
 ;

%%

int main()
{
  printf("\nEnter - ");
  yyparse();
  return 0;
}

void yyerror(char *s)
{
printf("\nError In Expression\n");
}