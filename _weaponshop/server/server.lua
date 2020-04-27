local Tunnel = module('_core', 'libs/Tunnel')
local Proxy = module('_core', 'libs/Proxy')

API = Proxy.getInterface('API')
cAPI = Tunnel.getInterface('cAPI')

RegisterServerEvent('weapon:pay')
AddEventHandler('weapon:pay', function()
	local _source = source
	local User = API.getUserFromSource(_source)
	local Character = User:getCharacter()
	local money = Character:getMoney()
	if User then
		Character:removeMoney(150000)
		User:notify(Config.Language.paid .. " 150000$")
	end
end)

RegisterServerEvent('ammo:pay')
AddEventHandler('ammo:pay', function()
	local _source = source
	local User = API.getUserFromSource(_source)
	local Character = User:getCharacter()
	local money = Character:getMoney()
	if User then
		Character:removeMoney(700)
		User:notify(Config.Language.paid .. " 700$")
	end
end)

RegisterServerEvent('fillammo:pay')
AddEventHandler('fillammo:pay', function()
	local _source = source
	local User = API.getUserFromSource(_source)
	local Character = User:getCharacter()
	local money = Character:getMoney()
	if User then
		Character:removeMoney(2000)
		User:notify(Config.Language.paid .. " 2000$")
	end
end)

RegisterServerEvent('custom:pay')
AddEventHandler('custom:pay', function()
	local _source = source
	local User = API.getUserFromSource(_source)
	local Character = User:getCharacter()
	local money = Character:getMoney()
	if User then
		Character:removeMoney(20000)
		User:notify(Config.Language.paid .. " 20000$")
	end
end)