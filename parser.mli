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
  | COLON
  | NOT_EQUAL
  | GREATER_EQUAL
  | LESS_EQUAL
  | LESS
  | GREATER
  | LS
  | RS
  | LB
  | RB
  | BAR
  | TYPE
  | OF
  | DOT
  | ALIAS
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | RP
  | LP
  | COMMA
  | EOF

val prog :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.expr list
