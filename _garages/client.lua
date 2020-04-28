local Proxy = module('_core', 'libs/Proxy')
local Tunnel = module('_core', 'libs/Tunnel')

cAPI = Proxy.getInterface('cAPI')
API = Tunnel.getInterface('API')

Citizen.CreateThread(function()
while not Config do Citizen.Wait(0) end

AddTextEntry("CKF_ENTER", cAPI.getUILanguage(GetCurrentResourceName()).PressEnter)

ckfGarage_default = {
    vehicleTaken = false,
    vehicleTakenPos = false,
    curGarage = false,
    curGarageName = false,
    vehicles = {},
} ckfGarage = ckfGarage or ckfGarage_default

local vehicleTable

function GetVehicle(ply,doesNotNeedToBeDriver)
	local found = false
	local ped = GetPlayerPed((ply and ply or -1))
	local veh = 0
	if IsPedInAnyVehicle(ped) then
		 veh = GetVehiclePedIsIn(ped, false)
	end
	if veh ~= 0 then
		if GetPedInVehicleSeat(veh, -1) == ped or doesNotNeedToBeDriver then
			found = true
		end
	end
	return found, veh, (veh ~= 0 and GetEntityModel(veh) or 0)
end

local lock_fancyteleport = false
local function FancyTeleport(ent,x,y,z,h,fOut,hold,fIn,resetCam)
    if not lock_fancyteleport then
        lock_fancyteleport = true
        Citizen.CreateThread(function() Citizen.Wait(15000) DoScreenFadeIn(500) end)
        Citizen.CreateThread(function()
            FreezeEntityPosition(ent, true)
            DoScreenFadeOut(fOut or 500)
            while IsScreenFadingOut() do Citizen.Wait(0) end
            SetEntityCoords(ent, x, y, z)
            if h then SetEntityHeading(ent, h) SetGameplayCamRelativeHeading(0) end
            if GetVehicle() then SetVehicleOnGroundProperly(ent) end
            FreezeEntityPosition(ent, false)
            Citizen.Wait(hold or 5000)
            DoScreenFadeIn(fIn or 500)
            while IsScreenFadingIn() do Citizen.Wait(0) end
            lock_fancyteleport = false
        end)
    end
end

local function ToCoord(t,withHeading)
    if withHeading == true then
        local h = (t[4]+0.0) or 0.0
        return (t[1]+0.0),(t[2]+0.0),(t[3]+0.0),h
    elseif withHeading == "only" then
        local h = (t[4]+0.0) or 0.0
        return h
    else
        return (t[1]+0.0),(t[2]+0.0),(t[3]+0.0)
    end
end

local function DoesVehicleHaveExtras( veh )
    for i = 1, 30 do
        if ( DoesExtraExist( veh, i ) ) then
            return true
        end
    end
    return false
end

local function VehicleToData(veh)
	local vehicleTableData = {}
	local model = GetEntityModel( veh )
	local primaryColour, secondaryColour = GetVehicleColours( veh )
	local pearlColour, wheelColour = GetVehicleExtraColours( veh )
	local mod1a, mod1b, mod1c = GetVehicleModColor_1( veh )
	local mod2a, mod2b = GetVehicleModColor_2( veh )
	local custR1, custG2, custB3, custR2, custG2, custB2
	if ( GetIsVehiclePrimaryColourCustom( veh ) ) then
		custR1, custG1, custB1 = GetVehicleCustomPrimaryColour( veh )
	end
	if ( GetIsVehicleSecondaryColourCustom( veh ) ) then
		custR2, custG2, custB2 = GetVehicleCustomSecondaryColour( veh )
	end
	vehicleTableData[ "model" ] = tostring( model )
	vehicleTableData[ "primaryColour" ] = primaryColour
	vehicleTableData[ "secondaryColour" ] = secondaryColour
	vehicleTableData[ "pearlColour" ] = pearlColour
	vehicleTableData[ "wheelColour" ] = wheelColour
	vehicleTableData[ "mod1Colour" ] = { mod1a, mod1b, mod1c }
	vehicleTableData[ "mod2Colour" ] = { mod2a, mod2b }
	vehicleTableData[ "custPrimaryColour" ] =  { custR1, custG1, custB1 }
	vehicleTableData[ "custSecondaryColour" ] = { custR2, custG2, custB2 }
	local livery = GetVehicleLivery( veh )
	local plateText = GetVehicleNumberPlateText( veh )
	local plateType = GetVehicleNumberPlateTextIndex( veh )
	local wheelType = GetVehicleWheelType( veh )
	local windowTint = GetVehicleWindowTint( veh )
	local burstableTyres = GetVehicleTyresCanBurst( veh )
	local customTyres = GetVehicleModVariation( veh, 23 )
	vehicleTableData[ "livery" ] = livery
	vehicleTableData[ "plateText" ] = plateText
	vehicleTableData[ "plateType" ] = plateType
	vehicleTableData[ "wheelType" ] = wheelType
	vehicleTableData[ "windowTint" ] = windowTint
	vehicleTableData[ "burstableTyres" ] = burstableTyres
	vehicleTableData[ "customTyres" ] = customTyres
	local neonR, neonG, neonB = GetVehicleNeonLightsColour( veh )
	local smokeR, smokeG, smokeB = GetVehicleTyreSmokeColor( veh )
	local neonToggles = {}
	for i = 0, 3 do
		if ( IsVehicleNeonLightEnabled( veh, i ) ) then
			table.insert( neonToggles, i )
		end
	end
	vehicleTableData[ "neonColour" ] = { neonR, neonG, neonB }
	vehicleTableData[ "smokeColour" ] = { smokeR, smokeG, smokeB }
	vehicleTableData[ "neonToggles" ] = neonToggles
	local extras = {}
	if ( DoesVehicleHaveExtras( veh ) ) then
		for i = 1, 30 do
			if ( DoesExtraExist( veh, i ) ) then
				if ( IsVehicleExtraTurnedOn( veh, i ) ) then
					table.insert( extras, i )
				end
			end
		end
	end
	vehicleTableData[ "extras" ] = extras
	local mods = {}
	for i = 0, 49 do
		local isToggle = ( i >= 17 ) and ( i <= 22 )
		if ( isToggle ) then
			mods[i] = IsToggleModOn( veh, i )
		else
			mods[i] = GetVehicleMod( veh, i )
		end
	end
	vehicleTableData[ "mods" ] = mods
	local ret = vehicleTableData
	return ret
end

local function CreateVehicleFromData(data, x,y,z,h, dontnetwork)
	local model = data[ "model" ]
	local primaryColour = data[ "primaryColour" ]
	local secondaryColour = data[ "secondaryColour" ]
	local pearlColour = data[ "pearlColour" ]
	local wheelColour = data[ "wheelColour" ]
	local mod1Colour = data[ "mod1Colour" ]
	local mod2Colour = data[ "mod2Colour" ]
	local custPrimaryColour = data[ "custPrimaryColour" ]
	local custSecondaryColour = data[ "custSecondaryColour" ]
	local livery = data[ "livery" ]
	local plateText = data[ "plateText" ]
	local plateType = data[ "plateType" ]
	local wheelType = data[ "wheelType" ]
	local windowTint = data[ "windowTint" ]
	local burstableTyres = data[ "burstableTyres" ]
	local customTyres = data[ "customTyres" ]
	local neonColour = data[ "neonColour" ]
	local smokeColour = data[ "smokeColour" ]
	local neonToggles = data[ "neonToggles" ]
	local extras = data[ "extras" ]
	local mods = data[ "mods" ]
	local veh = CreateVehicle(tonumber(model), x,y,z,h,not dontnetwork)
	-- Set the mod kit to 0, this is so we can do shit to the car
	SetVehicleModKit( veh, 0 )
	SetVehicleTyresCanBurst( veh, burstableTyres )
	SetVehicleNumberPlateTextIndex( veh,  plateType )
	SetVehicleNumberPlateText( veh, plateText )
	SetVehicleWindowTint( veh, windowTint )
	SetVehicleWheelType( veh, wheelType )
	for i = 1, 30 do
		if ( DoesExtraExist( veh, i ) ) then
			SetVehicleExtra( veh, i, true )
		end
	end
	for k, v in pairs( extras ) do
		local extra = tonumber( v )
		SetVehicleExtra( veh, extra, false )
	end
	for k, v in pairs( mods ) do
		local k = tonumber( k )
		local isToggle = ( k >= 17 ) and ( k <= 22 )
		if ( isToggle ) then
			ToggleVehicleMod( veh, k, v )
		else
			SetVehicleMod( veh, k, v, 0 )
		end
	end
	local currentMod = GetVehicleMod( veh, 23 )
	SetVehicleMod( veh, 23, currentMod, customTyres )
	SetVehicleMod( veh, 24, currentMod, customTyres )
	if ( livery ~= -1 ) then
		SetVehicleLivery( veh, livery )
	end
	SetVehicleExtraColours( veh, pearlColour, wheelColour )
	SetVehicleModColor_1( veh, mod1Colour[1], mod1Colour[2], mod1Colour[3] )
	SetVehicleModColor_2( veh, mod2Colour[1], mod2Colour[2] )
	SetVehicleColours( veh, primaryColour, secondaryColour )
	if ( custPrimaryColour[1] ~= nil and custPrimaryColour[2] ~= nil and custPrimaryColour[3] ~= nil ) then
		SetVehicleCustomPrimaryColour( veh, custPrimaryColour[1], custPrimaryColour[2], custPrimaryColour[3] )
	end
	if ( custSecondaryColour[1] ~= nil and custSecondaryColour[2] ~= nil and custSecondaryColour[3] ~= nil ) then
		SetVehicleCustomPrimaryColour( veh, custSecondaryColour[1], custSecondaryColour[2], custSecondaryColour[3] )
	end
	SetVehicleNeonLightsColour( veh, neonColour[1], neonColour[2], neonColour[3] )
	for i = 0, 3 do
		SetVehicleNeonLightEnabled( veh, i, false )
	end
	for k, v in pairs( neonToggles ) do
		local index = tonumber( v )
		SetVehicleNeonLightEnabled( veh, index, true )
	end
	SetVehicleDirtLevel(veh, 0.0)
	return veh
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.010+ factor, 0.03, 0, 0, 0, 90)
end

