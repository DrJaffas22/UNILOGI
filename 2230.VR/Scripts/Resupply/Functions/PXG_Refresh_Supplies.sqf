// Get selected item from faction list
_indexFaction = tvCurSel 451501;
_faction = [_indexFaction select 0];

// Prevents error about missing SQF if player selects faction rather than variant from tree list 
if (count _indexFaction < 2) exitwith {};


// Get faction name 
_faction = tvText [451501, _faction];
// Get variant name
_variant = tvText [451501, _indexFaction];

// Split variant name to get variant era 
_variantArray = _variant splitString " ";
_variantType = _variantArray #0;

// Path for loadout list 
_suppliesScriptPath = "Scripts\Factions\";
_suppliesScriptPath = _suppliesScriptPath + _faction + "\supplies_" + _variantType + ".sqf";

_suppliesArray = call compile preprocessfile _suppliesScriptPath;

lbClear 451502;

{
	//Set supplies list with data for box
    _suppliesText = _suppliesArray select _forEachIndex select 0;
	_suppliesData = _suppliesArray select _forEachIndex select 1;
	if (_suppliesData != "NONE") then {
		_suppliesCurrent = lbAdd [451502, _suppliesText];
		lbSetData [451502, _suppliesCurrent, _suppliesData];
	}
}	forEach _suppliesArray;

_wheelSupply = lbAdd [451502, "Spare Wheel"];
lbSetData [451502, _wheelSupply, "Wheel"];

_trackSupply = lbAdd [451502, "Spare Track"];
lbsetData [451502, _trackSupply, "Track"];

_suppliesMemory = player getVariable ["PXG_Resupply_Memory_Supply", -1];
if (_suppliesMemory != -1) then {lbSetCurSel [451502, _suppliesMemory];};
