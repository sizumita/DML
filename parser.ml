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
  | NOT_EQUAL
  | GREATER_EQUAL
  | LESS_EQUAL
  | LESS
  | GREATER
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

# 39 "parser.ml"
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
  269 (* NOT_EQUAL *);
  270 (* GREATER_EQUAL *);
  271 (* LESS_EQUAL *);
  272 (* LESS *);
  273 (* GREATER *);
  274 (* PLUS *);
  275 (* MINUS *);
  276 (* TIMES *);
  277 (* DIV *);
  278 (* RP *);
  279 (* LP *);
  280 (* COMMA *);
  281 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* STR *);
  259 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\003\000\003\000\003\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\004\000\
\004\000\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\003\000\002\000\001\000\004\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\006\000\002\000\004\000\005\000\002\000\001\000\002\000\
\001\000\002\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\023\000\002\000\003\000\000\000\000\000\000\000\
\000\000\000\000\028\000\000\000\000\000\025\000\000\000\000\000\
\000\000\000\000\005\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\001\000\027\000\
\000\000\024\000\000\000\000\000\000\000\000\000\004\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\026\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yydgoto = "\002\000\
\011\000\012\000\013\000\015\000\033\000"

let yysindex = "\012\000\
\055\255\000\000\000\000\000\000\000\000\030\255\055\255\038\255\
\055\255\031\255\000\000\151\255\003\255\000\000\068\255\027\000\
\004\255\025\255\000\000\009\000\055\255\055\255\055\255\055\255\
\055\255\055\255\055\255\055\255\055\255\055\255\000\000\000\000\
\003\255\000\000\055\255\055\255\055\255\037\255\000\000\049\255\
\059\000\049\255\049\255\049\255\049\255\244\254\244\254\025\255\
\025\255\000\000\059\000\043\000\059\000\055\255\055\255\059\000\
\059\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\066\255\000\000\000\000\000\000\
\000\000\100\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\083\255\000\000\000\000\000\000\000\000\000\000\000\000\196\255\
\002\255\210\255\224\255\238\255\252\255\168\255\182\255\117\255\
\134\255\000\000\027\255\000\000\035\255\000\000\000\000\136\255\
\010\000"

let yygindex = "\000\000\
\000\000\249\255\248\255\029\000\000\000"

let yytablesize = 336
let yytable = "\016\000\
\022\000\018\000\020\000\004\000\032\000\005\000\014\000\029\000\
\030\000\037\000\013\000\013\000\001\000\040\000\041\000\042\000\
\043\000\044\000\045\000\046\000\047\000\048\000\049\000\013\000\
\050\000\010\000\013\000\051\000\052\000\053\000\003\000\004\000\
\014\000\005\000\006\000\007\000\007\000\022\000\007\000\034\000\
\017\000\008\000\054\000\020\000\020\000\038\000\056\000\057\000\
\007\000\009\000\000\000\007\000\019\000\010\000\003\000\004\000\
\020\000\005\000\006\000\020\000\000\000\022\000\007\000\000\000\
\000\000\008\000\027\000\028\000\029\000\030\000\034\000\006\000\
\035\000\009\000\006\000\006\000\000\000\010\000\006\000\006\000\
\006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
\022\000\000\000\006\000\022\000\022\000\000\000\000\000\022\000\
\022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
\022\000\019\000\000\000\022\000\019\000\019\000\000\000\000\000\
\000\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
\019\000\019\000\010\000\000\000\019\000\010\000\010\000\000\000\
\000\000\000\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\011\000\000\000\010\000\011\000\011\000\
\021\000\021\000\000\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\021\000\021\000\011\000\000\000\
\021\000\000\000\000\000\022\000\023\000\024\000\025\000\026\000\
\027\000\028\000\029\000\030\000\000\000\008\000\000\000\031\000\
\008\000\008\000\000\000\000\000\000\000\008\000\008\000\008\000\
\008\000\008\000\008\000\009\000\000\000\008\000\009\000\009\000\
\008\000\000\000\000\000\009\000\009\000\009\000\009\000\009\000\
\009\000\012\000\000\000\009\000\012\000\012\000\009\000\000\000\
\000\000\012\000\012\000\012\000\012\000\000\000\000\000\017\000\
\000\000\012\000\017\000\017\000\012\000\000\000\000\000\017\000\
\017\000\017\000\017\000\000\000\000\000\016\000\000\000\017\000\
\016\000\016\000\017\000\000\000\000\000\016\000\016\000\016\000\
\016\000\000\000\000\000\014\000\000\000\016\000\014\000\014\000\
\016\000\000\000\000\000\014\000\014\000\014\000\014\000\000\000\
\000\000\015\000\000\000\014\000\015\000\015\000\014\000\000\000\
\000\000\015\000\015\000\015\000\015\000\000\000\021\000\000\000\
\000\000\015\000\018\000\018\000\015\000\022\000\023\000\024\000\
\025\000\026\000\027\000\028\000\029\000\030\000\039\000\018\000\
\021\000\000\000\018\000\036\000\000\000\000\000\000\000\022\000\
\023\000\024\000\025\000\026\000\027\000\028\000\029\000\030\000\
\021\000\000\000\000\000\000\000\055\000\000\000\000\000\022\000\
\023\000\024\000\025\000\026\000\027\000\028\000\029\000\030\000\
\021\000\000\000\000\000\000\000\000\000\000\000\000\000\022\000\
\023\000\024\000\025\000\026\000\027\000\028\000\029\000\030\000"

