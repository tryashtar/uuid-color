# first, hash the UUID
# the formula is (int1 XOR int3) XOR (int2 XOR int4)
execute store result score uuid1 uuid-color run data get storage uuid-color:main uuid[0]
execute store result score uuid2 uuid-color run data get storage uuid-color:main uuid[1]
execute store result score uuid3 uuid-color run data get storage uuid-color:main uuid[2]
execute store result score uuid4 uuid-color run data get storage uuid-color:main uuid[3]

# to calculate XOR, we can use a macro lookup table for every combination of inputs
# so we need to break these 4 large ints into smaller values
# I chose nibbles, so 8 values between 0 and 15 per int
# we can use arithmetic divides and modulo to shift and mask the desired bits
# unfortunately, negative numbers don't work with this kind of shifting
# we need to force them to be positive while preserving the bit pattern
# so we add 2147483648 to set the most significant bit to 0
execute if score uuid1 uuid-color matches ..-1 run scoreboard players add uuid1 uuid-color 1
execute if score uuid1 uuid-color matches ..0 run scoreboard players add uuid1 uuid-color 2147483647
execute if score uuid2 uuid-color matches ..-1 run scoreboard players add uuid2 uuid-color 1
execute if score uuid2 uuid-color matches ..0 run scoreboard players add uuid2 uuid-color 2147483647
execute if score uuid3 uuid-color matches ..-1 run scoreboard players add uuid3 uuid-color 1
execute if score uuid3 uuid-color matches ..0 run scoreboard players add uuid3 uuid-color 2147483647
execute if score uuid4 uuid-color matches ..-1 run scoreboard players add uuid4 uuid-color 1
execute if score uuid4 uuid-color matches ..0 run scoreboard players add uuid4 uuid-color 2147483647

# the first byte of the final hash is treated as alpha and ultimately discarded
# therefore, we don't need to bother extracting the first two nibbles of each int
# this also means restoring the most significant bit for negative numbers is also not required
scoreboard players operation nibble uuid-color = uuid1 uuid-color
scoreboard players operation nibble uuid-color /= #1048576 uuid-color
execute store result storage uuid-color:main xor1.nibble3 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid1 uuid-color
scoreboard players operation nibble uuid-color /= #65536 uuid-color
execute store result storage uuid-color:main xor1.nibble4 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid1 uuid-color
scoreboard players operation nibble uuid-color /= #4096 uuid-color
execute store result storage uuid-color:main xor1.nibble5 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid1 uuid-color
scoreboard players operation nibble uuid-color /= #256 uuid-color
execute store result storage uuid-color:main xor1.nibble6 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid1 uuid-color
scoreboard players operation nibble uuid-color /= #16 uuid-color
execute store result storage uuid-color:main xor1.nibble7 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid1 uuid-color
execute store result storage uuid-color:main xor1.nibble8 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color

scoreboard players operation nibble uuid-color = uuid2 uuid-color
scoreboard players operation nibble uuid-color /= #1048576 uuid-color
execute store result storage uuid-color:main xor1.nibble11 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid2 uuid-color
scoreboard players operation nibble uuid-color /= #65536 uuid-color
execute store result storage uuid-color:main xor1.nibble12 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid2 uuid-color
scoreboard players operation nibble uuid-color /= #4096 uuid-color
execute store result storage uuid-color:main xor1.nibble13 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid2 uuid-color
scoreboard players operation nibble uuid-color /= #256 uuid-color
execute store result storage uuid-color:main xor1.nibble14 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid2 uuid-color
scoreboard players operation nibble uuid-color /= #16 uuid-color
execute store result storage uuid-color:main xor1.nibble15 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid2 uuid-color
execute store result storage uuid-color:main xor1.nibble16 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color

scoreboard players operation nibble uuid-color = uuid3 uuid-color
scoreboard players operation nibble uuid-color /= #1048576 uuid-color
execute store result storage uuid-color:main xor1.nibble19 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid3 uuid-color
scoreboard players operation nibble uuid-color /= #65536 uuid-color
execute store result storage uuid-color:main xor1.nibble20 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid3 uuid-color
scoreboard players operation nibble uuid-color /= #4096 uuid-color
execute store result storage uuid-color:main xor1.nibble21 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid3 uuid-color
scoreboard players operation nibble uuid-color /= #256 uuid-color
execute store result storage uuid-color:main xor1.nibble22 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid3 uuid-color
scoreboard players operation nibble uuid-color /= #16 uuid-color
execute store result storage uuid-color:main xor1.nibble23 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid3 uuid-color
execute store result storage uuid-color:main xor1.nibble24 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color

scoreboard players operation nibble uuid-color = uuid4 uuid-color
scoreboard players operation nibble uuid-color /= #1048576 uuid-color
execute store result storage uuid-color:main xor1.nibble27 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid4 uuid-color
scoreboard players operation nibble uuid-color /= #65536 uuid-color
execute store result storage uuid-color:main xor1.nibble28 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid4 uuid-color
scoreboard players operation nibble uuid-color /= #4096 uuid-color
execute store result storage uuid-color:main xor1.nibble29 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid4 uuid-color
scoreboard players operation nibble uuid-color /= #256 uuid-color
execute store result storage uuid-color:main xor1.nibble30 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid4 uuid-color
scoreboard players operation nibble uuid-color /= #16 uuid-color
execute store result storage uuid-color:main xor1.nibble31 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color
scoreboard players operation nibble uuid-color = uuid4 uuid-color
execute store result storage uuid-color:main xor1.nibble32 byte 1 run scoreboard players operation nibble uuid-color %= #16 uuid-color

