_indexSpawn = lbCurSel 451500;
_indexSide = lbCurSel 451504;
_indexFaction = tvCurSel 451501;
_indexSupply = lbCurSel 451502;
_supplyData = lbData [451502, _indexSupply];

if (_indexSide == -1) exitWith { hint "Please select side."};
if (count _indexFaction == 0) exitWith { hint "Please select faction."};
if (count _indexFaction == 1) exitWith { hint "Please select faction variant."};
if (_indexSupply == -1) exitWith { hint "Please select supply crate."};
if (_indexSpawn == -1) exitWith {hint "Please select spawn point."};

//_spawnPosition = synchronizedObjects (player getVariable "PXG_Resupply_Master") select _indexSpawn;

_spawnMarker = lbText [451500,_indexSpawn];
//Spawn postion with elevation PositionAGL
_spawnPosition = getMarkerPos [_spawnMarker, true];

player setVariable ["PXG_Resupply_Memory_Side", _indexSide];
player setVariable ["PXG_Resupply_Memory_Faction", _indexFaction];
player setVariable ["PXG_Resupply_Memory_Supply", _indexSupply];
player setVariable ["PXG_Resupply_Memory_Spawn", _indexSpawn];

//Check for vehicles in radius of spawnpoint
/* Position for synced objects
private _nearVehicles = nearestObjects [getPos _spawnPosition, ["LandVehicle", "Air", "Ship", "Slingload_base_F"], 5];
_nearVehicles = _nearVehicles + nearestObjects [getPos _spawnPosition, ["Reammobox_F"], 1];
*/
private _nearVehicles = nearestObjects [_spawnPosition, ["LandVehicle", "Air", "Ship", "Slingload_base_F"], 5];


