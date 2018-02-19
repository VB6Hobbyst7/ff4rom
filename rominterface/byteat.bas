function FF4Rom.ByteAt(address as Long) as UByte
 return asc(mid(romdata, address + 1, 1))
end function
