(* 

(fun x y -> x (fun z -> y z)) f g a

 *)

let trim str =
  if str = "" then "" else
  let search_pos init p next =
    let rec search i =
      if p i then raise(Failure "empty") else
      match str.[i] with
      | ' ' | '\n' | '\r' | '\t' -> search (next i)
      | _ -> i
    in
    search init
  in
  let len = String.length str in
  try
    let left = search_pos 0 (fun i -> i >= len) (succ)
    and right = search_pos (len - 1) (fun i -> i < 0) (pred)
    in
    String.sub str left (right - left + 1)
  with
  | Failure "empty" -> ""


type token =
    Lb
  | Rb
  | Const of string
  | Fun
  | Equal

type expr =
    Var of string
  | Assign of string list * expr
  | Call of expr * expr

let expect_right_arrow t =
  let l = String.length t in
  let rec loop i =
    if t.[i] = '-' && t.[i+1] = '>' then (String.sub t 0 i, String.sub t (i+2) (l-i-2)) else loop @@ i+1
  in loop 0

let l = String.length

let parse text =
  let text_length = String.length text in
  let take_1 t = if l t >= 1 then (String.sub t 0 1, String.sub t 1 (l t - 1)) else  ("", t) in
  let take_2 t = if l t >= 2 then (String.sub t 0 2, String.sub t 2 (l t -2)) else ("", t) in
  let take_3 t = if l t >= 3 then (String.sub t 0 3, String.sub t 3 (l t -3)) else ("", t) in
  let take_4 t = if l t >= 4 then (String.sub t 0 4, String.sub t 4 (l t -4)) else ("", t) in
  let rec take_expr t =
    match take_4 t with
      | ("fun ", rest) -> take_fun rest
      | _ ->
    match take_3 t with
      | _ ->
    match take_2 t with
      | _ ->
    match take_1 t with
      | (" ", rest) -> take_expr rest
      | (a, rest) -> Var a
  and take_fun t =
    let (arg_list, exp) = take_fun_args t in
    Assign (arg_list, take_expr exp)
  and take_fun_args t =
    let (args, rest) = expect_right_arrow t in
    let arg_list = args |> String.split_on_char ' ' |> List.filter (fun a -> a <> "") in
    (arg_list, rest)

  in take_expr text

let e t = parse "fun a -> b"
