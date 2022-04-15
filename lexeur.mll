{
open Parseur 
exception Eof
exception TokenInconu
}
rule token = parse
[' ' '\t'] { token lexbuf }
| ['\n'] { EOL }
| ['0'-'9']+('.'['0'-'9']['0'-'9']*)? as lexem{ NOMBRE(float_of_string lexem) }
|[' ' '\t' '\n'] { token lexbuf }
| ';' { PT_VIRG }
|'%'  { MOD }
| '+' { PLUS }
| '-' { MOINS }
| '*' { FOIS }
| '(' { GPAREN }
| ')' { DPAREN }
| eof { raise Eof }
| _ { raise TokenInconu 
}


