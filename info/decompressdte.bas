function FF4Rom.DecompressDTE(text as String) as String

 dim result as String
 dim index as Integer
 dim symbol as UByte
 
 index = 1
 do until index > len(text)
  symbol = asc(mid(text, index, 1))
  index += 1
  if MessageCodeTakesParameter(symbol) then
   result += chr(symbol) + mid(text, index, 1)
   index += 1
  else
   if dte_range1.InRange(symbol) or dte_range2.InRange(symbol) then
    result += dte(symbol)
   else
    result += chr(symbol)
   end if
  end if
 loop
 
 return result

end function