--Map Blips
Citizen.CreateThread(function()
    local blips = {}
    for ln,loc in pairs(Config.locations) do
        local x,y,z = ToCoord(loc.inLocation[1],false) -- Get coords
        local blip = AddBlipForCoord(x,y,z) -- Create blip
        -- Set blip option
        SetBlipSprite(blip, 289)
		SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 63)
        SetBlipAsShortRange(blip, true)
        SetBlipCategory(blip, 9)
        BeginTextCommandSetBlipName("STRING")
    	AddTextComponentString(Config.GroupMapBlips and cAPI.getUILanguage(GetCurrentResourceName()).BlipName or ln)
    	EndTextCommandSetBlipName(blip)
        -- Save handle to blip table
        blips[#blips+1] = blip
    end
end)

local vehicleTable = {}
RegisterNetEvent("CKF:recVehicles")
AddEventHandler("CKF:recVehicles", function(data)
    vehicleTable = data
end)

RegisterNetEvent("CKF:message")
AddEventHandler("CKF:message", function(content,time)
    SetNotificationTextEntry("STRING")
        SetNotificationColorNext(0)
        AddTextComponentSubstringPlayerName(content)
    DrawNotification(0,1)
end)

local saveCallbackResponse = false
RegisterNetEvent("CKF:savecallback")
AddEventHandler("CKF:savecallback", function(response) saveCallbackResponse = response end)

