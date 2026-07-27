package com.hszg.todolist.users.mappers

import com.hszg.todolist.todoitems.mapper.toTodoItemDescriptorDtoList
import com.hszg.todolist.users.User
import com.hszg.todolist.users.dtos.GetUserDto
import com.hszg.todolist.users.dtos.GetUserDtoWithChildren
import com.hszg.todolist.users.dtos.PostUserDto
import com.hszg.todolist.users.dtos.PutUserDto
import com.hszg.todolist.users.dtos.UserDescriptor
import org.springframework.data.domain.Page

fun User.toUserDescriptor(): UserDescriptor {
    return UserDescriptor(
        id = id!!,
        username = username
    )
}

fun User.toGetUserDto(): GetUserDto {
    return GetUserDto(
        id = id!!,
        username = username,
        todoItemIds = todoItems.map { it.id!! }
    )
}

fun List<User>.toGetUserDtoList(): List<GetUserDto> {
    return map {
        it.toGetUserDto()
    }
}

fun User.toGetUserDtoWithChildren(): GetUserDtoWithChildren {
    return GetUserDtoWithChildren(
        id = id!!,
        username = username,
        todoItems = todoItems.toTodoItemDescriptorDtoList()
    )
}

fun List<User>.toGetUserDtoWithChildrenList(): List<GetUserDtoWithChildren> {
    return map {
        it.toGetUserDtoWithChildren()
    }
}

fun Page<User>.toGetUserDtoWithChildrenPage(): Page<GetUserDtoWithChildren> {
    return map {
        it.toGetUserDtoWithChildren()
    }
}

fun PostUserDto.toNewUser(): User {
    return User(
        username = username
    )
}

fun PutUserDto.toUpdatedUser(existingUser: User): User {
    return User(
        id = existingUser.id,
        username = username,
        todoItems = existingUser.todoItems,
    )
}

fun PutUserDto.toNewUser(): User {
    return User(
        username = username
    )
}
