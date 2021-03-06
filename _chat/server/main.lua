local Tunnel = module('_core', 'libs/Tunnel')
local Proxy = module('_core', 'libs/Proxy')

API = Proxy.getInterface('API')
cAPI = Tunnel.getInterface('cAPI')

local EnableRealnames = true

local GTAOTheme = true

Citizen.CreateThread(function()
	if GTAOTheme == true then
		StartResource("chat-theme-gtao")
	end
end)

AddEventHandler('chatMessage', function(source, name, message)
	local _source = source
	local User = API.getUserFromSource(_source)
	local Character = User:getCharacter()
	local char_id = Character:getId()
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()
		TriggerClientEvent('chat:addMessage', -1, { args = { "OOC | ID:" .. char_id .. " | " .. name, message }, color = { 128, 128, 128 } })
	end
end)

RegisterCommand('twt', function(source, args, rawCommand)
	if source == 0 then
		print('You cant execute this command from rcon!')
		return
	end
	args = table.concat(args, ' ')
	if EnableRealnames == true then
		local name = GetRealPlayerName(source)
		TriggerClientEvent('chat:addMessage', -1, { args = { "^0[^4Twitter^0] (^5@" .. name .. "^0)", args }, color = { 0, 153, 204 } })
	else
		local name = GetPlayerName(source)
		TriggerClientEvent('chat:addMessage', -1, { args = { "^0[^4Twitter^0] (^5@" .. name .. "^0)", args }, color = { 0, 153, 204 } })
	end
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('twta', function(source, args, rawCommand)
	if source == 0 then
		print('You cant execute this command from rcon!')
		return
	end
	args = table.concat(args, ' ')
	TriggerClientEvent('chat:addMessage', -1, { args = { "^0[^4Twitter^0] (^5@Anónimo^0)", args }, color = { 0, 153, 204 } })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('olx', function(source, args, rawCommand)
	if source == 0 then
		print('You cant execute this command from rcon!')
		return
	end
	args = table.concat(args, ' ')
	if EnableRealnames == true then
		local name = GetRealPlayerName(source)
		TriggerClientEvent('chat:addMessage', -1, { args = { "^0[^3OLX^0] (^3@" .. name .. "^0)", args }, color = { 0, 153, 204 } })
	else
		local name = GetPlayerName(source)
		TriggerClientEvent('chat:addMessage', -1, { args = { "^0[^3OLX^0] (^3@" .. name .. "^0)", args }, color = { 0, 153, 204 } })
	end
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('me', function(source, args, rawCommand)
	local _source = source
	local User = API.getUserFromSource(_source)
	local Character = User:getCharacter()
	local char_id = Character:getId()
	if source == 0 then
		print('You cant execute this command from rcon!')
		return
	end
	args = table.concat(args, ' ')
	if EnableRealnames == true then
		local name = GetRealPlayerName(source)
		TriggerClientEvent('chat:sendProximityMessage', -1, source, "Me | " .. name, args, { 255, 0, 0 })
	else
		local name = GetPlayerName(source)
		TriggerClientEvent('chat:sendProximityMessage', -1, source, "Me | ID:" .. char_id .. " " .. name, args, { 255, 0, 0 })
	end
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('do', function(source, args, rawCommand)
	local _source = source
	local User = API.getUserFromSource(_source)
	local Character = User:getCharacter()
	local char_id = Character:getId()
	if source == 0 then
		print('You cant execute this command from rcon!')
		return
	end
	args = table.concat(args, ' ')
	if EnableRealnames == true then
		local name = GetRealPlayerName(source)
		TriggerClientEvent('chat:sendProximityMessage', -1, source, "Do | " .. name, args, { 0, 0, 255 })
	else
		local name = GetPlayerName(source)
		TriggerClientEvent('chat:sendProximityMessage', -1, source, "Do | ID:" .. char_id .. " " .. name, args, { 0, 0, 255 })
	end
	--print(('%s: %s'):format(name, args))
end, false)

function GetRealPlayerName(source)
	local User = API.getUserFromSource(source)
    local Character = User:getCharacter()
    local Name = User:getCharacter():getName()
	if Character then
		return Name
	else
		return GetPlayerName(source)
	end
end 