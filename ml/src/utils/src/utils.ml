  let () =
    Js.Unsafe.global##escapeTextForBrowser <-
      Js.wrap_callback EscapeTextForBrowser.escapeTextForBrowser
