function FF4Rom.DisplayText(ff4text as String) as String
 dim result as String
 dim symbol_code as UByte
 for i as Integer = 1 to len(ff4text)
  symbol_code = asc(mid(ff4text, i, 1))
  select case symbol_code
  case &h80 to &h89
   result += chr(symbol_code - &h50)
  case &h42 to &h5B
   result += chr(symbol_code - 1)
  case &h5C to &h75
   result += chr(symbol_code + 5)
  case &hFF
   result += " "
  case &h15
   result += "#"
  case &hC0
   result += "'"
  case &hC1
   result += "."
  case &hC2
   result += "-"
  case &hC3
   result += "..."
  case &hC4
   result += "!"
  case &hC5
   result += "?"
  case &hC6
   result += "%"
  case &hC7
   result += "/"
  case &hC8
   result += ":"
  case &hC9
   result += ","
  case Symbols.petrify
   result += "(Petrify)"
  case Symbols.frog
   result += "(Frog)"
  case Symbols.mini
   result += "(Mini)"
  case Symbols.pig
   result += "(Pig)"
  case Symbols.mute
   result += "(Mute)"
  case Symbols.blind
   result += "(Blind)"
  case Symbols.poison
   result += "(Poison)"
  case Symbols.float
   result += "(Float)"
  case Symbols.claw
   result += "(Claw)"
  case Symbols.rod
   result += "(Rod)"
  case Symbols.staff
   result += "(Staff)"
  case Symbols.darksword
   result += "(Darksword)"
  case Symbols.sword
   result += "(Sword)"
  case Symbols.holysword
   result += "(Holysword)"
  case Symbols.spear
   result += "(Spear)"
  case Symbols.knife
   result += "(Knife)"
  case Symbols.katana
   result += "(Katana)"
  case Symbols.shuriken
   result += "(Shuriken)"
  case Symbols.boomerang
   result += "(Boomerang)"
  case Symbols.axe
   result += "(Axe)"
  case Symbols.wrench
   result += "(Wrench)"
  case Symbols.harp
   result += "(Harp)"
  case Symbols.bow
   result += "(Bow)"
  case Symbols.arrow
   result += "(Arrow)"
  case Symbols.hammer
   result += "(Hammer)"
  case Symbols.whip
   result += "(Whip)"
  case Symbols.shield
   result += "(Shield)"
  case Symbols.helm
   result += "(Helm)"
  case Symbols.mail
   result += "(Mail)"
  case Symbols.gauntlet
   result += "(Gauntlet)"
  case Symbols.black
   result += "(Black)"
  case Symbols.white
   result += "(White)"
  case Symbols.summon
   result += "(Summon)"
  case Symbols.flat_m
   result += "(Flat M)"
  case Symbols.flat_h
   result += "(Flat H)"
  case Symbols.flat_p
   result += "(Flat P)"
  case Symbols.tent
   result += "(Tent)"
  case Symbols.potion
   result += "(Potion)"
  case Symbols.robe
   result += "(Robe)"
  case Symbols.ring
   result += "(Ring)"
  case Symbols.crystal
   result += "(Crystal)"
  case Symbols.key
   result += "(Key)"
  case Symbols.tail
   result += "(Tail)"
  case Symbols.line_break, Symbols.blank_line
   result += "|"
  case Symbols.end_message
   result += "[END]" 
  case Symbols.item
   result += "[Item]"
  case Symbols.gil
   result += "[GP]"
  case Symbols.advance
   result += "[Advance]"
  case Symbols.actor_name
   result += "[" + Pad(DisplayText(names.ItemAt(asc(mid(ff4text, i + 1, 1)))), 6) + "]"
  case Symbols.song
   result += "[Song " + str(asc(mid(ff4text, i + 1, 1))) + "]"
   i += 1
  case Symbols.pause
   result += "[Pause " + str(asc(mid(ff4text, i + 1, 1))) + "]"
   i += 1
  case else
   result += "<" + hex(asc(mid(ff4text, i, 1)), 2) + ">"
  end select
 next
 return result
end function
