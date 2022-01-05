local steam_ids = {
	["dota"] = 570,
	["Celeste"] = 504230,
	["Muse Dash"] = 774171,
	["Hollow Knight"] = 367520,
	["Dark Souls: Remastered"] = 570940,
}

local game_list = ""
for k, _ in pairs(steam_ids) do
	game_list = game_list .. k .. "\n"
end

local cmd = ("echo -e '$a' | dmenu -i -p 'GabeN Clap: '"):gsub("$a", game_list)
local handle = io.popen(cmd)
local op = handle:read("*a")
handle:close()
op = string.sub(op, 1, string.len(op) - 1)
cmd = ("steam steam://rungameid/$id"):gsub("$id", steam_ids[op])
os.execute(cmd)
