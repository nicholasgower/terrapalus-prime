
if not global then global = {} end  -- Ensure global is initialized

local INHIBITOR_RADIUS = settings.startup["inhibitor-radius"].value
local THAW_DURATION = settings.startup["inhibitor-thaw-duration"].value
local FREEZE_DURATION = settings.startup["inhibitor-freeze-duration"].value
local FREEZE_DAYTIME = settings.startup["freeze-daytime"].value
local DAYTIME_VALUE = settings.startup["daytime-value"].value
local LAMPS_PER_TICK = 10

-- Ensure global tables are initialized
local function initialize_storage()
    global.frozen_entities = global.frozen_entities or {}
    global.thawing_entities = global.thawing_entities or {}
    global.inhibitor_lamps = global.inhibitor_lamps or {}
    global.lamp_index = global.lamp_index or 1
end

local function command_enemy_to_flee(enemy, turret)
    if not enemy.valid or not turret.valid then return end

    if enemy.valid and enemy.commandable then
        -- Access the LuaCommandable object
        local commandable = enemy.commandable

        if commandable then
            -- -- Calculate a random angle for movement direction
            -- local angle = math.random() * 3 * math.pi
            -- local distance = 100  -- Distance to move away

            -- -- Calculate the target position
            -- local target_position = {
            --     x = turret.position.x + math.cos(angle) * distance,
            --     y = turret.position.y + math.sin(angle) * distance
            -- }

            -- -- Create the movement command
            -- local move_command = {
            --     type = defines.command.go_to_location,
            --     destination = target_position,
            --     distraction = defines.distraction.none,
            --     radius = 1  -- Radius around the target position
            -- }

            -- Use the `flee` command to make the enemy move away from the turret
            local flee_command = {
                type = defines.command.flee,
                from = turret,
                distraction = defines.distraction.none
            }
            -- Assign the command using the dot operator
            commandable.set_command(flee_command)
        end
    end
end

local function on_entity_damaged(event)
    local enemy = event.entity
    local source = event.cause
    
    -- First debug check - entity validity
    if not enemy.valid then
        -- game.print("Entity not valid")
        return
    end

    -- Check force
    if enemy.force.name ~= "enemy" then
        -- game.print("Not an enemy force: " .. enemy.force.name)
        return
    end
    
    -- Debug print for entity type
    -- game.print("Enemy type: " .. enemy.type)
    
    -- Check if enemy is a unit or spider-vehicle
    -- The previous logic was wrong - it was ALWAYS returning true
    if enemy.type ~= "unit" and enemy.type ~= "spider-unit" then
        -- game.print("Not a valid enemy type")
        return
    end
    
    -- Debug source
    if not source then
        -- game.print("No damage source")
        return
    end
    
    if not source.valid then
        -- game.print("Invalid damage source")
        return
    end
    
    -- Debug source name
    -- game.print("Source name: " .. source.name)
    
    -- Check if damage was caused by a UV turret
    if source.name == "uv-turret" then
        -- game.print("UV turret hit confirmed - commanding to flee")
        command_enemy_to_flee(enemy, source)
    end
end
-- Register the event handler
script.on_event(defines.events.on_entity_damaged, on_entity_damaged)


-- Function to handle night vision equipment restrictions
local function handle_night_vision(player)
    if player.surface.name == "terrapalus" then
        local armor_inventory = player.get_inventory(defines.inventory.character_armor)
        if armor_inventory and not armor_inventory.is_empty() then
            local armor = armor_inventory[1]
            if armor and armor.valid_for_read then
                local grid = armor.grid
                if grid then
                    for _, equipment in pairs(grid.equipment) do
                        if equipment.name == "night-vision-equipment" then
                            local removed_equipment = grid.take{equipment = equipment, position = equipment.position}
                            if removed_equipment then
                                player.insert(removed_equipment)
                                player.print("Night vision equipment does not work on Terra Palus. It has been moved to your inventory.")
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Event handler for player changing surfaces
script.on_event(defines.events.on_player_changed_surface, function(event)
    local player = game.get_player(event.player_index)
    if player then
        handle_night_vision(player)
    end
end)

