/*

private _operationID = missionNamespace getVariable ['UNITAF_operationID', 0];

_uniFactionRaw = "extDB3" callExtension format ["0:FETCHDATA:SELECT faction FROM operations WHERE id = '%1'", _operationID]; //sends a request to the DB and returns the faction  (format of [TYPE,DATA] where type is if the request failed)
 _uniFactionArray = (parseSimpleArray `_uniFactionRaw); // converts the return from formatted sting into an array 
_faction = (_uniFactionArray select 1); // sets the _faction variable to the output of the call 


*/
//_univar = getVariable untafFaction

//_univar = 3;

_uniFactionRaw = missionNamespace getVariable "Jaff_UNIFACTION";

//_uniFactionArray = (parseSimpleArray str _uniFactionRaw); // converts the return from formatted sting into an array 
//_faction = (_uniFactionArray select 1)select 0 select 0; // sets the _faction variable to the output of the call 


_faction = (_uniFactionRaw select 1)select 0 select 0; // sets the _faction variable to the output of the call 
//publicVariable _uniFactionArray;

//publicVariable _faction;


_availableFactions = [str _faction];
_availableFactions