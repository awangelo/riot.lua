--local variables for API functions. Generated using https://github.com/sapphyrus/gamesense-lua/blob/master/generate_api.lua
local client_current_threat, client_userid_to_entindex, client_set_event_callback, client_screen_size, client_trace_bullet, client_unix_time, client_color_log, client_reload_active_scripts, client_scale_damage, client_get_cvar, client_key_state, client_create_interface, client_random_int, client_latency, client_set_clan_tag, client_find_signature, client_log, client_fire_event, client_delay_call, client_timestamp, client_trace_line, client_request_full_update, client_register_esp_flag, client_get_model_name, client_camera_position, client_error_log, client_visible, client_exec, client_random_float, client_set_cvar, client_draw_debug_text, client_draw_hitboxes, client_eye_position, client_update_player_list, client_camera_angles, client_real_latency, client_unset_event_callback, client_system_time = client.current_threat, client.userid_to_entindex, client.set_event_callback, client.screen_size, client.trace_bullet, client.unix_time, client.color_log, client.reload_active_scripts, client.scale_damage, client.get_cvar, client.key_state, client.create_interface, client.random_int, client.latency, client.set_clan_tag, client.find_signature, client.log, client.fire_event, client.delay_call, client.timestamp, client.trace_line, client.request_full_update, client.register_esp_flag, client.get_model_name, client.camera_position, client.error_log, client.visible, client.exec, client.random_float, client.set_cvar, client.draw_debug_text, client.draw_hitboxes, client.eye_position, client.update_player_list, client.camera_angles, client.real_latency, client.unset_event_callback, client.system_time
local entity_get_local_player, entity_is_enemy, entity_get_bounding_box, entity_get_all, entity_set_prop, entity_get_player_weapon, entity_get_steam64, entity_hitbox_position, entity_get_player_resource, entity_get_esp_data, entity_is_dormant, entity_get_player_name, entity_get_game_rules, entity_get_classname, entity_get_origin, entity_get_prop, entity_new_prop, entity_get_players, entity_is_alive = entity.get_local_player, entity.is_enemy, entity.get_bounding_box, entity.get_all, entity.set_prop, entity.get_player_weapon, entity.get_steam64, entity.hitbox_position, entity.get_player_resource, entity.get_esp_data, entity.is_dormant, entity.get_player_name, entity.get_game_rules, entity.get_classname, entity.get_origin, entity.get_prop, entity.new_prop, entity.get_players, entity.is_alive
local globals_interpolationamount, globals_servertickcount, globals_frametime, globals_absoluteframetime, globals_chokedcommands, globals_commandack, globals_oldcommandack, globals_tickcount, globals_framelerp, globals_lastoutgoingcommand, globals_curtime, globals_mapname, globals_tickinterval, globals_framecount, globals_realtime, globals_maxplayers = globals.interpolationamount, globals.servertickcount, globals.frametime, globals.absoluteframetime, globals.chokedcommands, globals.commandack, globals.oldcommandack, globals.tickcount, globals.framelerp, globals.lastoutgoingcommand, globals.curtime, globals.mapname, globals.tickinterval, globals.framecount, globals.realtime, globals.maxplayers
local ui_new_slider, ui_new_combobox, ui_reference, ui_set_visible, ui_new_textbox, ui_new_color_picker, ui_set_enabled, ui_new_button, ui_mouse_position, ui_new_listbox, ui_new_label, ui_is_menu_open, ui_new_hotkey, ui_set, ui_new_multiselect, ui_update, ui_menu_size, ui_name, ui_menu_position, ui_set_callback, ui_type, ui_new_checkbox, ui_new_string, ui_get = ui.new_slider, ui.new_combobox, ui.reference, ui.set_visible, ui.new_textbox, ui.new_color_picker, ui.set_enabled, ui.new_button, ui.mouse_position, ui.new_listbox, ui.new_label, ui.is_menu_open, ui.new_hotkey, ui.set, ui.new_multiselect, ui.update, ui.menu_size, ui.name, ui.menu_position, ui.set_callback, ui.type, ui.new_checkbox, ui.new_string, ui.get
local renderer_blur, renderer_load_svg, renderer_world_to_screen, renderer_circle_outline, renderer_rectangle, renderer_gradient, renderer_circle, renderer_text, renderer_line, renderer_load_jpg, renderer_load_png, renderer_triangle, renderer_measure_text, renderer_load_rgba, renderer_indicator, renderer_texture = renderer.blur, renderer.load_svg, renderer.world_to_screen, renderer.circle_outline, renderer.rectangle, renderer.gradient, renderer.circle, renderer.text, renderer.line, renderer.load_jpg, renderer.load_png, renderer.triangle, renderer.measure_text, renderer.load_rgba, renderer.indicator, renderer.texture
local math_ceil, math_tan, math_cos, math_sinh, math_pi, math_max, math_atan2, math_floor, math_sqrt, math_deg, math_atan, math_fmod, math_acos, math_pow, math_abs, math_min, math_sin, math_log, math_exp, math_cosh, math_asin, math_rad = math.ceil, math.tan, math.cos, math.sinh, math.pi, math.max, math.atan2, math.floor, math.sqrt, math.deg, math.atan, math.fmod, math.acos, math.pow, math.abs, math.min, math.sin, math.log, math.exp, math.cosh, math.asin, math.rad
local table_clear, table_sort, table_remove, table_concat, table_insert = table.clear, table.sort, table.remove, table.concat, table.insert
local string_find, string_format, string_len, string_gsub, string_gmatch, string_match, string_reverse, string_upper, string_lower, string_sub = string.find, string.format, string.len, string.gsub, string.gmatch, string.match, string.reverse, string.upper, string.lower, string.sub
local materialsystem_chams_material, materialsystem_arms_material, materialsystem_find_texture, materialsystem_get_model_materials, materialsystem_find_material, materialsystem_override_material, materialsystem_find_materials, materialsystem_viewmodel_material = materialsystem.chams_material, materialsystem.arms_material, materialsystem.find_texture, materialsystem.get_model_materials, materialsystem.find_material, materialsystem.override_material, materialsystem.find_materials, materialsystem.viewmodel_material
local ipairs, assert, pairs, next, tostring, tonumber, setmetatable, unpack, type, getmetatable, pcall, error = ipairs, assert, pairs, next, tostring, tonumber, setmetatable, unpack, type, getmetatable, pcall, error
--end of local variables

