// payable
// 

pragma solidity 0.7.5;

contract Bank {
    
    mapping(address => uint) balance;

    address owner;

    // create event
    event depositDone(uint amount, address depositedTo);
    // can be indexed to be searchable in future e.g.:
    event transferComplete(uint amount, address transferFrom, address indexed transferTo);

    modifier onlyOwner {
        require(msg.sender == owner); 
        _; 
    }

    constructor() {
        owner == msg.sender;
    }

    function deposit() public payable returns(uint) {  // add `payable` to function header
        balance[msg.sender] += msg.value; // balance mapping nothing to do with balance of smart contract. keeps track of internal balances i.e. which address deposited what money.
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }

    function getBalance() public view returns(uint) {
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Don't transfer to yourself");

        uint previousSenderBalance = balance[msg.sender]; 

        _transfer(msg.sender, recipient, amount);

        assert(balance[msg.sender] == previousSenderBalance - amount); 

        // event Logs and further checks
        emit transferComplete(amount, msg.sender, recipient);
    }

    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }

}