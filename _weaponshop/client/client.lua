local ckf_weaponshop = ckf_weaponshop or {
    interiorIDs = {
        [153857] = true,
        [200961] = true,
		[140289] = {
			weaponRotationOffset = 135.0,
		},
        [180481] = true,
        [168193] = true,
        [164609] = {
			weaponRotationOffset = 150.0,
		},
        [175617] = true,
        [176385] = true,
		[178689] = true,
		[137729] = {
			additionalOffset = 			vec(8.3,-6.5,0.0),
			additionalCameraOffset = 	vec(8.3,-6.0,0.0),
			additionalCameraPoint = 	vec(1.0,-0.91,0.0),
			additionalWeaponOffset =	vec(0.0,0.5,0.0),
			weaponRotationOffset = 		-60.0,
		},
		[248065] = {
			additionalOffset = 			vec(-10.0,3.0,0.0),
			additionalCameraOffset = 	vec(-9.5,3.0,0.0),
			additionalCameraPoint = 	vec(-1.0,0.4,0.0),
			additionalWeaponOffset =	vec(0.4,0.0,0.0),
		},
    },
    closeMenuNextFrame = false,
    weaponClasses = {},
}

function IsAmmunationOpen()
	return (string.find(tostring(NativeUI.CurrentMenu() or ""), "ckf_weaponshop") or string.find(tostring(NativeUI.CurrentMenu() or ""), "ckf_"))
end

for ci,wepTable in pairs(Config.WeaponTable) do
    local className = wepTable.name
    ckf_weaponshop.weaponClasses[ci] = {
        name = className,
        weapons = {},
    }
    local classWepTable = ckf_weaponshop.weaponClasses[ci].weapons
	for wi,weaponObject in ipairs(wepTable) do
		if weaponObject[3] then
			classWepTable[wi] = weaponObject[3]
			classWepTable[wi].name = weaponObject[2]
			classWepTable[wi].model = weaponObject[1]
			classWepTable[wi].attachments = {}
		else
			classWepTable[wi] = {
				name = weaponObject[2],
				model = weaponObject[1],
				attachments = {},
			}
		end
        local wep = classWepTable[wi]
        for _,attachmentObject in ipairs(Config.AttachmentTable) do
            if DoesWeaponTakeWeaponComponent(weaponObject[1], attachmentObject[1]) then
                wep.attachments[#wep.attachments+1] = {
                    name = attachmentObject[2],
                    model = attachmentObject[1]
                }
            end
        end
		wep.clipSize = wep.clipSize or GetWeaponClipSize(weaponObject[1])
		wep.isMK2 = wep.isMK2 or (string.find(weaponObject[1], "_MK2") ~= nil)
    end
end

for intID, interior in pairs(ckf_weaponshop.interiorIDs) do
	local additionalOffset = vec(0,0,0)	
	if type(interior) == "table" then
		additionalOffset = interior.additionalOffset or additionalOffset
	end
	local locationCoords = GetOffsetFromInteriorInWorldCoords(intID, (1.0),4.7,1.0) + additionalOffset
end

