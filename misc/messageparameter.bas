function FF4Rom.MessageParameter(symbol as UByte) as Boolean
 dim result as Boolean
 select case symbol
 case Symbols.actor_name, Symbols.pause, Symbols.song
  result = true
 end select
 return result
end function
