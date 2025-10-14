package com.hszg.todolist.todoitem

import com.hszg.todolist.todoitem.dtos.CreateTodoItemDto
import com.hszg.todolist.todoitem.dtos.GetTodoItemDto
import com.hszg.todolist.todoitem.dtos.UpdateTodoItemDto
import com.hszg.todolist.todoitem.mapper.fromCreateTodoItemDto
import com.hszg.todolist.todoitem.mapper.fromEditTodoItemDto
import com.hszg.todolist.todoitem.mapper.toGetTodoItemDto
import jakarta.persistence.EntityNotFoundException
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.util.Date

@Service
class TodoItemService (
    val todoItemRepository: TodoItemRepository
) {
    fun getTodoItemById(
        id: Long
    ): TodoItemEntity {
        return todoItemRepository.findById(id).orElseThrow {
            EntityNotFoundException(
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

    fun createTodoItem(
        createTodoItemDto: CreateTodoItemDto
    ): GetTodoItemDto {
        val newTodoItem = fromCreateTodoItemDto(createTodoItemDto)
        val savedTodoItem = todoItemRepository.save(newTodoItem)
        return toGetTodoItemDto(savedTodoItem)
    }

    fun updateTodoItem(
        id: Long,
        updateTodoItemDto: UpdateTodoItemDto
    ): GetTodoItemDto {
        return todoItemRepository.findById(id).map {
            val save = todoItemRepository.save(
                fromEditTodoItemDto(
                    it,
                    updateTodoItemDto
                )
            )
            toGetTodoItemDto(save)
        }.orElseGet(null)
    }

    @Transactional
    fun deleteTodoItem(id: Long) {
        val toDeleteTodoItem = getTodoItemById(id)
        todoItemRepository.delete(toDeleteTodoItem)
    }
}