# the nibbles are extracted, pass them into the lookup table
# then one more time to combine them into the red, green, and blue bytes
function uuid-color:xor1 with storage uuid-color:main xor1
function uuid-color:xor2 with storage uuid-color:main xor2

# next, we set the color's brightness to 90%
# this involves converting from RGB to HSV and back
# the algorithm is standard, with some small adjustments to accommodate integer arithmetic
# while the hash step is exact, this process does introduce small rounding discrepancies
scoreboard players operation max uuid-color = red uuid-color
execute if score green uuid-color > max uuid-color run scoreboard players operation max uuid-color = green uuid-color
execute if score blue uuid-color > max uuid-color run scoreboard players operation max uuid-color = blue uuid-color
scoreboard players operation min uuid-color = red uuid-color
execute if score green uuid-color < min uuid-color run scoreboard players operation min uuid-color = green uuid-color
execute if score blue uuid-color < min uuid-color run scoreboard players operation min uuid-color = blue uuid-color

scoreboard players operation range uuid-color = max uuid-color
scoreboard players operation range uuid-color -= min uuid-color
scoreboard players operation saturation uuid-color = range uuid-color
scoreboard players operation saturation uuid-color *= #256 uuid-color
scoreboard players operation saturation uuid-color /= max uuid-color

# if this color is pure gray, we immediately know what 90% gray looks like and can exit
execute if score saturation uuid-color matches 0 run return run scoreboard players set color uuid-color 15132390

execute if score red uuid-color = max uuid-color run scoreboard players operation hue uuid-color = green uuid-color
execute if score red uuid-color = max uuid-color run scoreboard players operation hue uuid-color -= blue uuid-color
execute if score green uuid-color = max uuid-color run scoreboard players operation hue uuid-color = blue uuid-color
execute if score green uuid-color = max uuid-color run scoreboard players operation hue uuid-color -= red uuid-color
execute if score blue uuid-color = max uuid-color run scoreboard players operation hue uuid-color = red uuid-color
execute if score blue uuid-color = max uuid-color run scoreboard players operation hue uuid-color -= green uuid-color
scoreboard players operation hue uuid-color *= #256 uuid-color
scoreboard players operation hue uuid-color /= range uuid-color
execute if score red uuid-color = max uuid-color if score green uuid-color < blue uuid-color run scoreboard players add hue uuid-color 1536
execute if score green uuid-color = max uuid-color run scoreboard players add hue uuid-color 512
execute if score blue uuid-color = max uuid-color run scoreboard players add hue uuid-color 1024

# at least one color will always be 230
# replace the others with calculated values
scoreboard players set red uuid-color 230
scoreboard players set green uuid-color 230
scoreboard players set blue uuid-color 230

scoreboard players operation col1 uuid-color = hue uuid-color
scoreboard players operation col1 uuid-color %= #256 uuid-color
scoreboard players set col2 uuid-color 256
scoreboard players operation col2 uuid-color -= saturation uuid-color
scoreboard players operation col2 uuid-color *= #9 uuid-color
scoreboard players operation col2 uuid-color /= #10 uuid-color
scoreboard players set col3 uuid-color 256
scoreboard players operation temp uuid-color = col1 uuid-color
scoreboard players operation temp uuid-color *= saturation uuid-color
scoreboard players operation temp uuid-color /= #256 uuid-color
scoreboard players operation col3 uuid-color -= temp uuid-color
scoreboard players operation col3 uuid-color *= #9 uuid-color
scoreboard players operation col3 uuid-color /= #10 uuid-color
scoreboard players set col4 uuid-color 256
scoreboard players set temp uuid-color 256
scoreboard players operation temp uuid-color -= col1 uuid-color
scoreboard players operation temp uuid-color *= saturation uuid-color
scoreboard players operation temp uuid-color /= #256 uuid-color
scoreboard players operation col4 uuid-color -= temp uuid-color
scoreboard players operation col4 uuid-color *= #9 uuid-color
scoreboard players operation col4 uuid-color /= #10 uuid-color

execute if score hue uuid-color matches ..256 run scoreboard players operation green uuid-color = col4 uuid-color
execute if score hue uuid-color matches ..256 run scoreboard players operation blue uuid-color = col2 uuid-color
execute if score hue uuid-color matches 257..512 run scoreboard players operation red uuid-color = col3 uuid-color
execute if score hue uuid-color matches 257..512 run scoreboard players operation blue uuid-color = col2 uuid-color
execute if score hue uuid-color matches 513..768 run scoreboard players operation red uuid-color = col2 uuid-color
execute if score hue uuid-color matches 513..768 run scoreboard players operation blue uuid-color = col4 uuid-color
execute if score hue uuid-color matches 769..1024 run scoreboard players operation red uuid-color = col2 uuid-color
execute if score hue uuid-color matches 769..1024 run scoreboard players operation green uuid-color = col3 uuid-color
execute if score hue uuid-color matches 1025..1280 run scoreboard players operation red uuid-color = col4 uuid-color
execute if score hue uuid-color matches 1025..1280 run scoreboard players operation green uuid-color = col2 uuid-color
execute if score hue uuid-color matches 1281.. run scoreboard players operation green uuid-color = col2 uuid-color
execute if score hue uuid-color matches 1281.. run scoreboard players operation blue uuid-color = col3 uuid-color

# reassemble the final color for use elsewhere
scoreboard players operation color uuid-color = red uuid-color
scoreboard players operation color uuid-color *= #256 uuid-color
scoreboard players operation color uuid-color += green uuid-color
scoreboard players operation color uuid-color *= #256 uuid-color
scoreboard players operation color uuid-color += blue uuid-color
