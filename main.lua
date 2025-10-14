-- name: [CS] Syning
-- description: the blue haired dumdum now in sm64,,\n\nMade by: Charlotte, Syning\n\n\\#ff7777\\This Pack requires Character Select\nto use as a Library!

local TEXT_MOD_NAME = "[CS] Syning"

if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end


local E_MODEL_CHAR =      smlua_model_util_get_id("syning_geo")
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

 
    _G.charSelect.character_add_palette_preset(E_MODEL_CHAR, PALETTE_CHAR)

    _G.charSelect.character_add_animations(E_MODEL_CHAR, ANIMTABLE_SYNING)

    local CSGRAFFITISYNING = get_texture_info("syninggraffiti")
    _G.charSelect.character_add_graffiti(CT_SYNING, CSGRAFFITISYNING)


    _G.charSelect.credit_add(TEXT_MOD_NAME, "Winbowbreaker Charlotte", "Syning Model")

    CSloaded = true
end


_G.charSelect.config_character_sounds()

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)