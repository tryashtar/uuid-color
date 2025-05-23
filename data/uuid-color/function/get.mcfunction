# first, hash the UUID
# the four integers are simply XOR'd together to get an ARGB integer
execute store result score uuid1 uuid-color run data get storage uuid-color:main uuid[0]
execute store result score uuid2 uuid-color run data get storage uuid-color:main uuid[1]
execute store result score uuid3 uuid-color run data get storage uuid-color:main uuid[2]
execute store result score uuid4 uuid-color run data get storage uuid-color:main uuid[3]

# the alpha channel is unused
# so we can use modulo to mask away the first byte of each int
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
scoreboard players operation uuid1 uuid-color %= #16777216 uuid-color
scoreboard players operation uuid2 uuid-color %= #16777216 uuid-color
scoreboard players operation uuid3 uuid-color %= #16777216 uuid-color
scoreboard players operation uuid4 uuid-color %= #16777216 uuid-color

# the other three bytes determine the red, green, and blue channels
scoreboard players set red uuid-color 0
scoreboard players set green uuid-color 0
scoreboard players set blue uuid-color 0

# simple XOR implementation
# basically go bit by bit, and write the relevant bit in the output if an odd number of input bits are set
# uses a lot of commands, but outperforms a previous macro lookup table implementation
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 8388608.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 8388608.. run scoreboard players remove uuid1 uuid-color 8388608
execute if score uuid2 uuid-color matches 8388608.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 8388608.. run scoreboard players remove uuid2 uuid-color 8388608
execute if score uuid3 uuid-color matches 8388608.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 8388608.. run scoreboard players remove uuid3 uuid-color 8388608
execute if score uuid4 uuid-color matches 8388608.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 8388608.. run scoreboard players remove uuid4 uuid-color 8388608
execute if score parity uuid-color matches -1 run scoreboard players add red uuid-color 128
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 4194304.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 4194304.. run scoreboard players remove uuid1 uuid-color 4194304
execute if score uuid2 uuid-color matches 4194304.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 4194304.. run scoreboard players remove uuid2 uuid-color 4194304
execute if score uuid3 uuid-color matches 4194304.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 4194304.. run scoreboard players remove uuid3 uuid-color 4194304
execute if score uuid4 uuid-color matches 4194304.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 4194304.. run scoreboard players remove uuid4 uuid-color 4194304
execute if score parity uuid-color matches -1 run scoreboard players add red uuid-color 64
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 2097152.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 2097152.. run scoreboard players remove uuid1 uuid-color 2097152
execute if score uuid2 uuid-color matches 2097152.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 2097152.. run scoreboard players remove uuid2 uuid-color 2097152
execute if score uuid3 uuid-color matches 2097152.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 2097152.. run scoreboard players remove uuid3 uuid-color 2097152
execute if score uuid4 uuid-color matches 2097152.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 2097152.. run scoreboard players remove uuid4 uuid-color 2097152
execute if score parity uuid-color matches -1 run scoreboard players add red uuid-color 32
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 1048576.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 1048576.. run scoreboard players remove uuid1 uuid-color 1048576
execute if score uuid2 uuid-color matches 1048576.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 1048576.. run scoreboard players remove uuid2 uuid-color 1048576
execute if score uuid3 uuid-color matches 1048576.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 1048576.. run scoreboard players remove uuid3 uuid-color 1048576
execute if score uuid4 uuid-color matches 1048576.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 1048576.. run scoreboard players remove uuid4 uuid-color 1048576
execute if score parity uuid-color matches -1 run scoreboard players add red uuid-color 16
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 524288.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 524288.. run scoreboard players remove uuid1 uuid-color 524288
execute if score uuid2 uuid-color matches 524288.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 524288.. run scoreboard players remove uuid2 uuid-color 524288
execute if score uuid3 uuid-color matches 524288.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 524288.. run scoreboard players remove uuid3 uuid-color 524288
execute if score uuid4 uuid-color matches 524288.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 524288.. run scoreboard players remove uuid4 uuid-color 524288
execute if score parity uuid-color matches -1 run scoreboard players add red uuid-color 8
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 262144.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 262144.. run scoreboard players remove uuid1 uuid-color 262144
execute if score uuid2 uuid-color matches 262144.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 262144.. run scoreboard players remove uuid2 uuid-color 262144
execute if score uuid3 uuid-color matches 262144.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 262144.. run scoreboard players remove uuid3 uuid-color 262144
execute if score uuid4 uuid-color matches 262144.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 262144.. run scoreboard players remove uuid4 uuid-color 262144
execute if score parity uuid-color matches -1 run scoreboard players add red uuid-color 4
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 131072.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 131072.. run scoreboard players remove uuid1 uuid-color 131072
execute if score uuid2 uuid-color matches 131072.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 131072.. run scoreboard players remove uuid2 uuid-color 131072
execute if score uuid3 uuid-color matches 131072.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 131072.. run scoreboard players remove uuid3 uuid-color 131072
execute if score uuid4 uuid-color matches 131072.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 131072.. run scoreboard players remove uuid4 uuid-color 131072
execute if score parity uuid-color matches -1 run scoreboard players add red uuid-color 2
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 65536.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 65536.. run scoreboard players remove uuid1 uuid-color 65536
execute if score uuid2 uuid-color matches 65536.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 65536.. run scoreboard players remove uuid2 uuid-color 65536
execute if score uuid3 uuid-color matches 65536.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 65536.. run scoreboard players remove uuid3 uuid-color 65536
execute if score uuid4 uuid-color matches 65536.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 65536.. run scoreboard players remove uuid4 uuid-color 65536
execute if score parity uuid-color matches -1 run scoreboard players add red uuid-color 1

scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 32768.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 32768.. run scoreboard players remove uuid1 uuid-color 32768
execute if score uuid2 uuid-color matches 32768.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 32768.. run scoreboard players remove uuid2 uuid-color 32768
execute if score uuid3 uuid-color matches 32768.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 32768.. run scoreboard players remove uuid3 uuid-color 32768
execute if score uuid4 uuid-color matches 32768.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 32768.. run scoreboard players remove uuid4 uuid-color 32768
execute if score parity uuid-color matches -1 run scoreboard players add green uuid-color 128
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 16384.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 16384.. run scoreboard players remove uuid1 uuid-color 16384
execute if score uuid2 uuid-color matches 16384.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 16384.. run scoreboard players remove uuid2 uuid-color 16384
execute if score uuid3 uuid-color matches 16384.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 16384.. run scoreboard players remove uuid3 uuid-color 16384
execute if score uuid4 uuid-color matches 16384.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 16384.. run scoreboard players remove uuid4 uuid-color 16384
execute if score parity uuid-color matches -1 run scoreboard players add green uuid-color 64
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 8192.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 8192.. run scoreboard players remove uuid1 uuid-color 8192
execute if score uuid2 uuid-color matches 8192.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 8192.. run scoreboard players remove uuid2 uuid-color 8192
execute if score uuid3 uuid-color matches 8192.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 8192.. run scoreboard players remove uuid3 uuid-color 8192
execute if score uuid4 uuid-color matches 8192.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 8192.. run scoreboard players remove uuid4 uuid-color 8192
execute if score parity uuid-color matches -1 run scoreboard players add green uuid-color 32
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 4096.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 4096.. run scoreboard players remove uuid1 uuid-color 4096
execute if score uuid2 uuid-color matches 4096.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 4096.. run scoreboard players remove uuid2 uuid-color 4096
execute if score uuid3 uuid-color matches 4096.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 4096.. run scoreboard players remove uuid3 uuid-color 4096
execute if score uuid4 uuid-color matches 4096.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 4096.. run scoreboard players remove uuid4 uuid-color 4096
execute if score parity uuid-color matches -1 run scoreboard players add green uuid-color 16
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 2048.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 2048.. run scoreboard players remove uuid1 uuid-color 2048
execute if score uuid2 uuid-color matches 2048.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 2048.. run scoreboard players remove uuid2 uuid-color 2048
execute if score uuid3 uuid-color matches 2048.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 2048.. run scoreboard players remove uuid3 uuid-color 2048
execute if score uuid4 uuid-color matches 2048.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 2048.. run scoreboard players remove uuid4 uuid-color 2048
execute if score parity uuid-color matches -1 run scoreboard players add green uuid-color 8
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 1024.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 1024.. run scoreboard players remove uuid1 uuid-color 1024
execute if score uuid2 uuid-color matches 1024.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 1024.. run scoreboard players remove uuid2 uuid-color 1024
execute if score uuid3 uuid-color matches 1024.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 1024.. run scoreboard players remove uuid3 uuid-color 1024
execute if score uuid4 uuid-color matches 1024.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 1024.. run scoreboard players remove uuid4 uuid-color 1024
execute if score parity uuid-color matches -1 run scoreboard players add green uuid-color 4
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 512.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 512.. run scoreboard players remove uuid1 uuid-color 512
execute if score uuid2 uuid-color matches 512.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 512.. run scoreboard players remove uuid2 uuid-color 512
execute if score uuid3 uuid-color matches 512.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 512.. run scoreboard players remove uuid3 uuid-color 512
execute if score uuid4 uuid-color matches 512.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 512.. run scoreboard players remove uuid4 uuid-color 512
execute if score parity uuid-color matches -1 run scoreboard players add green uuid-color 2
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 256.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 256.. run scoreboard players remove uuid1 uuid-color 256
execute if score uuid2 uuid-color matches 256.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 256.. run scoreboard players remove uuid2 uuid-color 256
execute if score uuid3 uuid-color matches 256.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 256.. run scoreboard players remove uuid3 uuid-color 256
execute if score uuid4 uuid-color matches 256.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 256.. run scoreboard players remove uuid4 uuid-color 256
execute if score parity uuid-color matches -1 run scoreboard players add green uuid-color 1

scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 128.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 128.. run scoreboard players remove uuid1 uuid-color 128
execute if score uuid2 uuid-color matches 128.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 128.. run scoreboard players remove uuid2 uuid-color 128
execute if score uuid3 uuid-color matches 128.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 128.. run scoreboard players remove uuid3 uuid-color 128
execute if score uuid4 uuid-color matches 128.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 128.. run scoreboard players remove uuid4 uuid-color 128
execute if score parity uuid-color matches -1 run scoreboard players add blue uuid-color 128
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 64.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 64.. run scoreboard players remove uuid1 uuid-color 64
execute if score uuid2 uuid-color matches 64.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 64.. run scoreboard players remove uuid2 uuid-color 64
execute if score uuid3 uuid-color matches 64.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 64.. run scoreboard players remove uuid3 uuid-color 64
execute if score uuid4 uuid-color matches 64.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 64.. run scoreboard players remove uuid4 uuid-color 64
execute if score parity uuid-color matches -1 run scoreboard players add blue uuid-color 64
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 32.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 32.. run scoreboard players remove uuid1 uuid-color 32
execute if score uuid2 uuid-color matches 32.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 32.. run scoreboard players remove uuid2 uuid-color 32
execute if score uuid3 uuid-color matches 32.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 32.. run scoreboard players remove uuid3 uuid-color 32
execute if score uuid4 uuid-color matches 32.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 32.. run scoreboard players remove uuid4 uuid-color 32
execute if score parity uuid-color matches -1 run scoreboard players add blue uuid-color 32
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 16.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 16.. run scoreboard players remove uuid1 uuid-color 16
execute if score uuid2 uuid-color matches 16.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 16.. run scoreboard players remove uuid2 uuid-color 16
execute if score uuid3 uuid-color matches 16.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 16.. run scoreboard players remove uuid3 uuid-color 16
execute if score uuid4 uuid-color matches 16.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 16.. run scoreboard players remove uuid4 uuid-color 16
execute if score parity uuid-color matches -1 run scoreboard players add blue uuid-color 16
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 8.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 8.. run scoreboard players remove uuid1 uuid-color 8
execute if score uuid2 uuid-color matches 8.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 8.. run scoreboard players remove uuid2 uuid-color 8
execute if score uuid3 uuid-color matches 8.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 8.. run scoreboard players remove uuid3 uuid-color 8
execute if score uuid4 uuid-color matches 8.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 8.. run scoreboard players remove uuid4 uuid-color 8
execute if score parity uuid-color matches -1 run scoreboard players add blue uuid-color 8
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 4.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 4.. run scoreboard players remove uuid1 uuid-color 4
execute if score uuid2 uuid-color matches 4.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 4.. run scoreboard players remove uuid2 uuid-color 4
execute if score uuid3 uuid-color matches 4.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 4.. run scoreboard players remove uuid3 uuid-color 4
execute if score uuid4 uuid-color matches 4.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 4.. run scoreboard players remove uuid4 uuid-color 4
execute if score parity uuid-color matches -1 run scoreboard players add blue uuid-color 4
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 2.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid1 uuid-color matches 2.. run scoreboard players remove uuid1 uuid-color 2
execute if score uuid2 uuid-color matches 2.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 2.. run scoreboard players remove uuid2 uuid-color 2
execute if score uuid3 uuid-color matches 2.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 2.. run scoreboard players remove uuid3 uuid-color 2
execute if score uuid4 uuid-color matches 2.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 2.. run scoreboard players remove uuid4 uuid-color 2
execute if score parity uuid-color matches -1 run scoreboard players add blue uuid-color 2
scoreboard players set parity uuid-color 1
execute if score uuid1 uuid-color matches 1.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid2 uuid-color matches 1.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid3 uuid-color matches 1.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score uuid4 uuid-color matches 1.. run scoreboard players operation parity uuid-color *= #-1 uuid-color
execute if score parity uuid-color matches -1 run scoreboard players add blue uuid-color 1

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
