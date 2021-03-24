let () =
  let cin =
    if Array.length Sys.argv > 1
    then open_in Sys.argv.(1)
    else stdin in
    let lexbuf =  Lexing.from_channel cin in
      let result = Parser.prog Lexer.token lexbuf in
      Ast.print_expr result

