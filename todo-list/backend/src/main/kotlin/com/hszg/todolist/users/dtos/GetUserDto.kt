package com.hszg.todolist.users.dtos

import com.hszg.todolist.todoitems.TodoItem

data class GetUserDto(
    val id: Long,
    val username: String,
    val todoItems: List<TodoItem>
)