-- Load Garage
function LoadGarage(wait)
    Citizen.CreateThread(function()
        local x,y,z = ToCoord(ckfGarage.curGarage.inLocation[1], false)
        local int = GetInteriorAtCoords(x, y, z)
        if int then RefreshInterior(int) end
        if wait then
            BeginTextCommandBusyString("STRING")
            AddTextComponentSubstringPlayerName(cAPI.getUILanguage(GetCurrentResourceName()).LoadingGarage)
            EndTextCommandBusyString(4)
            Citizen.Wait(wait)
            RemoveLoadingPrompt()
        end
        vehicleTable = false
        TriggerServerEvent("CKF:reqVehicles")
        while not vehicleTable do Citizen.Wait(0) end
        local vt = vehicleTable
        for _,oldVeh in pairs(ckfGarage.vehicles) do
			Citizen.Wait(0)
            SetEntityAsMissionEntity(oldVeh)
            DeleteVehicle(oldVeh)
			DeleteEntity(oldVeh)
        end
        ckfGarage.vehicles = {}
        if vehicleTable and vehicleTable[ckfGarage.curGarageName] then
            for pos=1,#Config.locations[ckfGarage.curGarageName].carLocations do -- Something weird with JSON causes something to be stupid with null keys
                local vehData = vehicleTable[ckfGarage.curGarageName][pos]
                if vehData and vehData ~= "none" then
                    Citizen.CreateThread(function()
                        local isInVehicle, veh, vehModel = GetVehicle()
                        local x,y,z,h = ToCoord(ckfGarage.curGarage.carLocations[pos], true)
                        local model = tonumber(vehData["model"])
                        if ckfGarage.vehicleTakenLoc == ckfGarage.curGarageName and ckfGarage.vehicleTaken and pos == ckfGarage.vehicleTakenPos and not IsEntityDead(ckfGarage.vehicleTaken) then
                        else
                            -- Load
                            RequestModel(model)
                            while not HasModelLoaded(model) do Citizen.Wait(0) end
                            -- Create
                            ckfGarage.vehicles[pos] = CreateVehicleFromData(vehData, x,y,z+1.0,h,true)
                            -- Godmode
                            SetEntityInvincible(ckfGarage.vehicles[pos], true)
            				SetEntityProofs(ckfGarage.vehicles[pos], true, true, true, true, true, true, 1, true)
            				SetVehicleTyresCanBurst(ckfGarage.vehicles[pos], false)
            				SetVehicleCanBreak(ckfGarage.vehicles[pos], false)
            				SetVehicleCanBeVisiblyDamaged(ckfGarage.vehicles[pos], false)
            				SetEntityCanBeDamaged(ckfGarage.vehicles[pos], false)
            				SetVehicleExplodesOnHighExplosionDamage(ckfGarage.vehicles[pos], false)
                        end
                        Citizen.CreateThread(function()
                            while true do
                                Citizen.Wait(0)
                                local isInVehicle, veh = GetVehicle()
                                if isInVehicle and veh == ckfGarage.vehicles[pos] then
                                    local x,y,z = table.unpack(GetEntityVelocity(veh))
                                    if (x > 0.5 or y > 0.5 or z > 0.5) or (x < -0.5 or y < -0.5 or z < -0.5) then
                                        Citizen.CreateThread(function()
                                            ckfGarage.vehicleTakenPos = pos
                                            ckfGarage.vehicleTakenLoc = ckfGarage.curGarageName
                                            local ent = GetPlayerPed(-1)
                                            local x,y,z,h = ToCoord(ckfGarage.curGarage.spawnOutLocation, true)
                                            DoScreenFadeOut(500)
                                            while IsScreenFadingOut() do Citizen.Wait(0) end
                                            FreezeEntityPosition(ent, true)
                                            SetEntityCoords(ent, x, y, z)
                                            -- Delete All Prev Vehicles
                                            for i,veh in ipairs(ckfGarage.vehicles) do
                                                SetEntityAsMissionEntity(veh)
                                                DeleteVehicle(veh)
                                                Citizen.Wait(10)
                                            end
                                            if ckfGarage.vehicleTaken then DeleteVehicle(ckfGarage.vehicleTaken) end -- Delete the last vehicle taken out if there is one
                                            -- Create new vehicle
                                            ckfGarage.vehicleTaken = CreateVehicleFromData(vehData, x,y,z+1.0,h)
                                            FreezeEntityPosition(ckfGarage.vehicleTaken, true)
                                            Citizen.Wait(1000)
                                            SetEntityAsMissionEntity(ckfGarage.vehicleTaken)
                                            SetPedIntoVehicle(ent, ckfGarage.vehicleTaken, -1) -- Put the ped into the new vehicle
                                            Citizen.Wait(1000)
                                            FreezeEntityPosition(ent, false)
                                            FreezeEntityPosition(ckfGarage.vehicleTaken, false)
                                            Citizen.Wait(1000)
                                            DoScreenFadeIn(500)
                                            while IsScreenFadingIn() do Citizen.Wait(0) end
                                            ckfGarage.curGarage = false
                                            ckfGarage.curGarageName = false
                                        end)
                                        break
                                    end
                                end
                            end
                        end)
                    end)
                end
            end
        end
    end)
