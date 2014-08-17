let joinClasses lst =
  List.map Js.to_string lst
  |> String.concat " "
  |> Js.string
