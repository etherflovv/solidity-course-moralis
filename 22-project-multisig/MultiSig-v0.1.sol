/*

In this project, you should build a Multisig Wallet Smart Contract. 
A multisig wallet is a wallet where multiple “signatures” or approvals are needed for an outgoing transfer to take place. 
As an example, I could create a multisig wallet with me and my 2 friends. 
I configure the wallet such that it requires at least 2 of us to sign any transfer before it is valid. 
Anyone can deposit funds into this wallet. But as soon as we want to spend funds, it requires 2/3 approvals.

Here are the requirements of the smart contract wallet you will be building:

– Anyone should be able to deposit ether into the smart contract

– The contract creator should be able to input (1): the addresses of the owners and (2):  the numbers of approvals required for a transfer, in the constructor. For example, input 3 addresses and set the approval limit to 2. 

– Anyone of the owners should be able to create a transfer request. The creator of the transfer request will specify what amount and to what address the transfer will be made.

– Owners should be able to approve transfer requests.

– When a transfer request has the required approvals, the transfer should be sent. 

*/

pragma solidity 0.7.5;

contract MultiSig {

    struct Transfer {

    }

    uint balance;



    address private signer;

    modifier isSigner {
        require(msg.sender == signer);
        _;
    }

    constructor() {
        signer = msg.sender; // signer should be = ???
    }



    function getBalance(address) public returns(address) {
        balance = address(this).balance;
        return(balance);
    }


    function deposit(uint _amount) public returns(uint) { // anyone can deposit ether to the contract
        

    }

    function setSigners(address _signer, uint _numberApprovalRequired) public onlyOwner { // input (1): the addresses of the owners and (2):  the numbers of approvals required for a transfer, in the constructor. 


    }

    function transfer(uint _amount, address _toAddress) public isSigner {

    }


    function approveTransfer() public isSigner {
        // --> once 2/3 approved then call the "pushTransfer" or "_transfer"
    }

    function _transfer()  {

    }


}