end

-- Management Menu
Citizen.CreateThread(function()
    local managecam = 999
    local camsettings = {
        zoomlevel = 1,
        heading = 360,
    }
    local context = {
        operation = false,
        entity = false,
        position = false,
        name = false,
    }
    local function SetupCam()
        if ckfGarage and ckfGarage.curGarage then
            camsettings = {
                zoomlevel = GetFollowPedCamZoomLevel(),
                heading = GetGameplayCamRelativeHeading(),
            }
            managecam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
            local x,y,z = ToCoord(ckfGarage.curGarage.modifyCam[1])
            local rx,ry,rz = ToCoord(ckfGarage.curGarage.modifyCam[2])
            SetCamCoord(managecam,x,y,z)
            SetCamRot(managecam, rx,ry,rz, 1)
            SetCamActive(managecam, true)
        end
    end
	WarMenu.CreateMenu('vmm', 'Vehicle Management')
        WarMenu.CreateSubMenu('vmm:veh', 'vmm', cAPI.getUILanguage(GetCurrentResourceName()).ManageGarage)
            WarMenu.CreateSubMenu('vmm:move', 'vmm:veh', cAPI.getUILanguage(GetCurrentResourceName()).Here)
            WarMenu.CreateSubMenu('vmm:delete', 'vmm:veh', cAPI.getUILanguage(GetCurrentResourceName()).Sure)
	WarMenu.SetSubTitle('vmm', "main menu")
    local menus = {"vmm","vmm:veh","vmm:move","vmm:delete"}
	while true do
        if WarMenu.IsMenuAboutToBeClosed() then
            for _,m in ipairs(menus) do
                if WarMenu.IsMenuOpened(m) then
                    SetCamActive(managecam, false)
                    SetCamActive(-1, true)
                    EnableGameplayCam(true)
                    RenderScriptCams(0,1,1000,0)
                    SetGameplayCamRelativeHeading(camsettings.heading)
                    SetFollowPedCamViewMode(camsettings.zoomlevel)
                    context = {}
                    managecam = 999
                    camsettings = {}
                    WarMenu.CloseMenu()
                    Citizen.Wait(1000)
                end
            end
        elseif WarMenu.IsMenuOpened('vmm') and ckfGarage and ckfGarage.curGarage then
            if managecam == 999 then SetupCam() elseif not IsCamRendering(managecam) and not IsCamInterpolating(managecam) then RenderScriptCams(1, 1, 1000, 0) end
            local hasAny = false
            for i=1,#ckfGarage.curGarage.carLocations do
                if ckfGarage.vehicles[i] then
                    hasAny = true
                    local n = GetDisplayNameFromVehicleModel(GetEntityModel(ckfGarage.vehicles[i])) ~= "CARNOTFOUND" and GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(ckfGarage.vehicles[i]))) or "Veiculo customizado" -- woah
                    if WarMenu.MenuButton(cAPI.getUILanguage(GetCurrentResourceName()).Vehicle..i,"vmm:veh",n) then
                        context = {
                            operation = "manage",
                            entity = ckfGarage.vehicles[i],
                            position = i,
                            name = n,
                        }
                    end
                end
            end
            if not hasAny then WarMenu.Button(cAPI.getUILanguage(GetCurrentResourceName()).NoVeh) end
        WarMenu.Display()
        elseif WarMenu.IsMenuOpened('vmm:veh') then
            local x,y,z = ToCoord(ckfGarage.curGarage.carLocations[context.position] or {0,0,0,0}, false)
            DrawMarker(20, x,y,z+2.0, 0.0, 0.0, 0.0, 180.0, 0.0, 180.0, 1.5, 1.5, 1.0, 240, 200, 80, 180, false, true, 2, false, false, false, false)
            if WarMenu.MenuButton(cAPI.getUILanguage(GetCurrentResourceName()).Move..context.name..cAPI.getUILanguage(GetCurrentResourceName()).Attention,"vmm:move") then context.operation = "move" end
            if WarMenu.MenuButton(cAPI.getUILanguage(GetCurrentResourceName()).Delete..context.name..cAPI.getUILanguage(GetCurrentResourceName()).What,"vmm:delete") then context.operation = "delete" end
        WarMenu.Display()
        elseif WarMenu.IsMenuOpened('vmm:move') then
            for i=1,#ckfGarage.curGarage.carLocations do
                if i ~= context.position then
                    local clicked,hovered = WarMenu.Button(cAPI.getUILanguage(GetCurrentResourceName()).Position..i)
                    if clicked then
                        Citizen.CreateThread(function()
                            TriggerServerEvent("CKF:moveVehicle",ckfGarage.curGarageName,context.position,i)
                            LoadGarage(1000)
                            WarMenu.CloseMenu()
                        end)
                    elseif hovered then
                        local x,y,z = ToCoord(ckfGarage.curGarage.carLocations[i] or {0,0,0,0}, false)
                        DrawMarker(20, x,y,z+2.0, 0.0, 0.0, 0.0, 180.0, 0.0, 180.0, 1.5, 1.5, 1.0, 0, 128, 255, 100, false, true, 2, false, false, false, false)
						DrawText3Ds(x,y,z+2.0, cAPI.getUILanguage(GetCurrentResourceName()).ChangePosition)
                    end
                else
                    WarMenu.Button("~HUD_COLOUR_GREY~"..cAPI.getUILanguage(GetCurrentResourceName()).Position..i)
                end
            end
            local x,y,z = ToCoord(ckfGarage.curGarage.carLocations[context.position] or {0,0,0,0}, false)
            DrawMarker(20, x,y,z+2.0, 0.0, 0.0, 0.0, 180.0, 0.0, 180.0, 1.5, 1.5, 1.0, 240, 200, 80, 180, false, true, 2, false, false, false, false)
			DrawText3Ds(x,y,z+2.0, cAPI.getUILanguage(GetCurrentResourceName()).Moving .. context.name)
        WarMenu.Display()
        elseif WarMenu.IsMenuOpened('vmm:delete') then
            local x,y,z = ToCoord(ckfGarage.curGarage.carLocations[context.position] or {0,0,0,0}, false)
            DrawMarker(20, x,y,z+2.0, 0.0, 0.0, 0.0, 180.0, 0.0, 180.0, 1.5, 1.5, 1.0, 255, 128, 128, 100, false, true, 2, false, false, false, false)
            WarMenu.MenuButton(cAPI.getUILanguage(GetCurrentResourceName()).No,'vmm:veh')
            if WarMenu.Button(cAPI.getUILanguage(GetCurrentResourceName()).Yes) and context.operation == "delete" then
                Citizen.CreateThread(function()
                    TriggerServerEvent("CKF:deleteVehicle",ckfGarage.curGarageName,context.position)
                    LoadGarage()
                    WarMenu.CloseMenu()
                end)
            end
        WarMenu.Display()
        end
        Citizen.Wait(0)
	end
