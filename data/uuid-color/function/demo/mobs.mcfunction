execute if entity @s[tag=uuid-color.mob] run return fail
tag @s add uuid-color.mob
data modify storage uuid-color:main uuid set from entity @s UUID
function uuid-color:get
execute store result storage uuid-color:main hex1.red int 1 run scoreboard players get red uuid-color
execute store result storage uuid-color:main hex1.green int 1 run scoreboard players get green uuid-color
execute store result storage uuid-color:main hex1.blue int 1 run scoreboard players get blue uuid-color
function uuid-color:hex with storage uuid-color:main hex1
function uuid-color:demo/mobs.macro with storage uuid-color:main hex1
data modify entity @s CustomNameVisible set value 1b
attribute @s waypoint_transmit_range modifier add uuid-color:mob 10 add_value
waypoint modify @s fade 5 1 10 0
