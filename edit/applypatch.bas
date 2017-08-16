'This allows you to apply a custom patch directly to a memory address.
' The patch should be sent as a string of chr values corresponding to the bytes
' to replace the bytes currently at the given address.

sub FF4Rom.ApplyPatch(address as Integer, patch as String)

 for i as Integer = 1 to len(patch)
  WriteByte(address + i - 1, asc(mid(patch, i, 1)))
 next

end sub
