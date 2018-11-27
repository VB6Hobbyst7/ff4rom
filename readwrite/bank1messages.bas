sub FF4Rom.ReadBank1Messages()
 dim start as Long
 dim p as Message ptr
 dim message_pointer as Long
 dim text as String
 dim symbol as UByte
 for index as Integer = 0 to total_bank1_messages
  p = bank1_messages[index]
  start = &h80200 + index * 2
  message_pointer = &h80600 + ByteAt(start) + ByteAt(start + 1) * &h100
  text = ""
  do
   symbol = ByteAt(message_pointer)
   message_pointer += 1
   text += chr(symbol)
   if MessageParameter(symbol) then
    text += chr(ByteAt(message_pointer))
    message_pointer += 1
   end if
  loop until symbol = Symbols.end_message
  p->text = DecompressDTE(text)
 next
end sub
