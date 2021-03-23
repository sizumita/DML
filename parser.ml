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
  | IN
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

# 31 "parser.ml"
let yytransl_const = [|
  260 (* FUN *);
  261 (* ARROW *);
  262 (* EQUAL *);
  263 (* SEMICOLON *);
  264 (* IF *);
  265 (* THEN *);
  266 (* ELSE *);
  267 (* LET *);
  268 (* IN *);
  269 (* PLUS *);
  270 (* MINUS *);
  271 (* TIMES *);
  272 (* DIV *);
  273 (* RP *);
  274 (* LP *);
  275 (* COMMA *);
  276 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* STR *);
  259 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\003\000\003\000\003\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\004\000\004\000\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\003\000\002\000\001\000\004\000\003\000\
\003\000\003\000\003\000\006\000\002\000\004\000\005\000\002\000\
\002\000\001\000\002\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\003\000\000\000\000\000\000\000\000\000\
\000\000\021\000\000\000\000\000\018\000\000\000\000\000\000\000\
\013\000\005\000\000\000\000\000\000\000\000\000\000\000\001\000\
\020\000\000\000\017\000\000\000\000\000\000\000\000\000\004\000\
\000\000\000\000\010\000\011\000\019\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yydgoto = "\002\000\
\010\000\011\000\012\000\014\000\026\000"

let yysindex = "\025\000\
\038\255\000\000\000\000\000\000\254\254\038\255\028\255\038\255\
\026\255\000\000\103\255\003\255\000\000\015\255\111\255\022\255\
\000\000\000\000\115\255\038\255\038\255\038\255\038\255\000\000\
\000\000\003\255\000\000\038\255\038\255\038\255\042\255\000\000\
\249\254\249\254\000\000\000\000\000\000\120\255\253\254\120\255\
\038\255\038\255\120\255\120\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\044\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\053\255\000\000\000\000\000\000\000\000\000\000\000\000\
\062\255\071\255\000\000\000\000\000\000\077\255\000\000\083\255\
\000\000\000\000\089\255\095\255"

let yygindex = "\000\000\
\000\000\250\255\249\255\016\000\000\000"

let yytablesize = 136
let yytable = "\015\000\
\013\000\017\000\019\000\003\000\025\000\004\000\042\000\022\000\
\023\000\020\000\021\000\022\000\023\000\033\000\034\000\035\000\
\036\000\027\000\037\000\028\000\009\000\038\000\039\000\040\000\
\013\000\001\000\003\000\030\000\004\000\005\000\016\000\031\000\
\000\000\006\000\043\000\044\000\007\000\000\000\003\000\008\000\
\004\000\005\000\018\000\009\000\027\000\006\000\000\000\041\000\
\007\000\000\000\000\000\008\000\006\000\006\000\000\000\009\000\
\006\000\006\000\006\000\006\000\006\000\016\000\016\000\006\000\
\000\000\016\000\016\000\016\000\016\000\016\000\008\000\008\000\
\016\000\000\000\008\000\008\000\000\000\000\000\008\000\009\000\
\009\000\008\000\000\000\009\000\009\000\007\000\007\000\009\000\
\000\000\000\000\009\000\014\000\014\000\007\000\000\000\000\000\
\007\000\015\000\015\000\014\000\000\000\000\000\014\000\012\000\
\012\000\015\000\000\000\000\000\015\000\000\000\000\000\012\000\
\000\000\000\000\012\000\020\000\021\000\022\000\023\000\029\000\
\000\000\000\000\024\000\020\000\021\000\022\000\023\000\020\000\
\021\000\022\000\023\000\032\000\020\000\021\000\022\000\023\000"

let yycheck = "\006\000\
\003\001\008\000\009\000\001\001\012\000\003\001\010\001\015\001\
\016\001\013\001\014\001\015\001\016\001\020\000\021\000\022\000\
\023\000\003\001\026\000\005\001\018\001\028\000\029\000\030\000\
\003\001\001\000\001\001\006\001\003\001\004\001\003\001\016\000\
\255\255\008\001\041\000\042\000\011\001\255\255\001\001\014\001\
\003\001\004\001\017\001\018\001\003\001\008\001\255\255\006\001\
\011\001\255\255\255\255\014\001\009\001\010\001\255\255\018\001\
\013\001\014\001\015\001\016\001\017\001\009\001\010\001\020\001\
\255\255\013\001\014\001\015\001\016\001\017\001\009\001\010\001\
\020\001\255\255\013\001\014\001\255\255\255\255\017\001\009\001\
\010\001\020\001\255\255\013\001\014\001\009\001\010\001\017\001\
\255\255\255\255\020\001\009\001\010\001\017\001\255\255\255\255\
\020\001\009\001\010\001\017\001\255\255\255\255\020\001\009\001\
\010\001\017\001\255\255\255\255\020\001\255\255\255\255\017\001\
\255\255\255\255\020\001\013\001\014\001\015\001\016\001\009\001\
\255\255\255\255\020\001\013\001\014\001\015\001\016\001\013\001\
\014\001\015\001\016\001\017\001\013\001\014\001\015\001\016\001"

let yynames_const = "\
  FUN\000\
  ARROW\000\
  EQUAL\000\
  SEMICOLON\000\
  IF\000\
  THEN\000\
  ELSE\000\
  LET\000\
  IN\000\
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
# 28 "parser.mly"
                ( _1 )
# 170 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 31 "parser.mly"
                  ( Int _1 )
# 177 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 32 "parser.mly"
                 ( Var _1 )
# 184 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 33 "parser.mly"
                         ( _2 )
# 191 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 34 "parser.mly"
                    ( Unit )
# 197 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 37 "parser.mly"
                   ( _1 )
# 204 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'fargs) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 38 "parser.mly"
                            ( Fun (_2, _4) )
# 212 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 39 "parser.mly"
                      ( Call (Var ("+"), [_1; _3]) )
# 220 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 40 "parser.mly"
                       ( Call (Var ("-"), [_1; _3]) )
# 228 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 41 "parser.mly"
                       ( Call (Var ("*"), [_1; _3]) )
# 236 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 42 "parser.mly"
                     ( Call (Var ("/"), [_1; _3]) )
# 244 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 43 "parser.mly"
                                                 ( Call (Var ("if"), [_2; _4; _6]))
# 253 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 44 "parser.mly"
                               ( Call (Var ("-"), [Int (0); _2]) )
# 260 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 45 "parser.mly"
                                        ( Assign (_2, _4) )
# 268 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'fargs) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 46 "parser.mly"
                                              ( Assign (_2, Fun (_3, _5)))
# 277 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'simple_expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'cargs) in
    Obj.repr(
# 47 "parser.mly"
                                        ( Call (_1, _2) )
# 285 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fargs) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 50 "parser.mly"
                 ( _1@ [_2] )
# 293 "parser.ml"
               : 'fargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 51 "parser.mly"
           ( [_1] )
# 300 "parser.ml"
               : 'fargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'cargs) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 54 "parser.mly"
                                         ( _1 @ [_2] )
# 308 "parser.ml"
               : 'cargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 55 "parser.mly"
                                  ( [_1] )
# 315 "parser.ml"
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
