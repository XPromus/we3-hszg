package com.hszg.todolist.todoitems.dtos

import java.time.LocalDateTime

data class TodoItemDescriptorDto(
    val id: Long,
    val name: String,
    val description: String,
    val done: Boolean,
    val created: LocalDateTime,
    val shouldBeDoneBy: LocalDateTime,
)
