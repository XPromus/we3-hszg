package com.hszg.todolist.todoitem.mapper

import com.hszg.todolist.todoitem.TodoItemEntity
import com.hszg.todolist.todoitem.dtos.CreateTodoItemDto

fun fromCreateTodoItemDto(
    createTodoItemDto: CreateTodoItemDto
): TodoItemEntity {
    return TodoItemEntity(
        name = createTodoItemDto.name,
        description = createTodoItemDto.description,
        done = createTodoItemDto.done,
        created = createTodoItemDto.created,
        shouldBeDoneBy = createTodoItemDto.shouldBeDoneBy
    )
}