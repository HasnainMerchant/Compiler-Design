%{

#include<stdio.h>
#include<math.h>
void yyerror(char *);

%}

%token SIN COS TAN LOG SQRT NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '^'
%left '(' ')'

%%

expr: E{
printf("Result = %g\n", $1);
return 0;
};

E: E'+'E { $$ = $1 + $3; }
 | E'-'E { $$ = $1 - $3; }
 | E'*'E { $$ = $1 * $3; }
 | E'/'E { if($3 == 0){ printf("Divide By Zero Error\n"); return 0;}
	   else {$$ = $1 / $3; }
	 }
 | E'%'E { $$ = $1 % $3; }
 | NUMBER'^'NUMBER {$$ = pow($1, $3); }
 | SQRT'('NUMBER')' {$$ = sqrt($3); }
 | SIN'('NUMBER')' {$$ = (cos($3) * tan($3)); }
 | COS'('NUMBER')' {$$ = cos($3); }
 | TAN'('NUMBER')' {$$ = tan($3); }
 | LOG'('NUMBER')' {$$ = log($3); }
 | '('E')' { $$ = $2; }
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