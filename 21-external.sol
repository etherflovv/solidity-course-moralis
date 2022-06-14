// Bank.sol will interact with Government.sol's external function(s)
// To do so, Bank.sol needs to know:
// 1) What are the contract Functions (that you want to interact with) definitions -> Define `interface` with function header, this is outside of contract{}
// 2) Where is the contract located? ==> in contract{}, define interface variable & input contract address

// this code will not work but is for demonstration of `external` usage
// for working code, refer to ./21-external-contracts/Bank.sol

pragma solidity 0.7.5;

interface nameOfInterface {
    function functionName(address _from, address _to, uint _amount) external; // enter entire function header
}

contract Bank {
    
    nameOfInterface externalInstance = nameOfInterface(0xa6165bbb69f7e8f3d960220B5F28e990ea5F630D); // pass address of contract into input
    
    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Don't transfer money to yourself");
        
        uint previousSenderBalance = balance[msg.sender];
        
        _transfer(msg.sender, recipient, amount);
        
        externalInstance.functionName(msg.sender, recipient, amount); // calls external function with inputs
        
        assert(balance[msg.sender] == previousSenderBalance - amount);
    }
    
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
    
}