Citizen.CreateThread(function()
    local radius = 1.0  
    local waitForPlayerToLeave = false
	while true do Citizen.Wait(1)
		if GetInteriorFromEntity(GetPlayerPed(-1)) ~= 0 and ckf_weaponshop.interiorIDs[GetInteriorFromEntity(GetPlayerPed(-1))] then
			local interiorID = GetInteriorFromEntity(GetPlayerPed(-1))
			local additionalOffset = vec(0,0,0)
			if type(ckf_weaponshop.interiorIDs[interiorID]) == "table" then
				additionalOffset = ckf_weaponshop.interiorIDs[interiorID].additionalOffset or additionalOffset
			end
            for i = 1,3 do
                if not IsAmmunationOpen() then
                    if (Vdist2(GetOffsetFromInteriorInWorldCoords(interiorID, (2.0-i),6.0,1.0) + additionalOffset, GetEntityCoords(PlayerPedId()))^2 <= radius^2) then
                        if not waitForPlayerToLeave then
                            BeginTextCommandDisplayHelp("GS_BROWSE_W")
                            AddTextComponentSubstringPlayerName("~INPUT_CONTEXT~")
                            EndTextCommandDisplayHelp(0, 0, true, -1)
                            if IsControlJustReleased(0, 51) then
								SetPlayerControl(PlayerId(), false)
								local additionalCameraOffset = vec(0,0,0)
								local additionalCameraPoint = vec(0,0,0)
								if type(ckf_weaponshop.interiorIDs[interiorID]) == "table" then
									additionalCameraOffset = ckf_weaponshop.interiorIDs[interiorID].additionalCameraOffset or additionalCameraOffset
									additionalCameraPoint = ckf_weaponshop.interiorIDs[interiorID].additionalCameraPoint or additionalCameraPoint
								end
								ckf_weaponshop.currentMenuCamera = CreateCam("DEFAULT_SCRIPTED_CAMERA")
								local cam = ckf_weaponshop.currentMenuCamera
								SetCamCoord(cam, GetOffsetFromInteriorInWorldCoords(interiorID, 3.25,6.5,2.0) + additionalCameraOffset)
								PointCamAtCoord(cam, GetOffsetFromInteriorInWorldCoords(interiorID, 5.0,6.5,2.0) + additionalCameraOffset + additionalCameraPoint)
								SetCamActive(cam, true)
								RenderScriptCams(true, 1, 600, 300, 0)
								Citizen.Wait(600)
								NativeUI.OpenMenu("ckf_weaponshop")
								waitForPlayerToLeave = true
                            end
                        end
                    else
                        if waitForPlayerToLeave then waitForPlayerToLeave = false end
					end
				end
			end
			additionalOffset = nil
			interiorID = nil
		end
    end
end)

local function IsWeaponMK2(weaponModel)
    return string.find(weaponModel, "_MK2")
end

local function DoesPlayerOwnWeapon(weaponModel)
    return HasPedGotWeapon(GetPlayerPed(-1), weaponModel, 0)
end

local function DoesPlayerWeaponHaveComponent(weaponModel, componentModel)
    return (DoesPlayerOwnWeapon(weaponModel) and HasPedGotWeaponComponent(GetPlayerPed(-1), weaponModel, componentModel) or false)
end

local function IsPlayerWeaponTintActive(weaponModel, tint)
	return (tint == GetPedWeaponTintIndex(GetPlayerPed(-1), weaponModel))
end

