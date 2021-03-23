type token =
  | NUM of (int)
  | STR of (string)
  | ID of (string)
  | FUN
  | ARROW
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | RP
  | LP
  | COMMA
  | EOL

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"

open Printf
open Ast

# 24 "parser.ml"
let yytransl_const = [|
  260 (* FUN *);
  261 (* ARROW *);
  262 (* PLUS *);
  263 (* MINUS *);
  264 (* TIMES *);
  265 (* DIV *);
  266 (* RP *);
  267 (* LP *);
  268 (* COMMA *);
  269 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* STR *);
  259 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\003\000\003\000\003\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\004\000\004\000\005\000\
\005\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\003\000\002\000\001\000\004\000\003\000\
\003\000\003\000\003\000\002\000\002\000\002\000\001\000\002\000\
\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\003\000\000\000\000\000\000\000\018\000\
\000\000\000\000\015\000\000\000\012\000\005\000\000\000\000\000\
\000\000\000\000\000\000\001\000\017\000\000\000\014\000\000\000\
\004\000\000\000\000\000\010\000\011\000\016\000\000\000"

let yydgoto = "\002\000\
\008\000\009\000\010\000\012\000\022\000"

let yysindex = "\003\000\
\021\255\000\000\000\000\000\000\013\255\021\255\016\255\000\000\
\043\255\004\255\000\000\026\255\000\000\000\000\060\255\021\255\
\021\255\021\255\021\255\000\000\000\000\004\255\000\000\021\255\
\000\000\000\255\000\255\000\000\000\000\000\000\065\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\027\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\035\255\000\000\000\000\
\000\000\047\255\052\255\000\000\000\000\000\000\249\254"

let yygindex = "\000\000\
\000\000\250\255\248\255\000\000\000\000"

let yytablesize = 74
let yytable = "\013\000\
\015\000\021\000\007\000\001\000\003\000\007\000\004\000\018\000\
\019\000\026\000\027\000\028\000\029\000\030\000\007\000\011\000\
\003\000\031\000\004\000\005\000\000\000\003\000\006\000\004\000\
\005\000\014\000\007\000\006\000\023\000\000\000\024\000\007\000\
\006\000\006\000\006\000\006\000\006\000\000\000\000\000\006\000\
\013\000\013\000\013\000\013\000\013\000\000\000\000\000\013\000\
\016\000\017\000\018\000\019\000\008\000\008\000\000\000\020\000\
\008\000\009\000\009\000\008\000\000\000\009\000\000\000\000\000\
\009\000\016\000\017\000\018\000\019\000\025\000\016\000\017\000\
\018\000\019\000"

let yycheck = "\006\000\
\007\000\010\000\010\001\001\000\001\001\013\001\003\001\008\001\
\009\001\016\000\017\000\018\000\019\000\022\000\011\001\003\001\
\001\001\024\000\003\001\004\001\255\255\001\001\007\001\003\001\
\004\001\010\001\011\001\007\001\003\001\255\255\005\001\011\001\
\006\001\007\001\008\001\009\001\010\001\255\255\255\255\013\001\
\006\001\007\001\008\001\009\001\010\001\255\255\255\255\013\001\
\006\001\007\001\008\001\009\001\006\001\007\001\255\255\013\001\
\010\001\006\001\007\001\013\001\255\255\010\001\255\255\255\255\
\013\001\006\001\007\001\008\001\009\001\010\001\006\001\007\001\
\008\001\009\001"

let yynames_const = "\
  FUN\000\
  ARROW\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  RP\000\
  LP\000\
  COMMA\000\
  EOL\000\
  "

let yynames_block = "\
  NUM\000\
  STR\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 23 "parser.mly"
                ( _1 )
# 129 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 26 "parser.mly"
                  ( Int _1 )
# 136 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 27 "parser.mly"
                 ( Var _1 )
# 143 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 28 "parser.mly"
                         ( _2 )
# 150 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 29 "parser.mly"
                    ( Unit )
# 156 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 32 "parser.mly"
                   ( _1 )
# 163 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'fargs) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 33 "parser.mly"
                            ( Fun (_2, _4) )
# 171 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 34 "parser.mly"
                      ( Call (Var ("+"), [_1; _3]) )
# 179 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 35 "parser.mly"
                       ( Call (Var ("-"), [_1; _3]) )
# 187 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 36 "parser.mly"
                       ( Call (Var ("*"), [_1; _3]) )
# 195 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "parser.mly"
                     ( Call (Var ("/"), [_1; _3]) )
# 203 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 38 "parser.mly"
                               ( Call (Var ("-"), [Int (0); _2]) )
# 210 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'simple_expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'cargs) in
    Obj.repr(
# 39 "parser.mly"
                                        ( Call (_1, _2) )
# 218 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fargs) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 42 "parser.mly"
                 ( _1@[_2] )
# 226 "parser.ml"
               : 'fargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 43 "parser.mly"
           ( [_1] )
# 233 "parser.ml"
               : 'fargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'cargs) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 46 "parser.mly"
                                         ( _1@[_2] )
# 241 "parser.ml"
               : 'cargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 47 "parser.mly"
                                  ( [_1] )
# 248 "parser.ml"
               : 'cargs))
(* Entry prog *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let prog (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.expr)
;;
