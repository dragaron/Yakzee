---------------------------------------------------------------------------------------------------
--Yakzee, by dragaron------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------
--INITIALIZATION START-----------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
--Load default palette
color.loadpalette()

	--Setup directory
	if files.exists("samples/yakzee.lua") then
	dir = "samples/yakzee/"
	else
	dir = "resources/"
	end

	--Read from, or create if nonexistent, "config.ini" file
	if files.exists(dir .. "config.ini") then
	screen.print(10, 10, "Loading...")
	screen.flip()
	motion_control = tonumber(ini.read(dir .. "config.ini", "motion_control", 1))
	orientation = tonumber(ini.read(dir .. "config.ini", "orientation", 1))
	game_type = tonumber(ini.read(dir .. "config.ini", "game_type", 1))
	name01 = ini.read(dir .. "config.ini", "name01", "Player01")
	name02 = ini.read(dir .. "config.ini", "name02", "Player02")
	name03 = ini.read(dir .. "config.ini", "name03", "CPU")
	name04 = ini.read(dir .. "config.ini", "name04", "Ghost")
	name01_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name01_pic_orientation", 1))
	name02_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name02_pic_orientation", 1))
	name03_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name03_pic_orientation", 1))
	name04_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name04_pic_orientation", 1))
	ghost = {}
	ghost[0] = ini.read(dir .. "config.ini", "ghost[0]", "01020304050608091011121314")
		for i = 1, 15 do
		ghost[i] = tonumber(ini.read(dir .. "config.ini", "ghost[" .. i .. "]", 0))
		end
	record_win = tonumber(ini.read(dir .. "config.ini", "record_win", 0))
	record_loss = tonumber(ini.read(dir .. "config.ini", "record_loss", 0))
	record_draw = tonumber(ini.read(dir .. "config.ini", "record_draw", 0))
	theme_slot = tonumber(ini.read(dir .. "config.ini", "theme_slot", 0))
	themes = {}
		for i = 1, 10 do
		themes[i] = ini.read(dir .. "config.ini", "themes[" .. i .. "]", "255255255065255255255125090090090000255255255255255255255085255255255255255255255255000000000255255255255255255255255255000000000100000000000100")
		end
	else
	screen.print(10, 10, "Please wait while the 'config.ini' file is created (only happens once)...")
	screen.flip()
	ini.write(dir .. "config.ini", "motion_control", 1)
	motion_control = tonumber(ini.read(dir .. "config.ini", "motion_control", 1))
	ini.write(dir .. "config.ini", "orientation", 1)
	orientation = tonumber(ini.read(dir .. "config.ini", "orientation", 1))
	ini.write(dir .. "config.ini", "game_type", 1)
	game_type = tonumber(ini.read(dir .. "config.ini", "game_type", 1))
	ini.write(dir .. "config.ini", "name01", "Player01")
	name01 = ini.read(dir .. "config.ini", "name01", "Player01")
	ini.write(dir .. "config.ini", "name02", "Player02")
	name02 = ini.read(dir .. "config.ini", "name02", "Player02")
	ini.write(dir .. "config.ini", "name03", "CPU")
	name03 = ini.read(dir .. "config.ini", "name03", "CPU")
	ini.write(dir .. "config.ini", "name04", "Ghost")
	name04 = ini.read(dir .. "config.ini", "name04", "Ghost")
	ini.write(dir .. "config.ini", "name01_pic_orientation", 1)
	name01_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name01_pic_orientation", 1))
	ini.write(dir .. "config.ini", "name02_pic_orientation", 1)
	name02_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name02_pic_orientation", 1))
	ini.write(dir .. "config.ini", "name03_pic_orientation", 1)
	name03_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name03_pic_orientation", 1))
	ini.write(dir .. "config.ini", "name04_pic_orientation", 1)
	name04_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name04_pic_orientation", 1))
	ghost = {}
	ini.write(dir .. "config.ini", "ghost[0]", "01020304050608091011121314")
	ghost[0] = ini.read(dir .. "config.ini", "ghost[0]", "01020304050608091011121314")
		for i = 1, 15 do
		ghost[i] = 0
		ini.write(dir .. "config.ini", "ghost[" .. i .. "]", ghost[i])
		end
	ini.write(dir .. "config.ini", "record_win", 0)
	record_win = tonumber(ini.read(dir .. "config.ini", "record_win", 0))
	ini.write(dir .. "config.ini", "record_loss", 0)
	record_loss = tonumber(ini.read(dir .. "config.ini", "record_loss", 0))
	ini.write(dir .. "config.ini", "record_draw", 0)
	record_draw = tonumber(ini.read(dir .. "config.ini", "record_draw", 0))
	ini.write(dir .. "config.ini", "theme_slot", 0)
	theme_slot = tonumber(ini.read(dir .. "config.ini", "theme_slot", 0))
	themes = {}
	ini.write(dir .. "config.ini", "themes[" .. 1 .. "]", "000180000090255255255255000000000070255255190255000000000045165090000255220100000255000000000255255255255255255255255255000015000055000000000070")
	themes[1] = ini.read(dir .. "config.ini", "themes[" .. 1 .. "]", "000180000090255255255255000000000070190255190255000000000045165090000255220100000255000000000255255255255255255255255255000015000055000000000070")
	ini.write(dir .. "config.ini", "themes[" .. 2 .. "]", "255255255050255000000090000000000100255255255255080000000110255215210185255215210255000000000255255255255255125000000255255255255075000000000070")
	themes[2] = ini.read(dir .. "config.ini", "themes[" .. 2 .. "]", "255255255050255000000090000000000100255255255255080000000110255215210185255215210255000000000255255255255255125000000255255255255075000000000070")
	ini.write(dir .. "config.ini", "themes[" .. 3 .. "]", "255255255065255255255125090090090000255255255255255255255085255255255255255255255255000000000255255255255255255255255255000000000100000000000100")
	themes[3] = ini.read(dir .. "config.ini", "themes[" .. 3 .. "]", "255255255065255255255125090090090000255255255255255255255085255255255255255255255255000000000255255255255255255255255255000000000100000000000100")
	ini.write(dir .. "config.ini", "themes[" .. 4 .. "]", "175000245050255255255120175000245050255255255255195120190050255255180255255255180255000000000255255255255255255255255120105100110095255255255015")
	themes[4] = ini.read(dir .. "config.ini", "themes[" .. 4 .. "]", "175000245050255255255120175000245050255255255255195120190050255255180255255255180255000000000255255255255255255255255120105100110095255255255015")
	ini.write(dir .. "config.ini", "themes[" .. 5 .. "]", "000235255060255255255125255255255050255255255255255255255030235235200255235235200255000000000255255255255255255255255075180180160200000000000085")
	themes[5] = ini.read(dir .. "config.ini", "themes[" .. 5 .. "]", "000235255060255255255125255255255050255255255255255255255030235235200255235235200255000000000255255255255255255255255075180180160200000000000085")
	ini.write(dir .. "config.ini", "themes[" .. 6 .. "]", "255255255000255255255255255255255060255255255255255255255060155150150255200200200255000000000255255255255000255255255105200200200110255255255030")
	themes[6] = ini.read(dir .. "config.ini", "themes[" .. 6 .. "]", "255255255000255255255255255255255060255255255255255255255060155150150255200200200255000000000255255255255000255255255105200200200110255255255030")
	ini.write(dir .. "config.ini", "themes[" .. 7 .. "]", "170195115075255255255255110095055255255255255255090000000035230220145255230220145255000000000255255255255255255255255000170170000065000000000085")
	themes[7] = ini.read(dir .. "config.ini", "themes[" .. 7 .. "]", "170195115075255255255255110095055255255255255255090000000035230220145255230220145255000000000255255255255255255255255000170170000065000000000085")
	ini.write(dir .. "config.ini", "themes[" .. 8 .. "]", "030090070205255255255255000165115145255255255255255255255030255230135255185075090255255255255255255255255255000000000255000000000055000000000070")
	themes[8] = ini.read(dir .. "config.ini", "themes[" .. 8 .. "]", "030090070205255255255255000165115145255255255255255255255030255230135255185075090255255255255255255255255255000000000255000000000055000000000070")
	ini.write(dir .. "config.ini", "themes[" .. 9 .. "]", "165010120095255255255255000000000070255200130255000000000045230180115235205140095255000000000255255255255255230180115255000015000055000000000070")
	themes[9] = ini.read(dir .. "config.ini", "themes[" .. 9 .. "]", "165010120095255255255255000000000070255200130255000000000045230180115235205140095255000000000255255255255255230180115255000015000055000000000070")
	ini.write(dir .. "config.ini", "themes[" .. 10 .. "]", "150180230105255255255125255255255050255255255255255255255030210215200255210215200255000000000255255255255255255255255075100100100110000000000085")
	themes[10] = ini.read(dir .. "config.ini", "themes[" .. 10 .. "]", "150180230105255255255125255255255050255255255255255255255030210215200255210215200255000000000255255255255255255255255075100100100110000000000085")	
	end


