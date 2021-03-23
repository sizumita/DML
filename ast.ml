type id = string
and expr =
  | Call of expr * expr list
  | Fun of id  * expr
  | Assign of id * expr
  | Unit
  | Var of id
  | Int of int
  | Bool of bool
  | Float of float
  | NameSpace of id * id

let print_expr exp =
  let rec loop exp' =
    match exp' with
      | Call (a, b) -> "Call(" ^ (loop a) ^ ", [" ^ (String.concat ", " (List.map loop b)) ^ "])"
      | Fun (b, c) -> "Fun([" ^ b ^ "], " ^ (loop c) ^ ")"
      | Assign (a, b) -> "Assign(" ^ a ^ ", " ^ (loop b)
      | Unit -> "()"
      | Var x -> "Var:" ^ x
      | Int x -> "Int:" ^ (string_of_int x)
      | Bool x -> if x then "Bool:True" else "Bool:False"
      | Float x -> "Float: " ^ (string_of_float x)
      | NameSpace (a, b) -> a ^ "::" ^ b
  in print_endline @@ loop exp
