'This returns the DTE encoding of the given string. It is possible that the
' encoded string may be different from what was originally in the rom, even if
' the decoded text is identical.

function FF4Rom.CompressDTE(text as String) as String

 dim result as String
 dim found as Boolean
 
 for i as Integer = 1 to len(text) - 1
  found = false
  for j as Integer = dte_range1.start to dte_range2.finish
   if dte(j) = mid(text, i, 2) then
    found = true
    result += chr(j)
    i += 1
    exit for
   end if
  next
  if not found then result += mid(text, i, 1)
 next
 if not found then result += right(text, 1)
 
 return result

end function