--COLORS-------------------------------------------------------------------------------------------
theme_selector01 = color.new(0, 0, 0, 200)
theme_selector02 = color.new(255, 255, 255, 255)
theme_selector03 = color.new(255, 50, 50, 100)


--FONTS--------------------------------------------------------------------------------------------


--VFX----------------------------------------------------------------------------------------------


--SFX----------------------------------------------------------------------------------------------
sfx_shake = sound.load(dir .. "sfx_shake.mp3")
sfx_roll = sound.load(dir .. "sfx_roll.mp3")
sfx_switch = sound.load(dir .. "sfx_switch.mp3")


--BOOLEONS-----------------------------------------------------------------------------------------
shake = false


--VARIABLES----------------------------------------------------------------------------------------
edit_mode = 0
theme_x = 1
theme_y = 1
	if orientation == 1 then
	grab = "l"
	elseif orientation == 2 then
	grab = "r"
	end


--TABLES-------------------------------------------------------------------------------------------
txt_set = {
"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
"`","1","2","3","4","5","6","7","8","9","0","-","=","[","]","\\",";","'",",",".","/"," "," "," "," "," ",
"~","!","@","#","$","%","^","&","*","(",")","_","+","{","}","|",":",'"',"<",">","?"," "," "," "," "," ",
}

theme_RGBA = {}
local first = 1
local last = 3
	for i = 1, 480 do
	theme_RGBA[i] = tonumber(string.sub(table.concat(themes), first, last))
	first += 3
	last += 3
	end


--FUNCTIONS----------------------------------------------------------------------------------------
function load_vfx()
--VFX if orientation == 1
vfx_akzee_l = image.load(dir .. "vfx_akzee.png")
image.rotate(vfx_akzee_l, 270)
vfx_error_l = image.load(dir .. "vfx_error.png")
image.rotate(vfx_error_l, 270)
vfx_frame_l = image.load(dir .. "vfx_frame.png")
image.rotate(vfx_frame_l, 270)
vfx_l = image.load(dir .. "vfx_l.png")
image.rotate(vfx_l, 270)
vfx_l_outline = image.load(dir .. "vfx_l_outline.png")
image.rotate(vfx_l_outline, 270)
vfx_player01_turn_l = image.load(dir .. "vfx_player01_turn.png")
image.rotate(vfx_player01_turn_l, 270)
vfx_player02_turn_l = image.load(dir .. "vfx_player02_turn.png")
image.rotate(vfx_player02_turn_l, 270)
vfx_score_l = image.load(dir .. "vfx_score.png")
image.rotate(vfx_score_l, 270)
vfx_shadow_l = image.load(dir .. "vfx_shadow.png")
image.rotate(vfx_shadow_l, 270)
vfx_start_l = image.load(dir .. "vfx_start.png")
image.rotate(vfx_start_l, 270)
vfx_start_bg_l = image.load(dir .. "vfx_start_bg.png")
image.rotate(vfx_start_bg_l, 270)
vfx_txt_black01_l = image.load(dir .. "vfx_txt_black01.png")
image.rotate(vfx_txt_black01_l, 270)
vfx_txt_black02_l = image.load(dir .. "vfx_txt_black02.png")
image.rotate(vfx_txt_black02_l, 270)
vfx_txt_black03_l = image.load(dir .. "vfx_txt_black03.png")
image.rotate(vfx_txt_black03_l, 270)
vfx_txt_white01_l = image.load(dir .. "vfx_txt_white01.png")
image.rotate(vfx_txt_white01_l, 270)
vfx_txt_white02_l = image.load(dir .. "vfx_txt_white02.png")
image.rotate(vfx_txt_white02_l, 270)
vfx_txt_white03_l = image.load(dir .. "vfx_txt_white03.png")
image.rotate(vfx_txt_white03_l, 270)
vfx_yak_l = image.load(dir .. "vfx_yak.png")
image.rotate(vfx_yak_l, 270)
vfx_yak_bg_l = image.load(dir .. "vfx_yak_bg.png")
image.rotate(vfx_yak_bg_l, 270)
--VFX if orientation == 2
vfx_akzee_r = image.load(dir .. "vfx_akzee.png")
image.rotate(vfx_akzee_r, 90)
vfx_error_r = image.load(dir .. "vfx_error.png")
image.rotate(vfx_error_r, 90)
vfx_frame_r = image.load(dir .. "vfx_frame.png")
image.rotate(vfx_frame_r, 90)
vfx_r = image.load(dir .. "vfx_r.png")
image.rotate(vfx_r, 90)
vfx_r_outline = image.load(dir .. "vfx_r_outline.png")
image.rotate(vfx_r_outline, 90)
vfx_player01_turn_r = image.load(dir .. "vfx_player01_turn.png")
image.rotate(vfx_player01_turn_r, 90)
vfx_player02_turn_r = image.load(dir .. "vfx_player02_turn.png")
image.rotate(vfx_player02_turn_r, 90)
vfx_score_r = image.load(dir .. "vfx_score.png")
image.rotate(vfx_score_r, 90)
vfx_shadow_r = image.load(dir .. "vfx_shadow.png")
image.rotate(vfx_shadow_r, 90)
vfx_start_r = image.load(dir .. "vfx_start.png")
image.rotate(vfx_start_r, 90)
vfx_start_bg_r = image.load(dir .. "vfx_start_bg.png")
image.rotate(vfx_start_bg_r, 90)
vfx_txt_black01_r = image.load(dir .. "vfx_txt_black01.png")
image.rotate(vfx_txt_black01_r, 90)
vfx_txt_black02_r = image.load(dir .. "vfx_txt_black02.png")
image.rotate(vfx_txt_black02_r, 90)
vfx_txt_black03_r = image.load(dir .. "vfx_txt_black03.png")
image.rotate(vfx_txt_black03_r, 90)
vfx_txt_white01_r = image.load(dir .. "vfx_txt_white01.png")
image.rotate(vfx_txt_white01_r, 90)
vfx_txt_white02_r = image.load(dir .. "vfx_txt_white02.png")
image.rotate(vfx_txt_white02_r, 90)
vfx_txt_white03_r = image.load(dir .. "vfx_txt_white03.png")
image.rotate(vfx_txt_white03_r, 90)
vfx_yak_r = image.load(dir .. "vfx_yak.png")
image.rotate(vfx_yak_r, 90)
vfx_yak_bg_r = image.load(dir .. "vfx_yak_bg.png")
image.rotate(vfx_yak_bg_r, 90)
vfx_dice = image.load(dir .. "vfx_dice.png")
vfx_dot = image.load(dir .. "vfx_dot.png")
vfx_hold = image.load(dir .. "vfx_hold.png")
end

function load_pics()
vfx_name01_pic_l = image.load(dir .. "vfx_name01_pic.png")
image.resize(vfx_name01_pic_l, 88, 66)
vfx_name02_pic_l = image.load(dir .. "vfx_name02_pic.png")
image.resize(vfx_name02_pic_l, 88, 66)
vfx_name03_pic_l = image.load(dir .. "vfx_name03_pic.png")
image.resize(vfx_name03_pic_l, 88, 66)
vfx_name04_pic_l = image.load(dir .. "vfx_name04_pic.png")
image.resize(vfx_name04_pic_l, 88, 66)
	if name01_pic_orientation == 2 then
	image.fliph(vfx_name01_pic_l)
	image.flipv(vfx_name01_pic_l)
	end
	if name02_pic_orientation == 2 then
	image.fliph(vfx_name02_pic_l)
	image.flipv(vfx_name02_pic_l)
	end
	if name03_pic_orientation == 2 then
	image.fliph(vfx_name03_pic_l)
	image.flipv(vfx_name03_pic_l)
	end
	if name04_pic_orientation == 2 then
	image.fliph(vfx_name04_pic_l)
	image.flipv(vfx_name04_pic_l)
	end
