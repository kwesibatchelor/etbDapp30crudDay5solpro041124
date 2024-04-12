//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Crud {
    struct User {
        uint id; // tag declaration, no instance
        string name; // tag declaration, no instance
    }

    // reuse type definition User
    User[] public users;
    // keep track of the next id for new user
    uint public nextId;
    // function to create new user
    function create (string memory name) public { // takes one argument which is the name of the user and make it public so it can be called outside the contract
        // create a new instance of the struct
        users.push(User(nextId, name)); // pass the parameters in the same order they are defined in the struct type
        // increment the id
        nextId++;
    }

    // function to read a specifc instance of user
    function read(uint id) view public returns(uint, string memory) { // function can return several values simply by using a comma ,
        // find the correct user instance 
        for(uint i = 0; i < users.length; i++) {
            if(users[i].id == id) {
                return (users[i].id, users[i].name);
            } 
        }
        // return default value if user is not found
        return(0, "");
    }

    // create update function
    function update(uint id, string memory name) public {
        for(uint i = 0; i < users.length; i++) {
            if(users[i].id == id) {
                users[id].name = name;
            }
        }
    }

    // create delete function (could not call the fucntion delete because its a keyword
    function destroy(uint id) public {
        for(uint i = 0; i < users.length; i++) {
            if(users[i].id == id) {
                delete users[i];
            }
        }
    }
}

