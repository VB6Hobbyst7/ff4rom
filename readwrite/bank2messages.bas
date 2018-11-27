sub FF4Rom.ReadBank2Messages()
 dim start as Long
 dim p as Map ptr
 dim message_pointer as Long
 dim text as String
 dim symbol as UByte
 dim next_line as Long
 dim finish as Long
 start = &h88200
 for index as Integer = 0 to total_maps
  p = maps[index]
  next_line = &h88500 + ByteAt(start + index * 2) + ByteAt(start + index * 2 + 1) * &h100
  finish = &h88500 + ByteAt(start + (index + 1) * 2) + ByteAt(start + (index + 1) * 2 + 1) * &h100
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
   p->messages.AddItem(DecompressDTE(text))
  loop
 next
end sub
