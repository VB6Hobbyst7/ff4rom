sub FF4Rom.ReadAlertMessages()
 dim start as Long
 dim p as Message ptr
 dim message_pointer as Long
 dim text as String
 dim symbol as UByte
 for index as Integer = 0 to total_alert_messages
  p = alert_messages[index]
  start = &h7B200 + index * 2
  message_pointer = &h70200 + ByteAt(start) + ByteAt(start + 1) * &h100
  text = ""
  do
   symbol = ByteAt(message_pointer)
   if symbol > 0 then text += chr(symbol)
   if symbol = 4 or symbol = 3 then
    message_pointer += 1
    text += chr(ByteAt(message_pointer))
   end if
   message_pointer += 1
  loop until symbol = Symbols.end_message
  p->text = text
 next
end sub
