(*fichier main.ml *)
let _ = (*main en OCaml*)
try
let lexbuf = Lexing.from_channel stdin in (*lexeur lancé sur stdin*)
while true do (*on ne s'arrête pas*)
Parseur.main Lexeur.token lexbuf (*parseur une ligne*)
|> Format.printf "%a\n%!" AST.print_AST
done
with
| Lexeur.Eof -> exit 0 (*impossible*)
| Lexeur.TokenInconu (*erreur de lexing*)
| Parsing.Parse_error -> (*erreur de parsing*)
Printf.printf ("Ceci n'est pas une expression arithmetique\n")
let arg =Array.length Sys.argv

let _ = 
		try	
	
			let lexbuf = if (arg == 2) then let file =open_in Sys.argv.(1) in Lexing.from_channel file
								else Lexing.from_channel stdin in (*lexeur lancé sur stdin*)
									while true do (*on ne s'arrête pas*)
										Parseur.main Lexeur.token lexbuf (*parseur une ligne*)
										|> Format.printf "%a\n%!" AST.print_AST
									done
												
		with
		| Lexeur.Eof -> exit 0 (*impossible*)
		| Lexeur.TokenInconu (*erreur de lexing*)
		| Parsing.Parse_error -> (*erreur de parsing*)
		Printf.printf ("Ceci n'est pas une expression arithmetique\n")
		|End_of_file ->close_in (open_in Sys.argv.(1))
		

