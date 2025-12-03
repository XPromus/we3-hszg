package com.hszg.todolist.users.mappers

import com.hszg.todolist.users.User
import com.hszg.todolist.users.dtos.UpdateUserDto

fun fromUpdateUserDto(
    user: User,
    updateUserDto: UpdateUserDto
): User {
    return User(
        id = user.id,
        username = updateUserDto.username ?: user.username,
        todoItems = user.todoItems
    )
}
