type token =
  | Cons of int
  | Plus
  | Minus
  | Div
  | Mul
  | Lb
  | Rb
  | Bracket of token list
  | Err

type expr =
  | Func of string * expr list * expr
  | Call of string * expr list
  | Const of int
  | EOF
  | Unit
  | Test of token


let numbers = [
  '0';
  '1';
  '2';
  '3';
  '4';
  '5';
  '6';
  '7';
  '8';
  '9';
]

let print_tokens lst =
  List.map (fun t ->
    match t with
      | Cons i -> "Const:" ^ (string_of_int i)
      | Plus -> "+"
      | Minus -> "-"
      | Div -> "/"
      | Mul -> "*"
      | Lb -> "("
      | Rb -> ")"
      | _ -> "..."
    ) lst
  |> String.concat " "
  |> print_endline

let expect_int p base =
  let buff = Buffer.create 16 in
  let len = String.length base in
  let rec loop pointer =
    if pointer >= len then pointer else
    let c = String.get base pointer in
    if List.mem c numbers
      then 
        begin
          Buffer.add_char buff c;
          loop @@ pointer + 1
        end
      else pointer       
  in 
    let pointer = loop p in (pointer, int_of_string @@ Buffer.contents buff)



let tokenize base =
  let rec loop pointer result =
    if pointer >= (String.length base) then List.rev result else
    match String.get base pointer with
      | ' ' -> loop (pointer+1) result
      | '\n' -> loop (pointer+1) result
      | '\t' -> loop (pointer+1) result
      | '+' -> loop (pointer+1) @@ Plus :: result
      | '-' -> loop (pointer+1) @@ Minus :: result
      | '/' -> loop (pointer+1) @@ Div :: result
      | '*' -> loop (pointer+1) @@ Mul :: result
      | '(' -> loop (pointer+1) @@ Lb :: result
      | ')' -> loop (pointer+1) @@ Rb :: result
      | _ ->
    let (pointer, i) = expect_int pointer base
    in loop pointer @@ (Cons i) :: result
  in loop 0 []


let expect_any tokens target =
  let rec loop lst result =
    match lst with
    | [] -> ([], tokens)
    | first :: rest ->
      if first = target
        then (List.rev result, rest)
        else loop rest @@ first :: result
  in loop tokens []

let parse tokens =
  let rec loop lst result =
    match lst with
      | (Cons x) :: [] -> Const x
      | (Cons x) :: [Rb] -> Const x
      | (Bracket l) :: [] -> loop l []
      | Lb :: rest ->
        (match bracket rest true with
          | Bracket [] -> Unit
          | Bracket l -> loop l []
          | _ -> EOF)
      | _ ->
        if List.mem Lb lst 
          then match bracket lst false with
            | Bracket [] -> Unit
            | Bracket l -> loop l []
            | _ -> split_symbols lst
          else split_symbols lst

  and split_symbols lst =
    if List.mem Plus lst then
        let (r, l) = expect_any lst Plus in Call ("+", [loop r []; loop l []])
      else if List.mem Minus lst then
        let (r, l) = expect_any lst Minus in Call ("-", [loop r []; loop l []])
      else if List.mem Div lst then
        let (r, l) = expect_any lst Div in Call ("/", [loop r []; loop l []])
      else if List.mem Mul lst then
        let (r, l) = expect_any lst Mul in Call ("*", [loop r []; loop l []])
      else EOF

  and bracket tokens_ is_expcted =
    let rec loop_ lst result =
      match lst with
      | [] -> if is_expcted then (Err, []) else (Bracket (List.rev result), [])
      | first :: rest ->
        if first = Lb
          then
            let (bracket, rest) = loop_ rest [] 
            in loop_ rest @@ bracket :: result
        else if first = Rb
          then (Bracket (List.rev result), rest)
          else loop_ rest @@ first :: result
    in let (bracket, _) = loop_ tokens_ [] in bracket
  in loop tokens []



let text = read_line ()
let tokens = tokenize text
let () = print_tokens tokens
let exprs = parse tokens
let e t = tokenize t |> parse
