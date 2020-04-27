Config = {}

Config.Debug = true

Config.Language = {
	blipname = "AmmuNation",
	paid = "You paid",
}

Config.Weaponshops = {
	vector3(-662.1, -935.3, 20.8),
	vector3(810.2, -2157.3, 28.6),
	vector3(1693.4, 3759.5, 33.7),
	vector3(-330.2, 6083.8, 30.4),
	vector3(252.3, -50.0, 68.9),
	vector3(22.0, -1107.2, 28.8),
	vector3(2567.6, 294.3, 107.7),
	vector3(-1117.5, 2698.6, 17.5),
	vector3(842.4, -1033.4, 27.1)
}

Config.WeaponTable = {
    {
        name = "Melee",
        { 'WEAPON_KNUCKLE', 'Knuckle Dusters' },
        { 'WEAPON_SWITCHBLADE', 'Switchblade' },
        { 'WEAPON_KNIFE', 'Knife' },
        { 'WEAPON_NIGHTSTICK', 'Nightstick' },
        { 'WEAPON_HAMMER', 'Hammer' },
        { 'WEAPON_BAT', 'Katana' },
        { 'WEAPON_GOLFCLUB', 'Golf Club' },
        { 'WEAPON_CROWBAR', 'Knife' },
        { 'WEAPON_HATCHET', 'Hatchet' },
        { 'WEAPON_POOLCUE', 'Pool Cue' },
        { 'WEAPON_WRENCH', 'Wrench' },
        { 'WEAPON_FLASHLIGHT', 'Flashlight' },
        { 'WEAPON_BOTTLE', 'Broken Bottle' },
        { 'WEAPON_DAGGER', 'Bowie Knife' },
        { 'WEAPON_MACHETE', 'Machete' },
        { 'WEAPON_BATTLEAXE', 'Battle Axe' },
        { 'WEAPON_BALL', 'Baseball' },
        { 'WEAPON_SNOWBALL', 'Snowball' },
    },
    {
        name = "Pistols",
        { 'WEAPON_PISTOL', 'Pistol' },
        { 'WEAPON_PISTOL_MK2', 'Pistol MKII' },
        { 'WEAPON_COMBATPISTOL', 'Combat Pistol' },
        { 'WEAPON_MACHINEPISTOL', 'Machine Pistol' },
        { 'WEAPON_APPISTOL', 'Automatic Pistol' },
        { 'WEAPON_PISTOL50', 'Pistol .50' },
        { 'WEAPON_REVOLVER', 'Revolver' },
        { 'WEAPON_REVOLVER_MK2', 'Revolver MKII' },
        { 'WEAPON_VINTAGEPISTOL', 'Vintage Pistol' },
        { 'WEAPON_SNSPISTOL', 'SNS Pistol' },
        { 'WEAPON_SNSPISTOL_MK2', 'SNS Pistol MKII' },
        { 'WEAPON_MARKSMANPISTOL', 'Marksman Pistol' },
        { 'WEAPON_HEAVYPISTOL', 'Heavy Pistol' },
        { 'WEAPON_FLAREGUN', 'Flare Gun' },
        { 'WEAPON_STUNGUN', 'Taser' },
        { 'WEAPON_DOUBLEACTION', 'Double-Action Revolver' },
    },
    {
        name = "SMGs",
        { 'WEAPON_MICROSMG', 'Micro SMG' },
        { 'WEAPON_SMG', 'SMG' },
        { 'WEAPON_SMG_MK2', 'SMG MKII' },
        { 'WEAPON_ASSAULTSMG', 'Assault SMG' },
        { 'WEAPON_MINISMG', 'Mini SMG' },
        { 'WEAPON_COMBATPDW', 'Combat PDW' },
    },
    {
        name = "MGs",
        { 'WEAPON_MG', 'MG' },
        { 'WEAPON_COMBATMG', 'Combat MG' },
        { 'WEAPON_COMBATMG_MK2', 'Combat MG MKII' },
        { 'WEAPON_GUSENBERG', 'Gusenberg' },
    },
    {
        name = "Shotguns",
        { 'WEAPON_PUMPSHOTGUN', 'Pump Shotgun' },
        { 'WEAPON_PUMPSHOTGUN_MK2', 'Pump Shotgun MKII' },
        { 'WEAPON_HEAVYSHOTGUN', 'Heavy Shotgun' },
        { 'WEAPON_SAWNOFFSHOTGUN', 'Sawn-off Shotgun' },
        { 'WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun' },
        { 'WEAPON_BULLPUPSHOTGUN', 'Bullpup Shotgun' },
        { 'WEAPON_AUTOSHOTGUN', 'Sweeper' },
        { 'WEAPON_DBSHOTGUN', 'Double-Barreled Shotgun' },
        { 'WEAPON_MUSKET', 'Musket' },
    },
    {
        name = "Assault Rifles",
        { 'WEAPON_ASSAULTRIFLE', 'Assault Rifle' },
        { 'WEAPON_ASSAULTRIFLE_MK2', 'Assault Rifle MKII' },
        { 'WEAPON_CARBINERIFLE', 'Carbine Rifle' },
        { 'WEAPON_CARBINERIFLE_MK2', 'Carbine Rifle MKII' },
        { 'WEAPON_ADVANCEDRIFLE', 'Advanced Rifle' },
        { 'WEAPON_COMPACTRIFLE', 'Compact Rifle' },
        { 'WEAPON_SPECIALCARBINE', 'Special Carbine' },
        { 'WEAPON_SPECIALCARBINE_MK2', 'Special Carbine MKII' },
        { 'WEAPON_BULLPUPRIFLE', 'Bullpup Rifle' },
        { 'WEAPON_BULLPUPRIFLE_MK2', 'Bullpup Rifle MKII' },
    },
    {
        name = "Sniper Rifles",
        { 'WEAPON_SNIPERRIFLE', 'Sniper Rifle' },
        { 'WEAPON_HEAVYSNIPER', 'Heavy Sniper Rifle' },
        { 'WEAPON_HEAVYSNIPER_MK2', 'Heavy Sniper Rifle MKII' },
        { 'WEAPON_MARKSMANRIFLE', 'Marksman Rifle' },
        { 'WEAPON_MARKSMANRIFLE_MK2', 'Marksman Rifle MKII' },
    },
    {
        name = "Special Weapons",
        { 'WEAPON_COMPACTLAUNCHER', 'Compact Grenade Launcher' },
        { 'WEAPON_GRENADELAUNCHER', 'Grenade Launcher' },
        { 'WEAPON_RPG', 'RPG' },
        { 'WEAPON_HOMINGLAUNCHER', 'Homing Launcher' },
        { 'WEAPON_MINIGUN', 'Minigun' },
        { 'WEAPON_RAILGUN', 'Railgun' },
    },
    {
        name = "Throwables",
        { 'WEAPON_GRENADE', 'Frag Grenade', {noTint = true} },
        { 'WEAPON_STICKYBOMB', 'Sticky Bombs', {noTint = true} },
        { 'WEAPON_SMOKEGRENADE', 'Smoke Grenade', {noTint = true} },
        { 'WEAPON_BZGAS', 'BZ Gas', {noTint = true} },
        { 'WEAPON_MOLOTOV', 'Molotov Cocktail', {noTint = true} },
        { 'WEAPON_PIPEBOMB', 'Pipebomb', {noTint = true} },
        { 'WEAPON_PROXMINE', 'Proximity Mine', {noTint = true} },
    },
    {
        name = "Accessories",
        { 'WEAPON_FIREEXTINGUISHER', 'Fire Extinguisher', {noAmmo = true, noTint = true} },
        { 'WEAPON_FIREWORK', 'Firework Launcher', {noTint = true} },
        { 'WEAPON_PETROLCAN', 'Jerry Can', {noTint = true} },
		{ 'WEAPON_FLARE', 'Flare', {noTint = true} },
		{ 'GADGET_PARACHUTE', 'Parachute', {noPreview = true, noTint = true, noAmmo = true} },
    },
}

