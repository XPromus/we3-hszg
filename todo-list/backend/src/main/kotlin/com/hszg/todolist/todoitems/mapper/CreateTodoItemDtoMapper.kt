package com.hszg.todolist.todoitems.mapper

import com.hszg.todolist.todoitems.TodoItem
import com.hszg.todolist.todoitems.dtos.CreateTodoItemDto
import com.hszg.todolist.users.User

fun fromCreateTodoItemDto(
    createTodoItemDto: CreateTodoItemDto,
    targetUser: User
): TodoItem {
    return TodoItem(
        name = createTodoItemDto.name,
        description = createTodoItemDto.description,
        done = createTodoItemDto.done,
        created = createTodoItemDto.created,
        shouldBeDoneBy = createTodoItemDto.shouldBeDoneBy,
        user = targetUser
    )
}