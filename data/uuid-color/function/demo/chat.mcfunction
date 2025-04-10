data modify storage uuid-color:main uuid set from entity @s UUID
function uuid-color:get
execute store result storage uuid-color:main hex1.red int 1 run scoreboard players get red uuid-color
execute store result storage uuid-color:main hex1.green int 1 run scoreboard players get green uuid-color
execute store result storage uuid-color:main hex1.blue int 1 run scoreboard players get blue uuid-color
function uuid-color:hex with storage uuid-color:main hex1
function uuid-color:demo/chat.macro with storage uuid-color:main hex1
