type AutoScriptEntry
 category as UByte
 action as UByte
end type

enum AutoScriptCategories
 spell = 0
 item
 menu_command = &hC
 next_sequence = &hF
end enum

