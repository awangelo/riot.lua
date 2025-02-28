--
-- Constantes
--

local message             = "live laugh lain"
local is_first_load       = true
local current_tab         = nil
local default_fov         = 680
local default_offset_x    = 25
local default_offset_y    = 0
local default_offset_z    = -15
local default_thirdperson = 115
local colors              = {
    blue = "\a5bcefaFF",
    pink = "\af5a9b8FF",
    white = "\affffffFF"
}
local tab_names           = {
    info = colors.white .. "Info",
    visuals = colors.pink .. "Visuals",
    misc = colors.blue .. "Misc"
}
local menu_tabs           = ui.new_combobox("LUA", "A",
    colors.white .. message .. colors.pink .. " ~ " .. colors.blue .. "category", {
        tab_names.info, tab_names.visuals, tab_names.misc
    }
)


--
-- Items do menu
--

ui.new_label("LUA", "A", colors.white .. "                . ݁₊ ⊹ . ݁ ⟡ ݁ . ⊹ ₊ ݁.")
ui.new_label("LUA", "A", " ")

local menu = {
    aspect_ratio_toggle = ui.new_checkbox("LUA", "A", "Aspect Ratio"),
    aspect_ratio_slider = ui.new_slider("LUA", "A", "\nRatio", 1, 4, 1, true, nil, 1, {
        [1] = "4/3",
        [2] = "5/4",
        [3] = "16/9",
        [4] = "16/10"
    }),
    thirdperson_toggle  = ui.new_checkbox("LUA", "A", "Thirdperson Distance"),
    thirdperson_slider  = ui.new_slider("LUA", "A", "\nDistance", 30, 200, 115, true, " u", 1),
    info_message        = ui.new_label("LUA", "A",
        colors.white .. "made " .. colors.pink .. "with ♥ " .. colors.white .. "by " .. colors.blue .. "@bsdtar"),
    viewmodel_changer   = ui.new_checkbox("LUA", "A", "Viewmodel changer"),
    viewmodel_fov       = ui.new_slider("LUA", "A", "Offset fov", 0, 1500, default_fov, true, nil, 0.1),
    viewmodel_offset_x  = ui.new_slider("LUA", "A", "Offset x", -200, 200, default_offset_x, true, nil, 0.1),
    viewmodel_offset_y  = ui.new_slider("LUA", "A", "Offset y", -100, 300, default_offset_y, true, nil, 0.1),
    viewmodel_offset_z  = ui.new_slider("LUA", "A", "Offset z", -100, 300, default_offset_z, true, nil, 0.1),
    autobuy             = ui.new_combobox("LUA", "A", "Auto buy", { "off", "auto", "awp", "scout" })
}


--
-- Features
--

local function set_aspectratio()
    local enabled = ui.get(menu.aspect_ratio_toggle)
    if not enabled then
        cvar["r_aspectratio"]:set_float(0)
        return
    end

    local slider_value = ui.get(menu.aspect_ratio_slider)
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
    local enabled = ui.get(menu.thirdperson_toggle)
    if not enabled then
        cvar["cam_idealdist"]:set_int(default_thirdperson)
        return
    end

    cvar["cam_idealdist"]:set_int(ui.get(menu.thirdperson_slider))
end

local function set_viewmodel(fov, x, y, z)
    cvar.viewmodel_fov:set_raw_float(fov * 0.1)
    cvar.viewmodel_offset_x:set_raw_float(x * 0.1)
    cvar.viewmodel_offset_y:set_raw_float(y * 0.1)
    cvar.viewmodel_offset_z:set_raw_float(z * 0.1)
end

local function handle_aspect_ratio_toggle()
    local enabled = ui.get(menu.aspect_ratio_toggle)
    ui.set_visible(menu.aspect_ratio_slider, enabled)
    set_aspectratio()
end

local function handle_thirdperson_toggle()
    local enabled = ui.get(menu.thirdperson_toggle)
    ui.set_visible(menu.thirdperson_slider, enabled)
    set_thirdperson()
end

local function handle_viewmodel()
    local enabled = ui.get(menu.viewmodel_changer)
    if not enabled then
        set_viewmodel(default_fov, default_offset_x, default_offset_y, default_offset_z)
    end

    local offset_fov = ui.get(menu.viewmodel_fov)
    local offset_x   = ui.get(menu.viewmodel_offset_x)
    local offset_y   = ui.get(menu.viewmodel_offset_y)
    local offset_z   = ui.get(menu.viewmodel_offset_z)
    set_viewmodel(offset_fov, offset_x, offset_y, offset_z)
