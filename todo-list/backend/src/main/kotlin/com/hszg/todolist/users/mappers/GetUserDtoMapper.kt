package com.hszg.todolist.users.mappers

import com.hszg.todolist.users.User
import com.hszg.todolist.users.dtos.GetUserDto

fun toGetUserDto(
    user: User
): GetUserDto {
    return GetUserDto(
        id = user.id!!,
        username = user.username,
        todoItems = user.todoItems
    )
}
