// Constructors
// Function run only once - at the time the contract is deployed
// Used to initialize the contract


pragma solidity 0.7.5;

contract HelloWorld {

    string message; // empty value // becomes value of _message (from constructor) when contract deployed

    constructor(string memory _message) {
        message = _message;
    }

    function hello() public view returns(string memory) { // Function/expression reads from the environment or state and thus requires "view" instead of "pure".
        return message;
    }
}