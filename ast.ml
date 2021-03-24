type id = string
and expr =
  | Call of expr * expr list
  | Fun of id * expr
  | Assign of id * expr
  | Unit
  | Var of id
  | TypeVar of id * expr
  | Int of int
  | Bool of bool
  | String of string
  | Float of float
  | List of expr list
  | Tuple of expr list
  | NameSpace of id
  | Block of expr list
  | Types of id * type_ list
and type_ =
  | Type of id
  | Typeof of id * id

let print_expr exprs =
  let rec loop exp' =
    match exp' with
      | Call (a, b) -> "Call(" ^ (loop a) ^ ", [" ^ (String.concat ", " (List.map loop b)) ^ "])"
      | Fun (b, c) -> "Fun([" ^ b ^ "], " ^ (loop c) ^ ")"
      | Assign (a, b) -> "Assign(" ^ a ^ ", " ^ (loop b) ^ ")"
      | Unit -> "()"
      | Var x -> "Var:" ^ x
      | TypeVar (x, y) -> "TypeVar:" ^ x ^ "::" ^ (loop y)
      | Int x -> "Int:" ^ (string_of_int x)
      | Bool x -> if x then "Bool:True" else "Bool:False"
      | Float x -> "Float: " ^ (string_of_float x)
      | List l -> "[" ^ (List.map (fun x -> loop x) l |> String.concat ", ") ^ "]"
      | Tuple l -> "(" ^ (List.map (fun x -> loop x) l |> String.concat " * ") ^ ")"
      | Block l -> "Block{" ^ (List.map (fun x -> loop x) l |> String.concat "; ") ^ "}"
      | NameSpace a -> a
      | String s -> "\"" ^ s ^ "\""
      | Types _ -> "Typedef"
  in List.iter (fun expr -> print_endline @@ loop expr) exprs

let type_to_json type_ =
  match type_ with
    | Type x -> Printf.sprintf "{\"name\": \"%s\", \"value\": null}" x
    | Typeof (x, y) -> Printf.sprintf "{\"name\": \"%s\", \"value\": \"%s\"}" x y

let to_json exprs =
  let rec loop exp' =
    match exp' with
      | Call (a, b) -> Printf.sprintf "{\"type\":\"call\",\"func\": %s,\"args\":[%s]}" (loop a) (String.concat ", " (List.map loop b))
      | Fun (b, c) -> Printf.sprintf "{\"type\":\"fun\",\"content\":%s,\"arg\":\"%s\"}" (loop c) b
      | Assign (name, value) -> Printf.sprintf "{\"type\":\"assign\",\"name\":\"%s\",\"value\":%s}" name @@ loop value
      | Unit -> "{\"type\":\"value\",\"value\":\"()\",\"t\":\"Unit\"}"
      | Var x -> Printf.sprintf "{\"type\":\"var\",\"name\":\"%s\", \"t\":\"'a\"}" x
      | TypeVar (x, y) -> Printf.sprintf "{\"type\":\"value\",\"value\":%s,\"t\": \"%s\"}" (loop y) x
      | Int x -> Printf.sprintf "{\"type\":\"value\",\"value\": %d,\"t\":\"Integer\"}" x
      | Bool x -> Printf.sprintf "{\"type\":\"value\",\"value\":%b,\"t\":\"Bool\"}" x
      | Float x -> Printf.sprintf "{\"type\":\"value\",\"value\":%f,\"t\":\"Float\"}" x
      | String x -> Printf.sprintf "{\"type\":\"value\",\"value\":%s,\"t\":\"String\"}" x
      | Tuple l -> Printf.sprintf "{\"type\":\"value\",\"value\":[%s],\"t\":\"Tuple\"}" (String.concat ", " @@ List.map loop l)
      | List l -> Printf.sprintf "{\"type\":\"value\",\"value\":[%s],\"t\": \"List\"}" (String.concat ", " @@ List.map loop l)
      | Block l -> Printf.sprintf "{\"type\":\"block\",\"contents\":[%s]}" (String.concat ", " @@ List.map loop l)
      | NameSpace a -> Printf.sprintf "{\"type\":\"name_space_var\",\"name\":\"%s\",\"t\":\"'a\"}" a
      | Types (name, values) -> Printf.sprintf "{\"type\":\"typedef\",\"name\":\"%s\",\"values\":[%s]}" name (String.concat ", " (List.map type_to_json values))

  in Printf.printf "[%s]\n" (String.concat ", " (List.map loop exprs))