end)

-- Mechanic Menu
Citizen.CreateThread(function()
	if Config.CallMechanic == true then
    local context = {
        location = false,
    }
    WarMenu.CreateMenu('mech', cAPI.getUILanguage(GetCurrentResourceName()).Mechanic)
        WarMenu.CreateSubMenu('mech:location', 'mech', cAPI.getUILanguage(GetCurrentResourceName()).Vehicles)
	WarMenu.SetSubTitle('mech', "main menu")
    local menus = {"mech","mech:location"}
	while true do
		if WarMenu.IsMenuOpened('mech') then
            if json.encode(vehicleTable) == json.encode({}) then
                WarMenu.Button(cAPI.getUILanguage(GetCurrentResourceName()).NoGarageVeh)
            else
                for ln,location in pairs(vehicleTable) do
                    if WarMenu.MenuButton(ln,"mech:location") then context.location = ln end
                end
            end
        WarMenu.Display()
        elseif WarMenu.IsMenuOpened('mech:location') then
            for pos,vehData in ipairs(vehicleTable[context.location]) do
                if vehData ~= "none" then
                    local model = tonumber(vehData["model"])
                    if GetEntityModel(ckfGarage.vehicleTaken) ~= model then -- Don't display the vehicle we currently have out
                        local name = GetDisplayNameFromVehicleModel(model) ~= "CARNOTFOUND" and GetLabelText(GetDisplayNameFromVehicleModel(model)) or ("Nome de veiculo não encontrado (hash: "..model..")") -- more of this shit
                        if WarMenu.Button(name) then
                            RequestModel(model)
                            while not HasModelLoaded(model) do Citizen.Wait(0) end
                            ckfGarage.vehicleTakenPos = pos
                            ckfGarage.vehicleTakenLoc = context.location
                            if ckfGarage.vehicleTaken then DeleteVehicle(ckfGarage.vehicleTaken) end
                            local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
                            local h = GetEntityHeading(GetPlayerPed(-1))
							WarMenu.CloseMenu()
							print("Atenção: o veiculo irá spawnar á tua beira, CUIDADO (WIP)")
							print("O teu ".. name .." será entregue em breve!")
							Wait(3000)
                            ckfGarage.vehicleTaken = CreateVehicleFromData(vehData, x,y,z,h)
                            SetEntityAsMissionEntity(ckfGarage.vehicleTaken)
                            SetPedIntoVehicle(GetPlayerPed(-1), ckfGarage.vehicleTaken, -1)
                        end
                    end
                end
            end
        WarMenu.Display()
        elseif WarMenu.IsMenuAboutToBeClosed() then
            for _,m in ipairs(menus) do
                if WarMenu.IsMenuOpened(m) then context = {} end
            end
        elseif IsControlJustReleased(0, 56) then
            vehicleTable = false
            TriggerServerEvent("CKF:reqVehicles")
            while not vehicleTable do Citizen.Wait(0) end
            WarMenu.OpenMenu("mech")
        end
		Citizen.Wait(0)
		end
	end
end)

