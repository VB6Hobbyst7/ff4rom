function FF4Rom.MessageCodeLength(symbol as UByte) as Integer

 dim result as Integer

 select case symbol
  case line_break_code: result = 0
  case blank_line_code: result = 0
  case song_code:  result = 0
  case name_code:  result = 6
  case pause_code: result = 0
  'case item_code:  result = 9
  case dte_range1.start to dte_range1.finish, dte_range2.start to dte_range2.finish
   result = 2
  case else:       result = 1
 end select

 return result

end function
