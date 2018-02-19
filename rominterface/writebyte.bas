sub FF4Rom.WriteByte(address as Long, newbyte as UByte)
 mid(romdata, address + 1, 1) = chr(newbyte)
end sub
