private _operationID = missionNamespace getVariable ['UNITAF_operationID', 0];

_uniFactionRaw = "extDB3" callExtension format ["0:FETCHDATA:SELECT faction FROM operations WHERE id = '%1'", _operationID]; //sends a request to the DB and returns the faction  (format of [TYPE,DATA] where type is if the request failed)

//_uniFactionRaw = ([1,21]);

missionNamespace setVariable ["Jaff_UNIFACTION", _uniFactionRaw, true];

/*
_uniFactionArray = (parseSimpleArray _uniFactionRaw); // converts the return from formatted sting into an array 
_faction = (_uniFactionArray select 1); // sets the _faction variable to the output of the call 