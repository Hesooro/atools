local imgui = require 'imgui'
local key = require 'vkeys'
local encoding = require 'encoding'
local fa = require 'faIcons'
local inicfg = require 'inicfg'
local dlstatus = require('moonloader').download_status
local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })
require "lib.moonloader"
-- библиотеки конец
script_author("Hessoro") 
script_name("bil") 
script_version('v1.0')
encoding.default = 'CP1251'
u8 = encoding.UTF8  
-- переменный цвета
local red_color = 0xFF0000
local green_color = 0x008000
--переменный автообновления

update_state = false

local script_vers = 1
local script_vers_text = "1.00"

local update_url = "https://raw.githubusercontent.com/Hesooro/atools/main/update.ini"
local update_path = getWorkingDirectory() .. "/update.ini"

local script_url = ""
local script_path = thisScript().path

function main() 
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end
    sampRegisterChatCommand("update", test)
	_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
    nick = sampGetPlayerNickname(id)

 downloadUrlToFile(update_url, update_path, function(id, status)
    if status == dlstatus.STATUS_ENDDOWNLOADDATA then
    updateIni = inicfg.load(nil, update_path)
        if tonumber(updateIni.info.vers) > script_vers then
        sampAddChatMessage("Есть обновление!! Версия: " .. updateIni.info.vers_text, green_color)
        update_state = true
        end
    end
end)


    print("Created by Mac East")
    print("Private")
    sampAddChatMessage("Создана Mac East, приятной игры ", 0x00FFFF) 
    print("Good Luck")



end

function test(arg)
    sampShowDialog(1000, "Обновление", "Учимся обновлять", "Закрыть", "", 0)
end