if (count _nearVehicles > 0) then {
	
	_vehicle = _nearVehicles select 0;
	
	switch(_supplyData) do {
	
		
		case "Wheel": {		
			if (((_vehicle getVariable "ace_cargo_space") - 1) >= 0) then {
				
				private _wheel = createVehicle["ACE_Wheel", [3000,3000,3000], [], 0, "CAN_COLLIDE"];
				
				[_wheel, _vehicle, true] call ace_cargo_fnc_loadItem;
				
				hint "Loaded wheel into vehicle";
			} else {
				hint "Could not load wheel into vehicle";
			};
		};

		case "Track": {		
			if (((_vehicle getVariable "ace_cargo_space") - 2) >= 0) then {
			
				private _track = createVehicle["ACE_Track", [3000,3000,3000], [], 0, "CAN_COLLIDE"];
				
				[_track, _vehicle, true] call ace_cargo_fnc_loadItem;
				
				hint "Loaded track into vehicle";
			} else {
				hint "Could not load track into vehicle";
			};
		};

		case "Parachutes":
		{
			if (((_vehicle getVariable "ace_cargo_space") - 1) >= 0) then {
				[_supplyData, "Box_UNICrate_CargoNet_Green_F", 1, _vehicle, _spawnPosition] call compile preprocessFileLineNumbers "Scripts\Resupply\Functions\PXG_Crate_Spawn_VehicleLoad.sqf";
				hint "Loaded crate into vehicle";
			} else {
				hint "Could not load crate into vehicle";
			};
		};

		case "OOPs Crate";
		case "EOD Tools";
		case "Flare Launchers";
		case "CBRN equipment and supplies, 15 kits":
		{
			if (((_vehicle getVariable "ace_cargo_space") - 1) >= 0) then {
				[_supplyData, "Box_UNICrate_Equip_Green_F", 1, _vehicle, _spawnPosition] call compile preprocessFileLineNumbers "Scripts\Resupply\Functions\PXG_Crate_Spawn_VehicleLoad.sqf";
				hint "Loaded crate into vehicle";
			} else {
				hint "Could not load crate into vehicle";
			};
		};

		case "Mines & enemy triggered explosives";
		case "Remote detonation explosives":
		{
			if (((_vehicle getVariable "ace_cargo_space") - 1) >= 0) then {
				[_supplyData, "Box_UNICrate_AmmoOrd_Green_F", 1, _vehicle, _spawnPosition] call compile preprocessFileLineNumbers "Scripts\Resupply\Functions\PXG_Crate_Spawn_VehicleLoad.sqf";
				hint "Loaded crate into vehicle";
			} else {
				hint "Could not load crate into vehicle";
			};
		};

		case "Anti-Vehicle Disposable launchers";
		case "Anti-Structure Disposable launchers":
		{
			if (((_vehicle getVariable "ace_cargo_space") - 2) >= 0) then {
				[_supplyData, "Box_UNICrate_WpsdispLaunch_Green_F", 2, _vehicle, _spawnPosition] call compile preprocessFileLineNumbers "Scripts\Resupply\Functions\PXG_Crate_Spawn_VehicleLoad.sqf";
				hint "Loaded crate into vehicle";
			} else {
				hint "Could not load crate into vehicle";
			};
		};


		case "Medium AT rounds & accessories":
		{
			if (((_vehicle getVariable "ace_cargo_space") - 2) >= 0) then {
				[_supplyData, "Box_UNICrate_WpsMediumLaunch_Green_F", 2, _vehicle, _spawnPosition] call compile preprocessFileLineNumbers "Scripts\Resupply\Functions\PXG_Crate_Spawn_VehicleLoad.sqf";
				hint "Loaded crate into vehicle";
			} else {
				hint "Could not load crate into vehicle";
			};
		};
		
		case "Heavy AT rounds & accessories":
		{
			if (((_vehicle getVariable "ace_cargo_space") - 2) >= 0) then {
				[_supplyData, "Box_UNICrate_WpsHeavyLaunch_Green_F", 2, _vehicle, _spawnPosition] call compile preprocessFileLineNumbers "Scripts\Resupply\Functions\PXG_Crate_Spawn_VehicleLoad.sqf";
				hint "Loaded crate into vehicle";
			} else {
				hint "Could not load crate into vehicle";
			};
		};
	
	
	
		case "MANPAD Anti Air rounds":
		case "MANPAD Anti Air Disposable Launchers":
		{
			if (((_vehicle getVariable "ace_cargo_space") - 2) >= 0) then {
				[_supplyData, "Box_UNICrate_WpsAALaunch_Green_F", 2, _vehicle, _spawnPosition] call compile preprocessFileLineNumbers "Scripts\Resupply\Functions\PXG_Crate_Spawn_VehicleLoad.sqf";
				hint "Loaded crate into vehicle";
			} else {
				hint "Could not load crate into vehicle";
			};
		};




		case "Bodybags";
		case "CCP Resupply";
		case "Squad Med Resupply";
		case "Platoon Med Resupply";
		case "MERT/CMT Resupply":
		{
			if (((_vehicle getVariable "ace_cargo_space") - 1) >= 0) then {
				[_supplyData, "Box_UNICrate_Medical_Green_F", 1, _vehicle, _spawnPosition] call compile preprocessFileLineNumbers "Scripts\Resupply\Functions\PXG_Crate_Spawn_VehicleLoad.sqf";
				hint "Loaded crate into vehicle";
			} else {
				hint "Could not load crate into vehicle";
			};
		};


		case "Crew weapons ammo";
		case "Sniper Team Ammo";
		case "Designated marksman ammo";
		case "Infantry Heavy Machine Gun ammo & accessories";
		case "Infantry Automatic Rifle";
		case "Infantry Medium Machine Gun";
		case "Infantry Standard Ammo":
		{
			if (((_vehicle getVariable "ace_cargo_space") - 1) >= 0) then {
				[_supplyData, "Box_UNICrate_Ammo_Green_F", 1, _vehicle, _spawnPosition] call compile preprocessFileLineNumbers "Scripts\Resupply\Functions\PXG_Crate_Spawn_VehicleLoad.sqf";
				hint "Loaded crate into vehicle";
			} else {
				hint "Could not load crate into vehicle";
			};
		};

		case "UGL Smoke & Lethal rounds";
		case "Signal Flares, Hand Smokes & Chemlights";		
		case "Hand Grenades, Lethal & Non-Lethal":
		{
			if (((_vehicle getVariable "ace_cargo_space") - 1) >= 0) then {
				[_supplyData, "Box_UNICrate_Grenades_Green_F", 1, _vehicle, _spawnPosition] call compile preprocessFileLineNumbers "Scripts\Resupply\Functions\PXG_Crate_Spawn_VehicleLoad.sqf";
				hint "Loaded crate into vehicle";
			} else {
				hint "Could not load crate into vehicle";
			};
		};

		default {		
			if (((_vehicle getVariable "ace_cargo_space") - 1) >= 0) then {
				[_supplyData, "Box_UNICrate_Equip_Green_F", 1, _vehicle, _spawnPosition] call compile preprocessFileLineNumbers "Scripts\Resupply\Functions\PXG_Crate_Spawn_VehicleLoad.sqf";
				hint "Loaded crate into vehicle";
			} else {
				hint "Could not load crate into vehicle";
			};
		};
	};
	
} else {

	switch(_supplyData) do {
	
	
	case "Wheel": {
		private _wheel = createVehicle["ACE_Wheel", _spawnPosition, [], 0, "CAN_COLLIDE"];
	};

	case "Track": {
		private _track = createVehicle["ACE_Track", _spawnPosition, [], 0, "CAN_COLLIDE"];
	};

	case "Parachutes":
	{
		private _crate = createVehicle["Box_UNICrate_CargoNet_Green_F", _spawnPosition, [], 0, "CAN_COLLIDE"];
		_crate addEventHandler ["HandleDamage", {0}];
		_crate allowDamage false;
		_crate setDamage 0;
		
		//Remove default contents from crate
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
		[_crate, 1] call ace_cargo_fnc_setSize;
		[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
	};

	case "OOPs Crate";
	case "EOD Tools";
	case "Flare Launchers";
	case "CBRN equipment and supplies, 15 kits":
	{
		private _crate = createVehicle["Box_UNICrate_Equip_Green_F", _spawnPosition, [], 0, "CAN_COLLIDE"];
		_crate addEventHandler ["HandleDamage", {0}];
		_crate allowDamage false;
		_crate setDamage 0;
		
		//Remove default contents from crate
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
		[_crate, 1] call ace_cargo_fnc_setSize;
		[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
	};


	case "Remote detonation explosives";
	case "Mines & enemy triggered explosives":
	{
		private _crate = createVehicle["Box_UNICrate_AmmoOrd_Green_F", _spawnPosition, [], 0, "CAN_COLLIDE"];
		_crate addEventHandler ["HandleDamage", {0}];
		_crate allowDamage false;
		_crate setDamage 0;
		
		//Remove default contents from crate
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
		[_crate, 1] call ace_cargo_fnc_setSize;
		[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
	};

	case "Anti-Vehicle Disposable launchers";
	case "Anti-Structure Disposable launchers":
	{
		private _crate = createVehicle["Box_UNICrate_WpsdispLaunch_Green_F", _spawnPosition, [], 0, "CAN_COLLIDE"];
		_crate addEventHandler ["HandleDamage", {0}];
		_crate allowDamage false;
		_crate setDamage 0;
		
		//Remove default contents from crate
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
		[_crate, 2] call ace_cargo_fnc_setSize;
		[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
	};

	case "Medium AT rounds & accessories":
	{
		private _crate = createVehicle["Box_UNICrate_WpsMediumLaunch_Green_F", _spawnPosition, [], 0, "CAN_COLLIDE"];
		_crate addEventHandler ["HandleDamage", {0}];
		_crate allowDamage false;
		_crate setDamage 0;
		
		//Remove default contents from crate
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
		[_crate, 2] call ace_cargo_fnc_setSize;
		[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
	};

	case "Heavy AT rounds & accessories":
	{
		private _crate = createVehicle["Box_UNICrate_WpsHeavyLaunch_Green_F", _spawnPosition, [], 0, "CAN_COLLIDE"];
		_crate addEventHandler ["HandleDamage", {0}];
		_crate allowDamage false;
		_crate setDamage 0;
		
		//Remove default contents from crate
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
		[_crate, 2] call ace_cargo_fnc_setSize;
		[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
	};


	case "MANPAD Anti Air rounds";
	case "MANPAD Anti Air Disposable Launchers":
	{
		private _crate = createVehicle["Box_UNICrate_WpsAALaunch_Green_F", _spawnPosition, [], 0, "CAN_COLLIDE"];
		_crate addEventHandler ["HandleDamage", {0}];
		_crate allowDamage false;
		_crate setDamage 0;
		
		//Remove default contents from crate
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
		[_crate, 2] call ace_cargo_fnc_setSize;
		[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
	};


	case "Bodybags";
	case "CCP Resupply";
	case "Squad Med Resupply";
	case "Platoon Med Resupply";	
	case "MERT/CMT Resupply":
	{
		private _crate = createVehicle["Box_UNICrate_Medical_Green_F", _spawnPosition, [], 0, "CAN_COLLIDE"];
		_crate addEventHandler ["HandleDamage", {0}];
		_crate allowDamage false;
		_crate setDamage 0;
		
		//Remove default contents from crate
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
		[_crate, 1] call ace_cargo_fnc_setSize;
		[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
	};




	case "Crew weapons ammo";
	case "Sniper Team Ammo";
	case "Designated marksman ammo";
	case "Infantry Heavy Machine Gun ammo & accessories";
	case "Infantry Automatic Rifle";
	case "Infantry Medium Machine Gun";
	case "Infantry Standard Ammo":
	{
		private _crate = createVehicle["Box_UNICrate_Ammo_Green_F", _spawnPosition, [], 0, "CAN_COLLIDE"];
		_crate addEventHandler ["HandleDamage", {0}];
		_crate allowDamage false;
		_crate setDamage 0;
		
		//Remove default contents from crate
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
		[_crate, 1] call ace_cargo_fnc_setSize;
		[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
	};

	
	case "UGL Smoke & Lethal rounds";
	case "Signal Flares, Hand Smokes & Chemlights";
	case "Hand Grenades, Lethal & Non-Lethal":
	{
		private _crate = createVehicle["Box_UNICrate_Grenades_Green_F", _spawnPosition, [], 0, "CAN_COLLIDE"];
		_crate addEventHandler ["HandleDamage", {0}];
		_crate allowDamage false;
		_crate setDamage 0;
		
		//Remove default contents from crate
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
		[_crate, 1] call ace_cargo_fnc_setSize;
		[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
	};



	default {
		private _crate = createVehicle["Box_UNICrate_Equip_Green_F", _spawnPosition, [], 0, "CAN_COLLIDE"];
		_crate addEventHandler ["HandleDamage", {0}];
		_crate allowDamage false;
		_crate setDamage 0;
		
		//Remove default contents from crate
		clearItemCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
		[_crate, 1] call ace_cargo_fnc_setSize;
		[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
		};
	};
};