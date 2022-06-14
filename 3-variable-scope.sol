pragma solidity 0.7.5;

contract HelloWorld {

    // // this is a `state variable` -> they preseve the state of the contract
    // string message = "Hello World!"; 
    // // global scope ; when var declared in contract but outside of function. can be used in any other function of the contract.

    function hello() public pure returns(string memory) {
        string memory message = "Hello World!"; 
        // // this is a `local variable` -> they only exist in the function scope
        // // when var declared within function, only can be used in function. `memory`must be added.
        return message;

    }
}