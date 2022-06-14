// Data Location

// 3 types:
// "storage" --> permanent storage of data. persistent over time and over function executions. e.g. state variable.
// "memory" --> temporary data storage. memory is used within functions; for function arguments & variables within functions.
//          --> must be declared for "complex" data types e.g. string.
//          --> "value" (aka simpler) data types do not require declaring "memory". e.g. int uint bool byte address fixed-size-array. -> they are always stored in memory.
// "callData" --> similar to "memory", but READ-ONLY.

pragma solidity 0.7.5;

contract DataLocation {

    uint data = 123; // this is a state variable, stored in "storage".

    function getString(string memory text) public pure returns (string memory) {
        return text;
    }

    // to save a function input string in "storage", do something like this:
    string stateString = ""; 

    // using the state variable in the function temporarily:
    function borrowStateString(string memory text) public {
        string memory tempString = stateString; /// pull state variable (`stateString`) to be used temporarily as memory in this function.
        tempString = text;
        // return tempString;
    }

    // changing the State variable with a temporary function input:
    function modifyStateString(string memory text) public {
        stateString = text; /// make state variable (`stateString`) = input (`text`).
        // return stateString;
    }

}