--
-- Constantes
--

local message             = "live laugh lain"
local is_first_load       = true
local default_fov         = 680
local default_offset_x    = 25
local default_offset_y    = 0
local default_offset_z    = -15
local default_thirdperson = 115

local colors = {
    blue = "\a5bcefaFF",
    pink = "\af5a9b8FF",
    white = "\affffffFF",
    blue_rgb = { 91, 206, 250 },
    pink_rgb = { 245, 169, 184 },
    white_rgb = { 255, 255, 255 }
}

local hitgroup_names = { "generic", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg",
    "neck", "?", "gear" }

local tab_names = {
    info = colors.white .. "Info",
    visuals = colors.pink .. "Visuals",
    misc = colors.blue .. "Misc"
}

local menu_tabs = ui_new_combobox("LUA", "A",
    colors.white .. message .. colors.pink .. " ~ " .. colors.blue .. "category", {
        tab_names.info, tab_names.visuals, tab_names.misc
    }
)


--
-- Items do menu
--

ui_new_label("LUA", "A", colors.white .. "                . ݁₊ ⊹ . ݁ ⟡ ݁ . ⊹ ₊ ݁.")
ui_new_label("LUA", "A", " ")

local menu = {
    aspect_ratio_toggle = ui_new_checkbox("LUA", "A", "Aspect Ratio"),
    aspect_ratio_slider = ui_new_slider("LUA", "A", "\nRatio", 1, 4, 1, true, nil, 1, {
        [1] = "4/3",
        [2] = "5/4",
        [3] = "16/9",
        [4] = "16/10"
    }),
    thirdperson_toggle  = ui_new_checkbox("LUA", "A", "Thirdperson Distance"),
    thirdperson_slider  = ui_new_slider("LUA", "A", "\nDistance", 30, 200, 115, true, " u", 1),
    info_message        = ui_new_label("LUA", "A",
        colors.white .. "made " .. colors.pink .. "with ♥ " .. colors.white .. "by " .. colors.blue .. "@bsdtar"),
    viewmodel_changer   = ui_new_checkbox("LUA", "A", "Viewmodel changer"),
    viewmodel_fov       = ui_new_slider("LUA", "A", "Offset fov", 0, 1500, default_fov, true, nil, 0.1),
    viewmodel_offset_x  = ui_new_slider("LUA", "A", "Offset x", -200, 200, default_offset_x, true, nil, 0.1),
    viewmodel_offset_y  = ui_new_slider("LUA", "A", "Offset y", -100, 300, default_offset_y, true, nil, 0.1),
    viewmodel_offset_z  = ui_new_slider("LUA", "A", "Offset z", -100, 300, default_offset_z, true, nil, 0.1),
    autobuy             = ui_new_combobox("LUA", "A", "Auto buy", { "off", "auto", "awp", "scout" }),
    log_missed_shots    = ui_new_checkbox("LUA", "A", "Log misses")
}

