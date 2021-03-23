%{

open Printf
open Ast

%}
%token <int> NUM
%token <string> STR ID
%token FUN ARROW
%token PLUS MINUS TIMES DIV RP LP COMMA
%token EOL
%type <Ast.expr> prog

%left PLUS MINUS
%left TIMES DIV
%nonassoc UMINUS

%start prog

%%

prog : expr EOL { $1 }
     ;

expr : NUM { IntExp $1 }
     | ID { VarExp (Var $1) }
     | LP RP { Unit }
     | FUN fargs ARROW expr { Fun ($2, $4) }
     | expr PLUS expr { Call ("+", [$1; $3]) }
     | expr MINUS expr { Call ("-", [$1; $3]) }
     | expr TIMES expr { Call ("*", [$1; $3]) }
     | expr DIV expr { Call ("/", [$1; $3]) }
     | LP expr RP { $2 }
     | MINUS expr %prec UMINUS { Call ("-", [IntExp (0); $2]) }
     | ID cargs { Call ($1, $2) }
     | expr cargs { CallNoname ($1, $2) }
     ;

fargs : fargs ID { $1@[$2] }
      | ID { [$1] }
      ;

cargs : cargs expr { $1@[$2] }
      | expr { [$1] }

%%
