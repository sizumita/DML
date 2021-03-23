type id = string
type var = Var of id
and expr =
  | Call of id * expr list
  | Fun of id list * expr
  | Assign of id * expr
  | Unit
  | VarExp of var
  | IntExp of int

let print_expr exp =
  let rec loop exp' =
    match exp' with
      | Call (a, b) -> "Call(" ^ a ^ ", [" ^ (String.concat ", " (List.map loop b)) ^ "])"
      | Fun (b, c) -> "Fun(" ^ (String.concat ", " b) ^ ", " ^ (loop c) ^ ")"
      | Assign (a, b) -> "Assign(" ^ a ^ ", " ^ (loop b)
      | Unit -> "()"
      | VarExp (Var x) -> "Var:" ^ x
      | IntExp x -> "Int:" ^ (string_of_int x)
  in print_endline @@ loop exp
