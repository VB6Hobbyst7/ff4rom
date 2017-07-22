function FF4Rom.MessageOutputLength(substring as String) as Integer

 dim result as Integer
 dim symbol as UByte
 dim index as Integer = 1

 do until index > len(substring)
  symbol = asc(mid(substring, index, 1))
  result += MessageCodeLength(symbol)
  index += 1
  if MessageCodeTakesParameter(symbol) then index += 1
 loop

 return result

end function
