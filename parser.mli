type token =
  | BOOL of (bool)
  | NUM of (int)
  | STR of (string)
  | ID of (string)
  | SPACE of (string)
  | FLOAT of (float)
  | NOT
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
  | NAMESPACE
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
