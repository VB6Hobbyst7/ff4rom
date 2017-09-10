sub FF4Rom.ApplyIPS(ips_file as String, headered as Boolean = true)

 dim contents as String
 dim offset as Integer
 dim length as Integer
 dim payload as String
 dim cursor as Integer
 
 open ips_file for binary access read as #1
  if err > 0 then
   print "PATCH FILE ACCESS ERROR"
   getkey
   end
  end if
  contents = string(lof(1), 0)
  get #1, , contents
 close #1
 
 if left(contents, 5) = "PATCH" and right(contents, 3) = "EOF" then
  contents = left(contents, len(contents) - 3)
  contents = mid(contents, 6)
  cursor = 1
  do
   offset = val("&h" + mid(contents, cursor, 1)) * &h10000 + val("&h" + mid(contents, cursor + 1, 1)) * &h100 + val("&h" + mid(contents, cursor + 2, 1))
   offset += 3
   length = val("&h" + mid(contents, cursor, 1)) * &h100 + val("&h" + mid(contents, cursor + 1, 1))
   offset += 2
   payload = mid(contents, cursor, length)
   offset += length
   for i as Integer = 1 to length
    WriteByte(offset + i - 1, mid(payload, i))
   next
  loop until offset > len(contents)
 else
  print "INVALID PATCH FILE"
  getkey
  end
 end if

end sub
