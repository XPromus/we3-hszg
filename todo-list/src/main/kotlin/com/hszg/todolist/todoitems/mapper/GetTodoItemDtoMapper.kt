package com.hszg.todolist.todoitems.mapper

import com.hszg.todolist.todoitems.TodoItem
import com.hszg.todolist.todoitems.dtos.GetTodoItemDto

fun toGetTodoItemDto(todoItem: TodoItem): GetTodoItemDto {
    return GetTodoItemDto(
        id = todoItem.id!!,
        name = todoItem.name,
        description = todoItem.description,
        done = todoItem.done,
        created = todoItem.created,
        shouldBeDoneBy = todoItem.shouldBeDoneBy,
        userId = todoItem.user.id!!
    )
}