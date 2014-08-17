  let () =
    Js.Unsafe.global##escapeTextForBrowser <-
      Js.wrap_callback EscapeTextForBrowser.escapeTextForBrowser;
    Js.Unsafe.global##joinClasses <-
      Js.wrap_callback JoinClasses.joinClasses;
    Js.Unsafe.global##camelize <-
      Js.wrap_callback Camelize.camelize;
    ()