-- Main
Citizen.CreateThread(function()
    while true do
        local isInVehicle, veh, vehModel = GetVehicle()
        if not ckfGarage.curGarage then
            for ln,location in pairs(Config.locations) do
                local ent = isInVehicle and veh or GetPlayerPed(-1)
                local ix,iy,iz = ToCoord(location.inLocation[1],false)
                if Vdist2(GetEntityCoords(ent),ix,iy,iz) < 500.0 then
                    --DrawMarker(20, ix,iy,iz+1.0, 0.0, 0.0, 0.0, 180.0, 0.0, 180.0, 1.5, 1.5, 1.0, 0, 128, 255, 100, false, true, 2, false, false, false, false)
					local text = cAPI.getUILanguage(GetCurrentResourceName()).Join
					if Vdist2(GetEntityCoords(ent),ix,iy,iz) <= location.inLocation[2]*2.5 then
						text = "[~g~E~s~] " .. cAPI.getUILanguage(GetCurrentResourceName()).Join
					end
					DrawText3Ds(ix,iy,iz+1.0, text)
                end
                local allowed = true
                if IsThisModelABoat(vehModel) then allowed = false end
                if IsThisModelAPlane(vehModel) then allowed = false end
                if IsThisModelAHeli(vehModel) then allowed = false end
                for _,blockedModel in ipairs(Config.BlacklistedVehicles) do
                    if GetHashKey(blockedModel) == vehModel then allowed = false end
                end
                if Vdist2(GetEntityCoords(ent),ix,iy,iz) < location.inLocation[2]*2.5 and not IsPedSprinting(GetPlayerPed(-1)) then
                    if not allowed then
                        DisplayHelpTextThisFrame("WEB_VEH_INV", 1)
                    else
                        DisplayHelpTextThisFrame("CKF_ENTER", 1)
                        if IsControlJustReleased(0, 51) then
                            if isInVehicle then SetVehicleHalt(veh,1.0,1) end -- Nice Native!
                            ckfGarage.curGarage = location
                            ckfGarage.curGarageName = ln
                            if Config.Debug then print("[DEBUG] Entrando na garagem: "..tostring(ln)) end
                            if not isInVehicle then
                                LoadGarage()
                                local x,y,z,h = ToCoord(ckfGarage.curGarage.spawnInLocation, true)
                                FancyTeleport(ent, x,y,z,h)
                                Citizen.Wait(500)
                            else
                                saveCallbackResponse = false
                                if ckfGarage.vehicleTaken ~= veh then
                                    TriggerServerEvent("CKF:saveVehicle",VehicleToData(veh),ln)
                                else
                                    TriggerServerEvent("CKF:saveVehicle",VehicleToData(veh),ln,ckfGarage.vehicleTakenPos,ckfGarage.vehicleTakenLoc)
                                end
                                while not saveCallbackResponse do Citizen.Wait(0) end
                                if saveCallbackResponse == "no_slot" then
                                    ckfGarage.curGarage = false
                                    ckfGarage.curGarageName = false
                                    while Vdist2(GetEntityCoords(ent),ix,iy,iz) < location.inLocation[2]*2.5 do
                                        Citizen.Wait(0)
                                        DisplayHelpTextThisFrame("WEB_VEH_FULL", 1)
                                    end
                                end
                                Citizen.Wait(1000)
                                if saveCallbackResponse == "success" then
                                    local lastVeh = veh
                                    ckfGarage.vehicleTaken = false
                                    ckfGarage.vehicleTakenPos = false
                                    ckfGarage.vehicleTakenLoc = false
                                    LoadGarage()
                                    local x,y,z,h = ToCoord(ckfGarage.curGarage.spawnInLocation, true)
                                    FancyTeleport(GetPlayerPed(-1), x,y,z,h)
                                    Citizen.Wait(1000)
				                    SetEntityAsMissionEntity(lastVeh)
                                    DeleteVehicle(lastVeh)
                                end
                            end
                            saveCallbackResponse = false
                        end
                    end
                end
            end
        else
            local gr = ckfGarage.curGarage
            local ent = isInVehicle and veh or GetPlayerPed(-1)
            -- Exit Marker
            local ox,oy,oz = ToCoord(gr.outMarker)
            --DrawMarker(1, ox,oy,oz, 0.0, 0.0, 0.0, 180.0, 180.0, 180.0, 1.0, 1.0, 1.0, 0, 128, 255, 100, false, true, 2, false, false, false, false)
			local text = cAPI.getUILanguage(GetCurrentResourceName()).Exit
			if Vdist2(GetEntityCoords(ent),ToCoord(gr.outMarker)) <= 1.5 then
				text = "[~g~E~s~] " .. cAPI.getUILanguage(GetCurrentResourceName()).Exit
			end
			DrawText3Ds(ox,oy,oz+1, text)
            if Vdist2(GetEntityCoords(ent),ToCoord(gr.outMarker)) <= 1.5 then
                local x,y,z,h = ToCoord(ckfGarage.curGarage.spawnOutLocation,true)
                local ix,iy,iz = ToCoord(gr.inLocation[1],false)
                local rad = gr.inLocation[2]
                FancyTeleport(ent, x,y,z,h, 500,2000,500, true)
                Citizen.Wait(3000)
                ckfGarage.curGarage = false
                ckfGarage.curGarageName = false
                ckfGarage = ckfGarage or ckfGarage_default
                Citizen.Wait(500)
                while Vdist2(GetEntityCoords(ent),ix,iy,iz) < rad*2.5 do Citizen.Wait(0) end
            end
            local mx,my,mz = ToCoord(gr.modifyMarker)
            --DrawMarker(1, mx,my,mz, 0.0, 0.0, 0.0, 180.0, 180.0, 180.0, 1.0, 1.0, 1.0, 240, 200, 80, 180, false, true, 2, false, false, false, false)
			local text = cAPI.getUILanguage(GetCurrentResourceName()).Manage
			if Vdist2(GetEntityCoords(ent),ToCoord(gr.modifyMarker)) <= 1.5 then
				text = "[~g~E~s~] " .. cAPI.getUILanguage(GetCurrentResourceName()).Manage
			end
			DrawText3Ds(mx,my,mz+1, text)
            if Vdist2(GetEntityCoords(ent),ToCoord(gr.modifyMarker)) <= 1.5 then
                DisplayHelpTextThisFrame("MP_MAN_VEH", 0)
                if IsControlJustPressed(1, 51) then
                    WarMenu.OpenMenu("vmm")
                    Citizen.Wait(500)
                end
            end
        end
        Citizen.Wait(0)
    end
end)

