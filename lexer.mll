{
open Parser
}

let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']
let lower = ['a'-'z']
let upper = ['A'-'Z']
let id = ['a'-'z' '_'] ['a'-'z' 'A'-'Z' '0'-'9']*
let space_name = upper (lower|upper|digit|'_')*

rule token = parse
  | space+ { token lexbuf }
  | digit+ as num { NUM (int_of_string num) }
  | digit+ ('.' digit*)? as num (['e' 'E'] ['+' '-']? digit+)? { FLOAT(float_of_string num) }
  | "(*"
    { comment lexbuf; (* ネストしたコメントのためのトリック *)
      token lexbuf }
  | "fun" { FUN }
  | "let" { LET }
  | "if" { IF }
  | "then" { THEN }
  | "else" { ELSE }
  | "in" { IN }
  | "true" { BOOL(true) }
  | "false" { BOOL(false) }
  | "!" { NOT }
  | '\"'[^'\"']*'\"' as str { STR str }
  | "->" { ARROW }
  | "=" { EQUAL }
  | "::" { NAMESPACE }
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
  | "{" { LB }
  | "}" { RB }
  | "[" { LS }
  | "]" { RS }
  | "," { COMMA }
  | id as text { ID text }
  | space_name as text { SPACE text }
  | eof { EOF }
and comment = parse
  | "*)" { () }
  | "(*"
    { comment lexbuf;
      comment lexbuf }
  | eof { Format.eprintf "warning: unterminated comment@." }
  | _ { comment lexbuf }