Citizen.CreateThread(function()
	function CreateFakeWeaponObject(weapon, keepOldWeapon)
		if weapon.noPreview then
			if DoesEntityExist(ckf_weaponshop.fakeWeaponObject) then DeleteObject(ckf_weaponshop.fakeWeaponObject) end
			ckf_weaponshop.fakeWeaponObject = false
			return false 
		end
		local weaponWorldModel = GetWeapontypeModel(weapon.model)
		RequestModel(weaponWorldModel)
		while not HasModelLoaded(weaponWorldModel) do Citizen.Wait(0) end
		local interiorID = GetInteriorFromEntity(GetPlayerPed(-1))
		local rotationOffset = 0.0
		local additionalOffset = vec(0,0,0)
		local additionalWeaponOffset = vec(0,0,0)
		if type(ckf_weaponshop.interiorIDs[interiorID]) == "table" then
			rotationOffset = ckf_weaponshop.interiorIDs[interiorID].weaponRotationOffset or 0.0
			additionalOffset = ckf_weaponshop.interiorIDs[interiorID].additionalOffset or additionalOffset
			additionalWeaponOffset = ckf_weaponshop.interiorIDs[interiorID].additionalWeaponOffset or additionalWeaponOffset
		end
		local extraAdditionalWeaponOffset = weapon.offset or vec(0,0,0)
		local fakeWeaponCoords = (GetOffsetFromInteriorInWorldCoords(interiorID, 4.0,6.25,2.0) + additionalOffset) + additionalWeaponOffset + extraAdditionalWeaponOffset
		local fakeWeapon = CreateWeaponObject(weapon.model, weapon.clipSize*3, fakeWeaponCoords, true, 0.0)
		SetEntityAlpha(fakeWeapon, 0)
		SetEntityHeading(fakeWeapon, (GetCamRot(GetRenderingCam(), 1).z - 180)+rotationOffset)
		SetEntityCoordsNoOffset(fakeWeapon, fakeWeaponCoords)
		for i,attach in ipairs(weapon.attachments) do
			if DoesPlayerWeaponHaveComponent(weapon.model, attach.model) then
				GiveWeaponComponentToWeaponObject(fakeWeapon, attach.model)
			end
		end
		if DoesPlayerOwnWeapon(weapon.model) then SetWeaponObjectTintIndex(fakeWeapon, GetPedWeaponTintIndex(GetPlayerPed(-1), weapon.model)) end
		if not keepOldWeapon then
			SetEntityAlpha(fakeWeapon, 255)
			if DoesEntityExist(ckf_weaponshop.fakeWeaponObject) then DeleteObject(ckf_weaponshop.fakeWeaponObject) end
			ckf_weaponshop.fakeWeaponObject = fakeWeapon
		end
		return fakeWeapon
	end
end)

local currentTempWeapon = false
local tempWeaponLocked = false
local function SetTempWeapon(weapon)		
	if (not currentTempWeapon and weapon) or currentTempWeapon ~= weapon.model then
		currentTempWeapon = weapon
		if weapon == false then
			if DoesEntityExist(ckf_weaponshop.fakeWeaponObject) then DeleteObject(ckf_weaponshop.fakeWeaponObject) end
		else
			if not tempWeaponLocked then
				tempWeaponLocked = true
				Citizen.CreateThread(function()
					CreateFakeWeaponObject(weapon)
					currentTempWeapon = weapon.model
					tempWeaponLocked = false
				end)
			end
		end
	end
end

local currentTempWeaponConfig = {
	component = false,
	tint = false,
}

local function SetTempWeaponConfig(weapon, component, tint)
	Citizen.CreateThread(function()
		if currentTempWeaponConfig.component ~= component or currentTempWeaponConfig.tint ~= tint then
			currentTempWeaponConfig = {
				component = component,
				tint = tint,
			}
			local fakeWeapon = CreateFakeWeaponObject(weapon, true)
			Citizen.Wait(30)
			if currentTempWeaponConfig.component then
				local attachWorldModel = GetWeaponComponentTypeModel(currentTempWeaponConfig.component)
				RequestModel(attachWorldModel)
				while not HasModelLoaded(attachWorldModel) do Citizen.Wait(0) end
				GiveWeaponComponentToWeaponObject(fakeWeapon, currentTempWeaponConfig.component)
			end
			if currentTempWeaponConfig.tint then
				SetWeaponObjectTintIndex(fakeWeapon, currentTempWeaponConfig.tint)
			else
				SetWeaponObjectTintIndex(fakeWeapon, GetPedWeaponTintIndex(GetPlayerPed(-1), weapon.model))
			end
			SetEntityAlpha(fakeWeapon, 255)
			if DoesEntityExist(ckf_weaponshop.fakeWeaponObject) then DeleteObject(ckf_weaponshop.fakeWeaponObject) end
			ckf_weaponshop.fakeWeaponObject = fakeWeapon
		end
	end)
end

local function GiveWeapon(weaponhash, weaponammo)
    GiveWeaponToPed(GetPlayerPed(-1), weaponhash, weaponammo, false, true)
	SetPedAmmoByType(GetPlayerPed(-1), GetPedAmmoTypeFromWeapon_2(GetPlayerPed(-1), weaponhash), weaponammo)
