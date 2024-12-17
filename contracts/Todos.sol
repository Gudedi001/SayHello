// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.24;

contract Todos {

    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
        todos.push(Todo({text: _text,completed: false}));
        todos.push(Todo(_text,false));

        Todo memory todo;
        todo.text = _text;

        todos.push(todo);
    }

    function get(uint256 index) public view returns (string memory text,bool completed){
        Todo storage todo = todos[index];
        return (todo.text,todo.completed);
    }

    function updateText(uint256 index,string calldata _updateText) public {
        Todo storage todo = todos[index];
        todo.text = _updateText;
    }

    function toggleCompleted(uint256 index) public {
        Todo storage todo = todos[index];
        todo.completed = !todo.completed;
    }



}