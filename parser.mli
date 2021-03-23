type token =
  | NUM of (int)
  | STR of (string)
  | ID of (string)
  | FUN
  | ARROW
  | EQUAL
  | SEMICOLON
  | IF
  | THEN
  | ELSE
  | LET
  | IN
  | NOT_EQUAL
  | GREATER_EQUAL
  | LESS_EQUAL
  | LESS
  | GREATER
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