let yycheck = "\007\000\
\013\001\009\000\010\000\001\001\013\000\003\001\003\001\020\001\
\021\001\006\001\009\001\010\001\001\000\021\000\022\000\023\000\
\024\000\025\000\026\000\027\000\028\000\029\000\030\000\022\001\
\033\000\023\001\025\001\035\000\036\000\037\000\000\001\001\001\
\003\001\003\001\004\001\009\001\010\001\013\001\008\001\003\001\
\003\001\011\001\006\001\009\001\010\001\017\000\054\000\055\000\
\022\001\019\001\255\255\025\001\022\001\023\001\000\001\001\001\
\022\001\003\001\004\001\025\001\255\255\013\001\008\001\255\255\
\255\255\011\001\018\001\019\001\020\001\021\001\003\001\006\001\
\005\001\019\001\009\001\010\001\255\255\023\001\013\001\014\001\
\015\001\016\001\017\001\018\001\019\001\020\001\021\001\022\001\
\006\001\255\255\025\001\009\001\010\001\255\255\255\255\013\001\
\014\001\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\006\001\255\255\025\001\009\001\010\001\255\255\255\255\
\255\255\014\001\015\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\006\001\255\255\025\001\009\001\010\001\255\255\
\255\255\255\255\014\001\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\006\001\255\255\025\001\009\001\010\001\
\009\001\010\001\255\255\014\001\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\006\001\022\001\025\001\255\255\
\025\001\255\255\255\255\013\001\014\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\255\255\006\001\255\255\025\001\
\009\001\010\001\255\255\255\255\255\255\014\001\015\001\016\001\
\017\001\018\001\019\001\006\001\255\255\022\001\009\001\010\001\
\025\001\255\255\255\255\014\001\015\001\016\001\017\001\018\001\
\019\001\006\001\255\255\022\001\009\001\010\001\025\001\255\255\
\255\255\014\001\015\001\016\001\017\001\255\255\255\255\006\001\
\255\255\022\001\009\001\010\001\025\001\255\255\255\255\014\001\
\015\001\016\001\017\001\255\255\255\255\006\001\255\255\022\001\
\009\001\010\001\025\001\255\255\255\255\014\001\015\001\016\001\
\017\001\255\255\255\255\006\001\255\255\022\001\009\001\010\001\
\025\001\255\255\255\255\014\001\015\001\016\001\017\001\255\255\
\255\255\006\001\255\255\022\001\009\001\010\001\025\001\255\255\
\255\255\014\001\015\001\016\001\017\001\255\255\006\001\255\255\
\255\255\022\001\009\001\010\001\025\001\013\001\014\001\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\022\001\
\006\001\255\255\025\001\009\001\255\255\255\255\255\255\013\001\
\014\001\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\006\001\255\255\255\255\255\255\010\001\255\255\255\255\013\001\
\014\001\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\006\001\255\255\255\255\255\255\255\255\255\255\255\255\013\001\
\014\001\015\001\016\001\017\001\018\001\019\001\020\001\021\001"

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
  NOT_EQUAL\000\
  GREATER_EQUAL\000\
  LESS_EQUAL\000\
  LESS\000\
  GREATER\000\
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
# 31 "parser.mly"
                ( _1 )
# 246 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 34 "parser.mly"
                  ( Int _1 )
# 253 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 35 "parser.mly"
                 ( Var _1 )
# 260 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 36 "parser.mly"
                         ( _2 )
# 267 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 37 "parser.mly"
                    ( Unit )
# 273 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 40 "parser.mly"
                   ( _1 )
# 280 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'fargs) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 41 "parser.mly"
                            ( fold_fun _2 _4 )
# 288 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 42 "parser.mly"
                      ( Call (Var ("+"), [_1; _3]) )
# 296 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 43 "parser.mly"
                       ( Call (Var ("-"), [_1; _3]) )
# 304 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 44 "parser.mly"
                       ( Call (Var ("*"), [_1; _3]) )
# 312 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 45 "parser.mly"
                     ( Call (Var ("/"), [_1; _3]) )
# 320 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 46 "parser.mly"
                       ( Call (Var ("="), [_1; _3]) )
# 328 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 47 "parser.mly"
                           ( Call (Var ("<>"), [_1; _3]) )
# 336 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 48 "parser.mly"
                      ( Call (Var ("<"), [_1; _3]) )
# 344 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 49 "parser.mly"
                         ( Call (Var (">"), [_1; _3]) )
# 352 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 50 "parser.mly"
                            ( Call (Var ("<="), [_1; _3]) )
# 360 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 51 "parser.mly"
                               ( Call (Var (">="), [_1; _3]) )
# 368 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 52 "parser.mly"
                                                 ( Call (Var ("if"), [_2; _4; _6]))
# 377 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 53 "parser.mly"
                               ( Call (Var ("-"), [Int (0); _2]) )
# 384 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 54 "parser.mly"
                                        ( Assign (_2, _4) )
# 392 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'fargs) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 55 "parser.mly"
                                              ( Assign (_2, fold_fun _3 _5))
# 401 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'simple_expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'cargs) in
    Obj.repr(
# 56 "parser.mly"
                                        ( Call (_1, _2) )
# 409 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "parser.mly"
     ( failwith 
          (Printf.sprintf "parse error near characters %d-%d"
               (Parsing.symbol_start ())
               (Parsing.symbol_end ())) )
# 418 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fargs) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 64 "parser.mly"
                 ( _1@ [_2] )
# 426 "parser.ml"
               : 'fargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 65 "parser.mly"
           ( [_1] )
# 433 "parser.ml"
               : 'fargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'cargs) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 68 "parser.mly"
                                         ( _1 @ [_2] )
# 441 "parser.ml"
               : 'cargs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 69 "parser.mly"
                                  ( [_1] )
# 448 "parser.ml"
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
