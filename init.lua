local function calc_yaw(yaw_data)
	local directions = {"+z", "-x", "-z", "+x"}
	return directions[math.floor(yaw_data / 90 + 0.5) + 1]
end

minetest.register_globalstep(function()
	local player = minetest.localplayer

	if not player then return end

	local is_cheat_enabled = minetest.settings:get_bool("bhop")

	if not is_cheat_enabled then return end

	local control = player:get_control()
	local yaw = player:get_yaw()

	if control.up and control.jump then
		--[[
		local direction = calc_yaw(yaw)

		if direction == "+z" then
			player:set_velocity(vector.add({x = 0, y = 0, z = 3}))
		elseif direction == "+x" then
			player:set_velocity(vector.add({x = 3, y = 0, z = 0}))
		elseif direction == "-z" then
			player:set_velocity(vector.add({x = 0, y = 0, z = -3}))
		elseif direction == "-x" then
			player:set_velocity(vector.add({x = -3, y = 0, z = 0}))
		end
		]]--
		player:set_physics_override({
			speed = 2
		})
	else
		player:set_physics_override({
			speed = 1
		})
	end
end)

minetest.register_cheat("BHop", "Movement", "bhop")