-- Event handler for player joining the game
script.on_event(defines.events.on_player_joined_game, function(event)
    local player = game.get_player(event.player_index)
    if player then
        handle_night_vision(player)
    end
end)

-- Event handler for when equipment is placed in the armor grid
script.on_event(defines.events.on_player_placed_equipment, function(event)
    if event.equipment.name == "night-vision-equipment" then
        local player = game.get_player(event.player_index)
        if player then
            handle_night_vision(player)
        end
    end
end)

-- Event handler for when a new surface is created
script.on_event(defines.events.on_surface_created, function(event)
    local surface = game.surfaces[event.surface_index]
    if surface.name == "terrapalus" then
        surface.daytime = DAYTIME_VALUE  -- Set to midnight
        surface.freeze_daytime = FREEZE_DAYTIME  -- Freeze the time at midnight
    end
end)

-- Add lamp to global list when built
script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity}, function(event)
    local entity = event.created_entity or event.entity
    if entity.name == "inhibitor-lamp" then
        initialize_storage()
        table.insert(global.inhibitor_lamps, entity)
    end
end)

-- Remove lamp from global list when destroyed
script.on_event({defines.events.on_entity_died, defines.events.on_player_mined_entity, defines.events.on_robot_mined_entity}, function(event)
    local entity = event.entity
    if entity.name == "inhibitor-lamp" then
        initialize_storage()
        for i, lamp in ipairs(global.inhibitor_lamps) do
            if lamp == entity then
                table.remove(global.inhibitor_lamps, i)
                break
            end
        end
    end
end)

-- Initialization event to handle existing lamps and surfaces on startup
script.on_init(function()
    initialize_storage()
    -- Initialize surfaces
    for _, surface in pairs(game.surfaces) do
        if surface.name == "terrapalus" then
            surface.daytime = DAYTIME_VALUE  -- Set to midnight
            surface.freeze_daytime = FREEZE_DAYTIME  -- Freeze the time at midnight
        end
    end

    -- Populate the global lamp list with existing lamps
    for _, surface in pairs(game.surfaces) do
        local lamps = surface.find_entities_filtered({name = "inhibitor-lamp"})
        for _, lamp in pairs(lamps) do
            table.insert(global.inhibitor_lamps, lamp)
        end
    end
end)

-- Handle loading the script
script.on_load(function()
    -- Re-initialize storage to ensure global tables exist
    initialize_storage()
    -- Event handlers are automatically re-registered, no action needed
end)

-- Apply frozen sticker to entity
local function apply_frozen_sticker(entity)
    if entity and entity.valid then
        entity.surface.create_entity{
            name = "frozen-sticker",
            target = entity,
            position = entity.position
        }
    end
end

-- Apply thawing sticker to entity
local function apply_thawing_sticker(entity)
    if entity and entity.valid then
        entity.surface.create_entity{
            name = "thawing-sticker",
            target = entity,
            position = entity.position
        }
    end
end

