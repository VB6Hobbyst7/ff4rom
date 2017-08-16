function FF4Rom.MessagesContaining(substring as String) as List

 dim result as List
 dim text as String
 
 for i as Integer = 0 to total_bank1_messages
  text = bank1_messages(i).text
  for j as Integer = 1 to len(text) - len(substring) + 1
   if mid(text, j, len(substring)) = substring then
    result.AddItem(str(i))
    exit for
   end if
  next
 next
 
 for i as Integer = 0 to total_bank3_messages
  text = bank3_messages(i).text
  for j as Integer = 1 to len(text) - len(substring) + 1
   if mid(text, j, len(substring)) = substring then
    result.AddItem(str(i + 1000))
    exit for
   end if
  next
 next
 
 return result

end function
