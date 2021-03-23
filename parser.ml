type token =
  | BOOL of (bool)
  | NUM of (int)
  | STR of (string)
  | ID of (string)
  | SPACE of (string)
  | FLOAT of (float)
  | NOT
  | FUN
  | ARROW
  | EQUAL
  | SEMICOLON
  | IF
  | THEN
  | ELSE
  | LET
  | IN
  | NOT_EQUAL
  | GREATER_EQUAL
  | LESS_EQUAL
  | LESS
  | GREATER
  | NAMESPACE
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

let fold_fun args exp =
     List.fold_left (fun a b -> Fun (b, a)) exp args

# 44 "parser.ml"
let yytransl_const = [|
  263 (* NOT *);
  264 (* FUN *);
  265 (* ARROW *);
  266 (* EQUAL *);
  267 (* SEMICOLON *);
  268 (* IF *);
  269 (* THEN *);
  270 (* ELSE *);
  271 (* LET *);
  272 (* IN *);
  273 (* NOT_EQUAL *);
  274 (* GREATER_EQUAL *);
  275 (* LESS_EQUAL *);
  276 (* LESS *);
  277 (* GREATER *);
  278 (* NAMESPACE *);
  279 (* PLUS *);
  280 (* MINUS *);
  281 (* TIMES *);
  282 (* DIV *);
  283 (* RP *);
  284 (* LP *);
  285 (* COMMA *);
  286 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* BOOL *);
  258 (* NUM *);
  259 (* STR *);
  260 (* ID *);
  261 (* SPACE *);
  262 (* FLOAT *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\004\000\004\000\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\003\000\002\000\001\000\001\000\003\000\
\001\000\004\000\002\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\006\000\002\000\004\000\
\005\000\002\000\001\000\002\000\001\000\002\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\027\000\006\000\002\000\003\000\000\000\007\000\
\000\000\000\000\000\000\000\000\000\000\000\000\032\000\000\000\
\000\000\000\000\000\000\029\000\000\000\000\000\000\000\000\000\
\005\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\001\000\031\000\000\000\008\000\
\028\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\030\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yydgoto = "\002\000\
\015\000\016\000\017\000\021\000\039\000"

let yysindex = "\002\000\
\065\255\000\000\000\000\000\000\000\000\000\000\245\254\000\000\
\065\255\010\255\065\255\025\255\065\255\036\255\000\000\167\255\
\011\255\026\255\096\000\000\000\045\255\067\000\064\255\014\255\
\000\000\036\000\065\255\065\255\065\255\065\255\065\255\065\255\
\065\255\065\255\065\255\065\255\000\000\000\000\011\255\000\000\
\000\000\065\255\065\255\065\255\071\255\000\000\240\254\096\000\
\240\254\240\254\240\254\240\254\030\255\030\255\014\255\014\255\
\000\000\096\000\084\000\096\000\065\255\065\255\096\000\096\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\077\255\000\000\032\255\000\000\000\000\000\000\000\000\113\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\095\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\215\255\151\255\
\230\255\248\255\007\000\022\000\185\255\200\255\131\255\149\255\
\000\000\225\255\000\000\017\000\000\000\000\000\037\000\052\000"

let yygindex = "\000\000\
\000\000\247\255\245\255\009\000\000\000"

let yytablesize = 378
let yytable = "\019\000\
\028\000\022\000\001\000\024\000\026\000\038\000\033\000\034\000\
\035\000\036\000\018\000\004\000\005\000\020\000\006\000\007\000\
\008\000\047\000\048\000\049\000\050\000\051\000\052\000\053\000\
\054\000\055\000\056\000\057\000\023\000\040\000\028\000\045\000\
\058\000\059\000\060\000\003\000\004\000\005\000\014\000\006\000\
\007\000\008\000\009\000\010\000\011\000\011\000\028\000\011\000\
\041\000\000\000\012\000\063\000\064\000\042\000\035\000\036\000\
\000\000\000\000\011\000\013\000\000\000\011\000\025\000\014\000\
\003\000\004\000\005\000\020\000\006\000\007\000\008\000\009\000\
\010\000\044\000\041\000\000\000\011\000\000\000\000\000\012\000\
\061\000\000\000\000\000\000\000\000\000\000\000\009\000\000\000\
\013\000\009\000\009\000\000\000\014\000\009\000\009\000\009\000\
\009\000\009\000\000\000\009\000\009\000\009\000\009\000\009\000\
\026\000\000\000\009\000\026\000\026\000\000\000\000\000\026\000\
\026\000\026\000\026\000\026\000\000\000\026\000\026\000\026\000\
\026\000\026\000\023\000\000\000\026\000\023\000\023\000\000\000\
\000\000\000\000\023\000\023\000\023\000\023\000\000\000\023\000\
\023\000\023\000\023\000\023\000\014\000\000\000\023\000\014\000\
\014\000\000\000\000\000\000\000\014\000\014\000\014\000\014\000\
\000\000\014\000\014\000\014\000\014\000\014\000\015\000\000\000\
\014\000\015\000\015\000\017\000\017\000\000\000\015\000\015\000\
\015\000\015\000\000\000\015\000\015\000\015\000\015\000\015\000\
\027\000\017\000\015\000\000\000\017\000\000\000\000\000\028\000\
\029\000\030\000\031\000\032\000\000\000\033\000\034\000\035\000\
\036\000\000\000\012\000\000\000\037\000\012\000\012\000\000\000\
\000\000\000\000\012\000\012\000\012\000\012\000\000\000\012\000\
\012\000\013\000\000\000\012\000\013\000\013\000\012\000\000\000\
\000\000\013\000\013\000\013\000\013\000\000\000\013\000\013\000\
\016\000\000\000\013\000\016\000\016\000\013\000\000\000\000\000\
\016\000\016\000\016\000\016\000\000\000\010\000\010\000\021\000\
\000\000\016\000\021\000\021\000\016\000\000\000\000\000\021\000\
\021\000\021\000\021\000\010\000\000\000\000\000\010\000\000\000\
\021\000\020\000\000\000\021\000\020\000\020\000\000\000\000\000\
\000\000\020\000\020\000\020\000\020\000\000\000\000\000\000\000\
\018\000\000\000\020\000\018\000\018\000\020\000\000\000\000\000\
\018\000\018\000\018\000\018\000\000\000\024\000\024\000\019\000\
\000\000\018\000\019\000\019\000\018\000\000\000\000\000\019\000\
\019\000\019\000\019\000\024\000\000\000\027\000\024\000\000\000\
\019\000\025\000\025\000\019\000\028\000\029\000\030\000\031\000\
\032\000\000\000\033\000\034\000\035\000\036\000\046\000\025\000\
\022\000\022\000\025\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\027\000\000\000\022\000\043\000\
\000\000\022\000\000\000\028\000\029\000\030\000\031\000\032\000\
\000\000\033\000\034\000\035\000\036\000\027\000\000\000\000\000\
\000\000\062\000\000\000\000\000\028\000\029\000\030\000\031\000\
\032\000\027\000\033\000\034\000\035\000\036\000\000\000\000\000\
\028\000\029\000\030\000\031\000\032\000\000\000\033\000\034\000\
\035\000\036\000"

let yycheck = "\009\000\
\017\001\011\000\001\000\013\000\014\000\017\000\023\001\024\001\
\025\001\026\001\022\001\001\001\002\001\004\001\004\001\005\001\
\006\001\027\000\028\000\029\000\030\000\031\000\032\000\033\000\
\034\000\035\000\036\000\039\000\004\001\004\001\017\001\023\000\
\042\000\043\000\044\000\000\001\001\001\002\001\028\001\004\001\
\005\001\006\001\007\001\008\001\013\001\014\001\017\001\012\001\
\004\001\255\255\015\001\061\000\062\000\009\001\025\001\026\001\
\255\255\255\255\027\001\024\001\255\255\030\001\027\001\028\001\
\000\001\001\001\002\001\004\001\004\001\005\001\006\001\007\001\
\008\001\010\001\004\001\255\255\012\001\255\255\255\255\015\001\
\010\001\255\255\255\255\255\255\255\255\255\255\010\001\255\255\
\024\001\013\001\014\001\255\255\028\001\017\001\018\001\019\001\
\020\001\021\001\255\255\023\001\024\001\025\001\026\001\027\001\
\010\001\255\255\030\001\013\001\014\001\255\255\255\255\017\001\
\018\001\019\001\020\001\021\001\255\255\023\001\024\001\025\001\
\026\001\027\001\010\001\255\255\030\001\013\001\014\001\255\255\
\255\255\255\255\018\001\019\001\020\001\021\001\255\255\023\001\
\024\001\025\001\026\001\027\001\010\001\255\255\030\001\013\001\
\014\001\255\255\255\255\255\255\018\001\019\001\020\001\021\001\
\255\255\023\001\024\001\025\001\026\001\027\001\010\001\255\255\
\030\001\013\001\014\001\013\001\014\001\255\255\018\001\019\001\
\020\001\021\001\255\255\023\001\024\001\025\001\026\001\027\001\
\010\001\027\001\030\001\255\255\030\001\255\255\255\255\017\001\
\018\001\019\001\020\001\021\001\255\255\023\001\024\001\025\001\
\026\001\255\255\010\001\255\255\030\001\013\001\014\001\255\255\
\255\255\255\255\018\001\019\001\020\001\021\001\255\255\023\001\
\024\001\010\001\255\255\027\001\013\001\014\001\030\001\255\255\
\255\255\018\001\019\001\020\001\021\001\255\255\023\001\024\001\
\010\001\255\255\027\001\013\001\014\001\030\001\255\255\255\255\
\018\001\019\001\020\001\021\001\255\255\013\001\014\001\010\001\
\255\255\027\001\013\001\014\001\030\001\255\255\255\255\018\001\
\019\001\020\001\021\001\027\001\255\255\255\255\030\001\255\255\
\027\001\010\001\255\255\030\001\013\001\014\001\255\255\255\255\
\255\255\018\001\019\001\020\001\021\001\255\255\255\255\255\255\
\010\001\255\255\027\001\013\001\014\001\030\001\255\255\255\255\
\018\001\019\001\020\001\021\001\255\255\013\001\014\001\010\001\
\255\255\027\001\013\001\014\001\030\001\255\255\255\255\018\001\
\019\001\020\001\021\001\027\001\255\255\010\001\030\001\255\255\
\027\001\013\001\014\001\030\001\017\001\018\001\019\001\020\001\
\021\001\255\255\023\001\024\001\025\001\026\001\027\001\027\001\
\013\001\014\001\030\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\010\001\255\255\027\001\013\001\
\255\255\030\001\255\255\017\001\018\001\019\001\020\001\021\001\
\255\255\023\001\024\001\025\001\026\001\010\001\255\255\255\255\
\255\255\014\001\255\255\255\255\017\001\018\001\019\001\020\001\
\021\001\010\001\023\001\024\001\025\001\026\001\255\255\255\255\
\017\001\018\001\019\001\020\001\021\001\255\255\023\001\024\001\
\025\001\026\001"

let yynames_const = "\
  NOT\000\
  FUN\000\
  ARROW\000\
  EQUAL\000\
  SEMICOLON\000\
  IF\000\
  THEN\000\
  ELSE\000\
  LET\000\
  IN\000\
  NOT_EQUAL\000\
  GREATER_EQUAL\000\
  LESS_EQUAL\000\
  LESS\000\
  GREATER\000\
  NAMESPACE\000\
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
  BOOL\000\
  NUM\000\
  STR\000\
  ID\000\
  SPACE\000\
  FLOAT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 36 "parser.mly"
                ( _1 )
# 273 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 39 "parser.mly"
                         ( Int _1 )
# 280 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 40 "parser.mly"
                         ( Var _1 )
# 287 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 41 "parser.mly"
                         ( _2 )
# 294 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 42 "parser.mly"
                         ( Unit )
# 300 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 43 "parser.mly"
                         ( Bool _1 )
# 307 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 44 "parser.mly"
                         ( Float _1 )
# 314 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 45 "parser.mly"
                                 ( NameSpace (_1, _3) )
# 322 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 48 "parser.mly"
                   ( _1 )
# 329 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'fargs) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 49 "parser.mly"
                            ( fold_fun _2 _4 )
# 337 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 50 "parser.mly"
                ( Call (Var "!", [_2]) )
# 344 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 51 "parser.mly"
                      ( Call (Var ("+"), [_1; _3]) )
# 352 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 52 "parser.mly"
                       ( Call (Var ("-"), [_1; _3]) )
# 360 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 53 "parser.mly"
                       ( Call (Var ("*"), [_1; _3]) )
# 368 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 54 "parser.mly"
                     ( Call (Var ("/"), [_1; _3]) )
# 376 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 55 "parser.mly"
                       ( Call (Var ("="), [_1; _3]) )
# 384 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 56 "parser.mly"
                           ( Call (Var ("<>"), [_1; _3]) )
# 392 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 57 "parser.mly"
                      ( Call (Var ("<"), [_1; _3]) )
# 400 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 58 "parser.mly"
                         ( Call (Var (">"), [_1; _3]) )
# 408 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 59 "parser.mly"
                            ( Call (Var ("<="), [_1; _3]) )
# 416 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 60 "parser.mly"
                               ( Call (Var (">="), [_1; _3]) )
# 424 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 61 "parser.mly"
                                                 ( Call (Var ("if"), [_2; _4; _6]))
# 433 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 62 "parser.mly"
                               ( Call (Var ("-"), [Int (0); _2]) )
# 440 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 63 "parser.mly"
                                        ( Assign (_2, _4) )
# 448 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'fargs) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 64 "parser.mly"
                                              ( Assign (_2, fold_fun _3 _5))
# 457 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'simple_expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'cargs) in
    Obj.repr(
# 65 "parser.mly"
                                        ( Call (_1, _2) )
# 465 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 67 "parser.mly"
          ( failwith 
               (Printf.sprintf "parse error near characters %d-%d"
                    (Parsing.symbol_start ())
                    (Parsing.symbol_end ())) )
# 474 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fargs) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 73 "parser.mly"
                 ( _1@ [_2] )
# 482 "parser.ml"
               : 'fargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 74 "parser.mly"
                 ( [_1] )
# 489 "parser.ml"
               : 'fargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'cargs) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 77 "parser.mly"
                                         ( _1 @ [_2] )
# 497 "parser.ml"
               : 'cargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 78 "parser.mly"
                                         ( [_1] )
# 504 "parser.ml"
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
