
// # Error Handling

// require() 
// e.g. require(inputnumber > 0);
// e.g. require(msg.sender == owner);
// check for valid conditions 
// check inputs
// revert

// assert()
// test for internal errors
// check invariants

// Invariants:
// Condition that is always true at a particular point of the code


pragma solidity 0.7.5;

contract Bank {
    
    mapping(address => uint) balance;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function addBalance(uint _toAdd) public returns(uint) {
        require(msg.sender == owner, "Only owner can call addBalance"); // errors can be added as the second input
        
        balance[msg.sender] += _toAdd;
        return balance[msg.sender];
    }

    function getBalance() public view returns(uint) {
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient.");
        require(msg.sender != recipient, "Don't transfer to yourself.");

        uint previousSenderBalance = balance[msg.sender]; // creating this to check Assert statement

        _transfer(msg.sender, recipient, amount);

        assert(balance[msg.sender] == previousSenderBalance - amount); // Assert statement

        // event Logs and further checks
    }

    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }

}