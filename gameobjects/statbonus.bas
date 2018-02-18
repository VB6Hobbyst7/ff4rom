'This represents a collection of bonuses granted to a character's base
'stats by, for example, an equipment or a levelup.

'Levelups treat the stat amount somewhat differently from equipment.
'For levelups, the amount is literally the amount the flagged stats
'increase, with the exception that 7 is "subtract 1" rather than
'"add 7". For equipment, there is a chart that determines how much
'the flagged stats are increased by and how much the unflagged stats
'are decreased by:
'  0 =  +3 /  -0
'  1 =  +5 /  -0
'  2 = +10 /  -0
'  3 = +15 /  -0
'  4 =  +5 /  -5
'  5 = +10 / -10
'  6 = +15 / -15
'  7 =  +5 / -10

'Only the lowest three bits of the amount byte matter (amount mod 8)

type StatBonus
 
 stats(4) as Boolean
 amount as UByte
 
 declare sub Display()
 declare sub SetEquipmentBonus(bonus as String)
 
end type

const str_stat = 0
const agi_stat = 1
const vit_stat = 2
const wis_stat = 3
const wil_stat = 4

'Sets the amount byte based on the given string.
'The string must be in a certain specific format, with the bonus
'amount followed by a slash "/" followed by the penalty amount, with
'NO + or - symbols or spaces. The bonus amounts with no penalty can
'be shortened to simply the bonus amount without the slash.
sub StatBonus.SetEquipmentBonus(bonus as String)
 
 select case bonus
  case "3/0", "3"
   amount = 0
  case "5/0", "5"
   amount = 1
  case "10/0", "10"
   amount = 2
  case "15/0", "15"
   amount = 3
  case "5/5"
   amount = 4
  case "10/10"
   amount = 5
  case "15/15"
   amount = 6
  case "5/10"
   amount = 7
 end select
 
end sub


'Displays the stat bonus information on the console screen. This is mostly for
'debugging purposes.
sub StatBonus.Display()

 dim temp as String
 
 if stats(0) then temp += "Str, "
 if stats(1) then temp += "Agi, "
 if stats(2) then temp += "Vit, "
 if stats(3) then temp += "Wis, "
 if stats(4) then temp += "Wil, "
 
 if len(temp) > 0 then temp = left(temp, len(temp) - 2) + " "

 temp += iif(amount = 7, "-1", "+" + str(amount))
 
 print temp

end sub


