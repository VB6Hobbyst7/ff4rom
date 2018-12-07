sub FF4Rom.DisplayBytes(start as Long, finish as Long)
 'Pad the beginning with ".." if it's not an even multiple of 16.
 for i as Integer = 1 to start mod &h10
  print ".. ";
 next
 for i as Integer = start to finish
  print hex(ByteAt(i), 2); " ";
  if i mod &h10 = &h0F then print
 next
end sub
