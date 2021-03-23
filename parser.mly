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
%left prec_app

%start prog

%%

prog : expr EOL { $1 }
     ;

simple_expr : NUM { Int $1 }
            | ID { Var $1 }
            | LP expr RP { $2 }
            | LP RP { Unit }

expr : 
     | simple_expr { $1 }
     | FUN fargs ARROW expr { Fun ($2, $4) }
     | expr PLUS expr { Call (Var ("+"), [$1; $3]) }
     | expr MINUS expr { Call (Var ("-"), [$1; $3]) }
     | expr TIMES expr { Call (Var ("*"), [$1; $3]) }
     | expr DIV expr { Call (Var ("/"), [$1; $3]) }
     | MINUS expr %prec UMINUS { Call (Var ("-"), [Int (0); $2]) }
     | simple_expr cargs %prec prec_app { Call ($1, $2) }
     ;

fargs : fargs ID { $1 @ [$2] }
      | ID { [$1] }
      ;

cargs : cargs simple_expr %prec prec_app { $1 @ [$2] }
      | simple_expr %prec prec_app{ [$1] }

%%
