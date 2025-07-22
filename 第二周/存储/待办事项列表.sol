//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;



contract TodoList{
    struct Todo{
        string text;
        bool completed;
    }

    Todo[] public todos;
    function create(string calldata _text) external {
        todos.push(Todo({
            text:_text,
            completed:false
        }));
    }
    function updateText(uint _index,string calldata _text)external {
        // todos[_index].text=_text;  //更新一个字段的，这种省gas
        // todos[_index].text=_text;  //更新一个字段的，这种省gas
        // todos[_index].completed=false;  //更新一个字段的，这种省gas

        Todo storage todo = todos[_index];  //批量的这种省gas
        todo.text=_text;
        // todo.text=_text;
        // todo.text=_text;
    }
    function get(uint _index) external view returns (string memory,bool) {
        Todo memory todo=todos[_index];
        return (todo.text,todo.completed);
    } 


function toggleCompleted(uint _index) external {
     todos[_index].completed = !todos[_index].completed;
}

}