Config.AttachmentTable = {  
	-- Putting these at the top makes them work properly as they need to be applied to the weapon first before other attachments
	{ "COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },
	{ "COMPONENT_CARBINERIFLE_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },
	{ "COMPONENT_ASSAULTRIFLE_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },
	{ "COMPONENT_MICROSMG_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },
	{ "COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },
	{ "COMPONENT_SNIPERRIFLE_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },
	{ "COMPONENT_PISTOL_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },
	{ "COMPONENT_PISTOL50_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },
	{ "COMPONENT_APPISTOL_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },
	{ "COMPONENT_HEAVYPISTOL_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },
	{ "COMPONENT_SMG_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },
	{ "COMPONENT_MARKSMANRIFLE_VARMOD_LUXE", "Yusuf Amir Luxury Finish" },

	{ "COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER", "Lowrider Finish" },
	{ "COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER", "Lowrider Finish" },
	{ "COMPONENT_SNSPISTOL_VARMOD_LOWRIDER", "Lowrider Finish" },
	{ "COMPONENT_MG_COMBATMG_LOWRIDER", "Lowrider Finish" },
	{ "COMPONENT_BULLPUPRIFLE_VARMOD_LOWRIDER", "Lowrider Finish" },
	{ "COMPONENT_MG_VARMOD_LOWRIDER", "Lowrider Finish" },
	{ "COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER", "Lowrider Finish" },
	{ "COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER", "Lowrider Finish" },

	{ "COMPONENT_CARBINERIFLE_MK2_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_MARKSMANRIFLE_MK2_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_COMBATMG_MK2_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_SMG_MK2_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_PISTOL_MK2_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_PISTOL_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_ASSAULTSHOTGUN_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_HEAVYSHOTGUN_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_PISTOL50_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_COMBATPISTOL_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_APPISTOL_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_COMBATPDW_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_SNSPISTOL_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_SNSPISTOL_MK2_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_ASSAULTRIFLE_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_COMBATMG_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_MG_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_ASSAULTSMG_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_GUSENBERG_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_MICROSMG_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_BULLPUPRIFLE_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_COMPACTRIFLE_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_HEAVYPISTOL_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_VINTAGEPISTOL_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_CARBINERIFLE_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_ADVANCEDRIFLE_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_MARKSMANRIFLE_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_SMG_CLIP_02", "Extended Magazine" },
	{ "COMPONENT_SPECIALCARBINE_CLIP_02", "Extended Magazine" },

	{ "COMPONENT_SPECIALCARBINE_CLIP_03", "Drum Magazine" },
	{ "COMPONENT_COMPACTRIFLE_CLIP_03", "Drum Magazine" },
	{ "COMPONENT_COMBATPDW_CLIP_03", "Drum Magazine" },
	{ "COMPONENT_ASSAULTRIFLE_CLIP_03", "Drum Magazine" },
	{ "COMPONENT_HEAVYSHOTGUN_CLIP_03", "Drum Magazine" },
	{ "COMPONENT_CARBINERIFLE_CLIP_03", "Drum Magazine" },
	{ "COMPONENT_SMG_CLIP_03", "Drum Magazine" },

	{ "COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER", "Tracer Rounds" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING", "Armor Piercing Rounds" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ", "Full Metal Jacket Rounds" },

	{ "COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER", "Tracer Rounds" },
	{ "COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },
	{ "COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING", "Armor Piercing Rounds" },
	{ "COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ", "Full Metal Jacket Rounds" },

	{ "COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER", "Tracer Rounds" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING", "Armor Piercing Rounds" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ", "Full Metal Jacket Rounds" },

	{ "COMPONENT_PISTOL_MK2_CLIP_TRACER", "Tracer Rounds" },
	{ "COMPONENT_PISTOL_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },
	{ "COMPONENT_PISTOL_MK2_CLIP_ARMORPIERCING", "Armor Piercing Rounds" },
	{ "COMPONENT_PISTOL_MK2_CLIP_FMJ", "Full Metal Jacket Rounds" },

	{ "COMPONENT_PUMPSHOTGUN_MK2_CLIP_TRACER", "Tracer Rounds" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT", "Hollowpoint Rounds" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE", "Explosive Rounds" },

	{ "COMPONENT_SNSPISTOL_MK2_CLIP_TRACER", "Tracer Rounds" },
	{ "COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },
	{ "COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT", "Hollowpoint Rounds" },
	{ "COMPONENT_SNSPISTOL_MK2_CLIP_FMJ", "Full Metal Jacket Rounds" },

	{ "COMPONENT_REVOLVER_MK2_CLIP_TRACER", "Tracer Rounds" },
	{ "COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },
	{ "COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT", "Hollowpoint Rounds" },
	{ "COMPONENT_REVOLVER_MK2_CLIP_FMJ", "Full Metal Jacket Rounds" },

	{ "COMPONENT_SMG_MK2_CLIP_TRACER", "Tracer Rounds" },
	{ "COMPONENT_SMG_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },
	{ "COMPONENT_SMG_MK2_CLIP_ARMORPIERCING", "Armor Piercing Rounds" },
	{ "COMPONENT_SMG_MK2_CLIP_FMJ", "Full Metal Jacket Rounds" },

	{ "COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER", "Tracer Rounds" },
	{ "COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER", "Tracer Rounds" },
	{ "COMPONENT_COMBATMG_MK2_CLIP_TRACER", "Tracer Rounds" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CLIP_TRACER", "Tracer Rounds" },

	{ "COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },
	{ "COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },
	{ "COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY", "Incendiary Rounds" },

	{ "COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING", "Armor Piercing Rounds" },
	{ "COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING", "Armor Piercing Rounds" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING", "Armor Piercing Rounds" },
	{ "COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING", "Armor Piercing Rounds" },

	{ "COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ", "Full Metal Jacket Rounds" },
	{ "COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ", "Full Metal Jacket Rounds" },
	{ "COMPONENT_COMBATMG_MK2_CLIP_FMJ", "Full Metal Jacket Rounds" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ", "Full Metal Jacket Rounds" },

	{ "COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE", "Explosive Rounds" },

	{ "COMPONENT_AT_PI_FLSH_02", "Flashlight" },
	{ "COMPONENT_AT_AR_FLSH	", "Flashlight" },
	{ "COMPONENT_AT_PI_FLSH", "Flashlight" },
	{ "COMPONENT_AT_AR_FLSH", "Flashlight" },
	{ "COMPONENT_AT_PI_FLSH_03", "Flashlight" },

	{ "COMPONENT_AT_PI_SUPP", "Suppressor" },
	{ "COMPONENT_AT_PI_SUPP_02", "Suppressor" },
	{ "COMPONENT_AT_AR_SUPP", "Suppressor" },
	{ "COMPONENT_AT_AR_SUPP_02", "Suppressor" },
	{ "COMPONENT_AT_SR_SUPP", "Suppressor" },
	{ "COMPONENT_AT_SR_SUPP_03", "Suppressor" },

	{ "COMPONENT_AT_PI_COMP", "Compensator" },
	{ "COMPONENT_AT_PI_COMP_02", "Compensator" },
	{ "COMPONENT_AT_PI_COMP_03", "Compensator" },
	{ "COMPONENT_AT_MRFL_BARREL_01", "Barrel Attachment 1" },
	{ "COMPONENT_AT_MRFL_BARREL_02", "Barrel Attachment 2" },
	{ "COMPONENT_AT_SR_BARREL_01", "Barrel Attachment 1" },
	{ "COMPONENT_AT_BP_BARREL_01", "Barrel Attachment 1" },
	{ "COMPONENT_AT_BP_BARREL_02", "Barrel Attachment 2" },
	{ "COMPONENT_AT_SC_BARREL_01", "Barrel Attachment 1" },
	{ "COMPONENT_AT_SC_BARREL_02", "Barrel Attachment 2" },
	{ "COMPONENT_AT_AR_BARREL_01", "Barrel Attachment 1" },
	{ "COMPONENT_AT_SB_BARREL_01", "Barrel Attachment 1" },
	{ "COMPONENT_AT_CR_BARREL_01", "Barrel Attachment 1" },
	{ "COMPONENT_AT_MG_BARREL_01", "Barrel Attachment 1" },
	{ "COMPONENT_AT_MG_BARREL_02", "Barrel Attachment 2" },
	{ "COMPONENT_AT_CR_BARREL_02", "Barrel Attachment 2" },
	{ "COMPONENT_AT_SR_BARREL_02", "Barrel Attachment 2" },
	{ "COMPONENT_AT_SB_BARREL_02", "Barrel Attachment 2" },
	{ "COMPONENT_AT_AR_BARREL_02", "Barrel Attachment 2" },
	{ "COMPONENT_AT_MUZZLE_01", "Muzzle Attachment 1" },
	{ "COMPONENT_AT_MUZZLE_02", "Muzzle Attachment 2" },
	{ "COMPONENT_AT_MUZZLE_03", "Muzzle Attachment 3" },
	{ "COMPONENT_AT_MUZZLE_04", "Muzzle Attachment 4" },
	{ "COMPONENT_AT_MUZZLE_05", "Muzzle Attachment 5" },
	{ "COMPONENT_AT_MUZZLE_06", "Muzzle Attachment 6" },
	{ "COMPONENT_AT_MUZZLE_07", "Muzzle Attachment 7" },

	{ "COMPONENT_AT_AR_AFGRIP", "Grip" },
	{ "COMPONENT_AT_AR_AFGRIP_02", "Grip" },

	{ "COMPONENT_AT_PI_RAIL", "Holographic Sight" },
	{ "COMPONENT_AT_SCOPE_MACRO_MK2", "Holographic Sight" },
	{ "COMPONENT_AT_PI_RAIL_02", "Holographic Sight" },
	{ "COMPONENT_AT_SIGHTS_SMG", "Holographic Sight" },
	{ "COMPONENT_AT_SIGHTS", "Holographic Sight" },

	{ "COMPONENT_AT_SCOPE_SMALL", "Scope Small" },
	{ "COMPONENT_AT_SCOPE_SMALL_02", "Scope Small" },

	{ "COMPONENT_AT_SCOPE_MACRO_02", "Scope" },
	{ "COMPONENT_AT_SCOPE_SMALL_02", "Scope" },
	{ "COMPONENT_AT_SCOPE_MACRO", "Scope" },
	{ "COMPONENT_AT_SCOPE_MEDIUM", "Scope" },
	{ "COMPONENT_AT_SCOPE_LARGE", "Scope" },
	{ "COMPONENT_AT_SCOPE_SMALL", "Scope" },

	{ "COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2", "2x Scope" },
	{ "COMPONENT_AT_SCOPE_SMALL_MK2", "2x Scope" },

	{ "COMPONENT_AT_SCOPE_SMALL_SMG_MK2", "4x Scope" },
	{ "COMPONENT_AT_SCOPE_MEDIUM_MK2", "4x Scope" },

	{ "COMPONENT_AT_SCOPE_MAX", "Advanced Scope" },
	{ "COMPONENT_AT_SCOPE_LARGE", "Scope Large" },
	{ "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2", "Scope Large" },
	{ "COMPONENT_AT_SCOPE_LARGE_MK2", "8x Scope" },

	{ "COMPONENT_AT_SCOPE_NV", "Nightvision Scope" },
	{ "COMPONENT_AT_SCOPE_THERMAL", "Thermal Scope" },

	--{ "COMPONENT_KNUCKLE_VARMOD_PLAYER", "Default Skin" },
	{ "COMPONENT_KNUCKLE_VARMOD_LOVE", "Love Skin" },
	{ "COMPONENT_KNUCKLE_VARMOD_DOLLAR", "Dollar Skin" },
	{ "COMPONENT_KNUCKLE_VARMOD_VAGOS", "Vagos Skin" },
	{ "COMPONENT_KNUCKLE_VARMOD_HATE", "Hate Skin" },
	{ "COMPONENT_KNUCKLE_VARMOD_DIAMOND", "Diamond Skin" },
	{ "COMPONENT_KNUCKLE_VARMOD_PIMP", "Pimp Skin" },
	{ "COMPONENT_KNUCKLE_VARMOD_KING", "King Skin" },
	{ "COMPONENT_KNUCKLE_VARMOD_BALLAS", "Ballas Skin" },
	{ "COMPONENT_KNUCKLE_VARMOD_BASE", "Base Skin" },
	{ "COMPONENT_SWITCHBLADE_VARMOD_VAR1", "Default Skin" },
	{ "COMPONENT_SWITCHBLADE_VARMOD_VAR2", "Variant 2 Skin" },
	--{ "COMPONENT_SWITCHBLADE_VARMOD_BASE", "Base Skin" },

	{ "COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_MARKSMANRIFLERIFLE_MK2_CAMO_IND_01", "American Camo" },

	{ "COMPONENT_BULLPUPRIFLE_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01", "American Camo" },

	{ "COMPONENT_PUMPSHOTGUN_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01", "American Camo" },

	{ "COMPONENT_REVOLVER_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_REVOLVER_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_REVOLVER_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_REVOLVER_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_REVOLVER_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_REVOLVER_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_REVOLVER_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_REVOLVER_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_REVOLVER_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_REVOLVER_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_REVOLVER_MK2_CAMO_IND_01", "American Camo" },

	{ "COMPONENT_SPECIALCARBINE_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01", "American Camo" },

	{ "COMPONENT_PISTOL_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_SNSPISTOL_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_SMG_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_CARBINERIFLE_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_COMBATMG_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CAMO", "Camo 1" },
	{ "COMPONENT_PISTOL_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_SNSPISTOL_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_CARBINERIFLE_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_SMG_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_COMBATMG_MK2_CAMO_02", "Camo 2" },
	{ "COMPONENT_PISTOL_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_SNSPISTOL_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_CARBINERIFLE_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_SMG_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_COMBATMG_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CAMO_03", "Camo 3" },
	{ "COMPONENT_PISTOL_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_SNSPISTOL_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_CARBINERIFLE_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_SMG_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_COMBATMG_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CAMO_04", "Camo 4" },
	{ "COMPONENT_PISTOL_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_SNSPISTOL_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_SMG_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_CARBINERIFLE_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_COMBATMG_MK2_CAMO_05", "Camo 5" },
	{ "COMPONENT_PISTOL_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_SNSPISTOL_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_SMG_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_CARBINERIFLE_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_COMBATMG_MK2_CAMO_06", "Camo 6" },
	{ "COMPONENT_PISTOL_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_SNSPISTOL_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_CARBINERIFLE_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_COMBATMG_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_SMG_MK2_CAMO_07", "Camo 7" },
	{ "COMPONENT_CARBINERIFLE_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_PISTOL_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_SNSPISTOL_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_COMBATMG_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_SMG_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CAMO_08", "Camo 8" },
	{ "COMPONENT_PISTOL_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_SNSPISTOL_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_COMBATMG_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_CARBINERIFLE_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_SMG_MK2_CAMO_09", "Camo 9" },
	{ "COMPONENT_PISTOL_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_SNSPISTOL_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_COMBATMG_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_CARBINERIFLE_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_SMG_MK2_CAMO_10", "Camo 10" },
	{ "COMPONENT_PISTOL_MK2_CAMO_IND_01", "American Camo" },
	{ "COMPONENT_SMG_MK2_CAMO_IND_01", "American Camo" },
	{ "COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01", "American Camo" },
	{ "COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01", "American Camo" },
	{ "COMPONENT_COMBATMG_MK2_CAMO_IND_01", "American Camo" },
	{ "COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01", "American Camo" },
	{ "COMPONENT_SNSPISTOL_MK2_CAMO_IND_01", "American Camo" },
}

Config.TintTable = {
	mk1 = {
		{ 1, "Green Tint" },
		{ 2, "Gold Tint" },
		{ 3, "Pink Tint" },
		{ 4, "Army Tint" },
		{ 5, "LSPD Tint" },
		{ 6, "Orange Tint" },
		{ 7, "Platinum Tint" },
	},
	mk2 = {
		{ 1, "Classic Gray Tint" },
		{ 2, "Classic TwoTone Tint" },
		{ 3, "Classic White Tint" },
		{ 4, "Classic Beige Tint" },
		{ 5, "Classic Green Tint" },
		{ 6, "Classic Blue Tint" },
		{ 7, "Classic Earth Tint" },
		{ 8, "Classic Brown And Black Tint" },
		{ 9, "Red Contrast Tint" },
		{ 10, "Blue Contrast Tint" },
		{ 11, "Yellow Contrast Tint" },
		{ 12, "Orange Contrast Tint" },
		{ 13, "Bold Pink Tint" },
		{ 14, "Bold Purple And Yellow Tint" },
		{ 15, "Bold Orange Tint" },
		{ 16, "Bold Green And Purple Tint" },
		{ 17, "Bold Red Features Tint" },
		{ 18, "Bold Green Features Tint" },
		{ 19, "Bold Cyan Features Tint" },
		{ 20, "Bold Yellow Features Tint" },
		{ 21, "Bold Red And White Tint" },
		{ 22, "Bold Blue And White Tint" },
		{ 23, "Metallic Gold Tint" },
		{ 24, "Metallic Platinum Tint" },
		{ 25, "Metallic Gray And Lilac Tint" },
		{ 26, "Metallic Purple And Lime Tint" },
		{ 27, "Metallic Red Tint" },
		{ 28, "Metallic Green Tint" },
		{ 29, "Metallic Blue Tint" },
		{ 30, "Metallic White And Aqua Tint" },
		{ 31, "Metallic Red And Yellow" },
	}
}