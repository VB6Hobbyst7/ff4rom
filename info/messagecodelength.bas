function FF4Rom.MessageCodeLength(symbol as UByte) as Integer

 dim result

 select case symbol
  case song_code:  reuslt = 0
  case name_code:  result = 6
  case pause_code: result = 0
  case item_code:  result = 9
  case else:       result = 1
 end select

 return result

end function
