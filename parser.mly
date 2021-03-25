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
%token FUN ARROW EQUAL SEMICOLON IF THEN ELSE LET COLON
%token EQUAL NOT_EQUAL GREATER_EQUAL LESS_EQUAL GREATER_EQUAL LESS GREATER
%token LS RS LB RB BAR TYPE OF DOT ALIAS
%token PLUS MINUS TIMES DIV RP LP COMMA
%token EOF
%type <Ast.expr list> prog

%right prec_let
%right SEMICOLON
%right prec_if
%nonassoc prec_typevar
%nonassoc prec_type
%nonassoc prec_tuple
%left COMMA
%left EQUAL NOT_GREATER LESS GREATER LESS_EQUAL GREATER_EQUAL
%left PLUS MINUS
%left TIMES DIV
%nonassoc UMINUS
%left prec_app
%left DOT

%start prog

%%

prog : stmts EOF { $1 }
     | error
          { failwith 
               (Printf.sprintf "parse error near characters %d-%d"
                    (Parsing.symbol_start ())
                    (Parsing.symbol_end ())) }
     ;

stmts : stmts stmt { $1 @ [$2] }
      | stmt { [$1] }
      ;

tuple : LP elems RP { $2 }
      ;

simple_expr : NUM        { Int $1 }
            | ID         { Var $1 }
            | STR        { String $1 }
            | SPACE expr %prec prec_typevar { TypeVarof ($1, $2) }
            | SPACE %prec prec_type { TypeVar $1 }
            | LP expr RP { $2 }
            | LP RP      { Unit }
            | LP elems RP %prec prec_tuple { Tuple $2 }
            | BOOL       { Bool $1 }
            | FLOAT      { Float $1 }
            | SPACE DOT ID { Call (Var ("get"), [NameSpace $1; String ("\"" ^ $3 ^ "\"")]) }
            | LS elems RS { List $2 }
            | LB struct_values RB { StructValue $2 }
            | simple_expr DOT ID { Call (Var ("get"), [$1; String ("\"" ^ $3 ^ "\"")])}
            ;

struct_values : struct_values SEMICOLON ID EQUAL simple_expr { $1 @ [($3, $5)] }
              | ID EQUAL simple_expr { [($1, $3)] }
              ;


stmt : LET ID fargs EQUAL expr %prec prec_let { Assign ($2, fold_fun ($3, $5)) }
     | LET ID LP RP EQUAL expr %prec prec_let { Assign ($2, Fun (["_"], $6)) }
     | LET ID EQUAL expr %prec prec_let { Assign ($2, $4) }
     | TYPE ID EQUAL types { Types ($2, $4) }
     | TYPE ALIAS ID EQUAL LB defstruct RB { StructType($3, $6) }
     ;

defstruct : defstruct SEMICOLON ID COLON SPACE { $1 @ [($3, $5)] }
          | ID COLON SPACE { [($1, $3)]}
          ;

types : BAR types BAR typed { $2 @ [$4] }
      | types BAR typed { $1 @ [$3] }
      | typed { [$1] }
      ;

typed : SPACE { Type $1 }
      | SPACE OF SPACE { Typeof ($1, $3) }
      ;

block : LB bcontents RB { Block $2 }
      ;

bcontents : bcontents SEMICOLON expr { $1 @ [$3] }
          | bcontents SEMICOLON stmt { $1 @ [$3] }
          | expr { [$1] }
          | stmt { [$1] }
          ;

expr :
     | simple_expr { $1 }
     | block { $1 }
     | FUN fargs ARROW expr { Fun ($2, $4) }
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
     ;

fargs : fargs ID { $1 @ [$2] }
      | ID       { [$1] }
      ;

cargs : cargs simple_expr %prec prec_app { $1 @ [$2] }
      | simple_expr %prec prec_app       { [$1] }
      ;

elems: elems COMMA expr { $1 @ [$3] }
     | expr { [$1] }
     ;

%%
