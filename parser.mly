%{

open Printf
open Ast

let fold_fun args exp =
     List.fold_left (fun a b -> Fun (b, a)) exp args

%}
%token <int> NUM
%token <string> STR ID
%token FUN ARROW EQUAL SEMICOLON IF THEN ELSE LET EQUAL IN NOT_EQUAL GREATER_EQUAL LESS_EQUAL GREATER_EQUAL LESS GREATER
%token PLUS MINUS TIMES DIV RP LP COMMA
%token EOL
%type <Ast.expr> prog

%nonassoc IN
%right prec_let
%right SEMICOLON
%right prec_if
%left EQUAL NOT_GREATER LESS GREATER LESS_EQUAL GREATER_EQUAL
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
     | FUN fargs ARROW expr { fold_fun $2 $4 }
     | expr PLUS expr { Call (Var ("+"), [$1; $3]) }
     | expr MINUS expr { Call (Var ("-"), [$1; $3]) }
     | expr TIMES expr { Call (Var ("*"), [$1; $3]) }
     | expr DIV expr { Call (Var ("/"), [$1; $3]) }
     | expr EQUAL expr { Call (Var ("="), [$1; $3]) }
     | expr NOT_EQUAL expr { Call (Var ("<>"), [$1; $3]) }
     | expr LESS expr { Call (Var ("<"), [$1; $3]) }
     | expr GREATER expr { Call (Var (">"), [$1; $3]) }
     | expr LESS_EQUAL expr { Call (Var ("<="), [$1; $3]) }
     | expr GREATER_EQUAL expr { Call (Var (">="), [$1; $3]) }
     | IF expr THEN expr ELSE expr %prec prec_if { Call (Var ("if"), [$2; $4; $6])}
     | MINUS expr %prec UMINUS { Call (Var ("-"), [Int (0); $2]) }
     | LET ID EQUAL expr %prec prec_let { Assign ($2, $4) }
     | LET ID fargs EQUAL expr %prec prec_let { Assign ($2, fold_fun $3 $5)}
     | simple_expr cargs %prec prec_app { Call ($1, $2) }
     | error
     { failwith 
          (Printf.sprintf "parse error near characters %d-%d"
               (Parsing.symbol_start ())
               (Parsing.symbol_end ())) }
     ;

fargs : fargs ID { $1@ [$2] }
      | ID { [$1] }
      ;

cargs : cargs simple_expr %prec prec_app { $1 @ [$2] }
      | simple_expr %prec prec_app{ [$1] }

%%
