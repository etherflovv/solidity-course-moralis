// Bank.sol will interact with Government.sol's external function(s)
// To do so, Bank.sol needs to know:
// 1) What are the contract Functions (that you want to interact with) definitions -> Define `interface` with function header, this is outside of contract{}
// 2) Where is the contract located? ==> in contract{}, define interface variable & input contract address\

// To setup, first deploy Government.sol.
// Then input the contract address into the GovernmentInterface(input) below before deploying Bank.sol.

pragma solidity 0.7.5;
import "./Ownable.sol";

interface GovernmentInterface {
    function addTransaction(address _from, address _to, uint _amount) external; // enter entire function header
}

contract Bank is Ownable {
    
    GovernmentInterface governmentInstance = GovernmentInterface(0xa6165bbb69f7e8f3d960220B5F28e990ea5F630D); // pass address of contract into input

    mapping(address => uint) balance;
    
    event depositDone(uint amount, address indexed depositedTo);
    
    function deposit() public payable returns (uint)  {
        balance[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }
    
    function withdraw(uint amount) public returns (uint) {
        require(balance[msg.sender] >= amount, "Your size is not size");
        balance[msg.sender] -= amount;
        msg.sender.transfer(amount); 
        return balance[msg.sender];
    }
    
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }
    
    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Don't transfer money to yourself");
        
        uint previousSenderBalance = balance[msg.sender];
        
        _transfer(msg.sender, recipient, amount);
        
        governmentInstance.addTransaction(msg.sender, recipient, amount); // call external function
        
        assert(balance[msg.sender] == previousSenderBalance - amount);
    }
    
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
    
}