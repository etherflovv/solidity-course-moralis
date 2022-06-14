pragma solidity 0.7.5;

contract HelloWorld {

    string message;

    constructor(string memory _message) {
        message = _message;
    }

    function hello() public view returns(string memory) {
        if (msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) {
            return message;
        } 
        else {
            return "Wrong address";
        }
        return ""; // unreachable code
    }

}