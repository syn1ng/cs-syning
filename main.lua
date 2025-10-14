-- name: [CS] Syning
-- description: the blue haired dumdum now in sm64,,\n\nMade by: Charlotte, Syning\n\n\\#ff7777\\This Pack requires Character Select\nto use as a Library!

--[[
    API Documentation for Character Select can be found below:
    https://github.com/Squishy6094/character-select-coop/wiki/API-Documentation

    Use this if you're curious on how anything here works >v<
]]

-- Replace Mod Name with your Character/Pack name.
local TEXT_MOD_NAME = "[CS] Syning"

-- Stops mod from loading if Character Select isn't on, Does not need to be touched
if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

--[[
    Everything from here down is character data, and is loaded at the end of the file

    Note that most things here are noted out via use of '--', if there is any
    functionality you'd want to use then remove the '--' in front of the functions.

    If needbe, Replace CHAR in the tables with your character's name
    Ex: E_MODEL_CHAR -> E_MODEL_SQUISHY

    Ensure all file naming is unique from other mods.
    Prefixing your files with your character's name should work fine
    Ex: life-icon.png -> squis
]]

local E_MODEL_CHAR =      smlua_model_util_get_id("syning_geo")      -- Located in "actors"
-- local E_MODEL_CHAR_STAR = smlua_model_util_get_id("custom_model_star_geo") -- Located in "actors"



-- All Located in "actors" folder
-- (Models do not exist in template)
--[[
local CAPTABLE_CHAR = {
    normal = smlua_model_util_get_id("FILENAME_geo"),
    wing = smlua_model_util_get_id("FILENAME_geo"),
    metal = smlua_model_util_get_id("FILENAME_geo"),
}
]]

local ANIMTABLE_SYNING = {
    [charSelect.CS_ANIM_MENU] = 'SYNINGPOSE'
}

local PALETTE_CHAR = {
    [PANTS]  = "191827FF",
    [SHIRT]  = "B4B6E4FF",
    [GLOVES] = "E5E5FFFF",
    [SHOES]  = "B4B6E4FF",
    [HAIR]   = "2D54FFFF",
    [SKIN]   = "FFA781FF",
    [CAP]    = "2D54FFFF",
	[EMBLEM] = "05031AFF"
}

-- All Located in "textures" folder
-- (Textures do not exist in template)
--[[
local HEALTH_METER_CHAR = {
    label = {
        left = get_texture_info("healthleft"),
        right = get_texture_info("healthright"),
    },
    pie = {
        [1] = get_texture_info("Pie1"),
        [2] = get_texture_info("Pie2"),
        [3] = get_texture_info("Pie3"),
        [4] = get_texture_info("Pie4"),
        [5] = get_texture_info("Pie5"),
        [6] = get_texture_info("Pie6"),
        [7] = get_texture_info("Pie7"),
        [8] = get_texture_info("Pie8"),
    }
}
]]

--[[
    Everything from here down where the data is applied

    Note that nothing here other than the 'character_add' function
    is required for a custom character, if you don't have the assets
    then feel free to remove the function from the functions below
]]

local CSloaded = false
local function on_character_select_load()
    
    CT_CHAR = _G.charSelect.character_add(
        "Syning", -- Character Name
        "Blue hair and pronouns incarnated,,,", -- Description
        "Syning, Winbowbreaker Charlotte", -- Credits
        "2D54FFFF",           -- Menu Color
        E_MODEL_CHAR,       -- Character Model
        CT_MARIO,           -- Override Character
        TEX_CHAR_LIFE_ICON, -- Life Icon
        1,                  -- Camera Scale
        0                   -- Vertical Offset
    )

    -- Adds cap models to your character
    -- (Models do not exist in template)
    -- _G.charSelect.character_add_caps(E_MODEL_CHAR, CAPTABLE_CHAR)

    -- Adds a voice to your character
    -- (Sounds do not exist in template)
    -- _G.charSelect.character_add_voice(E_MODEL_CHAR, VOICETABLE_CHAR)

    -- Adds a celebration star to your character
    -- (Models do not exist in template)
    --_G.charSelect.character_add_celebration_star(E_MODEL_CHAR, E_MODEL_CHAR_STAR, TEX_CHAR_STAR_ICON)

    -- Adds a palette to your character
    _G.charSelect.character_add_palette_preset(E_MODEL_CHAR, PALETTE_CHAR)

    _G.charSelect.character_add_animations(E_MODEL_CHAR, ANIMTABLE_SYNING)

    local CSGRAFFITISYNING = get_texture_info("syninggraffiti")
    _G.charSelect.character_add_graffiti(CT_SYNING, CSGRAFFITISYNING)
    
    -- Adds a health meter to your character
    -- (Textures do not exist in template)
    -- _G.charSelect.character_add_health_meter(CT_CHAR, HEALTH_METER_CHAR)

    -- Adds credits to the credits menu
    _G.charSelect.credit_add(TEXT_MOD_NAME, "Winbowbreaker Charlotte", "Syning Model")

    CSloaded = true
end

-- Character Voice hooks
-- You will likely not need to care about these
-- Will soon be overhauled

_G.charSelect.config_character_sounds()

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)