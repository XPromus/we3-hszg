package com.hszg.todolist.todoitems.mapper

import com.hszg.todolist.todoitems.TodoItem
import com.hszg.todolist.todoitems.dtos.*
import com.hszg.todolist.users.User
import com.hszg.todolist.users.mappers.toUserDescriptor
import org.springframework.data.domain.Page
import java.time.LocalDateTime

fun TodoItem.toGetTodoItemDto(): GetTodoItemDto {
    return GetTodoItemDto(
        id = id!!,
        name = name,
        description = description,
        done = done,
        created = created,
        shouldBeDoneBy = shouldBeDoneBy,
        userId = user.id!!
    )
}

fun List<TodoItem>.toGetTodoItemDtoList(): List<GetTodoItemDto> {
    return map {
        it.toGetTodoItemDto()
    }
}

fun Page<TodoItem>.toGetTodoItemDtoPage(): Page<GetTodoItemDto> {
    return map {
        it.toGetTodoItemDto()
    }
}

fun TodoItem.toGetTodoItemWithChildren(): GetTodoItemDtoWithChildren {
    return GetTodoItemDtoWithChildren(
        id = id!!,
        name = name,
        description = description,
        done = done,
        created = created,
        shouldBeDoneBy = shouldBeDoneBy,
        user = user.toUserDescriptor()
    )
}

fun List<TodoItem>.toGetTodoItemWithChildrenList(): List<GetTodoItemDtoWithChildren> {
    return map {
        it.toGetTodoItemWithChildren()
    }
}

fun Page<TodoItem>.toGetTodoItemDtoWithChildrenPage(): Page<GetTodoItemDtoWithChildren> {
    return map {
        it.toGetTodoItemWithChildren()
    }
}

fun TodoItem.toTodoItemDescriptorDto(): TodoItemDescriptorDto {
    return TodoItemDescriptorDto(
        id = id!!,
        name = name,
        description = description,
        done = done,
        created = created,
        shouldBeDoneBy = shouldBeDoneBy
    )
}

fun List<TodoItem>.toTodoItemDescriptorDtoList(): List<TodoItemDescriptorDto> {
    return map {
        it.toTodoItemDescriptorDto()
    }
}

fun PutTodoItemDto.toUpdatedTodoItem(
    existingTodoItem: TodoItem,
    targetUser: User
): TodoItem {
    return TodoItem(
        id = existingTodoItem.id,
        name = name,
        description = description,
        done = done,
        created = existingTodoItem.created,
        shouldBeDoneBy = shouldBeDoneBy,
        user = targetUser
    )
}

fun PutTodoItemDto.toNewTodoItem(
    targetUser: User
): TodoItem {
    return TodoItem(
        name = name,
        description = description,
        done = done,
        created = created,
        shouldBeDoneBy = shouldBeDoneBy,
        user = targetUser
    )
}

fun PostTodoItemDto.toNewTodoItem(
    targetUser: User
): TodoItem {
    return TodoItem(
        name = name,
        description = description,
        done = done,
        created = created,
        shouldBeDoneBy = shouldBeDoneBy,
        user = targetUser
    )
}