-- Process a subset of lamps each tick
local function process_lamps()
    initialize_storage()
    local lamps = global.inhibitor_lamps
    local lamp_count = #lamps

    if lamp_count == 0 then return end

    -- Ensure global.lamp_index is within valid range
    if global.lamp_index > lamp_count then
        global.lamp_index = 1
    end

    local end_index = math.min(global.lamp_index + LAMPS_PER_TICK - 1, lamp_count)
    for i = global.lamp_index, end_index do
        local lamp = lamps[i]
        if lamp and lamp.valid and lamp.energy > 0 then
            -- Process the lamp as before
            local enemies_in_range = lamp.surface.find_entities_filtered({
                position = lamp.position,
                radius = INHIBITOR_RADIUS,
                force = "enemy",
                type = {"unit", "spider-unit"}
            })
            -- [Continue with the existing logic for freezing entities]
            for _, enemy in ipairs(enemies_in_range) do
                if enemy and enemy.valid and enemy.health > 0 then
                    if not global.frozen_entities[enemy.unit_number] then
                        global.frozen_entities[enemy.unit_number] = {
                            entity = enemy,
                            freeze_start_tick = game.tick,
                            is_freezing = true
                        }
                        apply_frozen_sticker(enemy)
                    else
                        local freeze_data = global.frozen_entities[enemy.unit_number]
                        local elapsed_ticks = game.tick - freeze_data.freeze_start_tick
                        if freeze_data.is_freezing and elapsed_ticks >= FREEZE_DURATION then
                            enemy.active = false
                            freeze_data.is_freezing = false
                        end
                    end
                    global.thawing_entities[enemy.unit_number] = nil
                end
            end
        else
            -- Remove invalid lamp
            lamps[i] = nil
        end
    end

    -- Clean up nil entries
    for i = lamp_count, 1, -1 do
        if lamps[i] == nil or not lamps[i].valid then
            table.remove(lamps, i)
        end
    end

    -- Update global.lamp_index for the next iteration
    global.lamp_index = end_index + 1
    if global.lamp_index > #lamps then
        global.lamp_index = 1
    end
end

-- Update thawing entities
local function update_thawing_entities()
    initialize_storage()
    for unit_number, thaw_data in pairs(global.thawing_entities) do
        local entity = thaw_data.entity
        if entity and entity.valid then
            local elapsed_ticks = game.tick - thaw_data.thaw_start_tick
            if elapsed_ticks > THAW_DURATION then
                -- Fully thawed; restore entity to normal
                entity.active = true
                global.thawing_entities[unit_number] = nil
            elseif elapsed_ticks == 0 then
                -- Apply thawing sticker once when thawing starts
                apply_thawing_sticker(entity)
            end
        else
            -- Clean up invalid entities
            global.thawing_entities[unit_number] = nil
        end
    end
end

-- Handle entities moving out of range and start thawing
local function process_frozen_entities()
    initialize_storage()
    for unit_number, freeze_data in pairs(global.frozen_entities) do
        local entity = freeze_data.entity
        if entity and entity.valid then
            local in_range = false
            for _, lamp in pairs(global.inhibitor_lamps) do
                if lamp and lamp.valid and lamp.energy > 0 and lamp.surface == entity.surface then
                    local dx = lamp.position.x - entity.position.x
                    local dy = lamp.position.y - entity.position.y
                    local distance_squared = dx * dx + dy * dy
                    if distance_squared <= INHIBITOR_RADIUS * INHIBITOR_RADIUS then
                        in_range = true
                        break
                    end
                end
            end
            if not in_range then
                -- Start thawing
                global.thawing_entities[unit_number] = {
                    entity = entity,
                    thaw_start_tick = game.tick
                }
                global.frozen_entities[unit_number] = nil
                entity.active = true  -- Reactivate for gradual thaw
                apply_thawing_sticker(entity)
            end
        else
            -- Clean up invalid entities
            global.frozen_entities[unit_number] = nil
        end
    end
end

-- Main update function called every tick
script.on_event(defines.events.on_tick, function(event)
    process_lamps()
    process_frozen_entities()
    update_thawing_entities()

end)


-- Ensure configuration changes are handled properly
script.on_configuration_changed(function(data)
    initialize_storage()
    -- Clean up invalid references
    for unit_number, data in pairs(global.frozen_entities) do
        if not data.entity or not data.entity.valid then
            global.frozen_entities[unit_number] = nil
        end
    end
    for unit_number, data in pairs(global.thawing_entities) do
        if not data.entity or not data.entity.valid then
            global.thawing_entities[unit_number] = nil
        end
    end
    for i = #global.inhibitor_lamps, 1, -1 do
        if not global.inhibitor_lamps[i] or not global.inhibitor_lamps[i].valid then
            table.remove(global.inhibitor_lamps, i)
        end
    end
end)
