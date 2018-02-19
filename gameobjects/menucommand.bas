type MenuCommand
 name as String
 target as UByte
 delay as UByte
 disabling_statuses as AttributeTable
 charging_stance as Stance ptr
 action_stance as Stance ptr
 second_stance as Stance ptr
 third_stance as Stance ptr
 messages as List
 spells as List
 values as List
 actors as List
 items as List
 freeze as Boolean
end type

const total_menu_commands = 25
