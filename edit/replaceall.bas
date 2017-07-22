sub FF4Rom.ReplaceAll(find_word as String, replacement as String)

 dim candidates as List
 dim index as Integer
 
 candidates = MessagesContaining(find_word)
 
 for i as Integer = 1 to candidates.Length()
  index = val(candidates.ItemAt(i))
  if index < 1000 then
   bank1_messages(index).text = WrapMessage(Replace(find_word, replacement, bank1_messages(index).text))
  else
   index -= 1000
   bank3_messages(index).text = WrapMessage(Replace(find_word, replacement, bank3_messages(index).text))
  end if
 next

end sub
