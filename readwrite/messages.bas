sub FF4Rom.ReadMessages()

 dim start as Integer
 dim message_pointer as Integer
 dim text as String
 dim symbol as UByte
 
 ConstructDTE()

 for i as Integer = 0 to total_bank1_messages
  start = &h80200 + i * 2
  message_pointer = &h80600 + ByteAt(start) + ByteAt(start + 1) * &h100
  text = ""
  do
   symbol = ByteAt(message_pointer)
   message_pointer += 1
   text += chr(symbol)
   if MessageCodeTakesParameter(symbol) then
    text += chr(ByteAt(message_pointer))
    message_pointer += 1
   end if
  loop until symbol = message_end_code
  bank1_messages(i).text = DecompressDTE(text)
 next

 for i as Integer = 0 to total_bank3_messages
  start = &h9A700 + i * 2
  message_pointer = &h9A900 + ByteAt(start) + ByteAt(start + 1) * &h100
  text = ""
  do
   symbol = ByteAt(message_pointer)
   message_pointer += 1
   text += chr(symbol)
   if MessageCodeTakesParameter(symbol) then
    text += chr(ByteAt(message_pointer))
    message_pointer += 1
   end if
  loop until symbol = message_end_code
  bank3_messages(i).text = DecompressDTE(text)
 next
 
 for i as Integer = 0 to total_battle_messages
  start = &h77400 + i * 2
  message_pointer = &h68200 + ByteAt(start) + ByteAt(start + 1) * &h100
  text = ""
  do
   symbol = ByteAt(message_pointer)
   if symbol > 0 then text += chr(symbol)
   if symbol = 4 or symbol = 3 then
    message_pointer += 1
    text += chr(ByteAt(message_pointer))
   end if
   message_pointer += 1
  loop until symbol = message_end_code
  battle_messages(i).text = text
 next
 
 for i as Integer = 0 to total_alert_messages
  start = &h7B200 + i * 2
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
  loop until symbol = message_end_code
  alert_messages(i).text = text
 next

 
end sub


sub FF4Rom.WriteMessages()

 dim start as Integer
 dim message_pointer as Integer
 dim text as String
 dim symbol as UByte
 
 message_pointer = &h80600
 for i as Integer = 0 to total_bank1_messages
  start = &h80200 + i * 2
  WriteByte(start, (message_pointer - &h80600) mod &h100)
  WriteByte(start + 1, (message_pointer - &h80600) \ &h100)
  text = CompressDTE(bank1_messages(i).text)
  for j as Integer = 1 to len(text)
   WriteByte(message_pointer, asc(mid(text, j, 1)))
   message_pointer += 1
  next
 next

 message_pointer = &h9A900
 for i as Integer = 0 to total_bank3_messages
  start = &h9A700 + i * 2
  WriteByte(start, (message_pointer - &h9A900) mod &h100)
  WriteByte(start + 1, (message_pointer - &h9A900) \ &h100)
  text = CompressDTE(bank3_messages(i).text)
  for j as Integer = 1 to len(text)
   WriteByte(message_pointer, asc(mid(text, j, 1)))
   message_pointer += 1
  next
 next

 message_pointer = &h77574
 for i as Integer = 0 to total_battle_messages
  start = &h77400 + i * 2
  WriteByte(start, (message_pointer - &h68200) mod &h100)
  WriteByte(start + 1, (message_pointer - &h68200) \ &h100)
  text = battle_messages(i).text
  for j as Integer = 1 to len(text)
   WriteByte(message_pointer, asc(mid(text, j, 1)))
   message_pointer += 1
  next
  WriteByte(message_pointer, message_end_code)
  message_pointer += 1
 next

 message_pointer = &h7B276
 for i as Integer = 0 to total_alert_messages
  start = &h7B200 + i * 2
  WriteByte(start, (message_pointer - &h70200) mod &h100)
  WriteByte(start + 1, (message_pointer - &h70200) \ &h100)
  text = alert_messages(i).text
  for j as Integer = 1 to len(text)
   WriteByte(message_pointer, asc(mid(text, j, 1)))
   message_pointer += 1
  next
  WriteByte(message_pointer, message_end_code)
  message_pointer += 1
 next

end sub
