// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todoList;

    function create(string calldata _text) external {
        todoList.push(Todo({
            text: _text,
            completed: false
        }));
    }

    function updateText(uint _index, string calldata _text) external {
        Todo storage todo = todoList[_index];
        todo.text = _text;
    }

    function get(uint _index) external view returns(string memory, bool){
        Todo memory todo = todoList[_index];
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint _index) external {
        todoList[_index].completed = !todoList[_index].completed;
    }
}