function FF4Rom.Replace(find_word as String, replacement as String, text as String) as String

 dim result as String
 dim found as Boolean
 
 'for i as Integer = 1 to len(text) - len(find_word) + 1
  'if mid(text, i, len(find_word)) = find_word then
   'result += replacement
   'i += len(find_word) - 1
  'else
   'result += mid(text, i, 1)
  'end if
 'next
 'result += right(text, len(find_word) - 1)
 
 do while instr(text, find_word) > 0
  result += left(text, instr(text, find_word) - 1)
  result += replacement
  text = mid(text, instr(text, find_word) + len(find_word))
 loop
 result += text
 
 return result

end function
