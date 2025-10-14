package com.hszg.todolist.todoitem

import com.hszg.todolist.todoitem.dtos.CreateTodoItemDto
import com.hszg.todolist.todoitem.dtos.GetTodoItemDto
import com.hszg.todolist.todoitem.dtos.UpdateTodoItemDto
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestController
import java.util.Date

@RestController
@RequestMapping("/todos")
class TodoItemController (
    val todoItemService: TodoItemService
) {

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    fun getTodoItems(
        @RequestParam(name = "id", required = false) id: Long?,
        @RequestParam(name = "name", required = false) name: String?,
        @RequestParam(name = "description", required = false) description: String?,
        @RequestParam(name = "done", required = false) done: Boolean?,
        @RequestParam(name = "created", required = false) created: Date?,
        @RequestParam(name = "shouldBeDoneBy", required = false) shouldBeDoneBy: Date?
    ): List<GetTodoItemDto> {
        return todoItemService.getTodoItems(
            id, name, description, done, created, shouldBeDoneBy
        )
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createTotoItem(
        @RequestBody createTodoItemDto: CreateTodoItemDto
    ): GetTodoItemDto {
        return todoItemService.createTodoItem(createTodoItemDto)
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    fun updateTodoItem(
        @PathVariable id: Long,
        @RequestBody updateTodoItemDto: UpdateTodoItemDto
    ): GetTodoItemDto {
        return todoItemService.updateTodoItem(id, updateTodoItemDto)
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteTodoItem(
        @PathVariable id: Long,
    ) {
        todoItemService.deleteTodoItem(id)
    }
}