vfx_name01_pic_r = image.load(dir .. "vfx_name01_pic.png")
image.resize(vfx_name01_pic_r, 88, 66)
vfx_name02_pic_r = image.load(dir .. "vfx_name02_pic.png")
image.resize(vfx_name02_pic_r, 88, 66)
vfx_name03_pic_r = image.load(dir .. "vfx_name03_pic.png")
image.resize(vfx_name03_pic_r, 88, 66)
vfx_name04_pic_r = image.load(dir .. "vfx_name04_pic.png")
image.resize(vfx_name04_pic_r, 88, 66)
	if name01_pic_orientation == 1 then
	image.fliph(vfx_name01_pic_r)
	image.flipv(vfx_name01_pic_r)
	end
	if name02_pic_orientation == 1 then
	image.fliph(vfx_name02_pic_r)
	image.flipv(vfx_name02_pic_r)
	end
	if name03_pic_orientation == 1 then
	image.fliph(vfx_name03_pic_r)
	image.flipv(vfx_name03_pic_r)
	end
	if name04_pic_orientation == 1 then
	image.fliph(vfx_name04_pic_r)
	image.flipv(vfx_name04_pic_r)
	end
end

function txt(txt_x, txt_y, txt_string, x_spacing, y_spacing, return_char, txt_size, txt_color)
local col = 0
local row = 0
local x_size = 0
local y_size = 0
local	char_x = 0
local	char_y = 0
local char_type = 0
local magic_char = "[.%($^"
	if txt_size == 1 then
	x_size = 7
	y_size = 13
	elseif txt_size == 2 then
	x_size = 10
	y_size = 18
	elseif txt_size == 3 then
	x_size = 14
	y_size = 26
	end
	for i = 1, string.len(txt_string) do
	char_type = 0
		for i2 = 1, 6 do
			if string.sub(txt_string, i, i) == string.sub(magic_char, i2, i2) then
			char_type = 1
			end
		end
		if char_type == 0 then
		char_y, char_x = string.find(table.concat(txt_set), string.sub(txt_string, i, i))
		elseif char_type == 1 then
		char_y, char_x = string.find(table.concat(txt_set), "%" .. string.sub(txt_string, i, i))
		end
	char_y = 0
		if string.sub(txt_string, i, i) == return_char then
		col = 0
		row += y_size+y_spacing
		end
		if char_x ~= nil and string.sub(txt_string, i, i) ~= return_char then
			if char_x >= 1 then
			char_x -= 1
			char_x *= x_size
			end
			while char_x >= x_size*26 do
			char_y += y_size
			char_x -= x_size*26
			end
			if orientation == 1 then
				if txt_size == 1 then
					if txt_color == 1 then
					image.blit(vfx_txt_black01_l, row+txt_y, 544-col-txt_x, char_x, char_y, x_size, y_size, 255)
					elseif txt_color == 2 then
					image.blit(vfx_txt_white01_l, row+txt_y, 544-col-txt_x, char_x, char_y, x_size, y_size, 255)
					end
				elseif txt_size == 2 then
					if txt_color == 1 then
					image.blit(vfx_txt_black02_l, row+txt_y, 544-col-txt_x, char_x, char_y, x_size, y_size, 255)
					elseif txt_color == 2 then
					image.blit(vfx_txt_white02_l, row+txt_y, 544-col-txt_x, char_x, char_y, x_size, y_size, 255)
					end
				elseif txt_size == 3 then
					if txt_color == 1 then
					image.blit(vfx_txt_black03_l, row+txt_y, 544-col-txt_x, char_x, char_y, x_size, y_size, 255)
					elseif txt_color == 2 then
					image.blit(vfx_txt_white03_l, row+txt_y, 544-col-txt_x, char_x, char_y, x_size, y_size, 255)
					end
				end
			elseif orientation == 2 then
				if txt_size == 1 then
					if txt_color == 1 then
					image.blit(vfx_txt_black01_r, 960-row-txt_y, col+txt_x, char_x, char_y, x_size, y_size, 255)
					elseif txt_color == 2 then
					image.blit(vfx_txt_white01_r, 960-row-txt_y, col+txt_x, char_x, char_y, x_size, y_size, 255)
					end
				elseif txt_size ==2 then
					if txt_color == 1 then
					image.blit(vfx_txt_black02_r, 960-row-txt_y, col+txt_x, char_x, char_y, x_size, y_size, 255)
					elseif txt_color == 2 then
					image.blit(vfx_txt_white02_r, 960-row-txt_y, col+txt_x, char_x, char_y, x_size, y_size, 255)
					end
				elseif txt_size ==3 then
					if txt_color == 1 then
					image.blit(vfx_txt_black03_r, 960-row-txt_y, col+txt_x, char_x, char_y, x_size, y_size, 255)
					elseif txt_color == 2 then
					image.blit(vfx_txt_white03_r, 960-row-txt_y, col+txt_x, char_x, char_y, x_size, y_size, 255)
					end
				end
			end
		col += x_size+x_spacing
			if col >= 544-x_size-txt_x then
			col = 0
			row += y_size+y_spacing
			end
		end
	end
end

function setup_game()
math.randomseed(os.time())
round = 0
player_turn = 1
player_roll = 0
player_pattern = ""
dice = {}
hold = {}
	for i = 1, 5 do
	dice[i] = 0
	hold[i] = false
	end
