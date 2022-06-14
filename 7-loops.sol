pragma solidity 0.7.5;

contract HelloWorld {

    function count(int number) public pure returns(int) { 
        // for loop
        for (int i=0;i<10;i++) {
            number++; // number = number + 1;
        }
        return number;

        // // while loop
        // i = 0;
        // while(i < 10) {
        //     number++;
        //     i++;
        // }
        // return number;
    }
}