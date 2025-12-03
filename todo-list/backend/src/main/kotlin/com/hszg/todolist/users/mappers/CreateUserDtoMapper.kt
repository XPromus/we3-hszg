package com.hszg.todolist.users.mappers

import com.hszg.todolist.users.User
import com.hszg.todolist.users.dtos.CreateUserDto

fun fromCreateUserDto(
    createUserDto: CreateUserDto
): User {
    return User(
        username = createUserDto.username
    )
}