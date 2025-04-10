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
scoreboard players operation bright uuid-color = range uuid-color
scoreboard players operation bright uuid-color *= #256 uuid-color
scoreboard players operation bright uuid-color /= max uuid-color

execute if score bright uuid-color matches 0 run return run scoreboard players set color uuid-color 15132390

scoreboard players operation red_range uuid-color = max uuid-color
scoreboard players operation red_range uuid-color -= red uuid-color
scoreboard players operation red_range uuid-color *= #256 uuid-color
scoreboard players operation red_range uuid-color /= range uuid-color
scoreboard players operation green_range uuid-color = max uuid-color
scoreboard players operation green_range uuid-color -= green uuid-color
scoreboard players operation green_range uuid-color *= #256 uuid-color
scoreboard players operation green_range uuid-color /= range uuid-color
scoreboard players operation blue_range uuid-color = max uuid-color
scoreboard players operation blue_range uuid-color -= blue uuid-color
scoreboard players operation blue_range uuid-color *= #256 uuid-color
scoreboard players operation blue_range uuid-color /= range uuid-color

execute if score red uuid-color = max uuid-color run scoreboard players operation hue uuid-color = blue_range uuid-color
execute if score red uuid-color = max uuid-color run scoreboard players operation hue uuid-color -= green_range uuid-color
execute if score green uuid-color = max uuid-color run scoreboard players operation hue uuid-color = red_range uuid-color
execute if score green uuid-color = max uuid-color run scoreboard players operation hue uuid-color -= blue_range uuid-color
execute if score green uuid-color = max uuid-color run scoreboard players add hue uuid-color 512
execute if score blue uuid-color = max uuid-color run scoreboard players operation hue uuid-color = green_range uuid-color
execute if score blue uuid-color = max uuid-color run scoreboard players operation hue uuid-color -= red_range uuid-color
execute if score blue uuid-color = max uuid-color run scoreboard players add hue uuid-color 1024
scoreboard players operation hue uuid-color /= #6 uuid-color
execute if score hue uuid-color matches ..-1 run scoreboard players add hue uuid-color 256
scoreboard players operation hue uuid-color %= #256 uuid-color

scoreboard players operation col1 uuid-color = hue uuid-color
scoreboard players operation col1 uuid-color *= #6 uuid-color
scoreboard players operation col2 uuid-color = col1 uuid-color
scoreboard players operation col2 uuid-color %= #256 uuid-color
scoreboard players set col3 uuid-color 256
scoreboard players operation col3 uuid-color -= bright uuid-color
scoreboard players operation col3 uuid-color *= #9 uuid-color
scoreboard players operation col3 uuid-color /= #10 uuid-color
scoreboard players set col4 uuid-color 256
scoreboard players operation temp uuid-color = bright uuid-color
scoreboard players operation temp uuid-color *= col2 uuid-color
scoreboard players operation temp uuid-color /= #256 uuid-color
scoreboard players operation col4 uuid-color -= temp uuid-color
scoreboard players set col5 uuid-color 256
scoreboard players set temp uuid-color 256
scoreboard players operation temp uuid-color -= col2 uuid-color
scoreboard players operation temp uuid-color *= bright uuid-color
scoreboard players operation temp uuid-color /= #256 uuid-color
scoreboard players operation col5 uuid-color -= temp uuid-color
scoreboard players operation col5 uuid-color *= #9 uuid-color
scoreboard players operation col5 uuid-color /= #10 uuid-color

execute if score hue uuid-color matches ..43 run scoreboard players set red uuid-color 230
execute if score hue uuid-color matches ..43 run scoreboard players operation green uuid-color = col5 uuid-color
execute if score hue uuid-color matches ..43 run scoreboard players operation blue uuid-color = col3 uuid-color

execute if score hue uuid-color matches 44..85 run scoreboard players operation red uuid-color = col4 uuid-color
execute if score hue uuid-color matches 44..85 run scoreboard players set green uuid-color 230
execute if score hue uuid-color matches 44..85 run scoreboard players operation blue uuid-color = col3 uuid-color

execute if score hue uuid-color matches 86..128 run scoreboard players operation red uuid-color = col3 uuid-color
execute if score hue uuid-color matches 86..128 run scoreboard players set green uuid-color 230
execute if score hue uuid-color matches 86..128 run scoreboard players operation blue uuid-color = col5 uuid-color

execute if score hue uuid-color matches 129..171 run scoreboard players operation red uuid-color = col3 uuid-color
execute if score hue uuid-color matches 129..171 run scoreboard players operation green uuid-color = col4 uuid-color
execute if score hue uuid-color matches 129..171 run scoreboard players set blue uuid-color 230

execute if score hue uuid-color matches 172..213 run scoreboard players operation red uuid-color = col5 uuid-color
execute if score hue uuid-color matches 172..213 run scoreboard players operation green uuid-color = col3 uuid-color
execute if score hue uuid-color matches 172..213 run scoreboard players set blue uuid-color 230

execute if score hue uuid-color matches 214.. run scoreboard players set red uuid-color 230
execute if score hue uuid-color matches 214.. run scoreboard players operation green uuid-color = col3 uuid-color
execute if score hue uuid-color matches 214.. run scoreboard players operation blue uuid-color = col4 uuid-color

scoreboard players operation color uuid-color = red uuid-color
scoreboard players operation color uuid-color *= #256 uuid-color
scoreboard players operation color uuid-color += green uuid-color
scoreboard players operation color uuid-color *= #256 uuid-color
scoreboard players operation color uuid-color += blue uuid-color
