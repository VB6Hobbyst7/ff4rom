function FF4Rom.Replace(find_word as String, replacement as String, text as String) as String

 dim result as String
 
 for i as Integer = 1 to len(text) - len(find_word) + 1
  if mid(text, i, len(find_word)) = find_word then
   result += replacement
   i += len(find_word) - 1
  else
   result += mid(text, i, 1)
  end if
 next
 result += right(text, len(find_word) - 1)
 
 return result

end function
