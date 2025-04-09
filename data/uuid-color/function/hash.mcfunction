execute store result score uuid1 uuid-color run data get storage uuid-color:main uuid[0]
execute store result score uuid2 uuid-color run data get storage uuid-color:main uuid[1]
execute store result score uuid3 uuid-color run data get storage uuid-color:main uuid[2]
execute store result score uuid4 uuid-color run data get storage uuid-color:main uuid[3]
scoreboard players operation bits1 uuid-color = uuid1 uuid-color
scoreboard players operation bits2 uuid-color = uuid2 uuid-color
scoreboard players operation bits3 uuid-color = uuid3 uuid-color
scoreboard players operation bits4 uuid-color = uuid4 uuid-color
# we want to break up each number into 8 nibbles
# we use arithmetic divides and modulo to shift and mask the desired bits
# but negative numbers do not work this way
# so we need to force them to be positive while preserving the bit pattern
# so we set the most significant bit to 0
# the missing bit is restored to the most significant nibble after its value is calculated
execute if score uuid1 uuid-color matches ..-1 run scoreboard players add bits1 uuid-color 2147483647
execute if score uuid1 uuid-color matches ..-1 run scoreboard players add bits1 uuid-color 1
execute if score uuid2 uuid-color matches ..-1 run scoreboard players add bits2 uuid-color 2147483647
execute if score uuid2 uuid-color matches ..-1 run scoreboard players add bits2 uuid-color 1
execute if score uuid3 uuid-color matches ..-1 run scoreboard players add bits3 uuid-color 2147483647
execute if score uuid3 uuid-color matches ..-1 run scoreboard players add bits3 uuid-color 1
execute if score uuid4 uuid-color matches ..-1 run scoreboard players add bits4 uuid-color 2147483647
execute if score uuid4 uuid-color matches ..-1 run scoreboard players add bits4 uuid-color 1

scoreboard players operation nibble uuid-color = bits1 uuid-color
scoreboard players operation nibble uuid-color /= #268435456 uuid-color
execute if score uuid1 uuid-color matches ..-1 run scoreboard players add nibble uuid-color 8
execute store result storage uuid-color:main xor1.nibble1 byte 1 run scoreboard players get nibble uuid-color
scoreboard players operation nibble uuid-color = bits1 uuid-color
scoreboard players operation nibble uuid-color /= #16777216 uuid-color
execute store result storage uuid-color:main xor1.nibble2 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits1 uuid-color
scoreboard players operation nibble uuid-color /= #1048576 uuid-color
execute store result storage uuid-color:main xor1.nibble3 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits1 uuid-color
scoreboard players operation nibble uuid-color /= #65536 uuid-color
execute store result storage uuid-color:main xor1.nibble4 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits1 uuid-color
scoreboard players operation nibble uuid-color /= #4096 uuid-color
execute store result storage uuid-color:main xor1.nibble5 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits1 uuid-color
scoreboard players operation nibble uuid-color /= #256 uuid-color
execute store result storage uuid-color:main xor1.nibble6 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits1 uuid-color
scoreboard players operation nibble uuid-color /= #16 uuid-color
execute store result storage uuid-color:main xor1.nibble7 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits1 uuid-color
execute store result storage uuid-color:main xor1.nibble8 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color

scoreboard players operation nibble uuid-color = bits2 uuid-color
scoreboard players operation nibble uuid-color /= #268435456 uuid-color
execute if score uuid2 uuid-color matches ..-1 run scoreboard players add nibble uuid-color 8
execute store result storage uuid-color:main xor1.nibble9 byte 1 run scoreboard players get nibble uuid-color
scoreboard players operation nibble uuid-color = bits2 uuid-color
scoreboard players operation nibble uuid-color /= #16777216 uuid-color
execute store result storage uuid-color:main xor1.nibble10 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits2 uuid-color
scoreboard players operation nibble uuid-color /= #1048576 uuid-color
execute store result storage uuid-color:main xor1.nibble11 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits2 uuid-color
scoreboard players operation nibble uuid-color /= #65536 uuid-color
execute store result storage uuid-color:main xor1.nibble12 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits2 uuid-color
scoreboard players operation nibble uuid-color /= #4096 uuid-color
execute store result storage uuid-color:main xor1.nibble13 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits2 uuid-color
scoreboard players operation nibble uuid-color /= #256 uuid-color
execute store result storage uuid-color:main xor1.nibble14 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits2 uuid-color
scoreboard players operation nibble uuid-color /= #16 uuid-color
execute store result storage uuid-color:main xor1.nibble15 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits2 uuid-color
execute store result storage uuid-color:main xor1.nibble16 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color

