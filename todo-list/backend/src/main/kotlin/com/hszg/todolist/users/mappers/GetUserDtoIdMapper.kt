package com.hszg.todolist.users.mappers

import com.hszg.todolist.users.User
import com.hszg.todolist.users.dtos.GetUserDtoId

fun toGetUserDtoId(
    user: User
): GetUserDtoId {
    return GetUserDtoId(
        id = user.id!!,
        username = user.username,
        todoItems = user.todoItems.map {
            it.id!!
        }
    )
}
