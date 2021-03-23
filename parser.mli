type token =
  | NUM of (int)
  | STR of (string)
  | ID of (string)
  | FUN
  | ARROW
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | RP
  | LP
  | COMMA
  | EOL

val prog :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.expr