end

local function GiveAmmo(weaponHash, ammo)
    AddAmmoToPed(GetPlayerPed(-1), weaponHash, ammo)
end

local function GiveMaxAmmo(weaponHash)
	local gotMaxAmmo, maxAmmo = GetMaxAmmo(GetPlayerPed(-1), weaponHash)
	if not gotMaxAmmo then maxAmmo = 99999 end
	SetAmmoInClip(GetPlayerPed(-1), weaponHash, GetWeaponClipSize(weaponHash))
    AddAmmoToPed(GetPlayerPed(-1), weaponHash, maxAmmo) 
end

local function RemoveWeapon(weaponhash)
    RemoveWeaponFromPed(GetPlayerPed(-1), weaponhash)
end

local function GiveComponent(weaponname, componentname, weapon)
	GiveWeaponComponentToPed(GetPlayerPed(-1), weaponname, componentname)
	CreateFakeWeaponObject(weapon)
end

local function RemoveComponent(weaponname, componentname, weapon)
	RemoveWeaponComponentFromPed(GetPlayerPed(-1), weaponname, componentname)
	CreateFakeWeaponObject(weapon)
end

local function SetPlayerWeaponTint(weaponname, tint, weapon)
	SetPedWeaponTintIndex(GetPlayerPed(-1), weaponname, tint)
	CreateFakeWeaponObject(weapon)
end

local weaponsCanSave = false
Citizen.CreateThread(function()
	while GetIsLoadingScreenActive() and not PlayerPedId() do Citizen.Wait(0) end
	if GetConvar("ckf_enableWeaponSaving", true) then
		local loadedWeapons = json.decode(GetResourceKvpString("ckf_weaponshop:weapons") or "[]")
		for i,weapon in ipairs(loadedWeapons) do
			GiveWeaponToPed(GetPlayerPed(-1), weapon.model, 0, false, true)
			for i,attach in ipairs(weapon.attachments) do
				GiveWeaponComponentToPed(GetPlayerPed(-1), weapon.model, attach.model)
			end
			SetPedWeaponTintIndex(GetPlayerPed(-1), weapon.model, weapon.tint)
			GiveAmmo(weapon.model, weapon.ammo)
		end
		SetPedCurrentWeaponVisible(PlayerPedId(), false, true)
		weaponsCanSave = true
	end
end)

local function SaveWeapons()
	if GetConvar("ckf_enableWeaponSaving", true) then
		local currentWeapons = {}
		for i,class in ipairs(ckf_weaponshop.weaponClasses) do
			for i,weapon in ipairs(class.weapons) do
				if DoesPlayerOwnWeapon(weapon.model) then -- Construct weapons for saving
					local savedweapon = {
						model = weapon.model,
						tint = GetPedWeaponTintIndex(GetPlayerPed(-1), weapon.model),
						ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), weapon.model),
						attachments = {},
					}
					for i,attach in ipairs(weapon.attachments) do
						if DoesPlayerWeaponHaveComponent(weapon.model, attach.model) then
							savedweapon.attachments[#savedweapon.attachments+1] = attach
						end
					end
					currentWeapons[#currentWeapons+1] = savedweapon
				end
			end
		end
		SetResourceKvp("ckf_weaponshop:weapons", json.encode(currentWeapons))
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30000)
		if weaponsCanSave then
			SaveWeapons()
		end
	end
end)

local function ReleaseWeaponModels()
	for ci,wepTable in pairs(Config.WeaponTable) do
		for wi,weaponObject in ipairs(wepTable) do
			if weaponObject[1] and HasModelLoaded(GetWeapontypeModel(weaponObject[1])) then
				SetModelAsNoLongerNeeded(GetWeapontypeModel(weaponObject[1]))
				--print("released "..GetWeapontypeModel(weaponObject[1]))
			end
		end
	end
end

