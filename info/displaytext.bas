'This converts a string from FF4 encoding to ASCII text.
' It converts special symbols to long text such as (Potion) or (Harp), so you
' can't necessarily convert it back with the ConvertText routine.
' This is mainly for debugging purposes so I don't have to keep opening
' FF4kster to view text.

function FF4Rom.DisplayText(text as String) as String

 dim result as String
 dim letter as UByte

 for i as Integer = 1 to len(text)
  letter = asc(mid(text, i, 1))
  select case mid(text, i, 1)
   case chr(&h80) to chr(&h89)
    result += chr(letter - &h50)
   case chr(&h42) to chr(&h5B)
    result += chr(letter - 1)
   case chr(&h5C) to chr(&h75)
    result += chr(letter + 5)
   case chr(&hFF)
    result += " "
   case chr(&h15)
    result += "#"
   case chr(&hC0)
    result += "'"
   case chr(&hC1)
    result += "."
   case chr(&hC2)
    result += "-"
   case chr(&hC3)
    result += "..."
   case chr(&hC4)
    result += "!"
   case chr(&hC5)
    result += "?"
   case chr(&hC6)
    result += "%"
   case chr(&hC7)
    result += "/"
   case chr(&hC8)
    result += ":"
   case chr(&hC9)
    result += ","
   case petrify_symbol
    result += "(Petrify)"
   case frog_symbol
    result += "(Frog)"
   case mini_symbol
    result += "(Mini)"
   case pig_symbol
    result += "(Pig)"
   case mute_symbol
    result += "(Mute)"
   case blind_symbol
    result += "(Blind)"
   case poison_symbol
    result += "(Poison)"
   case float_symbol
    result += "(Float)"
   case claw_symbol
    result += "(Claw)"
   case rod_symbol
    result += "(Rod)"
   case staff_symbol
    result += "(Staff)"
   case darksword_symbol
    result += "(Darksword)"
   case sword_symbol
    result += "(Sword)"
   case holysword_symbol
    result += "(Holysword)"
   case spear_symbol
    result += "(Spear)"
   case knife_symbol
    result += "(Knife)"
   case katana_symbol
    result += "(Katana)"
   case shuriken_symbol
    result += "(Shuriken)"
   case boomerang_symbol
    result += "(Boomerang)"
   case axe_symbol
    result += "(Axe)"
   case wrench_symbol
    result += "(Wrench)"
   case harp_symbol
    result += "(Harp)"
   case bow_symbol
    result += "(Bow)"
   case arrow_symbol
    result += "(Arrow)"
   case hammer_symbol
    result += "(Hammer)"
   case whip_symbol
    result += "(Whip)"
   case shield_symbol
    result += "(Shield)"
   case helm_symbol
    result += "(Helm)"
   case mail_symbol
    result += "(Mail)"
   case gauntlet_symbol
    result += "(Gauntlet)"
   case black_symbol
    result += "(Black)"
   case white_symbol
    result += "(White)"
   case summon_symbol
    result += "(Call)"
   case flat_m_symbol
    result += "(Flat M)"
   case flat_h_symbol
    result += "(Flat H)"
   case flat_p_symbol
    result += "(Flat P)"
   case tent_symbol
    result += "(Tent)"
   case potion_symbol
    result += "(Potion)"
   case robe_symbol
    result += "(Robe)"
   case ring_symbol
    result += "(Ring)"
   case crystal_symbol
    result += "(Crystal)"
   case key_symbol
    result += "(Key)"
   case tail_symbol
    result += "(Tail)"
   case chr(line_break_code), chr(blank_line_code)
    result += "|"
   case chr(message_end_code)
    result += "[END]"
   case chr(item_code)
    result += "[Item]"
   case chr(gp_code)
    result += "[GP]"
   case chr(advance_code)
    result += "[Advance]"
   case chr(name_code)
    result += Pad(DisplayText(names(asc(mid(text, i + 1, 1)))), 6)
    i += 1
   case chr(song_code)
    result += "[Song " + str(asc(mid(text, i + 1, 1))) + "]"
    i += 1
   case chr(pause_code)
    result += "[Pause " + str(asc(mid(text, i + 1, 1))) + "]"
    i += 1
   case else
    result += "<" + hex(asc(mid(text, i, 1)), 2) + ">"
  end select
 next

 return result

end function
