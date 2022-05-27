%{
enum {
      LOOKUP =0, /* default - looking rather than defining. */
      VERB,
      ADJ,
      ADV,
      NOUN,
      PREP,
      PRON,
      CONJ
};
int state;
int add_word(int type, char *word);
int lookup_word(char *word);
%}

%%

\n    { state = LOOKUP; } 
^verb  { state = VERB; }
^adj  { state = ADJ; }
^adv  { state = ADV; }
^noun  { state = NOUN; }
^prep  { state = PREP; }
^pron  { state = PRON; }
^conj  { state = CONJ; }

[a-zA-Z]+ {
                
      if(state != LOOKUP) {
            add_word(state, yytext);
      } else {
            switch(lookup_word(yytext)) {
                  case VERB: 
                        printf("%s: Verb\n", yytext); 
                        break;
		  case ADJ: 
                        printf("%s: Adjective\n", yytext); 
                        break;
		  case ADV: 
                        printf("%s: Adverb\n", yytext); 
                        break;
		  case NOUN: 
                        printf("%s: Noun\n", yytext); 
                        break;
		  case PREP: 
                        printf("%s: Preposition\n", yytext); 
                        break;
		  case PRON: 
                        printf("%s: Pronoun\n", yytext); 
                        break;
		  case CONJ: 
                        printf("%s: Conjunction\n", yytext); 
                        break;
                  default:
                        printf("%s: Cant Identify\n", yytext);
                        break;
            }
      }
}

.    /* ignore anything else */ ;

%%
int yywrap() {return 1;}
int main()
{
      yylex();
}
struct word {
      char *word_name;
      int word_type;
      struct word *next;
};
struct word *word_list; 
extern void *malloc() ;
int add_word(int type, char *word)
{
      struct word *wp;
      if(lookup_word(word) != LOOKUP)
      {
            printf("!!! warning: word %s already defined \n", word);
            return 0;
      }
      wp = (struct word *) malloc(sizeof(struct word));
      wp->next = word_list;
      wp->word_name = (char *) malloc(strlen(word)+1);
      strcpy(wp->word_name, word);
      wp->word_type = type;
      word_list = wp;
      return 1;
}
int lookup_word(char *word)
{
      struct word *wp = word_list;
      for(; wp; wp = wp->next) {
      if(strcmp(wp->word_name, word) == 0)
            return wp->word_type;
      }
      return LOOKUP;
}
