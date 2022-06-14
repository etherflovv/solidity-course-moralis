// public - function/variable available for anyone to query/execute
// private - can only be accessed from within the contract itself
// external - can only be accessed from other contracts
// internal - like private, ++ also be accessed by any contract inheriting from it

pragma solidity 0.7.5;

contract Bank {
    
    mapping(address => uint) balance;

    function addBalance(uint _toAdd) public returns(uint) {
        balance[msg.sender] += _toAdd;
        return balance[msg.sender];
    }

    function getBalance() public view returns(uint) {
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        // check balance of msg.sender

        _transfer(msg.sender, recipient, amount);

        // event Logs and further checks
    }

    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }

}