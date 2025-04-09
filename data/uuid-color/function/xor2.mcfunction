# can't use scale for the first nibble, since it may overflow and saturate, when we want it to wrap
$execute store result score nibble1 uuid-color run data get storage uuid-color:main xor."$(nibble1)^$(nibble9)"
scoreboard players operation nibble1 uuid-color *= #268435456 uuid-color
$execute store result score nibble2 uuid-color run data get storage uuid-color:main xor."$(nibble2)^$(nibble10)" 16777216
$execute store result score nibble3 uuid-color run data get storage uuid-color:main xor."$(nibble3)^$(nibble11)" 1048576
$execute store result score nibble4 uuid-color run data get storage uuid-color:main xor."$(nibble4)^$(nibble12)" 65536
$execute store result score nibble5 uuid-color run data get storage uuid-color:main xor."$(nibble5)^$(nibble13)" 4096
$execute store result score nibble6 uuid-color run data get storage uuid-color:main xor."$(nibble6)^$(nibble14)" 256
$execute store result score nibble7 uuid-color run data get storage uuid-color:main xor."$(nibble7)^$(nibble15)" 16
$execute store result score nibble8 uuid-color run data get storage uuid-color:main xor."$(nibble8)^$(nibble16)"
