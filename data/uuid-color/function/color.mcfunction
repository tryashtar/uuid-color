scoreboard players operation bits uuid-color = hash uuid-color
# set the most significant bit to 0 again
# we don't care about alpha this time, so no need to preserve it
execute if score hash uuid-color matches ..-1 run scoreboard players add bits uuid-color 2147483647
execute if score hash uuid-color matches ..-1 run scoreboard players add bits uuid-color 1

scoreboard players operation red uuid-color = bits uuid-color
scoreboard players operation red uuid-color /= #65536 uuid-color
scoreboard players operation red uuid-color %= #256 uuid-color
scoreboard players operation green uuid-color = bits uuid-color
scoreboard players operation green uuid-color /= #256 uuid-color
scoreboard players operation green uuid-color %= #256 uuid-color
scoreboard players operation blue uuid-color = bits uuid-color
scoreboard players operation blue uuid-color %= #256 uuid-color

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

scoreboard players operation color uuid-color = red uuid-color
scoreboard players operation color uuid-color *= #256 uuid-color
scoreboard players operation color uuid-color += green uuid-color
scoreboard players operation color uuid-color *= #256 uuid-color
scoreboard players operation color uuid-color += blue uuid-color