-- Slow walk loop
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ckfGarage.curGarage and Config.RestrictActions then
            DisableControlAction(0, 22, true)
            DisablePlayerFiring(PlayerId(), true)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if Config.RestrictActions then
            local curGarage = ckfGarage.curGarage
            while ckfGarage.curGarage == curGarage do Citizen.Wait(0) end

            if ckfGarage.curGarage then
                SetCanAttackFriendly(GetPlayerPed(-1), false, false)
                NetworkSetFriendlyFireOption(false)
            else
                SetCanAttackFriendly(GetPlayerPed(-1), true, false)
                NetworkSetFriendlyFireOption(true)
            end
        end
        Citizen.Wait(0)
    end
end)

-- Personal vehicle blip
Citizen.CreateThread(function()
    local blip = false
    while true do
        Citizen.Wait(0)
        local prevEntId = ckfGarage.vehicleTaken
        while not ckfGarage.vehicleTaken or prevEntId == ckfGarage.vehicleTaken do Citizen.Wait(0) end
        blip = AddBlipForEntity(ckfGarage.vehicleTaken)
        SetBlipSprite(blip, 225)
		SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 63)
        BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringTextLabel("PVEHICLE")
		EndTextCommandSetBlipName(blip)
        Citizen.CreateThread(function() -- I could probably make this better but eh
            local myBlip = blip
            while myBlip == blip do
                Citizen.Wait(0)
                local isInVehicle, veh = GetVehicle(_,true)
                if isInVehicle and veh == ckfGarage.vehicleTaken then
                    if GetBlipInfoIdDisplay(myBlip) ~= 3 then
                        SetBlipDisplay(myBlip, 3)
                        BeginTextCommandSetBlipName("STRING")
                		AddTextComponentSubstringTextLabel("PVEHICLE")
                		EndTextCommandSetBlipName(myBlip)
                    end
                else
                    if GetBlipInfoIdDisplay(myBlip) ~= 2 then
                        SetBlipDisplay(myBlip, 2)
                        BeginTextCommandSetBlipName("STRING")
                		AddTextComponentSubstringTextLabel("PVEHICLE")
                		EndTextCommandSetBlipName(myBlip)
                    end
                end
                if IsEntityDead(ckfGarage.vehicleTaken) then
                    RemoveBlip(myBlip)
                    break
                end
            end
        end)
    end
