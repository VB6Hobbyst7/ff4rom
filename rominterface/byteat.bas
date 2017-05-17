'This returns a byte from the game data at the specified address.

function FF4Rom.ByteAt(address as Integer) as UByte

 return asc(mid(romdata, address + 1, 1))

end function
