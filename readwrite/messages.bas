sub FF4Rom.ReadMessages()

 dim start as Integer
 dim message_pointer as Integer
 dim text as String
 dim symbol as UByte
 dim next_line as UInteger
 dim finish as UInteger
 
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
  bank1_messages(i)->text = DecompressDTE(text)
 next
 
 start = &h88200
 for i as Integer = 0 to total_maps
  next_line = &h88500 + ByteAt(start + i * 2) + ByteAt(start + i * 2 + 1) * &h100
  'if i = total_maps then start = &h901FE - (i - 1) * 2
  finish = &h88500 + ByteAt(start + (i + 1) * 2) + ByteAt(start + (i + 1) * 2 + 1) * &h100
  if finish = &h88500 + &hFFFF then finish = &h901FB
  do until next_line >= finish
   text = ""
   do
    symbol = ByteAt(next_line)
    if symbol > 0 then text += chr(symbol)
    if symbol = 4 or symbol = 3 then
     next_line += 1
     text += chr(ByteAt(next_line))
    end if
    next_line += 1
   loop until symbol = 0
   maps(i)->messages.AddItem(DecompressDTE(text))
  loop
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
  bank3_messages(i)->text = DecompressDTE(text)
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
  battle_messages(i)->text = text
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
  alert_messages(i)->text = text
 next

 
end sub


sub FF4Rom.WriteMessages()

 dim start as Integer
 dim message_pointer as Integer
 dim text as String
 dim symbol as UByte
 dim total as Integer
 
 message_pointer = &h80600
 for i as Integer = 0 to total_bank1_messages
  start = &h80200 + i * 2
  WriteByte(start, (message_pointer - &h80600) mod &h100)
  WriteByte(start + 1, (message_pointer - &h80600) \ &h100)
  text = CompressDTE(bank1_messages(i)->text)
  for j as Integer = 1 to len(text)
   WriteByte(message_pointer, asc(mid(text, j, 1)))
   message_pointer += 1
  next
 next

 start = &h88500
 for i as Integer = 0 to total_maps
  total = 0
  for j as Integer = 1 to maps(i)->messages.Length()
   total += len(maps(i)->messages.ItemAt(j)) + 1
  next
  if start + total <= &h901FB then
   WriteByte(&h88200 + i * 2, (start - &h88500) mod &h100)
   WriteByte(&h88200 + i * 2 + 1, (start - &h88500) \ &h100)
   for j as Integer = 1 to maps(i)->messages.Length()
    text = CompressDTE(maps(i)->messages.ItemAt(j))
    for k as Integer = 1 to len(text)
     WriteByte(start, asc(mid(text, k, 1)))
     start += 1
    next
    WriteByte(start, 0)
    start += 1
   next
  end if
  if i = total_maps then
   WriteByte(&h901FE, (start - &h88500) mod &h100)
   WriteByte(&h901FF, (start - &h88500) \ &h100)
  end if
 next

 message_pointer = &h9A900
 for i as Integer = 0 to total_bank3_messages
  start = &h9A700 + i * 2
  WriteByte(start, (message_pointer - &h9A900) mod &h100)
  WriteByte(start + 1, (message_pointer - &h9A900) \ &h100)
  text = CompressDTE(bank3_messages(i)->text)
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
  text = battle_messages(i)->text
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
  text = alert_messages(i)->text
  for j as Integer = 1 to len(text)
   WriteByte(message_pointer, asc(mid(text, j, 1)))
   message_pointer += 1
  next
  WriteByte(message_pointer, message_end_code)
  message_pointer += 1
 next

end sub
