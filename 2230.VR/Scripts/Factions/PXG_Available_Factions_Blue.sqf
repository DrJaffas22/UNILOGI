

_uniFactionRaw = missionNamespace getVariable "Jaff_UNIFACTION";



_faction = (_uniFactionRaw select 1)select 0 select 0; // sets the _faction variable to the output of the call 


_availableFactions = [str _faction];
_availableFactions