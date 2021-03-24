%{

open Printf
open Ast

let fold_fun args exp =
     List.fold_left (fun a b -> Fun (b, a)) exp args

%}

%token <bool> BOOL
%token <int> NUM
%token <string> STR ID SPACE
%token <float> FLOAT
%token NOT
%token FUN ARROW EQUAL SEMICOLON IF THEN ELSE LET 
%token EQUAL NOT_EQUAL GREATER_EQUAL LESS_EQUAL GREATER_EQUAL LESS GREATER NAMESPACE
%token LS RS LB RB BAR TYPE OF
%token PLUS MINUS TIMES DIV RP LP COMMA
%token EOF
%type <Ast.expr list> prog

%right prec_let
%right SEMICOLON
%right prec_if
%nonassoc prec_tuple
%left COMMA
%left EQUAL NOT_GREATER LESS GREATER LESS_EQUAL GREATER_EQUAL
%left PLUS MINUS
%left TIMES DIV
%nonassoc UMINUS
%left prec_app
%left NAMESPACE

%start prog

%%

prog : stmts EOF { $1 }
     ;

stmts : stmts stmt { $1 @ [$2] }
      | stmt { [$1] }
      ;

tuple : LP elems RP { $2 }

simple_expr : NUM        { Int $1 }
            | ID         { Var $1 }
            | SPACE expr { TypeVar ($1, $2) }
            | LP expr RP { $2 }
            | LP RP      { Unit }
            | LP elems RP %prec prec_tuple { Tuple $2 }
            | BOOL       { Bool $1 }
            | FLOAT      { Float $1 }
            | SPACE NAMESPACE ID { NameSpace ($1, $3) }
            | LS elems RS { List $2 }
            ;


stmt : LET ID fargs EQUAL expr %prec prec_let { Assign ($2, fold_fun $3 $5) }
     | LET ID EQUAL expr %prec prec_let { Assign ($2, $4) }
     | TYPE ID EQUAL types { Types ($2, $4) }
     ;

types : BAR types BAR typed { $2 @ [$4] }
      | types BAR typed { $1 @ [$3] }
      | typed { [$1] }

typed : SPACE { Type $1 }
      | SPACE OF SPACE { Typeof ($1, $3) }

block : LB bcontents RB { Block $2 }

bcontents : bcontents SEMICOLON expr { $1 @ [$3] }
          | bcontents SEMICOLON stmt { $1 @ [$3] }
          | expr { [$1] }
          | stmt { [$1] }
          ;

expr :
     | simple_expr { $1 }
     | block { $1 }
     | FUN fargs ARROW expr { fold_fun $2 $4 }
     | NOT expr { Call (Var "!", [$2]) }
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
     | simple_expr cargs %prec prec_app { Call ($1, $2) }
     | error
          { failwith 
               (Printf.sprintf "parse error near characters %d-%d"
                    (Parsing.symbol_start ())
                    (Parsing.symbol_end ())) }
     ;

fargs : fargs ID { $1@ [$2] }
      | ID       { [$1] }
      ;

cargs : cargs simple_expr %prec prec_app { $1 @ [$2] }
      | simple_expr %prec prec_app       { [$1] }

elems: elems COMMA expr { $1 @ [$3] }
     | expr { [$1] }

%%
