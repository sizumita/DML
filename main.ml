let () =
  Printexc.print (fun () ->
      try
        let lexbuf = Lexing.from_string "let p a b = if a then b else 1\n" in
        while true do
          let result = Parser.prog Lexer.token lexbuf in
          Ast.print_expr result
        done
      with
        Lexer.Eof -> exit 0
    ) ()
