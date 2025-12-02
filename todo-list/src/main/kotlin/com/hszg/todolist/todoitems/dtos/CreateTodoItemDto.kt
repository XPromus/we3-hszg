package com.hszg.todolist.todoitems.dtos

import java.util.Date

data class CreateTodoItemDto(
    val name: String,
    val description: String,
    val done: Boolean,
    val created: Date,
    val shouldBeDoneBy: Date,
    val userId: Long
)
