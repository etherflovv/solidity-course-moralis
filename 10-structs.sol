pragma solidity 0.7.5;

contract HelloWorld {
    
    // struct can be used as its own type
    struct Person { // only to define the structure; not to define any values to elements;
        uint age;
        string name;
    }

    Person[] people; // Create `Person[]` type for variable `people`

    function addPerson(uint _age, string memory _name) public {
        Person memory newPerson = Person(_age, _name); // Create an `instance` of `Person`
        people.push(newPerson);
    } 

    function getPerson(uint _index) public view returns (uint, string memory) {
        Person memory personToReturn = people[_index];
        return (personToReturn.age, personToReturn.name);
    }

}