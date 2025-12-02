package com.hszg.todolist.todoitems

import com.hszg.todolist.todoitems.dtos.CreateTodoItemDto
import com.hszg.todolist.todoitems.dtos.GetTodoItemDto
import com.hszg.todolist.todoitems.dtos.UpdateTodoItemDto
import com.hszg.todolist.todoitems.exceptions.TodoItemNotFoundException
import com.hszg.todolist.todoitems.mapper.fromCreateTodoItemDto
import com.hszg.todolist.todoitems.mapper.fromEditTodoItemDto
import com.hszg.todolist.todoitems.mapper.toGetTodoItemDto
import com.hszg.todolist.users.UserService
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.util.Date

@Service
class TodoItemService (
    val todoItemRepository: TodoItemRepository,
    val userService: UserService
) {
    fun getTodoItemById(
        id: Long
    ): TodoItem {
        return todoItemRepository.findById(id).orElseThrow {
            TodoItemNotFoundException(
                "Todo item with id $id could not be found."
            )
        }
    }

    fun getTodoItems(
        id: Long?,
        name: String?,
        description: String?,
        done: Boolean?,
        created: Date?,
        shouldBeDoneBy: Date?
    ): List<GetTodoItemDto> {
        val todoItemsToReturn = todoItemRepository.findTodoItemEntityByField(
            id, name, description, done, created, shouldBeDoneBy
        )
        return todoItemsToReturn.map {
            toGetTodoItemDto(it)
        }
    }

    @Transactional
    fun createTodoItem(
        createTodoItemDto: CreateTodoItemDto
    ): GetTodoItemDto {
        val targetUser = userService.getUserById(createTodoItemDto.userId)
        val newTodoItem = fromCreateTodoItemDto(createTodoItemDto, targetUser)
        val savedTodoItem = todoItemRepository.save(newTodoItem)
        return toGetTodoItemDto(savedTodoItem)
    }

    @Transactional
    fun updateTodoItem(
        id: Long,
        updateTodoItemDto: UpdateTodoItemDto
    ): GetTodoItemDto {
        return todoItemRepository.findById(id).map {
            val targetUser = userService.getUserById(id)
            val save = todoItemRepository.save(
                fromEditTodoItemDto(
                    it,
                    updateTodoItemDto,
                    targetUser
                )
            )
            toGetTodoItemDto(save)
        }.orElseThrow{
            TodoItemNotFoundException(
                "Todo item with id $id could not be found."
            )
        }
    }

    @Transactional
    fun deleteTodoItem(id: Long) {
        val toDeleteTodoItem = getTodoItemById(id)
        todoItemRepository.delete(toDeleteTodoItem)
    }
}