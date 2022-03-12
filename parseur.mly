%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG MOD
%left PLUS MOINS
%left FOIS MOD
%nonassoc UMOINS

%type <unit> main expression terme facteur
%start main
%%
main:
expression PT_VIRG {}
;
expression:
expression PLUS terme {}
| expression MOINS expression {}
| expression FOIS expression {}
| GPAREN expression DPAREN {}
| MOINS expression %prec UMOINS {}
| expression MOD expression {}
| NOMBRE {}
 ;

