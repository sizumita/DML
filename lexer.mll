{
open Parser
exception Eof
}

let digit = ['0'-'9']
let id = ['a'-'z' '_'] ['a'-'z' 'A'-'Z' '0'-'9']*

rule token = parse
  | digit+ as num { NUM (int_of_string num) }
  | "fun" { FUN }
  | "let" { LET }
  | "if" { IF }
  | "then" { THEN }
  | "else" { ELSE }
  | "in" { IN }
  | '\"'[^'\"']*'\"' as str { STR str }
  | "->" { ARROW }
  | "=" { EQUAL }
  | "<>" { NOT_EQUAL }
  | "<=" { LESS_EQUAL }
  | ">=" { GREATER_EQUAL }
  | "<" { LESS }
  | ">" { GREATER }
  | ";" { SEMICOLON }
  | "+" { PLUS }
  | "-" { MINUS }
  | "*" { TIMES }
  | "/" { DIV }
  | "(" { LP }
  | ")" { RP }
  | "," { COMMA }
  | [' ' '\t'] { token lexbuf }
  | ['\n'] { EOL }
  | id as text { ID text }
  | eof { raise Eof }
