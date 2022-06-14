pragma solidity 0.7.5;
contract MemoryAndStorage {

    mapping(uint => User) users;

    struct User{
        uint id;
        uint balance;
    }

    function addUser(uint id, uint balance) public {
        users[id] = User(id, balance);
    }

    function updateBalance(uint id, uint balance) public {
         users[id].balance = balance; // solution
        //  User memory user = users[id]; // alternatively, change memory to storage
        //  user.balance = balance;
    }

    function getBalance(uint id) view public returns (uint) {
        return users[id].balance;
    }

}