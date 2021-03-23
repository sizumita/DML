type token =
  | NUM of (int)
  | STR of (string)
  | ID of (string)
  | FUN
  | ARROW
  | EQUAL
  | SEMICOLON
  | IF
  | THEN
  | ELSE
  | LET
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

# 30 "parser.ml"
let yytransl_const = [|
  260 (* FUN *);
  261 (* ARROW *);
  262 (* EQUAL *);
  263 (* SEMICOLON *);
  264 (* IF *);
  265 (* THEN *);
  266 (* ELSE *);
  267 (* LET *);
  268 (* PLUS *);
  269 (* MINUS *);
  270 (* TIMES *);
  271 (* DIV *);
  272 (* RP *);
  273 (* LP *);
  274 (* COMMA *);
  275 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* STR *);
  259 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\003\000\003\000\003\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\004\000\004\000\
\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\003\000\002\000\001\000\004\000\003\000\
\003\000\003\000\003\000\006\000\002\000\002\000\002\000\001\000\
\002\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\003\000\000\000\000\000\000\000\000\000\
\019\000\000\000\000\000\016\000\000\000\000\000\013\000\005\000\
\000\000\000\000\000\000\000\000\000\000\001\000\018\000\000\000\
\015\000\000\000\000\000\004\000\000\000\000\000\010\000\011\000\
\017\000\000\000\000\000\000\000\000\000"

let yydgoto = "\002\000\
\009\000\010\000\011\000\013\000\024\000"

let yysindex = "\004\000\
\021\255\000\000\000\000\000\000\023\255\021\255\021\255\015\255\
\000\000\071\255\032\255\000\000\101\255\250\254\000\000\000\000\
\083\255\021\255\021\255\021\255\021\255\000\000\000\000\032\255\
\000\000\021\255\021\255\000\000\252\254\252\254\000\000\000\000\
\000\000\088\255\079\255\021\255\088\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\027\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\038\255\
\000\000\000\000\000\000\000\000\046\255\051\255\000\000\000\000\
\000\000\059\255\000\000\000\000\063\255"

let yygindex = "\000\000\
\000\000\250\255\249\255\000\000\000\000"

let yytablesize = 106
let yytable = "\014\000\
\015\000\017\000\027\000\023\000\001\000\018\000\019\000\020\000\
\021\000\020\000\021\000\029\000\030\000\031\000\032\000\003\000\
\033\000\004\000\005\000\034\000\035\000\003\000\006\000\004\000\
\005\000\012\000\000\000\007\000\006\000\037\000\016\000\008\000\
\003\000\007\000\004\000\006\000\006\000\008\000\006\000\006\000\
\006\000\006\000\006\000\000\000\000\000\006\000\014\000\014\000\
\008\000\014\000\014\000\014\000\014\000\014\000\008\000\008\000\
\014\000\008\000\008\000\009\000\009\000\008\000\009\000\009\000\
\008\000\000\000\009\000\007\000\007\000\009\000\000\000\012\000\
\012\000\000\000\007\000\000\000\000\000\007\000\012\000\000\000\
\000\000\012\000\018\000\019\000\020\000\021\000\000\000\000\000\
\036\000\022\000\018\000\019\000\020\000\021\000\018\000\019\000\
\020\000\021\000\028\000\018\000\019\000\020\000\021\000\025\000\
\000\000\026\000"

let yycheck = "\006\000\
\007\000\008\000\009\001\011\000\001\000\012\001\013\001\014\001\
\015\001\014\001\015\001\018\000\019\000\020\000\021\000\001\001\
\024\000\003\001\004\001\026\000\027\000\001\001\008\001\003\001\
\004\001\003\001\255\255\013\001\008\001\036\000\016\001\017\001\
\001\001\013\001\003\001\009\001\010\001\017\001\012\001\013\001\
\014\001\015\001\016\001\255\255\255\255\019\001\009\001\010\001\
\017\001\012\001\013\001\014\001\015\001\016\001\009\001\010\001\
\019\001\012\001\013\001\009\001\010\001\016\001\012\001\013\001\
\019\001\255\255\016\001\009\001\010\001\019\001\255\255\009\001\
\010\001\255\255\016\001\255\255\255\255\019\001\016\001\255\255\
\255\255\019\001\012\001\013\001\014\001\015\001\255\255\255\255\
\010\001\019\001\012\001\013\001\014\001\015\001\012\001\013\001\
\014\001\015\001\016\001\012\001\013\001\014\001\015\001\003\001\
\255\255\005\001"

let yynames_const = "\
  FUN\000\
  ARROW\000\
  EQUAL\000\
  SEMICOLON\000\
  IF\000\
  THEN\000\
  ELSE\000\
  LET\000\
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
# 27 "parser.mly"
                ( _1 )
# 158 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 30 "parser.mly"
                  ( Int _1 )
# 165 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 31 "parser.mly"
                 ( Var _1 )
# 172 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 32 "parser.mly"
                         ( _2 )
# 179 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 33 "parser.mly"
                    ( Unit )
# 185 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 36 "parser.mly"
                   ( _1 )
# 192 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'fargs) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "parser.mly"
                            ( Fun (_2, _4) )
# 200 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 38 "parser.mly"
                      ( Call (Var ("+"), [_1; _3]) )
# 208 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 39 "parser.mly"
                       ( Call (Var ("-"), [_1; _3]) )
# 216 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 40 "parser.mly"
                       ( Call (Var ("*"), [_1; _3]) )
# 224 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 41 "parser.mly"
                     ( Call (Var ("/"), [_1; _3]) )
# 232 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 42 "parser.mly"
                                                 ( Call (Var ("if"), [_2; _4; _6]))
# 241 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 43 "parser.mly"
                               ( Call (Var ("-"), [Int (0); _2]) )
# 248 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'simple_expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'cargs) in
    Obj.repr(
# 44 "parser.mly"
                                        ( Call (_1, _2) )
# 256 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fargs) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 47 "parser.mly"
                 ( _1@ [_2] )
# 264 "parser.ml"
               : 'fargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 48 "parser.mly"
           ( [_1] )
# 271 "parser.ml"
               : 'fargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'cargs) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 51 "parser.mly"
                                         ( _1 @ [_2] )
# 279 "parser.ml"
               : 'cargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 52 "parser.mly"
                                  ( [_1] )
# 286 "parser.ml"
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
