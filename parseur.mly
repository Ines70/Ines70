<<<<<<< HEAD
%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG
=======
%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN EOL
%left PLUS MOINS
%left FOIS
%nonassoc UMOINS

>>>>>>> master
%type <unit> main expression terme facteur
%start main
%%
main:
expression PT_VIRG {}
;
expression:
expression PLUS terme {}
| expression MOINS terme {}
| terme {}
;
terme:
terme FOIS facteur {}
| facteur {}
;
facteur:
GPAREN expression DPAREN {}
| MOINS expression %prec UMOINS {}
| NOMBRE {}
;
