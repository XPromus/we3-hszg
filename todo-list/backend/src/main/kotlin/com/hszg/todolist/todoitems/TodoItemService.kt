package com.hszg.todolist.todoitems

import com.hszg.todolist.todoitems.dtos.*
import com.hszg.todolist.todoitems.mapper.*
import com.hszg.todolist.todoitems.specification.TodoItemSpecification
import com.hszg.todolist.users.UserRepository
import com.hszg.todolist.users.exceptions.UserNotFoundException
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class TodoItemService (
    private val todoItemRepository: TodoItemRepository,
    private val userRepository: UserRepository
) {

    @Transactional(readOnly = true)
    fun findTodoItems(
        filter: TodoItemFilter,
        pageable: Pageable
    ): Page<GetTodoItemDto> {
        val spec = TodoItemSpecification.withFilter(filter)
        return todoItemRepository
            .findAll(spec, pageable)
            .toGetTodoItemDtoPage()
    }

    @Transactional(readOnly = true)
    fun findTodoItemsWithChildren(
        filter: TodoItemFilter,
        pageable: Pageable
    ): Page<GetTodoItemDtoWithChildren> {
        val spec = TodoItemSpecification.withFilter(filter)
        return todoItemRepository.findAll(
            spec, pageable
        ).toGetTodoItemDtoWithChildrenPage()
    }

    @Transactional
    fun putTodoItem(
        id: Long,
        putTodoItemDto: PutTodoItemDto
    ): Pair<GetTodoItemDto, Boolean> {
        val existingTodoItem = todoItemRepository.findByIdOrNull(id)
        val targetUser = userRepository.findById(putTodoItemDto.userId).orElseThrow {
            UserNotFoundException("User could not be found")
        }
        val todoItemToSave: TodoItem = existingTodoItem?.let {
            putTodoItemDto.toUpdatedTodoItem(
                existingTodoItem = it,
                targetUser = targetUser
            )
        } ?: run {
            putTodoItemDto.toNewTodoItem(
                targetUser = targetUser
            )
        }

        val savedTodoItem = todoItemRepository.save(todoItemToSave)
        return savedTodoItem.toGetTodoItemDto() to (existingTodoItem == null)
    }

    @Transactional
    fun createTodoItem(
        postTodoItemDto: PostTodoItemDto
    ): GetTodoItemDto {
        val targetUser = userRepository.findById(postTodoItemDto.userId).orElseThrow {
            UserNotFoundException("User could not be found")
        }
        val newTodoItem = postTodoItemDto.toNewTodoItem(
            targetUser = targetUser
        )

        return todoItemRepository.save(newTodoItem).toGetTodoItemDto()
    }

    @Transactional
    fun deleteTodoItem(
        id: Long
    ) {
        todoItemRepository.deleteById(id)
    }

}