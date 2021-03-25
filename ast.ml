type id = string
and expr =
  | Call of expr * expr list
  | Fun of id list * expr
  | Assign of id * expr
  | Unit
  | Var of id
  | TypeVarof of id * expr
  | TypeVar of id
  | Int of int
  | Bool of bool
  | String of string
  | Float of float
  | List of expr list
  | Tuple of expr list
  | NameSpace of id
  | Block of expr list
  | Types of id * type_ list
  | StructType of id  * (id * id) list
  | StructValue of (id * expr) list
and type_ =
  | Type of id
  | Typeof of id * id

let type_to_json type_ =
  match type_ with
    | Type x -> Printf.sprintf "{\"name\": \"%s\", \"value\": null}" x
    | Typeof (x, y) -> Printf.sprintf "{\"name\": \"%s\", \"value\": \"%s\"}" x y

let struct_to_json value =
  let (n, v) = value in
  Printf.sprintf "{\"name\": \"%s\", \"type\": \"%s\"}" n v

let to_json exprs =
  let rec loop exp' =
    match exp' with
      | Call (a, b) -> Printf.sprintf "{\"type\":\"call\",\"func\": %s,\"args\":[%s]}" (loop a) (String.concat ", " (List.map loop b))
      | Fun (b, c) -> Printf.sprintf "{\"type\":\"fun\",\"content\":%s,\"args\":[%s], \"env\": {}}" (loop c) (String.concat "," (List.map (fun a -> "\"" ^ a ^ "\"") b))
      | Assign (name, value) -> Printf.sprintf "{\"type\":\"assign\",\"name\":\"%s\",\"value\":%s}" name @@ loop value
      | Unit -> "{\"type\":\"value\",\"value\":\"()\",\"t\":\"Unit\"}"
      | Var x -> Printf.sprintf "{\"type\":\"var\",\"name\":\"%s\", \"t\":\"'a\"}" x
      | TypeVarof (x, y) -> Printf.sprintf "{\"type\":\"value\",\"value\":%s,\"t\": \"%s\"}" (loop y) x
      | TypeVar x -> Printf.sprintf "{\"type\":\"value\",\"value\":null,\"t\": \"%s\"}"  x
      | Int x -> Printf.sprintf "{\"type\":\"value\",\"value\": %d,\"t\":\"Integer\"}" x
      | Bool x -> Printf.sprintf "{\"type\":\"value\",\"value\":%b,\"t\":\"Bool\"}" x
      | Float x -> Printf.sprintf "{\"type\":\"value\",\"value\":%f,\"t\":\"Float\"}" x 
      | String x -> Printf.sprintf "{\"type\":\"value\",\"value\":%s,\"t\":\"String\"}" x
      | Tuple l -> Printf.sprintf "{\"type\":\"value\",\"value\":[%s],\"t\":\"Tuple\"}" (String.concat ", " @@ List.map loop l)
      | List l -> Printf.sprintf "{\"type\":\"value\",\"value\":[%s],\"t\": \"List\"}" (String.concat ", " @@ List.map loop l)
      | Block l -> Printf.sprintf "{\"type\":\"block\",\"contents\":[%s]}" (String.concat ", " @@ List.map loop l)
      | NameSpace a -> Printf.sprintf "{\"type\":\"name_space_var\",\"name\":\"%s\",\"t\":\"'a\"}" a
      | Types (name, values) -> Printf.sprintf "{\"type\":\"typedef\",\"name\":\"%s\",\"values\":[%s]}" name (String.concat ", " (List.map type_to_json values))
      | StructType (name, values) -> Printf.sprintf "{\"type\":\"structdef\",\"name\":\"%s\",\"values\":[%s]}" name (String.concat ", " (List.map struct_to_json values))
      | StructValue values -> Printf.sprintf "{\"type\":\"value\",\"value\":{%s},\"t\":\"Struct\"}" (String.concat ", " (List.map struct_value_to_json values))
  and struct_value_to_json value =
    let (n, v) = value in
    Printf.sprintf "\"%s\": %s" n (loop v)

  in Printf.printf "[%s]\n" (String.concat ", " (List.map loop exprs))

