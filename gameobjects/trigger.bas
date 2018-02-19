type MapFwd as Map

type Trigger
 x as UByte
 y as UByte
 teleport as Boolean
 destination as MapFwd ptr
 destination_x as UByte
 destination_y as UByte
 facing as UByte
 treasure as Boolean
 gil as Boolean
 amount as UByte
 contents as Item ptr
 trapped as Boolean
 trap_formation as Formation ptr
 event_call as EventCall ptr
end type

const total_triggers = 100