end)

-- Hide players in garage
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ckfGarage.curGarage then
            for i=0,63 do
                if i ~= GetPlayerServerId(PlayerId()) then
                    SetPlayerInvisibleLocally(GetPlayerFromServerId(i))
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    if Config.EnableInteriors then
    	RequestIpl("bkr_bi_id1_23_door")
    	RequestIpl("bkr_bi_hw1_13_int")
        RequestIpl("bkr_biker_interior_placement_interior_0_biker_dlc_int_01_milo")
        RequestIpl("bkr_biker_interior_placement_interior_1_biker_dlc_int_02_milo")
    	EnableInteriorProp(246529, "mod_booth")
    	EnableInteriorProp(246529, "gun_locker")
    	EnableInteriorProp(246529, "lower_walls_default")
    	SetInteriorPropColor(246529, "lower_walls_default", 3)
    	EnableInteriorProp(246529, "walls_02")
    	SetInteriorPropColor(246529, "walls_02", 3)
    	EnableInteriorProp(246529, "mural_01")
    	EnableInteriorProp(246529, "furnishings_02")
        RefreshInterior(246529)
        RequestIpl("ex_exec_warehouse_placement_interior_0_int_warehouse_m_dlc_milo ")
        RequestIpl("ex_exec_warehouse_placement_interior_1_int_warehouse_s_dlc_milo ")
        RequestIpl("ex_exec_warehouse_placement_interior_2_int_warehouse_l_dlc_milo ")
        RequestIpl("imp_dt1_11_cargarage_a")
        EnableInteriorProp(256513, "Garage_Decor_01")
        EnableInteriorProp(256513, "Lighting_Option01")
        EnableInteriorProp(256513, "Numbering_Style01_N1")
        EnableInteriorProp(256513, "Floor_vinyl_01")
        RefreshInterior(256513)
        RequestIpl("imp_dt1_02_cargarage_a")
        EnableInteriorProp(253441, "Garage_Decor_02")
        EnableInteriorProp(253441, "Lighting_Option02")
        EnableInteriorProp(253441, "Numbering_Style02_N1")
        EnableInteriorProp(253441, "Floor_vinyl_02")
        RefreshInterior(253441)
        RequestIpl("imp_sm_13_cargarage_a")
        EnableInteriorProp(254465, "Garage_Decor_03")
        EnableInteriorProp(254465, "Lighting_Option03")
        EnableInteriorProp(254465, "Numbering_Style03_N1")
        EnableInteriorProp(254465, "Floor_vinyl_03")
        RefreshInterior(254465)
        RequestIpl("imp_sm_15_cargarage_a")
        EnableInteriorProp(255489, "Garage_Decor_04")
        EnableInteriorProp(255489, "Lighting_Option04")
        EnableInteriorProp(255489, "Numbering_Style04_N1")
        EnableInteriorProp(255489, "Floor_vinyl_04")
        RefreshInterior(255489)
		end
	end)
end) -- no, this is not mismatched