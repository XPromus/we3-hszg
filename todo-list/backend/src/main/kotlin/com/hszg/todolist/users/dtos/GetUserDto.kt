package com.hszg.todolist.users.dtos

data class GetUserDto(
    val id: Long,
    val username: String,
    val todoItemIds: List<Long>
)
