'This takes the name of an element or status and returns the index of the
' flag corresponding to that element or status.

function FF4Rom.FlagIndex(flagname as String) as Integer

 dim result as Integer

 select case lcase(trim(flagname))
  case "fire":     result = fire
  case "ice":      result = ice
  case "bolt":     result = bolt
  case "dark":     result = dark
  case "holy":     result = holy
  case "air":      result = air
  case "absorb":   result = absorb
  case "immune":   result = immune
  case "poison":   result = poison
  case "blind":    result = blind
  case "mute":     result = mute
  case "pig":      result = pig
  case "mini":     result = mini
  case "frog":     result = frog
  case "petrify":  result = petrify
  case "ko":       result = ko
  case "calcify1": result = calcify1
  case "calcify2": result = calcify2
  case "berserk":  result = berserk
  case "charm":    result = charm
  case "asleep":   result = asleep 'Sleep is a BASIC keyword
  case "stun":     result = stun
  case "float":    result = float
  case "curse":    result = curse
 end select

 return result

end function
