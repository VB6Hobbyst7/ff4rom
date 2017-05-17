'This writes the given byte to the given address in the rom.

sub FF4Rom.WriteByte(address as Integer, newbyte as UByte)

 mid(romdata, address + 1, 1) = chr(newbyte)
 
end sub


