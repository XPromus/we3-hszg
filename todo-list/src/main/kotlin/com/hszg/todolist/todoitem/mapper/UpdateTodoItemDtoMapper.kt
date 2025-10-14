package com.hszg.todolist.todoitem.mapper

import com.hszg.todolist.todoitem.TodoItemEntity
import com.hszg.todolist.todoitem.dtos.UpdateTodoItemDto

fun fromEditTodoItemDto(
    todoItemEntity: TodoItemEntity,
    updateTodoItemDto: UpdateTodoItemDto
): TodoItemEntity {
    return TodoItemEntity(
        id = todoItemEntity.id,
        name = updateTodoItemDto.name ?: todoItemEntity.name,
        description = updateTodoItemDto.description ?: todoItemEntity.description,
        done = updateTodoItemDto.done ?: todoItemEntity.done,
        created = updateTodoItemDto.created ?: todoItemEntity.created,
        shouldBeDoneBy = updateTodoItemDto.shouldBeDoneBy ?: todoItemEntity.shouldBeDoneBy
    )
}