Citizen.CreateThread(function()
	for k,v in pairs(Config.Weaponshops) do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (blip, 110)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, 1)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName(Config.Language.blipname)
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
    NativeUI.CreateMenu("ckf_weaponshop", Config.Language.blipname, function()
		SetPlayerControl(PlayerId(), true)
		SetCamActive(cam, false)
		RenderScriptCams(false, 1, 600, 300, 300)
		if DoesEntityExist(ckf_weaponshop.fakeWeaponObject) then DeleteObject(ckf_weaponshop.fakeWeaponObject) end
		SetPedDropsWeaponsWhenDead(GetPlayerPed(-1), false)
		SaveWeapons()
		ReleaseWeaponModels()
        return true
    end)
	NativeUI.SetSubTitle('ckf_weaponshop', "Weapons")
	NativeUI.CreateSubMenu("ckf_weaponshop_removeall_confirm","ckf_weaponshop","Are you sure?")
    for i,class in ipairs(ckf_weaponshop.weaponClasses) do
		NativeUI.CreateSubMenu("ckf_"..class.name, "ckf_weaponshop", class.name, function() 
			if DoesEntityExist(ckf_weaponshop.fakeWeaponObject) then DeleteObject(ckf_weaponshop.fakeWeaponObject) end
			return true
		end)
        for i,weapon in ipairs(class.weapons) do
			NativeUI.CreateSubMenu("ckf_"..class.name.."_"..weapon.model, "ckf_"..class.name, weapon.name, function() 
				SetTempWeaponConfig(weapon, false, false)
				return true
			end)
        end
	end
	while true do Citizen.Wait(0)
		if IsAmmunationOpen() then
			if NativeUI.IsMenuOpened('ckf_weaponshop') then
				for i,class in ipairs(ckf_weaponshop.weaponClasses) do
					NativeUI.MenuButton(class.name, "ckf_"..class.name)
				end
				if Config.Debug == true then
				if NativeUI.Button("Max All Ammo Types") then
					for i,class in ipairs(ckf_weaponshop.weaponClasses) do
						for i,weapon in ipairs(class.weapons) do
							if DoesPlayerOwnWeapon(weapon.model) then
								GiveMaxAmmo(weapon.model)
							end
						end
					end
				end
				if NativeUI.Button("Get All Weapons") then
					for i,class in ipairs(ckf_weaponshop.weaponClasses) do
						for i,weapon in ipairs(class.weapons) do
							if not DoesPlayerOwnWeapon(weapon.model) then
								GiveWeapon(weapon.model, 0)
								GiveMaxAmmo(weapon.model)
							end
						end
					end
				end
				NativeUI.MenuButton("~r~Remove All Weapons", "ckf_weaponshop_removeall_confirm")
				end
				NativeUI.Display()
			elseif NativeUI.IsMenuOpened('ckf_weaponshop_removeall_confirm') then
				if NativeUI.Button("No") then NativeUI.SwitchMenu("ckf_weaponshop")
				elseif NativeUI.Button("~r~Yes") then
					for i,class in ipairs(ckf_weaponshop.weaponClasses) do
						for i,weapon in ipairs(class.weapons) do
							if DoesPlayerOwnWeapon(weapon.model) then
								RemoveWeapon(weapon.model)
							end
						end
					end
					SaveWeapons()
					NativeUI.SwitchMenu("ckf_weaponshop")
				end
				NativeUI.Display()
			end
			for i,class in ipairs(ckf_weaponshop.weaponClasses) do
				if NativeUI.IsMenuOpened("ckf_"..class.name) then
					for i,weapon in ipairs(class.weapons) do
						if DoesPlayerOwnWeapon(weapon.model) then
							local clicked, hovered = NativeUI.SpriteMenuButton(weapon.name, "commonmenu", "shop_gunclub_icon_a", "shop_gunclub_icon_b", "ckf_"..class.name.."_"..weapon.model)
							if clicked then
								SetCurrentPedWeapon(GetPlayerPed(-1), weapon.model, true)
								CreateFakeWeaponObject(weapon)
							elseif hovered then
								SetTempWeapon(weapon)
							end
						else
							local clicked, hovered = NativeUI.Button(weapon.name, "150000$")
							if clicked then
								TriggerServerEvent('weapon:pay')
								GiveWeapon(weapon.model, weapon.clipSize*3)
								SetCurrentPedWeapon(GetPlayerPed(-1), weapon.model, true)
								CreateFakeWeaponObject(weapon)
								NativeUI.SwitchMenu("ckf_"..class.name.."_"..weapon.model)
							elseif hovered then
								SetTempWeapon(weapon)
							end
						end
					end
					NativeUI.Display()
				end
				for i,weapon in ipairs(class.weapons) do
					if NativeUI.IsMenuOpened("ckf_"..class.name.."_"..weapon.model) then
						if NativeUI.Button("~r~Remove Weapon") then
							RemoveWeapon(weapon.model)
							NativeUI.SwitchMenu("ckf_"..class.name)
						end
						if not weapon.noAmmo then
							if NativeUI.Button(weapon.clipSize.."x Rounds", "700$") then
								TriggerServerEvent('ammo:pay')
								GiveAmmo(weapon.model, weapon.clipSize)
							end
							if NativeUI.Button("Fill Ammo", "2000$") then
								TriggerServerEvent('fillammo:pay')
								GiveMaxAmmo(weapon.model)
							end
						end
						for i,attachment in ipairs(weapon.attachments) do			
							if DoesPlayerWeaponHaveComponent(weapon.model, attachment.model) then
								local clicked, hovered = NativeUI.SpriteButton(attachment.name, "commonmenu", "shop_gunclub_icon_a", "shop_gunclub_icon_b")
								if clicked then
									RemoveComponent(weapon.model, attachment.model, weapon)
								elseif hovered then
									SetTempWeaponConfig(weapon, false, false)
								end
							else
								--local clicked, hovered = NativeUI.SpriteButton(attachment.name, "commonmenu", "shop_tick_icon")
								local clicked, hovered = NativeUI.Button(attachment.name, "20000$")
								if clicked then
									TriggerServerEvent('custom:pay')
									GiveComponent(weapon.model, attachment.model, weapon)
								elseif hovered then
									SetTempWeaponConfig(weapon, attachment.model, false)
								end
							end
						end
						if not weapon.noTint then
							for i,tint in ipairs((weapon.isMK2 and Config.TintTable.mk2 or Config.TintTable.mk1)) do
								if IsPlayerWeaponTintActive(weapon.model, tint[1]) then
									local clicked, hovered = NativeUI.SpriteButton(tint[2], "commonmenu", "shop_gunclub_icon_a", "shop_gunclub_icon_b")
									--local clicked, hovered = NativeUI.Button(tint[2], "20000$")
									if clicked then
										--TriggerServerEvent('custom:pay')
										SetPlayerWeaponTint(weapon.model, 0, weapon)
									elseif hovered then
										SetTempWeaponConfig(weapon, false, tint[1])
									end
								else
									local clicked, hovered = NativeUI.SpriteButton(tint[2], "commonmenu", "shop_tick_icon")
									--local clicked, hovered = NativeUI.Button(tint[2], "20000$")
									if clicked then
										--TriggerServerEvent('custom:pay')
										SetPlayerWeaponTint(weapon.model, tint[1], weapon)
									elseif hovered then
										SetTempWeaponConfig(weapon, false, tint[1])
									end
								end
							end
						end
						NativeUI.Display()
						DisplayAmmoThisFrame(true)
					end
				end
			end
			if ckf_weaponshop.closeMenuNextFrame then
				ckf_weaponshop.closeMenuNextFrame = false
				NativeUI.CloseMenu()
			end
		end
    end
end)

SetPlayerControl(PlayerId(), true)
RenderScriptCams(false, 0, 0, 0, 0)