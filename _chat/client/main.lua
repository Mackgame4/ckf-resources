RegisterNetEvent('chat:sendProximityMessage')
AddEventHandler('chat:sendProximityMessage', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
	if target == source then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/twt',  "Manda um tweet",  { { name = "Mensagem", help = "Mensagem" } } )
	TriggerEvent('chat:addSuggestion', '/twta',  "Manda um tweet anonimo",  { { name = "Mensagem", help = "Mensagem" } } )
	TriggerEvent('chat:addSuggestion', '/ooc',  "Manda uma mensagem fora de RP",  { { name = "Mensagem", help = "Mensagem" } } )
	TriggerEvent('chat:addSuggestion', '/olx',  "Serve para vender/anunciar algo no chat",  { { name = "Mensagem", help = "Mensagem" } } )
	TriggerEvent('chat:addSuggestion', '/me',   "Ação pessoal",   { { name = "Mensagem", help = "Mensagem" } } )
	TriggerEvent('chat:addSuggestion', '/do',   "Informação em RP",   { { name = "Mensagem", help = "Mensagem" } } )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/twt')
		TriggerEvent('chat:removeSuggestion', '/twta')
		TriggerEvent('chat:removeSuggestion', '/ooc')
		TriggerEvent('chat:removeSuggestion', '/olx')
		TriggerEvent('chat:removeSuggestion', '/me')
		TriggerEvent('chat:removeSuggestion', '/do')
	end
end)