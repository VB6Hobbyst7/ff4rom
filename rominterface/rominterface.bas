type RomInterface
 romdata as String
 unheadered as Boolean
 if_patch as Boolean
 declare function ByteAt(address as Long) as UByte
 declare sub WriteByte(address as Long, newbyte as UByte)
end type

function RomInterface.ByteAt(address as Long) as UByte
 return asc(mid(romdata, address + 1, 1))
end function

sub RomInterface.WriteByte(address as Long, newbyte as UByte)
 mid(romdata, address + 1, 1) = chr(newbyte)
end sub
