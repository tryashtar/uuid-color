$execute store result score red uuid-color run data get storage uuid-color:main xor."$(nibble3)^$(nibble11)" 16
$execute store result score red_more uuid-color run data get storage uuid-color:main xor."$(nibble4)^$(nibble12)"
scoreboard players operation red uuid-color += red_more uuid-color
$execute store result score green uuid-color run data get storage uuid-color:main xor."$(nibble5)^$(nibble13)" 16
$execute store result score green_more uuid-color run data get storage uuid-color:main xor."$(nibble6)^$(nibble14)"
scoreboard players operation green uuid-color += green_more uuid-color
$execute store result score blue uuid-color run data get storage uuid-color:main xor."$(nibble7)^$(nibble15)" 16
$execute store result score blue_more uuid-color run data get storage uuid-color:main xor."$(nibble8)^$(nibble16)"
scoreboard players operation blue uuid-color += blue_more uuid-color