end

local function handle_autobuy()
    local selected_option = ui.get(menu.autobuy)

    if selected_option == "off" then
        return
    elseif selected_option == "auto" then
        client.exec(
            "buy g3sg1; buy scar20; buy deagle; buy revolver; buy smokegrenade; buy hegrenade; buy molotov; buy incgrenade; buy defuser; buy taser 34; buy vesthelm;")
    elseif selected_option == "awp" then
        client.exec(
            "buy awp; buy deagle; buy revolver; buy smokegrenade; buy hegrenade; buy molotov; buy incgrenade; buy defuser; buy taser 34; buy vesthelm;")
    elseif selected_option == "scout" then
        client.exec(
            "buy ssg08; buy deagle; buy revolver; buy smokegrenade; buy hegrenade; buy molotov; buy incgrenade; buy defuser; buy taser 34; buy vesthelm;")
    end
end

local function handle_viewmodel_toggle()
    local enabled = ui.get(menu.viewmodel_changer)
    ui.set_visible(menu.viewmodel_fov, enabled)
    ui.set_visible(menu.viewmodel_offset_x, enabled)
    ui.set_visible(menu.viewmodel_offset_y, enabled)
    ui.set_visible(menu.viewmodel_offset_z, enabled)

    if not enabled then
        set_viewmodel(default_fov, default_offset_x, default_offset_y, default_offset_z)
    else
        handle_viewmodel()
    end
end


--
-- Menu
--

local function update_visibility(selected_tab)
    if current_tab == selected_tab then
        return
    end

    current_tab = selected_tab

    for _, e in pairs(menu) do
        ui.set_visible(e, false)
    end

    if selected_tab == tab_names.info then
        ui.set_visible(menu.info_message, true)
    elseif selected_tab == tab_names.visuals then
        -- Checkboxes de toggle
        ui.set_visible(menu.aspect_ratio_toggle, true)
        ui.set_visible(menu.thirdperson_toggle, true)
        ui.set_visible(menu.viewmodel_changer, true)

        ui.set_visible(menu.aspect_ratio_slider, ui.get(menu.aspect_ratio_toggle))
        ui.set_visible(menu.thirdperson_slider, ui.get(menu.thirdperson_toggle))

        ui.set_visible(menu.viewmodel_changer, true)
        -- Mostra os sliders do viewmodel apenas se a feature estiver ativada
        local viewmodel_enabled = ui.get(menu.viewmodel_changer)
        ui.set_visible(menu.viewmodel_fov, viewmodel_enabled)
        ui.set_visible(menu.viewmodel_offset_x, viewmodel_enabled)
        ui.set_visible(menu.viewmodel_offset_y, viewmodel_enabled)
        ui.set_visible(menu.viewmodel_offset_z, viewmodel_enabled)
    elseif selected_tab == tab_names.misc then
        ui.set_visible(menu.autobuy, true)
    end
end

local function init_menu()
    if not is_first_load then
        return
    end

    -- Callbacks para as features
    ui.set_callback(menu.aspect_ratio_toggle, handle_aspect_ratio_toggle)
    ui.set_callback(menu.aspect_ratio_slider, set_aspectratio)

    ui.set_callback(menu.thirdperson_toggle, handle_thirdperson_toggle)
    ui.set_callback(menu.thirdperson_slider, set_thirdperson)

    ui.set_callback(menu.viewmodel_changer, handle_viewmodel_toggle)
    ui.set_callback(menu.viewmodel_fov, handle_viewmodel)
    ui.set_callback(menu.viewmodel_offset_x, handle_viewmodel)
    ui.set_callback(menu.viewmodel_offset_y, handle_viewmodel)
    ui.set_callback(menu.viewmodel_offset_z, handle_viewmodel)

    -- Callback para mudanca de tab
    ui.set_callback(menu_tabs, function()
        update_visibility(ui.get(menu_tabs))
    end)

    -- Seta a primeira aba
    update_visibility(ui.get(menu_tabs))

    is_first_load = false

    -- Remove a si mesmo
    client.unset_event_callback("paint_ui", init_menu)
end

client.set_event_callback("paint_ui", init_menu)
client.set_event_callback("round_prestart", handle_autobuy)

client.set_event_callback("shutdown", function()
    set_viewmodel(default_fov, default_offset_x, default_offset_y, default_offset_z)
end)
