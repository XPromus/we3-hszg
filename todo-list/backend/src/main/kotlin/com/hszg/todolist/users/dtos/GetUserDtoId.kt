package com.hszg.todolist.users.dtos

data class GetUserDtoId(
    val id: Long,
    val username: String,
    val todoItems: List<Long>
)
