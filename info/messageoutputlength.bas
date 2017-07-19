function FF4Rom.MessageOutputLength(substring as String) as Integer

 dim result as Integer
 dim symbol as UByte
 dim index as Integer = 1

 do
  symbol = mid(substring, index, 1)
  result += MessageCodeLength(symbol)
  index += 1
  if MessageCodeTakesParameter(symbol) then index += 1
 next

 return result

end function