let () =
  Printexc.print (fun () ->
      try
        let lexbuf = Lexing.from_string "fun a d -> fun b d -> fun c d -> a\n" in
        while true do
          let result = Parser.prog Lexer.token lexbuf in
          Ast.print_expr result
        done
      with
        Lexer.Eof -> exit 0
    ) ()
