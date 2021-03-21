type token = 
  | Let
  | Equal
  | Integer of int
  | Semi
  | Expr of string
  | Lb (* [ *)
  | Rb (* ] *)

let expect_let pointer base =
  if ((String.length base) - pointer) < 4 then false else (String.sub base pointer 4) = "let "

let expect_expr pointer base =
  if String.contains_from base pointer ' '
    then let when_space = String.index_from base pointer ' '
      in String.sub base pointer (when_space - pointer)
    else String.sub base pointer @@ (String.length base) - pointer


let print_tokens lst =
  List.map (fun t ->
    match t with
      | Let -> "Let"
      | Equal -> "Equal"
      | Integer i -> "Int:" ^ (string_of_int i)
      | Semi -> "Semi"
      | Expr s -> "Expr:" ^ s
      | Lb -> "Lb"
      | Rb -> "Rb"
    ) lst
  |> String.concat " "
  |> print_endline



let rec tokenize pointer base result =
  if pointer >= (String.length base) then List.rev result else
  match String.get base pointer with
    | ' ' -> tokenize (pointer+1) base result
    | '\n' -> tokenize (pointer+1) base result
    | '\t' -> tokenize (pointer+1) base result
    | '=' -> tokenize (pointer+1) base @@ Equal :: result
    | ';' -> tokenize (pointer+1) base @@ Equal :: result
    | '[' -> tokenize (pointer+1) base @@ Lb :: result
    | ']' -> tokenize (pointer+1) base @@ Rb :: result
    | _ ->
      if expect_let pointer base
        then tokenize (pointer+4) base @@ Let :: result
        else 
          let expr = expect_expr pointer base
            in tokenize (pointer + String.length expr) base @@ (Expr expr) :: result


let text = read_line ()
let () = print_tokens @@ tokenize 0 text []
