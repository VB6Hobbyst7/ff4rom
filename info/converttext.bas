'This takes an ascii string and converts it into the FF4 character encoding.
' Certain special characters can be specified by constants.

const petrify_symbol = chr(&h21)
const frog_symbol = chr(&h22)
const mini_symbol = chr(&h23)
const pig_symbol = chr(&h24)
const mute_symbol = chr(&h25)
const blind_symbol = chr(&h26)
const poison_symbol = chr(&h27)
const float_symbol = chr(&h28)
const claw_symbol = chr(&h29)
const rod_symbol = chr(&h2A)
const staff_symbol = chr(&h2B)
const darksword_symbol = chr(&h2C)
const sword_symbol = chr(&h2D)
const holysword_symbol = chr(&h2E)
const spear_symbol = chr(&h2F)
const knife_symbol = chr(&h30)
const katana_symbol = chr(&h31)
const shuriken_symbol = chr(&h32)
const boomerang_symbol = chr(&h33)
const axe_symbol = chr(&h34)
const wrench_symbol = chr(&h35)
const harp_symbol = chr(&h36)
const bow_symbol = chr(&h37)
const arrow_symbol = chr(&h38)
const hammer_symbol = chr(&h39)
const whip_symbol = chr(&h3A)
const shield_symbol = chr(&h3B)
const helm_symbol = chr(&h3C)
const mail_symbol = chr(&h3D)
const gauntlet_symbol = chr(&h3E)
const black_symbol = chr(&h3F)
const white_symbol = chr(&h40)
const summon_symbol = chr(&h41)
const flat_m_symbol = chr(&h76)
const flat_h_symbol = chr(&h77)
const flat_p_symbol = chr(&h78)
const tent_symbol = chr(&h79)
const potion_symbol = chr(&h7A)
const robe_symbol = chr(&h7B)
const ring_symbol = chr(&h7C)
const crystal_symbol = chr(&h7D)
const key_symbol = chr(&h7E)
const tail_symbol = chr(&h7F)

function FF4Rom.ConvertText(text as String) as String

 dim result as String
 dim letter as String
 dim temp as UByte

 for i as Integer = 1 to len(text)
  letter = mid(text, i, 1)
  select case letter
   case "0" to "9"
    temp = asc(letter) + &h50
   case "A" to "Z"
    temp = asc(letter) + 1
   case "a" to "z"
    temp = asc(letter) - 5
   case " "
    temp = &hFF
   case "#"
    temp = &h15
   case "'"
    temp = &hC0
   case "."
    temp = &hC1
   case "-"
    temp = &hC2
   case "_"
    temp = &hC3
   case "!"
    temp = &hC4
   case "?"
    temp = &hC5
   case "%"
    temp = &hC6
   case "/"
    temp = &hC7
   case ":"
    temp = &hC8
   case ","
    temp = &hC9
   case else
    temp = asc(letter)
  end select
  result += chr(temp)
 next

 return result

end function
