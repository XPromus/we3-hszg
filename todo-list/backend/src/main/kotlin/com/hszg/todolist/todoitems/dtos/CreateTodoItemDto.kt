package com.hszg.todolist.todoitems.dtos

import java.util.Date

data class CreateTodoItemDto(
    val name: String,
    val description: String,
    val done: Boolean,
    val created: Long,
    val shouldBeDoneBy: Long,
    val userId: Long
)