local tab_groups = {
    [tab_names.info] = {
        menu.info_message
    },
    [tab_names.visuals] = {
        menu.aspect_ratio_toggle, menu.aspect_ratio_slider,
        menu.thirdperson_toggle, menu.thirdperson_slider,
        menu.viewmodel_changer, menu.viewmodel_fov,
        menu.viewmodel_offset_x, menu.viewmodel_offset_y,
        menu.viewmodel_offset_z
    },
    [tab_names.misc] = {
        menu.autobuy, menu.log_missed_shots
    }
}


--
-- Features
--

local function set_aspectratio()
    local enabled = ui_get(menu.aspect_ratio_toggle)
    if not enabled then
        cvar["r_aspectratio"]:set_float(0)
        return
    end

    local slider_value = ui_get(menu.aspect_ratio_slider)
    local aspect_map = {
        [1] = 4 / 3,
        [2] = 5 / 4,
        [3] = 16 / 9,
        [4] = 16 / 10
    }
    local ratio = aspect_map[slider_value]
    cvar["r_aspectratio"]:set_float(ratio)
end

local function set_thirdperson()
    local enabled = ui_get(menu.thirdperson_toggle)
    if not enabled then
        cvar["cam_idealdist"]:set_int(default_thirdperson)
        return
    end

    cvar["cam_idealdist"]:set_int(ui_get(menu.thirdperson_slider))
end

local function set_viewmodel(fov, x, y, z)
    cvar.viewmodel_fov:set_raw_float(fov * 0.1)
    cvar.viewmodel_offset_x:set_raw_float(x * 0.1)
    cvar.viewmodel_offset_y:set_raw_float(y * 0.1)
    cvar.viewmodel_offset_z:set_raw_float(z * 0.1)
end

local function handle_aspect_ratio_toggle()
    local enabled = ui_get(menu.aspect_ratio_toggle)
    ui_set_visible(menu.aspect_ratio_slider, enabled)
    set_aspectratio()
end

local function handle_thirdperson_toggle()
    local enabled = ui_get(menu.thirdperson_toggle)
    ui_set_visible(menu.thirdperson_slider, enabled)
    set_thirdperson()
end

local function handle_viewmodel()
    local enabled = ui_get(menu.viewmodel_changer)
    if not enabled then
        set_viewmodel(default_fov, default_offset_x, default_offset_y, default_offset_z)
    end

    local offset_fov = ui_get(menu.viewmodel_fov)
    local offset_x   = ui_get(menu.viewmodel_offset_x)
    local offset_y   = ui_get(menu.viewmodel_offset_y)
    local offset_z   = ui_get(menu.viewmodel_offset_z)
    set_viewmodel(offset_fov, offset_x, offset_y, offset_z)
end

local function handle_viewmodel_toggle()
    local enabled = ui_get(menu.viewmodel_changer)
    ui_set_visible(menu.viewmodel_fov, enabled)
    ui_set_visible(menu.viewmodel_offset_x, enabled)
    ui_set_visible(menu.viewmodel_offset_y, enabled)
    ui_set_visible(menu.viewmodel_offset_z, enabled)

    if not enabled then
        set_viewmodel(default_fov, default_offset_x, default_offset_y, default_offset_z)
    else
        handle_viewmodel()
    end
end

local function buy(command)
    client_exec(command)
end

