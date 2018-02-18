sub FF4Rom.ReplaceAll(find_word as String, replacement as String, include_battle as Boolean = false)

 dim candidates as List
 dim index as Integer
 dim text as String
 dim map_index as Integer
 
 candidates = MessagesContaining(find_word)
 
 for i as Integer = 1 to candidates.Length()
  index = val(candidates.ItemAt(i))
  if index < 1000 then
   bank1_messages(index).text = WrapMessage(Replace(find_word, replacement, bank1_messages(index).text))
  elseif index < 10000 then
   index -= 1000
   bank3_messages(index).text = WrapMessage(Replace(find_word, replacement, bank3_messages(index).text))
  else
   map_index = index \ 10000 - 1
   index = index mod 10000
   maps(map_index).messages.AssignItem(index, WrapMessage(Replace(find_word, replacement, maps(map_index).messages.ItemAt(index))))
  end if
 next
 
 if include_battle then
  for i as Integer = 0 to total_battle_messages
   battle_messages(i).text = Replace(find_word, replacement, battle_messages(i).text)
  next
 end if

end sub
