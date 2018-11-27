sub FF4Rom.ReadDescriptions()
 dim start as Long
 dim p as Message ptr
 dim text as String
 dim symbol as UByte
 start = &h70200 + ByteAt(&hA9CF) + ByteAt(&hA9D0) * &h100
 for index as Integer = 0 to total_descriptions
  p = descriptions[index]
  text = ""
  do
   symbol = ByteAt(start)
   if symbol > 0 then text += chr(symbol)
   start += 1
  loop until symbol = 0
  p->text = text
 next
end sub