--score[player1, player2/CPU/ghost][scores, score strings, score submissions][score/string/submission values]
score = {{{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}},{{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}
	for i = 1, 2 do
		for i2 = 1, 15 do
		score[i][1][i2] = 0
		score[i][2][i2] = ""
		score[i][3][i2] = false
		end
	end
	for i = 1, 2 do
	score[i][3][7] = true
	score[i][3][15] = true
	end
	--CPU
	if game_type == 2 then
	local random = 0
	local number = 0
	local pattern = {}
		for i = 1, 14 do
		pattern[i] = false
		end
	pattern[7] = true
	cpu_pattern = ""
		while string.len(cpu_pattern) < 26 do
		random = math.random(1, 14)
			if random ~= 7 and pattern[random] ~= true then
				if random <= 9 then
				cpu_pattern = cpu_pattern .. "0" .. random
				pattern[random] = true
				else
				cpu_pattern = cpu_pattern .. random
				pattern[random] = true
				end
			end
		end
	random = 0
	number = 0
		for i = 1, 6 do
		random = math.random(1, 100)
			if random <= 15 then
			number = i*4
			elseif random <= 45 then
			number = i*3
			elseif random <= 75 then
			number = i*2
			elseif random <= 95 then
			number = i*1
			else
			number = 0
			end
		score[2][1][i] = number
		end
	random = math.random(1, 100)
		if random <= 75 then
		number = math.random(8, 28)
		else
		number = 0
		end
	score[2][1][8] = number
	random = math.random(1, 100)
		if random <= 50 then
		number = math.random(8, 28)
		else
		number = 0
		end
	score[2][1][9] = number
		random = math.random(1, 100)
		if random <= 70 then
		number = 25
		else
		number = 0
		end
	score[2][1][10] = number
	random = math.random(1, 100)
		if random <= 70 then
		number = 30
		else
		number = 0
		end
	score[2][1][11] = number
	random = math.random(1, 100)
		if random <= 40 then
		number = 40
		else
		number = 0
		end
	score[2][1][12] = number
	random = math.random(1, 100)
		if random <= 4 then
		number = 50
		else
		number = 0
		end
	score[2][1][13] = number
	score[2][1][14] = math.random(8, 28)
	--Ghost
	elseif game_type == 3 then
		for i = 1, 15 do
		score[2][1][i] = ghost[i]
		end
	score[2][1][7] = 0
	score[2][1][15] = 0
	end
player01_name = name01
	if game_type == 1 then
	player02_name = name02
	elseif game_type == 2 then
	player02_name = name03
	elseif game_type == 3 then
	player02_name = name04
	end
end

function load_theme()
theme_set = {}
theme_color = {}
local n = 1
	for i = 1, 120 do
	theme_set[i] = {theme_RGBA[n], theme_RGBA[n+1], theme_RGBA[n+2], theme_RGBA[n+3]}
	theme_color[i] = color.new(theme_RGBA[n], theme_RGBA[n+1], theme_RGBA[n+2], theme_RGBA[n+3])
	n += 4
	end
end


--SCRIPT STORAGE-----------------------------------------------------------------------------------
--[[
---------------------------------------
--For testing CPU AI (place before main while loop)
game_type = 2
load_vfx()
	while true do
	setup_game()
	score[2][1][7] = 0
		for i2 = 1, 6 do
		score[2][1][7] += score[2][1][i2]
		end
		if score[2][1][7] >= 63 then
		score[2][1][7] = 35
		else
		score[2][1][7] = 0
		end
	score[2][1][15] = 0
		for i2 = 1, 14 do
		score[2][1][15] += score[2][1][i2]
		end
	txt(0, 0, "CP:"..cpu_pattern.."|1s:"..score[2][1][1].."|2s:"..score[2][1][2].."|3s:"..score[2][1][3].."|4s:"..score[2][1][4].."|5s:"..score[2][1][5].."|6s:"..score[2][1][6].."|BN:"..score[2][1][7].."|FH:"..score[2][1][8].."|3x:"..score[2][1][9].."|4x:"..score[2][1][10].."|SS:"..score[2][1][11].."|LS:"..score[2][1][12].."|Y!:"..score[2][1][13].."|Ch:"..score[2][1][14].."|Tt:"..score[2][1][15], 0, 0, "|", 3, 2)
	screen.flip()
	buttons.waitforkey()
	end
---------------------------------------
---------------------------------------
---------------------------------------
--]]


--NOTES--------------------------------------------------------------------------------------------
--[[
Regarding 'txt()' function...
Characters '"' and '\' require an escape '\'.  Therefore, '\"' or '\\'.
	EXAMPLE: txt(0, 0, "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz `1234567890-=[]\\;',./ ~!@#$%^&*()_+{}|:\"<>?", 0, 0, "", 1, 1)
Local variable 'return_char' determines which character is sacrificed for line breaks in strings.
	EXAMPLE: txt(0, 0, "First line|Second line|Third line", 0, 0, "|", 1, 1)


--]]


---------------------------------------------------------------------------------------------------
--INITIALIZATION END-------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------
--MAIN START---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
buttons.analogtodpad(0)
buttons.interval(5, 2)
load_vfx()
load_pics()
load_theme()
setup_game()
	while true do
	power.tick()
	buttons.read()
	touch.read()
	motion.read()
	--Draw main VFX
	draw.fillrect(0, 0, 960, 544, theme_color[1+theme_slot])
		if orientation == 1 then
		image.blittint(vfx_shadow_l, 0, 544, theme_color[3+theme_slot])
			if player01_name == "I AM ERROR" or player02_name == "I AM ERROR" then
			image.blit(vfx_error_l, 0, 544, 255)
			end
		image.blittint(vfx_frame_l, 0, 544, theme_color[2+theme_slot])
		image.blittint(vfx_l_outline, 0, 544, theme_color[2+theme_slot])
		image.blittint(vfx_yak_bg_l, 0, 544, theme_color[10+theme_slot])
		image.blittint(vfx_yak_l, 0, 544, theme_color[9+theme_slot])
		image.blittint(vfx_score_l, 0, 544, theme_color[5+theme_slot])
		image.blittint(vfx_akzee_l, 0, 544, theme_color[4+theme_slot])
		image.blittint(vfx_l, 0, 544, theme_color[4+theme_slot])
		image.blit(vfx_name01_pic_l, 266, 455, 255)
			if game_type == 1 then
			image.blit(vfx_name02_pic_l, 266, 191, 255)
			elseif game_type == 2 then
			image.blit(vfx_name03_pic_l, 266, 191, 255)
			elseif game_type == 3 then
			image.blit(vfx_name04_pic_l, 266, 191, 255)
			end
			if round == 0 then
			image.blittint(vfx_start_bg_l, 0, 544, theme_color[3+theme_slot])
			image.blittint(vfx_start_l, 0, 544, theme_color[2+theme_slot])
			image.blittint(vfx_player01_turn_l, 0, 544, theme_color[2+theme_slot])
			image.blittint(vfx_player02_turn_l, 0, 544, theme_color[2+theme_slot])
			elseif round >= 1 then
				if player_turn == 1 then
				image.blittint(vfx_player01_turn_l, 0, 544, theme_color[6+theme_slot])
				image.blittint(vfx_player02_turn_l, 0, 544, theme_color[2+theme_slot])
				elseif player_turn == 2 then
				image.blittint(vfx_player01_turn_l, 0, 544, theme_color[2+theme_slot])
				image.blittint(vfx_player02_turn_l, 0, 544, theme_color[6+theme_slot])
				end
			end
		elseif orientation == 2 then
		image.blittint(vfx_shadow_r, 960, 0, theme_color[3+theme_slot])
			if player01_name == "I AM ERROR" or player02_name == "I AM ERROR" then
			image.blit(vfx_error_r, 960, 0, 255)
			end
		image.blittint(vfx_frame_r, 960, 0, theme_color[2+theme_slot])
		image.blittint(vfx_r_outline, 960, 0, theme_color[2+theme_slot])
		image.blittint(vfx_yak_bg_r, 960, 0, theme_color[10+theme_slot])
		image.blittint(vfx_yak_r, 960, 0, theme_color[9+theme_slot])
		image.blittint(vfx_score_r, 960, 0, theme_color[5+theme_slot])
		image.blittint(vfx_akzee_r, 960, 0, theme_color[4+theme_slot])
		image.blittint(vfx_r, 960, 0, theme_color[4+theme_slot])
		image.blit(vfx_name01_pic_r, 606, 23, 255)
			if game_type == 1 then
			image.blit(vfx_name02_pic_r, 606, 287, 255)
			elseif game_type == 2 then
			image.blit(vfx_name03_pic_r, 606, 287, 255)
			elseif game_type == 3 then
			image.blit(vfx_name04_pic_r, 606, 287, 255)
			end
			if round == 0 then
			image.blittint(vfx_start_bg_r, 960, 0, theme_color[3+theme_slot])
			image.blittint(vfx_start_r, 960, 0, theme_color[2+theme_slot])
			image.blittint(vfx_player01_turn_r, 960, 0, theme_color[2+theme_slot])
			image.blittint(vfx_player02_turn_r, 960, 0, theme_color[2+theme_slot])
			elseif round >= 1 then
				if player_turn == 1 then
				image.blittint(vfx_player01_turn_r, 960, 0, theme_color[6+theme_slot])
				image.blittint(vfx_player02_turn_r, 960, 0, theme_color[2+theme_slot])
				elseif player_turn == 2 then
				image.blittint(vfx_player01_turn_r, 960, 0, theme_color[2+theme_slot])
				image.blittint(vfx_player02_turn_r, 960, 0, theme_color[6+theme_slot])
				end
			end
		end
		--Draw dice VFX and process touch input
		if player_roll >= 1 then
		local x = 0
		local y = 0
			if orientation == 1 then
			x = 169
			y = 414
			elseif orientation == 2 then
			x = 722
			y = 61
			end
			for i = 1, 5 do
			image.blittint(vfx_dice, x, y, theme_color[7+theme_slot])
			image.blittint(vfx_dot, x, y, theme_color[8+theme_slot])
				if hold[i] == true then
				image.blit(vfx_hold, x-3, y-3, 255)
				end
				if dice[i] == 1 then
				draw.fillrect(x+13, y+47, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+13, y+30, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+13, y+13, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+47, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+13, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+47, y+47, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+47, y+30, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+47, y+13, 9, 9, theme_color[7+theme_slot])
				elseif dice[i] == 2 then
				draw.fillrect(x+13, y+30, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+13, y+13, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+47, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+30, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+13, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+47, y+47, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+47, y+30, 9, 9, theme_color[7+theme_slot])
				elseif dice[i] == 3 then
				draw.fillrect(x+13, y+47, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+13, y+30, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+47, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+13, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+47, y+30, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+47, y+13, 9, 9, theme_color[7+theme_slot])
				elseif dice[i] == 4 then
				draw.fillrect(x+13, y+30, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+47, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+30, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+13, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+47, y+30, 9, 9, theme_color[7+theme_slot])
				elseif dice[i] == 5 then
				draw.fillrect(x+13, y+30, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+47, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+13, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+47, y+30, 9, 9, theme_color[7+theme_slot])
				elseif dice[i] == 6 then
				draw.fillrect(x+13, y+30, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+30, y+30, 9, 9, theme_color[7+theme_slot])
				draw.fillrect(x+47, y+30, 9, 9, theme_color[7+theme_slot])
				end
				if touch.front[1].pressed == true then
					if touch.front[1].x >= x and touch.front[1].x <= x+69 and touch.front[1].y >= y and touch.front[1].y <= y+69 then
						if hold[i] == true then
						hold[i] = false
						elseif hold[i] == false then
						hold[i] = true
						end
					sound.play(sfx_switch)
					end
				end
				if orientation == 1 then
				y -= 91
				elseif orientation == 2 then
				y += 91
				end
			end
		end
	--Draw score VFX, process score calculations, and process touch input
	local x = 0
	local y = 0
		if orientation == 1 then
		x = 364
		y = 287
			if player_turn == 2 then
			y -= 264
			end
		elseif orientation == 2 then
		x = 560
		y = 23
			if player_turn == 2 then
			y += 264
			end
		end
		for i = 1, 15 do
			if orientation == 1 then
				if i == 7 then
				x += 5
				elseif i == 8 then
				x += 9
				elseif i == 15 then
				x += 5
				end
			elseif orientation == 2 then
				if i == 7 then
				x -= 5
				elseif i == 8 then
				x -= 9
				elseif i == 15 then
				x -= 5
				end
			end
			if player_roll >= 1 then
				if touch.front[1].held == true then
					if touch.front[1].x >= x and touch.front[1].x <= x+37 and touch.front[1].y >= y and touch.front[1].y <= y+235 then
						if score[player_turn][3][i] == false then
						draw.line(x-1, y, x+37, y, theme_color[11+theme_slot])
						draw.line(x, y+235, x+37, y+235, theme_color[11+theme_slot])
						draw.line(x, y, x, y+235, theme_color[11+theme_slot])
						draw.line(x+37, y, x+37, y+235, theme_color[11+theme_slot])
							if orientation == 1 then
							draw.fillrect(x, y+68, 36, 166, theme_color[12+theme_slot])
							draw.fillrect(x, y, 36, 68, theme_color[11+theme_slot])
							elseif orientation == 2 then
							draw.fillrect(x, y, 36, 166, theme_color[12+theme_slot])
							draw.fillrect(x, y+166, 36, 68, theme_color[11+theme_slot])
							end
						end
					end
				elseif touch.front[1].released == true then
					if touch.front[1].x >= x and touch.front[1].x <= x+37 and touch.front[1].y >= y and touch.front[1].y <= y+235 then
						if score[player_turn][3][i] == false then
						local yakzee = 0
							if dice[1] == dice[2] and dice[2] == dice[3] and dice[3] == dice[4] and dice[4] == dice[5] then
							yakzee += 1
							end
							if score[player_turn][1][13] >= 50 then
							yakzee += 1
							end
							--Score additional Yakzees if previous was awarded; after first, +100 bonus
							if yakzee == 2 then
							score[player_turn][1][13] += 100
							end
						--Determine sum of each dice amount
						local dice_sum = {}
							for i2 = 1, 6 do
							dice_sum[i2] = 0
							end
							for i2 = 1, 5 do
								if dice[i2] == 1 then
								dice_sum[1] += 1
								elseif dice[i2] == 2 then
								dice_sum[2] += 1
								elseif dice[i2] == 3 then
								dice_sum[3] += 1
								elseif dice[i2] == 4 then
								dice_sum[4] += 1
								elseif dice[i2] == 5 then
								dice_sum[5] += 1
								elseif dice[i2] == 6 then
								dice_sum[6] += 1
								end
							end
							--Score boxes 1-6, according to their respective values
							if i <= 6 then
							score[player_turn][1][i] = i*dice_sum[i]
							--Score box 8, three of a kind
							elseif i == 8 then
								if dice_sum[1] >= 3 or dice_sum[2] >= 3 or dice_sum[3] >= 3 or dice_sum[4] >= 3 or dice_sum[5] >= 3 or dice_sum[6] >= 3 then
									for i2 = 1, 5 do
									score[player_turn][1][8] += dice[i2]
									end
								end
							--Score box 9, four of a kind
							elseif i == 9 then
								if dice_sum[1] >= 4 or dice_sum[2] >= 4 or dice_sum[3] >= 4 or dice_sum[4] >= 4 or dice_sum[5] >= 4 or dice_sum[6] >= 4 then
									for i2 = 1, 5 do
									score[player_turn][1][9] += dice[i2]
									end
								end
							--Score box 10, full house: two of a kind and three of another kind; or per joker rules, additional Yakzees can be used to fulfill requirement once the respective upper section is filled
							elseif i == 10 then
							local full_house = 0
								for i2 = 1, 6 do
									if dice_sum[i2] == 2 then
									full_house += 2
									elseif dice_sum[i2] == 3 then
									full_house += 3
									end
								end
								if full_house == 5 or yakzee == 2 and score[player_turn][3][dice[1]] == true then
								score[player_turn][1][10] = 25
								end
							--Score box 11, small straight: 1, 2, 3, 4 or 2, 3, 4, 5 or 3, 4, 5, 6; or per joker rules, additional Yakzees can be used to fulfill requirement once the respective upper section is filled
							elseif i == 11 then
								if dice_sum[1] >= 1 and dice_sum[2] >= 1 and dice_sum[3] >= 1 and dice_sum[4] >= 1 or dice_sum[2] >= 1 and dice_sum[3] >= 1 and dice_sum[4] >= 1 and dice_sum[5] >= 1 or dice_sum[3] >= 1 and dice_sum[4] >= 1 and dice_sum[5] >= 1 and dice_sum[6] >= 1 or yakzee == 2 and score[player_turn][3][dice[1]] == true then
								score[player_turn][1][11] = 30
								end
							--Score box 12, large straight: 1, 2, 3, 4, 5 or 2, 3, 4, 5, 6; or per joker rules, additional Yakzees can be used to fulfill requirements once the respective upper section is filled
							elseif i == 12 then
								if dice_sum[1] >= 1 and dice_sum[2] >= 1 and dice_sum[3] >= 1 and dice_sum[4] >= 1 and dice_sum[5] >= 1 or dice_sum[2] >= 1 and dice_sum[3] >= 1 and dice_sum[4] >= 1 and dice_sum[5] >= 1 and dice_sum[6] >= 1 or yakzee == 2 and score[player_turn][3][dice[1]] == true then
								score[player_turn][1][12] = 40
								end
							--Score box 13, Yakzee: five of a kind; first Yakzee = +50, and additional Yakzees = +100
							elseif i == 13 then
								if yakzee == 1 then
								score[player_turn][1][13] += 50
								end
							--Score box 14, chance: sum of all dice
							elseif i == 14 then
								for i2 = 1, 5 do
								score[player_turn][1][14] += dice[i2]
								end
							end
						--Tally scores; bonus of +35 added if sum of boxes 1-6 >= 63
						score[player_turn][1][7] = 0
							for i2 = 1, 6 do
							score[player_turn][1][7] += score[player_turn][1][i2]
							end
							if score[player_turn][1][7] >= 63 then
							score[player_turn][1][7] = 35
							else
							score[player_turn][1][7] = 0
							end
						score[player_turn][1][15] = 0
							for i2 = 1, 14 do
							score[player_turn][1][15] += score[player_turn][1][i2]
							end
						score[player_turn][3][i] = true
						player_roll = 0
							for i = 1, 5 do
							dice[i] = 0
							hold[i] = false
							end
							if game_type == 1 then
								if player_turn == 1 then
								player_turn = 2
								elseif player_turn == 2 then
								player_turn = 1
								round += 1
								end
							elseif game_type == 2 then
								if string.sub(cpu_pattern, (round*2)-1, (round*2)-1) == "0" then
								score[2][3][tonumber(string.sub(cpu_pattern, round*2, round*2))] = true
								else
								score[2][3][tonumber(string.sub(cpu_pattern, (round*2)-1, round*2))] = true
								end
							score[2][1][7] = 0
								for i2 = 1, 6 do
									if score[2][3][i2] == true then
									score[2][1][7] += score[2][1][i2]
									end
								end
								if score[2][1][7] >= 63 then
								score[2][1][7] = 35
								else
								score[2][1][7] = 0
								end
							score[2][1][15] = 0
								for i2 = 1, 14 do
									if score[2][3][i2] == true then
									score[2][1][15] += score[2][1][i2]
									end
								end
							round += 1
							elseif game_type == 3 then
								if string.sub(ghost[0], (round*2)-1, (round*2)-1) == "0" then
								score[2][3][tonumber(string.sub(ghost[0], round*2, round*2))] = true
								else
								score[2][3][tonumber(string.sub(ghost[0], (round*2)-1, round*2))] = true
								end
								if i < 10 then
								player_pattern = player_pattern .. "0" .. i
								elseif i >= 10 then
								player_pattern = player_pattern .. i
								end
							score[2][1][7] = 0
								for i2 = 1, 6 do
									if score[2][3][i2] == true then
									score[2][1][7] += score[2][1][i2]
									end
								end
								if score[2][1][7] >= 63 then
								score[2][1][7] = 35
								else
								score[2][1][7] = 0
								end
							score[2][1][15] = 0
								for i2 = 1, 14 do
									if score[2][3][i2] == true then
									score[2][1][15] += score[2][1][i2]
									end
								end
							round += 1
							end
						end
					end
				end
			end
			if orientation == 1 then
			x += 37
			elseif orientation == 2 then
			x -= 37
			end
		end
		--Prepare score strings (right justify them)
		for i = 1, 15 do
		score[1][2][i] = tostring(score[1][1][i])
		score[2][2][i] = tostring(score[2][1][i])
			while string.len(score[1][2][i]) < 4 do
			score[1][2][i] = " " .. score[1][2][i]
			end
			while string.len(score[2][2][i]) < 4 do
			score[2][2][i] = " " .. score[2][2][i]
			end
		end
		--Draw text VFX
		if round >= 1 and round <= 13 and player_roll <= 2 then
			if motion_control == 0 then
			txt(60, 4, "Hold " .. string.upper(grab) .. ", then release " .. string.upper(grab) .. " to roll.", 0, 0, "", 2, 2)
			elseif motion_control == 1 then
			txt(60, 4, "Hold " .. string.upper(grab) .. " and shake, then release " .. string.upper(grab) .. " to roll.", 0, 0, "", 2, 2)
			end
		elseif round >= 1 and round <= 13 and player_roll == 3 then
		txt(60, 4, "Touch selection to submit score.", 0, 0, "", 2, 2)
		end
	x = 81
	y = 154
		for i = 1, 5 do
			if hold[i] == true then
			txt(x, y, "HOLD", 0, 0, "", 1, 2)
			end
		x += 91
		end
	x = 204
	y = 376
	txt(x-96, y-49, player01_name, 0, 0, "", 3, 2)
	txt(x+168, y-49, player02_name, 0, 0, "", 3, 2)
		if round >= 1 and round <= 13 then
			if player_turn == 1 then
			txt(x-96, y-110, "Round: " .. round .. "/13", 0, 0, "", 2, 2)
				if player_roll >= 1 then
				txt(x-96, y-90, "Roll: " .. player_roll .. "/3", 0, 0, "", 2, 2)
				end
			elseif player_turn == 2 then
			txt(x+168, y-110, "Round: " .. round .. "/13", 0, 0, "", 2, 2)
				if player_roll >= 1 then
				txt(x+168, y-90, "Roll: " .. player_roll .. "/3", 0, 0, "", 2, 2)
				end
			end
		end
		for i = 1, 15 do
			if i == 1 then
			txt(x-174, y-1, "Aces|Twos|Threes|Fours|Fives|Sixes", 0, 19, "|", 2, 2)
			txt(x+90, y-1, "Aces|Twos|Threes|Fours|Fives|Sixes", 0, 19, "|", 2, 2)
			elseif i == 7 then
			y += 5
			txt(x-174, y-1, "Bonus (      )", 0, 0, "", 2, 2)
			txt(x+90, y-1, "Bonus (      )", 0, 0, "", 2, 2)
			txt(x-103, y+2, "if >= 63", 0, 0, "", 1, 2)
			txt(x+161, y+2, "if >= 63", 0, 0, "", 1, 2)
			elseif i == 8 then
			y += 9
			txt(x-174, y-1, "Three of a Kind|Four of a Kind|Full House|Small Straight|Large Straight|Yakzee|Chance", 0, 19, "|", 2, 2)
			txt(x+90, y-1, "Three of a Kind|Four of a Kind|Full House|Small Straight|Large Straight|Yakzee|Chance", 0, 19, "|", 2, 2)
			elseif i == 15 then
			y += 5
			txt(x-174, y-1, "Total Score", 0, 0, "", 2, 2)
			txt(x+90, y-1, "Total Score", 0, 0, "", 2, 2)
			end
			if score[1][3][i] == true then
			txt(x, y, score[1][2][i], 0, 0, "", 2, 1)
			end
			if score[2][3][i] == true then
			txt(x+264, y, score[2][2][i], 0, 0, "", 2, 1)
			end
		y += 37
		end
		if motion_control == 1 then
		txt(326, 72, "Motion: Enabled", 0, 0, "", 1, 2)
		elseif motion_control == 0 then
		txt(326, 72, "Motion: Disabled", 0, 0, "", 1, 2)
		end
		--Draw player pics, player names, and process touch input
		if orientation == 1 then
		x = 266
		y = 455
		elseif orientation == 2 then
		x = 606
		y = 23
		end
		for i = 1, 2 do
			if touch.front[1].held == true then
				if touch.front[1].x >= x and touch.front[1].x <= x+89 and touch.front[1].y >= y and touch.front[1].y <= y+67 then
				draw.line(x-1, y, x+89, y, theme_color[11+theme_slot])
				draw.line(x, y+67, x+89, y+67, theme_color[11+theme_slot])
				draw.line(x, y, x, y+67, theme_color[11+theme_slot])
				draw.line(x+89, y, x+89, y+67, theme_color[11+theme_slot])
				draw.fillrect(x, y, 88, 66, theme_color[12+theme_slot])
				end
			elseif touch.front[1].released == true then
				if touch.front[1].x >= x and touch.front[1].x <= x+89 and touch.front[1].y >= y and touch.front[1].y <= y+67 then
				cam.init(0)
					while true do
					buttons.read()
					draw.fillrect(0, 0, 960, 544, theme_color[1+theme_slot])
						if orientation == 1 then
						draw.fillrect(126, 466, 90, 68, theme_color[2+theme_slot])
						draw.fillrect(276, 466, 90, 68, theme_color[2+theme_slot])
							if i == 1 then
							txt(10, 10, player01_name, 0, 0, "", 3, 2)
							image.blit(vfx_name01_pic_l, 127, 467, 255)
							elseif i == 2 then
							txt(10, 10, player02_name, 0, 0, "", 3, 2)
								if game_type == 1 then
								image.blit(vfx_name02_pic_l, 127, 467, 255)
								elseif game_type == 2 then
								image.blit(vfx_name03_pic_l, 127, 467, 255)
								elseif game_type == 3 then
								image.blit(vfx_name04_pic_l, 127, 467, 255)
								end
							end
						cam.render(277, 467, 88, 66)
						elseif orientation == 2 then
						draw.fillrect(744, 10, 90, 68, theme_color[2+theme_slot])
						draw.fillrect(594, 10, 90, 68, theme_color[2+theme_slot])
							if i == 1 then
							txt(10, 10, player01_name, 0, 0, "", 3, 2)
							image.blit(vfx_name01_pic_r, 745, 11, 255)
							elseif i == 2 then
							txt(10, 10, player02_name, 0, 0, "", 3, 2)
								if game_type == 1 then
								image.blit(vfx_name02_pic_r, 745, 11, 255)
								elseif game_type == 2 then
								image.blit(vfx_name03_pic_r, 745, 11, 255)
								elseif game_type == 3 then
								image.blit(vfx_name04_pic_r, 745, 11, 255)
								end
							end
						cam.render(595, 11, 88, 66)
						end
					txt(10, 40, "CIRCLE button: Change name", 0, 0, "", 2, 2)
					txt(10, 100, "Current pic", 0, 0, "", 2, 2)
					txt(10, 250, "New pic", 0, 0, "", 2, 2)
						if cam.state(0) then
						txt(10, 380, "TRIANGLE button: Switch to rear camera", 0, 0, "", 2, 2)
						elseif cam.state(1) then
						txt(10, 380, "TRIANGLE button: Switch to front camera", 0, 0, "", 2, 2)
						end
					txt(10, 410, string.upper(grab) .. " button: Save pic (takes about 20 seconds)|--Don't turn the system off while saving!", 0, 0, "|", 2, 2)
					txt(10, 495, "START button: Exit", 0, 0, "", 2, 2)
					screen.flip()
						if buttons[grab] then
						draw.fillrect(0, 0, 960, 544, theme_color[1+theme_slot])
						txt(10, 10, "SAVING image...", 0, 0, "", 3, 2)
						txt(230, 14, "(Takes about 20 seconds)", 0, 0, "", 2, 2)
						txt(10, 37, "Don't turn the system power off while saving!", 0, 0, "", 2, 2)
						screen.flip()
						buttons.homepopup(0)
							if i == 1 then
							cam.shot(dir .. "vfx_name01_pic.png")
							ini.write(dir .. "config.ini", "name01_pic_orientation", orientation)
							name01_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name01_pic_orientation", 1))
							elseif i == 2 then
								if game_type == 1 then
								cam.shot(dir .. "vfx_name02_pic.png")
								ini.write(dir .. "config.ini", "name02_pic_orientation", orientation)
								name02_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name02_pic_orientation", 1))
								elseif game_type == 2 then
								cam.shot(dir .. "vfx_name03_pic.png")
								ini.write(dir .. "config.ini", "name03_pic_orientation", orientation)
								name03_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name03_pic_orientation", 1))
								elseif game_type == 3 then
								cam.shot(dir .. "vfx_name04_pic.png")
								ini.write(dir .. "config.ini", "name04_pic_orientation", orientation)
								name04_pic_orientation = tonumber(ini.read(dir .. "config.ini", "name04_pic_orientation", 1))
								end
							end
						buttons.homepopup(1)
						load_pics()
						elseif buttons.triangle then
							if cam.state(0) then
							cam.term()
							cam.init(1)
							elseif cam.state(1) then
							cam.term()
							cam.init(0)
							end
						elseif buttons.circle then
							if i == 1 then
							player01_name = osk.init("Hey " .. player01_name .. ", what's your new handle?", player01_name, 1, 10)
								if player01_name == nil then
								player01_name = "I AM ERROR"
								end
							ini.write(dir .. "config.ini", "name01", player01_name)
							name01 = ini.read(dir .. "config.ini", "name01", "Player01")
							elseif i == 2 then
								if game_type == 1 then
								player02_name = osk.init("Hey " .. player02_name .. ", what's your new handle?", player02_name, 1, 10)
									if player02_name == nil then
									player02_name = "I AM ERROR"
									end
								ini.write(dir .. "config.ini", "name02", player02_name)
								name02 = ini.read(dir .. "config.ini", "name02", "Player02")
								elseif game_type == 2 then
								player02_name = osk.init("Hey " .. player02_name .. ", what's your new handle?", player02_name, 1, 10)
									if player02_name == nil then
									player02_name = "HAL9001"
									end
								ini.write(dir .. "config.ini", "name03", player02_name)
								name03 = ini.read(dir .. "config.ini", "name03", "CPU")
								elseif game_type == 3 then
								player02_name = osk.init("Hey " .. player02_name .. ", what's your new handle?", player02_name, 1, 10)
									if player02_name == nil then
									player02_name = "ICDEADPPL"
									end
								ini.write(dir .. "config.ini", "name04", player02_name)
								name04 = ini.read(dir .. "config.ini", "name04", "Ghost")
								end
							end
						elseif buttons.start then
						buttons.read()
						break
						end
					end
				cam.term()
				end
			end
			if orientation == 1 then
			y -= 264
			elseif orientation == 2 then
			y += 264
			end
		end
		--Check if game is complete
		if round == 14 then
			if score[1][1][15] > score[2][1][15] then
			txt(190, 290, "WINNER!", 0, 0, "", 2, 2)
			txt(460, 290, "LOSER!", 0, 0, "", 2, 2)
			record_win += 1
			ini.write(dir .. "config.ini", "record_win", record_win)
			elseif score[2][1][15] > score[1][1][15] then
			txt(196, 290, "LOSER!", 0, 0, "", 2, 2)
			txt(454, 290, "WINNER!", 0, 0, "", 2, 2)
			record_loss += 1
			ini.write(dir .. "config.ini", "record_loss", record_loss)
			elseif score[1][1][15] == score[2][1][15] then
			txt(200, 290, "DRAW!", 0, 0, "", 2, 2)
			txt(464, 290, "DRAW!", 0, 0, "", 2, 2)
			record_draw += 1
			ini.write(dir .. "config.ini", "record_draw", record_draw)
			end
		txt(60, 4, "Press any button to continue.", 0, 0, "", 2, 2)
		screen.flip()
		buttons.waitforkey()
			if game_type == 3 then
				if score[1][1][15] > ghost[15] then
				draw.fillrect(0, 0, 960, 544, theme_color[1+theme_slot])
				txt(10, 10, "SAVING ghost data...", 0, 0, "", 3, 2)
				txt(10, 37, "Don't turn the system power off while saving!", 0, 0, "", 2, 2)
				screen.flip()
				ini.write(dir .. "config.ini", "ghost[0]", player_pattern)
				ghost[0] = ini.read(dir .. "config.ini", "ghost[0]", "01020304050608091011121314")
					for i = 1, 15 do
					ghost[i] = score[1][1][i]
					ini.write(dir .. "config.ini", "ghost[" .. i .. "]", ghost[i])
					end
				end
			end
		setup_game()
		end
		if round == 0 then
			--Draw game start VFX, and process touch input
			if orientation == 1 then
			x = 257
			y = 14
			elseif orientation == 2 then
			x = 660
			y = 422
			end
		txt(60, 4, "Select your opponent and touch \"START\".", 0, 0, "", 2, 2)
		txt(118, 255, "Win: " .. record_win, 0, 0, "", 2, 2)
		txt(108, 271, "Loss: " .. record_loss, 0, 0, "", 2, 2)
		txt(108, 288, "Draw: " .. record_draw, 0, 0, "", 2, 2)
		txt(440, 268, "START", 0, 0, "", 3, 2)
			if touch.front[1].held == true then
				if touch.front[1].x >= x and touch.front[1].x <= x+44 and touch.front[1].y >= y and touch.front[1].y <= y+109 then
				draw.line(x-1, y, x+44, y, theme_color[11+theme_slot])
				draw.line(x, y+109, x+44, y+109, theme_color[11+theme_slot])
				draw.line(x, y, x, y+109, theme_color[11+theme_slot])
				draw.line(x+44, y, x+44, y+109, theme_color[11+theme_slot])
				draw.fillrect(x, y, 43, 108, theme_color[12+theme_slot])
				end
			elseif touch.front[1].released == true then
				if touch.front[1].x >= x and touch.front[1].x <= x+44 and touch.front[1].y >= y and touch.front[1].y <= y+109 then
				setup_game()
				round = 1
				sound.play(sfx_switch)
				end
			end
			--Draw game type selector VFX and process touch input
			if orientation == 1 then
			x = 257
			y = 273
			elseif orientation == 2 then
			x = 660
			y = 228
			end
			for i = 1, 2 do
				if touch.front[1].held == true then
					if touch.front[1].x >= x and touch.front[1].x <= x+44 and touch.front[1].y >= y and touch.front[1].y <= y+44 then
					draw.line(x-1, y, x+44, y, theme_color[11+theme_slot])
					draw.line(x, y+44, x+44, y+44, theme_color[11+theme_slot])
					draw.line(x, y, x, y+44, theme_color[11+theme_slot])
					draw.line(x+44, y, x+44, y+44, theme_color[11+theme_slot])
					draw.fillrect(x, y, 43, 43, theme_color[12+theme_slot])
					end
				elseif touch.front[1].released == true then
					if touch.front[1].x >= x and touch.front[1].x <= x+44 and touch.front[1].y >= y and touch.front[1].y <= y+44 then
						if i == 1 then
						game_type -= 1
						elseif i == 2 then
						game_type += 1
						end
						if game_type < 1 then
						game_type = 3
						elseif game_type > 3 then
						game_type = 1
						end
					sound.play(sfx_switch)
					end
					if game_type == 1 then
					player02_name = name02
					elseif game_type == 2 then
					player02_name = name03
					elseif game_type == 3 then
					player02_name = name04
					end
				end
				if orientation == 1 then
				y -= 141
				elseif orientation == 2 then
				y += 141
				end
			end
		end
		--Draw L and R VFX (when held) and process dice rolling
		if round >= 1 and player_roll < 3 then
			if motion_control == 1 and buttons.held[grab] and motion.velocity.x ~= 0 and motion.velocity.y ~= 0 and motion.velocity.z ~= 0 or motion_control == 0 and buttons.held[grab] then
				if orientation == 1 then
				x = 8
				y = 8
				elseif orientation == 2 then
				x = 906
				y = 8
				end
			draw.line(x-1, y, x+47, y, theme_color[11+theme_slot])
			draw.line(x, y+38, x+47, y+38, theme_color[11+theme_slot])
			draw.line(x, y, x, y+38, theme_color[11+theme_slot])
			draw.line(x+47, y, x+47, y+38, theme_color[11+theme_slot])
			draw.fillrect(x, y, 46, 37, theme_color[12+theme_slot])
				if sound.playing(sfx_roll) then
				sound.stop(sfx_roll)
				else
					if sound.playing(sfx_shake) then
					else
					sound.play(sfx_shake)
					end
				end
			shake = true
			else
				if sound.playing(sfx_shake) then
				sound.stop(sfx_shake)
				end
				if buttons.held[grab] == false then
					if shake == true then
						for i = 1, 5 do
							if hold[i] == false then
							dice[i] = math.random(1, 6)
							end
						end
					sound.play(sfx_roll)
					player_roll += 1
					end
				end
			shake = false
			end
		end
		--Process orientation change(s)
		if motion_control == 1 and orientation == 2 and motion.orientation.x == -1 then
		orientation = 1
		grab = "l"
		sound.play(sfx_switch)
		ini.write(dir .. "config.ini", "orientation", orientation)
		elseif motion_control == 1 and orientation == 1 and motion.orientation.x == 1 then
		orientation = 2
		grab = "r"
		sound.play(sfx_switch)
		ini.write(dir .. "config.ini", "orientation", orientation)
		end
		if motion_control == 0 then
			if buttons.analogrx <= -30 then
				if orientation == 2 then
				orientation = 1
				grab = "l"
				sound.play(sfx_switch)
				ini.write(dir .. "config.ini", "orientation", orientation)
				end
			elseif buttons.analogrx >= 30 then
				if orientation == 1 then
				orientation = 2
				grab = "r"
				sound.play(sfx_switch)
				ini.write(dir .. "config.ini", "orientation", orientation)
				end
			end
		end
		--Draw theme selector/editor if edit mode is enabled
		if edit_mode == 1 then
		last = 12+theme_slot
		first = last - 11
			if orientation == 1 then
			x = 91
			y = 519
			elseif orientation == 2 then
			x = 860
			y = 16
			end
			if orientation == 1 then
			draw.fillrect(x-31, y+18, 190, -144, theme_selector01)
			draw.rect(x-31, y+18, 190, -144, theme_selector02)
			elseif orientation == 2 then
			draw.fillrect(x+41, y-8, -190, 144, theme_selector01)
			draw.rect(x+41, y-8, -190, 144, theme_selector02)
			end
			if theme_y == 13 then
				if orientation == 1 then
				draw.fillrect(x-26, y-11, 10, -94, theme_selector03)
				elseif orientation == 2 then
				draw.fillrect(x+25, y+20, 10, 94, theme_selector03)
				end
			end
			for i = first, last do
			draw.fillrect(x, y, 10, 10, theme_color[i])
			draw.rect(x, y, 10, 10, theme_selector02)
				if theme_y+theme_slot == i then
					if orientation == 1 then
					draw.fillrect(x, y-1, 10, -124, theme_selector03)
					elseif orientation == 2 then
					draw.fillrect(x, y+10, 10, 124, theme_selector03)
					end
				end
				if orientation == 1 then
				x += 13
				elseif orientation == 2 then
				x -= 13
				end
			end
		x = 30
		y = 90
		txt(x+11, y-13, "RGBA", 23, 0, "", 1, 2)
			if theme_slot < 108 then
			txt(x+10, y-26, "Theme: 0" .. (theme_slot/12)+1 .. "/10", 0, 0, "", 1, 2)
			else
			txt(x+10, y-26, "Theme: " .. (theme_slot/12)+1 .. "/10", 0, 0, "", 1, 2)
			end
			if theme_y == 13 then
			txt(x+3, y-27, "[            ]", 0, 0, "", 1, 2)
			end
			for i = first, last do
				for i2 = 1, 4 do
				temp = theme_set[i][i2]
					if temp < 10 then temp = "00" .. temp
					elseif temp < 100 then temp = "0" .. temp
					end
					if theme_y+theme_slot == i and theme_x == i2 then
					txt(x-3, y-2, "[   ]", 0, 0, "", 1, 2)
					end
				txt(x+4, y, temp, 0, 0, "", 1, 2)
				x += 30
				end
			x = 30
			y += 13
			end
			if orientation == 1 then
				if buttons.up then
					if theme_y == 13 then
					theme_slot += 12
						if theme_slot > 108 then
						theme_slot = 0
						end
					else
					theme_x += 1
						if theme_x > 4 then
						theme_x = 1
						end
					end
				end
				if buttons.down then
					if theme_y == 13 then
					theme_slot -= 12
						if theme_slot < 0 then
						theme_slot = 108
						end
					else
					theme_x -= 1
						if theme_x <= 0 then
						theme_x = 4
						end
					end
				end
				if buttons.left then
				theme_y -= 1
					if theme_y <= 0 then
					theme_y = 13
					end
				end
				if buttons.right then
				theme_y += 1
					if theme_y > 13 then
					theme_y = 1
					end
				end
				if buttons.analoglx <= -30 then
					if theme_RGBA[(((theme_y*4)-4)+theme_x)+(4*theme_slot)] < 255 then
					theme_RGBA[(((theme_y*4)-4)+theme_x)+(4*theme_slot)] += 5
					load_theme()
					end
				elseif buttons.analoglx >= 30 then
					if theme_RGBA[(((theme_y*4)-4)+theme_x)+(4*theme_slot)] > 0 then
					theme_RGBA[(((theme_y*4)-4)+theme_x)+(4*theme_slot)] -= 5
					load_theme()
					end
				end
			elseif orientation == 2 then
				if buttons.up then
					if theme_y == 13 then
					theme_slot -= 12
						if theme_slot < 0 then
						theme_slot = 108
						end
					else
					theme_x -= 1
						if theme_x <= 0 then
						theme_x = 4
						end
					end
				end
				if buttons.down then
					if theme_y == 13 then
					theme_slot += 12
						if theme_slot > 108 then
						theme_slot = 0
						end
					else
					theme_x += 1
						if theme_x > 4 then
						theme_x = 1
						end
					end
				end
				if buttons.left then
				theme_y += 1
					if theme_y > 13 then
					theme_y = 1
					end
				end
				if buttons.right then
				theme_y -= 1
					if theme_y <= 0 then
					theme_y = 13
					end
				end
				if buttons.analoglx <= -30 then
					if theme_RGBA[(((theme_y*4)-4)+theme_x)+(4*theme_slot)] > 0 then
					theme_RGBA[(((theme_y*4)-4)+theme_x)+(4*theme_slot)] -= 5
					load_theme()
					end
				elseif buttons.analoglx >= 30 then
					if theme_RGBA[(((theme_y*4)-4)+theme_x)+(4*theme_slot)] < 255 then
					theme_RGBA[(((theme_y*4)-4)+theme_x)+(4*theme_slot)] += 5
					load_theme()
					end
				end
			end
		end
		--Process motion enablement/disablement
		if buttons.square then
			if motion_control == 1 then
			motion_control = 0
			sound.play(sfx_switch)
			elseif motion_control == 0 then
			motion_control = 1
			sound.play(sfx_switch)
			end
		ini.write(dir .. "config.ini", "motion_control", motion_control)
		end
		--Edit mode
		if buttons.select then
			if edit_mode == 0 then
			edit_mode = 1
			elseif edit_mode == 1 then
			edit_mode = 0
			temp = ""
				for i = 1, 120 do
					for i2 = 1, 4 do
						if string.len(theme_set[i][i2]) == 1 then
						temp = temp .. "00" .. theme_set[i][i2]
						elseif string.len(theme_set[i][i2]) == 2 then
						temp = temp .. "0" .. theme_set[i][i2]
						elseif string.len(theme_set[i][i2]) == 3 then
						temp = temp .. theme_set[i][i2]
						end
					end
				end
			first = 1
			last = 144
			screen.flip()
			draw.fillrect(0, 0, 960, 544, theme_color[1+theme_slot])
			txt(10, 10, "SAVING theme data...", 0, 0, "", 3, 2)
			txt(10, 37, "Don't turn the system power off while saving!", 0, 0, "", 2, 2)
			screen.flip()
				for i = 1, 10 do
					if string.sub(table.concat(themes), first, last) ~= string.sub(temp, first, last) then
					ini.write(dir .. "config.ini", "themes[" .. i .. "]", string.sub(temp, first, last))
					themes[i] = ini.read(dir .. "config.ini", "themes[" .. i .. "]", "255255255050000050000255090090090255255255255255255255255030000000000050130130130255255255255255255255255255255255255255255255180255255255255030")
					end
				first += 144
				last += 144
				end
			ini.write(dir .. "config.ini", "theme_slot", theme_slot)
			end
		end

		--Refresh VFX
		screen.waitvblankstart()
		screen.flip()
	end
---------------------------------------------------------------------------------------------------
--MAIN END-----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------