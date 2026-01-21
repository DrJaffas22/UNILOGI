params["_supplyData","_crateType","_crateCargoSize","_vehicleLoad","_spawnPosition"];


private _crate = createVehicle[_crateType, [3000,3000,3000], [], 0, "CAN_COLLIDE"];
_crate setDir getDir _spawnPosition;
_crate addEventHandler ["HandleDamage", {0}];
_crate allowDamage false;
_crate setDamage 0;
	
//Remove default contents from crate
clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

[_crate] call compile preprocessFile "Scripts\Resupply\Functions\PXG_Crate_Fill.sqf";
[_crate, _crateCargoSize] call ace_cargo_fnc_setSize;
[_crate, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
[_crate, _vehicleLoad, true] call ace_cargo_fnc_loadItem;
