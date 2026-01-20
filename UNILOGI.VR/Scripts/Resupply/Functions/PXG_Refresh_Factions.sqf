_factionsScriptPath = "Scripts\Factions\GetFactionFromId.sqf";

_factionsArray = call compile preprocessfile _factionsScriptPath;

tvClear 451501;
tvClear 451502;
{
	// Add faction to tree list
	tvAdd [451501,[], _x];
	// Path foo faction variants 
	_variantScriptPath = "Scripts\Factions\";
	// Combine strings and get list of variants 
	_variantScriptPath = _variantScriptPath + _x + "\variantlist.sqf";
	_variantArray = call compile preprocessfile _variantScriptPath;
	// Find factions place in tree list 
	_factionPlaceInTree = _foreachindex;
	{
		// Add variants to tree list
		tvAdd [451501,[_factionPlaceInTree],_x];
		
	} forEach _variantArray;

}	forEach _factionsArray;

_factionMemory = player getVariable ["PXG_Resupply_Memory_Faction", [-1,-1]];
if (_factionMemory select 0 != -1) then {tvSetCurSel [451501, _factionMemory]};