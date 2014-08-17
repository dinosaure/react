{
  exception End_of_string
}

rule compute = parse
  | eof             { raise End_of_string }
  | '-' (_ as c)    { fun buffer -> Buffer.add_char buffer (Char.uppercase c) }
  | _ as c          { fun buffer -> Buffer.add_char buffer c }

{
  let camelize str =
    let lexbuf = Lexing.from_string (Js.to_string str) in
    let buffer = Buffer.create 16 in
    let rec aux () =
      try let apply = compute lexbuf in
          apply buffer; aux ()
      with End_of_string -> Buffer.contents buffer |> Js.string
    in aux ()
}
