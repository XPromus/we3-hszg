package com.hszg.todolist.todoitem.mapper

import com.hszg.todolist.todoitem.TodoItemEntity
import com.hszg.todolist.todoitem.dtos.GetTodoItemDto

fun toGetTodoItemDto(todoItemEntity: TodoItemEntity): GetTodoItemDto {
    return GetTodoItemDto(
        id = todoItemEntity.id!!,
        name = todoItemEntity.name,
        description = todoItemEntity.description,
        done = todoItemEntity.done,
        created = todoItemEntity.created,
        shouldBeDoneBy = todoItemEntity.shouldBeDoneBy
    )
}