Config = {
    RestrictActions = true, -- Ativa/Desativa correr,saltal e pvp dentro da garagem
    GroupMapBlips = true, -- Coloca todos os blips no mapa num só
    ShowGarageMarkers = true, -- Mostra os markers
    EnableInteriors = true, -- Ativa/Desativa os interiores das garagens (Desativar caso tenhas outro script com a mesma função)
	CallMechanic = false, -- Ativa/Desativa o menu do mecânico (WIP) [F9]

    BlacklistedVehicles = { -- A table of vehicles that should not be stored inside a garage
        "DUMP",
        "THRUSTER",
		"AIRBUS",
		"BUS",
    },

    Debug = false, -- Modo Debug

    locations = {
        ["Garagem Maze Bank"] = {
        	inLocation = {
        		{-84.06058,-820.882263,35.0280571,173.7467},
        		5,
        	},

        	outMarker = {-91.15355,-821.2789,221.0005,64.25077},

        	modifyMarker = {-87.6717148,-831.4004,221.00058,-98.71559},
        	modifyCam = {
        		{-94.86439,-831.2481,236.825089},
        		{-28.6049633,-5.12264251E-06,-76.4239349},
        	},

        	spawnInLocation = {-88.79834,-822.3201,222.0005,-147.027237},
        	spawnOutLocation = {-82.29792,-812.9583,35.2313232,-6.39963531},

        	carLocations = {
        		{-85.24082,-818.235535,220.23494,-144.433289},
        		{-76.9321747,-819.9362,220.234451,176.218323},
        		{-71.09352,-822.318542,220.234543,140.8338},
        		{-67.9834747,-828.685547,220.234467,94.56514},
        		{-70.25896,-836.0581,220.234222,45.08332},
        		{-84.3974152,-819.8488,225.672928,-148.987808},
        		{-76.77495,-819.621033,225.672867,171.160126},
        		{-71.1063461,-823.0381,225.672928,136.971},
        		{-67.4827652,-828.406433,225.672943,92.51076},
        		{-70.124855,-835.7496,225.673065,49.92409},
        		{-85.98553,-820.654846,231.018417,-142.9082},
        		{-77.21592,-820.092957,231.018982,178.564911},
        		{-71.42833,-822.0914,231.018478,133.955643},
        		{-68.0297,-828.6458,231.018784,88.1085358},
        		{-70.2125,-835.0709,231.0186,48.27413},
        	},
        },
        ["Garagem Maze Bank West"] = {
        	inLocation = {
        		{-1363.74561,-472.178558,30.2760544,-81.24413},
        		5,
        	},

        	outMarker = {238.360962,-1004.80573,-99.99996,90.22185},

        	modifyMarker = {226.6449,-975.0273,-100,0},
        	modifyCam = {
        		{228.454254,-974.812866,-96.1175},
        		{-19.3930645,0.05425337,177.062912},
        	},

        	spawnInLocation = {228,-1003.7,-99,0},
        	spawnOutLocation = {-1369.74561,-473.178558,30.2760544,110.24413},

        	carLocations = {
        		{223.4,-1001,-100,-60},
        		{223.4,-996,-100,-60},
        		{223.4,-991,-100,-60},
        		{223.4,-986,-100,-60},
        		{223.4,-981,-100,-60},
        		{232.7,-1001,-100,60},
        		{232.7,-996,-100,60},
        		{232.7,-991,-100,60},
        		{232.7,-986,-100,60},
        		{232.7,-981,-100,60},
        	},
        },
		["Garagem Principal"] = {
        	inLocation = {
        		{230.74561,-801.178558,29.55,-81.24413},
        		5,
        	},

        	outMarker = {238.360962,-1004.80573,-99.99996,90.22185},

        	modifyMarker = {226.6449,-975.0273,-100,0},
        	modifyCam = {
        		{228.454254,-974.812866,-96.1175},
        		{-19.3930645,0.05425337,177.062912},
        	},

        	spawnInLocation = {228,-1003.7,-99,0},
        	spawnOutLocation = {230.74561,-801.178558,29.55,-81.24413},

        	carLocations = {
        		{223.4,-1001,-100,-60},
        		{223.4,-996,-100,-60},
        		{223.4,-991,-100,-60},
        		{223.4,-986,-100,-60},
        		{223.4,-981,-100,-60},
        		{232.7,-1001,-100,60},
        		{232.7,-996,-100,60},
        		{232.7,-991,-100,60},
        		{232.7,-986,-100,60},
        		{232.7,-981,-100,60},
        	},
        },
    },
}