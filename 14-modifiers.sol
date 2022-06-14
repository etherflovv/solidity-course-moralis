// modifier
// used for parts that are repeated over multiple functions

pragma solidity 0.7.5;

contract Bank {
    
    mapping(address => uint) balance;
    address owner;

    // create modifier - move it out from the function
    modifier onlyOwner { // modifiers can have inputs e.g. `modifier onlyOwner (uint number) {}`. -> then function header also require input e.g. `onlyOwner(100)` where input must be fixed.
        require(msg.sender == owner); 
        _; // this line is required for all modifiers // it means -> "run the function"
    }

    // // example of common modifier, check that amount sent is more than the price.
    // modifier costs(uint price) { 
    //     require(msg.value >= price); 
    //     _; 
    // }

    constructor() {
        owner = msg.sender;
    }

    function addBalance(uint _toAdd) public onlyOwner returns(uint) { // add modifier back into function header
        // require(msg.sender == owner); // this require statement may be used multiple times -> then create modifier for it
        
        balance[msg.sender] += _toAdd;
        return balance[msg.sender];
    }

    function getBalance() public view returns(uint) {
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient.");
        require(msg.sender != recipient, "Don't transfer to yourself.");

        uint previousSenderBalance = balance[msg.sender]; 

        _transfer(msg.sender, recipient, amount);

        assert(balance[msg.sender] == previousSenderBalance - amount); 

        // event Logs and further checks
    }

    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }

}