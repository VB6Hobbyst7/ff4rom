type MenuCommand
 name as String
 target as UByte
 delay as UByte
 disabling_statuses as AttributeTable
 charging_stance as Stance ptr
 action_stance as Stance ptr
 second_stance as Stance ptr
 third_stance as Stance ptr
 values as List
 messages as MessageList
 spells as SpellList
 actors as ActorList
 items as ItemList
 freeze as Boolean
end type

const total_menu_commands = 25

enum CommandNames
 fight = 0
 item
 white
 black
 summon
 dark_wave
 jump
 recall
 sing
 hide
 salve
 pray
 aim
 charge
 kick
 gird
 twin
 boast
 cry
 cover
 peep
 crash
 dart
 sneak
 ninja
 regen
end enum


