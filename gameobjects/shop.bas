'This is the inventory list of one of the vendors in the game.

' Each shop can have up to eight wares. Each of the wares is simply an index of
'  an item. A blank spot is indicated by FF.

type Shop

 wares(8) as UByte

end type

const total_shops = 32
