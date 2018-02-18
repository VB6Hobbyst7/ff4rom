function FF4Rom.MessagesContaining(substring as String) as List

 dim result as List
 dim text as String
 
 for i as Integer = 0 to total_bank1_messages
  text = bank1_messages(i).text
  for j as Integer = 1 to len(text) - len(substring) + 1
   if mid(text, j, len(substring)) = substring then
    result.AddValue(i)
    exit for
   end if
  next
 next
 
 for i as Integer = 0 to total_bank3_messages
  text = bank3_messages(i).text
  for j as Integer = 1 to len(text) - len(substring) + 1
   if mid(text, j, len(substring)) = substring then
    result.AddValue(i + 1000)
    exit for
   end if
  next
 next
 
 for map_index as Integer = 0 to total_maps
  for i as Integer = 1 to maps(map_index).messages.Length()
   text = maps(map_index).messages.ItemAt(i)
   for j as Integer = 1 to len(text) - len(substring) + 1
    if mid(text, j, len(substring)) = substring then
     result.AddValue(i + (map_index + 1) * 10000)
     exit for
    end if
   next
  next
 next
 
 return result

end function
