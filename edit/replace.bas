'This replaces all instances of the given substring in the given text with the
' given replacement substring, then returns the resulting new string.

function FF4Rom.Replace(find_word as String, replacement as String, text as String) as String

 dim result as String
 dim found as Boolean
 
 do while instr(text, find_word) > 0
  result += left(text, instr(text, find_word) - 1)
  result += replacement
  text = mid(text, instr(text, find_word) + len(find_word))
 loop
 result += text
 
 return result

end function
