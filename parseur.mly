%token<int> NOMBRE 
%token PLUS MOINS FOIS GPAREN DPAREN EOL
%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG
%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN EOL
%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG MOD

%left PLUS MOINS
%left FOIS MOD
%nonassoc UMOINS

%type <int> main expression
%start main
%%
main:
expression EOL { $1 }

%type <unit> main expression terme facteur
%start main
%%
main:
expression PT_VIRG {}
;
expression:

expression PLUS expression { $1+$3 }
| expression MOINS expression { $1-$3 }
| expression FOIS expression{ $1*$3 }
|GPAREN expression DPAREN{( $2 )}
|MOINS expression %prec UMOINS { -$2 }
|NOMBRE { $1 }
;

expression PLUS terme {}
| expression MOINS expression {}
| expression FOIS expression {}
| GPAREN expression DPAREN {}
| MOINS expression %prec UMOINS {}
| expression MOD expression {}
| NOMBRE {}
 ;