scoreboard players operation nibble uuid-color = bits3 uuid-color
scoreboard players operation nibble uuid-color /= #268435456 uuid-color
execute if score uuid3 uuid-color matches ..-1 run scoreboard players add nibble uuid-color 8
execute store result storage uuid-color:main xor1.nibble17 byte 1 run scoreboard players get nibble uuid-color
scoreboard players operation nibble uuid-color = bits3 uuid-color
scoreboard players operation nibble uuid-color /= #16777216 uuid-color
execute store result storage uuid-color:main xor1.nibble18 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits3 uuid-color
scoreboard players operation nibble uuid-color /= #1048576 uuid-color
execute store result storage uuid-color:main xor1.nibble19 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits3 uuid-color
scoreboard players operation nibble uuid-color /= #65536 uuid-color
execute store result storage uuid-color:main xor1.nibble20 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits3 uuid-color
scoreboard players operation nibble uuid-color /= #4096 uuid-color
execute store result storage uuid-color:main xor1.nibble21 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits3 uuid-color
scoreboard players operation nibble uuid-color /= #256 uuid-color
execute store result storage uuid-color:main xor1.nibble22 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits3 uuid-color
scoreboard players operation nibble uuid-color /= #16 uuid-color
execute store result storage uuid-color:main xor1.nibble23 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits3 uuid-color
execute store result storage uuid-color:main xor1.nibble24 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color

scoreboard players operation nibble uuid-color = bits4 uuid-color
scoreboard players operation nibble uuid-color /= #268435456 uuid-color
execute if score uuid4 uuid-color matches ..-1 run scoreboard players add nibble uuid-color 8
execute store result storage uuid-color:main xor1.nibble25 byte 1 run scoreboard players get nibble uuid-color
scoreboard players operation nibble uuid-color = bits4 uuid-color
scoreboard players operation nibble uuid-color /= #16777216 uuid-color
execute store result storage uuid-color:main xor1.nibble26 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits4 uuid-color
scoreboard players operation nibble uuid-color /= #1048576 uuid-color
execute store result storage uuid-color:main xor1.nibble27 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits4 uuid-color
scoreboard players operation nibble uuid-color /= #65536 uuid-color
execute store result storage uuid-color:main xor1.nibble28 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits4 uuid-color
scoreboard players operation nibble uuid-color /= #4096 uuid-color
execute store result storage uuid-color:main xor1.nibble29 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits4 uuid-color
scoreboard players operation nibble uuid-color /= #256 uuid-color
execute store result storage uuid-color:main xor1.nibble30 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits4 uuid-color
scoreboard players operation nibble uuid-color /= #16 uuid-color
execute store result storage uuid-color:main xor1.nibble31 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = bits4 uuid-color
execute store result storage uuid-color:main xor1.nibble32 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color

function uuid-color:xor1 with storage uuid-color:main xor1
function uuid-color:xor2 with storage uuid-color:main xor2

scoreboard players set hash uuid-color 0
scoreboard players operation hash uuid-color += nibble1 uuid-color
scoreboard players operation hash uuid-color += nibble2 uuid-color
scoreboard players operation hash uuid-color += nibble3 uuid-color
scoreboard players operation hash uuid-color += nibble4 uuid-color
scoreboard players operation hash uuid-color += nibble5 uuid-color
scoreboard players operation hash uuid-color += nibble6 uuid-color
scoreboard players operation hash uuid-color += nibble7 uuid-color
scoreboard players operation hash uuid-color += nibble8 uuid-color
