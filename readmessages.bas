sub FF4Rom.ReadMessages()

 dim start as Integer
 dim message_pointer as Integer
 dim text as String
 dim symbol as UByte

 for i as Integer = 0 to total_bank1_dialogues
  start = &h80200 + i * 2
  message_pointer = &h80600 + ByteAt(start) + ByteAt(start + 1) * &h100
  text = ""
  symbol = ByteAt(message_pointer)
  message_pointer += 1
  do until symbol = 0
   text += chr(symbol)
   if MessageCodeTakesParameter(symbol) then
    message += chr(ByteAt(message_pointer))
    message_pointer += 1
   end if
  loop
  bank1_messages(i).text = text
 next

end sub