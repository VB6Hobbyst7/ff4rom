function FF4Rom.ConvertText(asciitext as String) as String
 dim result as String
 dim symbol as String
 for i as Integer = 1 to len(asciitext)
  symbol = mid(asciitext, i, 1)
  select case symbol
  case "0" to "9"
   result += chr(asc(symbol) + &h50)
  case "A" to "Z"
   result += chr(asc(symbol) + 1)
  case "a" to "z"
   result += chr(asc(symbol) - 5)
  case " "
   result += chr(Symbols.spacebar)
  case "#"
   result += chr(Symbols.blank)
  case "'"
   result += chr(Symbols.apostrophe)
  case "."
   result += chr(Symbols.period)
  case "-"
   result += chr(Symbols.hyphen)
  case "_"
   result += chr(Symbols.elipsis)
  case "!"
   result += chr(Symbols.exclamation)
  case "?"
   result += chr(Symbols.question)
  case "%"
   result += chr(Symbols.percent)
  case "/"
   result += chr(Symbols.slash)
  case ":"
   result += chr(Symbols.colon)
  case ","
   result += chr(Symbols.comma)
  case else
   result += symbol
  end select
 next
 return result
end function
