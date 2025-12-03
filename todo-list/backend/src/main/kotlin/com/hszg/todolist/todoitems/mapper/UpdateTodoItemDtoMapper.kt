package com.hszg.todolist.todoitems.mapper

import com.hszg.todolist.todoitems.TodoItem
import com.hszg.todolist.todoitems.dtos.UpdateTodoItemDto
import com.hszg.todolist.users.User

fun fromEditTodoItemDto(
    todoItem: TodoItem,
    updateTodoItemDto: UpdateTodoItemDto,
    newTargetUser: User?
): TodoItem {
    return TodoItem(
        id = todoItem.id,
        name = updateTodoItemDto.name ?: todoItem.name,
        description = updateTodoItemDto.description ?: todoItem.description,
        done = updateTodoItemDto.done ?: todoItem.done,
        created = updateTodoItemDto.created ?: todoItem.created,
        shouldBeDoneBy = updateTodoItemDto.shouldBeDoneBy ?: todoItem.shouldBeDoneBy,
        user = newTargetUser ?: todoItem.user
    )
}