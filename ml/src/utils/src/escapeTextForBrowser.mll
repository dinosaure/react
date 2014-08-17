{
  exception End_of_string
}

rule escaper = parse
  | eof             { raise End_of_string }
  | "&"             { fun buffer -> Buffer.add_string buffer "&amp;" }
  | ">"             { fun buffer -> Buffer.add_string buffer "&gt;" }
  | "<"             { fun buffer -> Buffer.add_string buffer "&lt;" }
  | "\""            { fun buffer -> Buffer.add_string buffer "&quot;" }
  | "'"             { fun buffer -> Buffer.add_string buffer "&#x27;" }
  | _ as c          { fun buffer -> Buffer.add_char buffer c }

{
  let escapeTextForBrowser str =
    let lexbuf = Lexing.from_string (Js.to_string str) in
    let buffer = Buffer.create 16 in
    let rec aux () =
      try let apply = escaper lexbuf in
          apply buffer; aux ()
      with End_of_string -> Buffer.contents buffer |> Js.string
    in aux ()
}
