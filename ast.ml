type id = string
and expr =
  | Call of expr * expr list
  | Fun of id * expr
  | Assign of id * expr
  | Unit
  | Var of id
  | Int of int
  | Bool of bool
  | Float of float
  | List of expr list
  | NameSpace of id * id
  | LetIn of id * expr * expr
  | Block of expr list

let print_expr exprs =
  let rec loop exp' =
    match exp' with
      | Call (a, b) -> "Call(" ^ (loop a) ^ ", [" ^ (String.concat ", " (List.map loop b)) ^ "])"
      | Fun (b, c) -> "Fun([" ^ b ^ "], " ^ (loop c) ^ ")"
      | Assign (a, b) -> "Assign(" ^ a ^ ", " ^ (loop b) ^ ")"
      | Unit -> "()"
      | Var x -> "Var:" ^ x
      | Int x -> "Int:" ^ (string_of_int x)
      | Bool x -> if x then "Bool:True" else "Bool:False"
      | Float x -> "Float: " ^ (string_of_float x)
      | List l -> "[" ^ (List.map (fun x -> loop x) l |> String.concat ", ") ^ "]"
      | Block l -> "Block{" ^ (List.map (fun x -> loop x) l |> String.concat "; ") ^ "}"
      | NameSpace (a, b) -> a ^ "::" ^ b
      | LetIn (b, c, d) -> "LetIn([" ^ b ^ "], " ^ (loop c) ^ ", " ^ (loop d) ^ ")"
  in List.iter (fun expr -> print_endline @@ loop expr) exprs
