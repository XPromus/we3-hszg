package com.hszg.todolist.users.dtos

import com.hszg.todolist.todoitems.dtos.TodoItemDescriptorDto

data class GetUserDtoWithChildren(
    val id: Long,
    val username: String,
    val todoItems: List<TodoItemDescriptorDto>
)