local function handle_autobuy()
    local selected_option = ui_get(menu.autobuy)
    if selected_option == "off" then
        return
    end

    local local_player = entity_get_local_player()
    local money = entity_get_prop(local_player, "m_iAccount")
    if money <= 1200 then
        return
    end

    local command = ""
    if selected_option == "auto" then
        command =
        "buy g3sg1; buy scar20; buy deagle; buy smokegrenade; buy hegrenade; buy molotov; buy incgrenade; buy defuser; buy taser; buy vesthelm;"
    elseif selected_option == "awp" then
        command =
        "buy awp; buy deagle; buy smokegrenade; buy hegrenade; buy molotov; buy incgrenade; buy defuser; buy taser; buy vesthelm;"
    elseif selected_option == "scout" then
        command =
        "buy ssg08; buy deagle; buy smokegrenade; buy hegrenade; buy molotov; buy incgrenade; buy defuser; buy taser; buy vesthelm;"
    end

    -- Calculate delay based on latency
    local delay = 0.3 - client_latency() + 0.1

    -- Schedule multiple buy attempts
    client_delay_call(delay, buy, command)
    client_delay_call(delay + 0.1, buy, command)
    client_delay_call(delay + 0.2, buy, command)
end

local function aim_miss(e)
    local group = hitgroup_names[e.hitgroup + 1] or "?"

    -- Prefixo da lua
    client_color_log(colors.pink_rgb[1], colors.pink_rgb[2], colors.pink_rgb[3], "[\0")
    client_color_log(colors.blue_rgb[1], colors.blue_rgb[2], colors.blue_rgb[3], "riot\0")
    client_color_log(colors.pink_rgb[1], colors.pink_rgb[2], colors.pink_rgb[3], "] \0")

    -- Nome do player
    client_color_log(colors.white_rgb[1], colors.white_rgb[2], colors.white_rgb[3], "missed \0")
    client_color_log(colors.blue_rgb[1], colors.blue_rgb[2], colors.blue_rgb[3], entity_get_player_name(e.target), " \0")

    -- Hit group
    client_color_log(colors.pink_rgb[1], colors.pink_rgb[2], colors.pink_rgb[3], "(", group, ") \0")

    -- Reason
    client_color_log(colors.white_rgb[1], colors.white_rgb[2], colors.white_rgb[3], "due to \0")
    client_color_log(colors.pink_rgb[1], colors.pink_rgb[2], colors.pink_rgb[3], e.reason)
end

local function handle_missed_shots()
    local enabled = ui_get(menu.log_missed_shots)

    if enabled then
        client_set_event_callback("aim_miss", aim_miss)
    else
        client_unset_event_callback("aim_miss", aim_miss)
    end
end


--
-- Menu
--

local function update_visibility(selected_tab)
    for tab, controls in pairs(tab_groups) do
        local isVisible = (tab == selected_tab)
        for _, control in ipairs(controls) do
            ui_set_visible(control, isVisible)
        end
    end
end

local function init_menu()
    if not is_first_load then
        return
    end

    -- Callbacks para as features
    ui_set_callback(menu.aspect_ratio_toggle, handle_aspect_ratio_toggle)
    ui_set_callback(menu.aspect_ratio_slider, set_aspectratio)

    ui_set_callback(menu.thirdperson_toggle, handle_thirdperson_toggle)
    ui_set_callback(menu.thirdperson_slider, set_thirdperson)

    ui_set_callback(menu.viewmodel_changer, handle_viewmodel_toggle)
    ui_set_callback(menu.viewmodel_fov, handle_viewmodel)
    ui_set_callback(menu.viewmodel_offset_x, handle_viewmodel)
    ui_set_callback(menu.viewmodel_offset_y, handle_viewmodel)
    ui_set_callback(menu.viewmodel_offset_z, handle_viewmodel)

    ui_set_callback(menu.log_missed_shots, handle_missed_shots)

    -- Callback para mudanca de tab
    ui_set_callback(menu_tabs, function()
        update_visibility(ui_get(menu_tabs))
    end)

    -- Seta a primeira aba
    update_visibility(ui_get(menu_tabs))

    is_first_load = false

    -- Remove a si mesmo
    client_unset_event_callback("paint_ui", init_menu)
end


--
-- Callbacks
--

client_set_event_callback("paint_ui", init_menu)
client_set_event_callback("round_prestart", handle_autobuy)
client_set_event_callback("shutdown", function()
    set_viewmodel(default_fov, default_offset_x, default_offset_y, default_offset_z)
    cvar["cam_idealdist"]:set_int(default_thirdperson)
end)
