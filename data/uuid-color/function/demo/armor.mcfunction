execute if entity @s[tag=uuid-color.armor] run return fail
tag @s add uuid-color.armor
data modify storage uuid-color:main uuid set from entity @s UUID
function uuid-color:hash
function uuid-color:color
execute store result storage uuid-color:main hex1.color int 1 run scoreboard players get color uuid-color
function uuid-color:demo/armor.macro with storage uuid-color:main hex1
