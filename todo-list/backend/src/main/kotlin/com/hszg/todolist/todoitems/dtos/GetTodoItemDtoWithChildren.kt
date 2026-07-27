package com.hszg.todolist.todoitems.dtos

import com.hszg.todolist.users.dtos.UserDescriptor
import java.time.LocalDateTime

data class GetTodoItemDtoWithChildren(
    val id: Long,
    val name: String,
    val description: String,
    val done: Boolean,
    val created: LocalDateTime,
    val shouldBeDoneBy: LocalDateTime,
    val user: UserDescriptor
)
