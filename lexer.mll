{
open Parser
exception Eof
}

let digit = ['0'-'9']
let id = ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9']*

rule token = parse
  | digit+ as num { NUM (int_of_string num) }
  | "fun" { FUN }
  | id as text { ID text }
  | '\"'[^'\"']*'\"' as str { STR str }
  | "->" { ARROW }
  | "+" { PLUS }
  | "-" { MINUS }
  | "*" { TIMES }
  | "/" { DIV }
  | "(" { LP }
  | ")" { RP }
  | "," { COMMA }
  | [' ' '\t'] { token lexbuf }
  | ['\n'] { EOL }
  | eof            { raise Eof }