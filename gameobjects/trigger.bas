'This is something that happens when you step on or examine certain tiles on
' certain maps. Each map has associated with it a list of triggers. The
' "parent map" of a trigger is the map it is associated with.

' There are three types of triggers, and they all have special parameters
'  unique to their type:
'   * Teleport: When you move onto the tile, you will be taken to another
'               place on a map of the same world ("upper world" or
'               "underground/moon"). These are "forward" teleports that put
'               your previous location onto the warp stack; another tile
'               handles popping the stack and warping backwards and doesn't
'               involve triggers.
'   * Treasure: When you stand next to the tile, face it, and press A, you
'               get some item or money. It will only happen the first time
'               you "examine" it; from then on it is empty. Some treasures
'               are "trapped", meaning you have to first fight a certain
'               formation of monsters before it will give you the contents.
'               Only certain monster formations are allowed to be treasure
'               guards.
'   * Event: When you move onto the tile, it begins an event. The index
'            specified as a parameter here is not directly to an event itself,
'            but rather to an "event call", which specifies certain details
'            about which event to call under which conditions.

' A given map will only have certain tiles that can contain triggers. Ones
'  that are solid will be interpreted as treasures (even if the corresponding
'  isn't supposed to be) and ones you step on will be interpreted either as
'  events, or as teleports if the "event" flag on the trigger isn't set.

' The X, Y coordinates of a trigger should match that of a tile on its parent
'  map that supports triggers. If it doesn't, there will be bugs. In addition,
'  if you have a trigger tile with no corresponding trigger, that can also
'  cause strange behaviours to occur.

type Trigger

 'All triggers have a location on their parent map.
 x as UByte
 y as UByte

 'Teleport triggers take you to another place on a map from the same world.
 teleport as Boolean
 destination_map as UByte
 destination_x as UByte
 destination_y as UByte

 'Treasure triggers give you money or an item; they could be trapped.
 treasure as Boolean
 gil as Boolean
 contents as UByte 'Amount of money or index of item
 trapped as Boolean
 formation as UByte 'Battle to fight if trapped

 'If it isn't a treasure or teleport, then it's an event.
 event_call as UByte

end type