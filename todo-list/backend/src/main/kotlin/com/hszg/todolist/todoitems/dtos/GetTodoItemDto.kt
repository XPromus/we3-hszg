package com.hszg.todolist.todoitems.dtos

import java.util.Date

data class GetTodoItemDto(
    val id: Long,
    val name: String,
    val description: String,
    val done: Boolean,
    val created: Long,
    val shouldBeDoneBy: Long,
    val userId: Long
)
