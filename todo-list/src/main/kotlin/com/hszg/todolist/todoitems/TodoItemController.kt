package com.hszg.todolist.todoitems

import com.hszg.todolist.todoitems.dtos.CreateTodoItemDto
import com.hszg.todolist.todoitems.dtos.GetTodoItemDto
import com.hszg.todolist.todoitems.dtos.UpdateTodoItemDto
import com.hszg.todolist.todoitems.exceptions.TodoItemNotFoundException
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
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
import org.springframework.web.server.ResponseStatusException
import java.util.Date

@Tag(
    name = "todo_item_controller",
    description = "Controller for CRUD operations on the todo items"
)
@RestController
@RequestMapping("/todos")
class TodoItemController (
    val todoItemService: TodoItemService
) {

    @Tag(
        name = "getTodoItems",
        description = "Get a List of todo items according to provided parameters."
    )
    @Tag(
        name = "GET Methods"
    )
    @Operation(
        summary = "Get a List of todo items according to provided parameters."
    )
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

    @Tag(
        name = "createTodoItem",
        description = "Create a new todo item according to the CreateTodoItemDto."
    )
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createTotoItem(
        @RequestBody createTodoItemDto: CreateTodoItemDto
    ): GetTodoItemDto {
        return todoItemService.createTodoItem(createTodoItemDto)
    }

    @Tag(
        name = "updateTodoItem",
        description = "Update an existing todo item according to the UpdateTodoItemDto. " +
                "The todo item is chosen by a provided id in the url. " +
                "If the todo item doesn't exist, this operation will fail."
    )
    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    fun updateTodoItem(
        @PathVariable id: Long,
        @RequestBody updateTodoItemDto: UpdateTodoItemDto
    ): GetTodoItemDto {
        try {
            return todoItemService.updateTodoItem(id, updateTodoItemDto)
        } catch (ex: TodoItemNotFoundException) {
            throw ResponseStatusException(
                HttpStatus.NOT_FOUND, ex.message
            )
        }

    }

    @Tag(
        name = "deleteTodoItem",
        description = "An existing todo item will be deleted. " +
                "The todo item to be deleted is chosen by the provided id. " +
                "If the todo item doesn't exist, this operation will fail."
    )
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteTodoItem(
        @PathVariable id: Long,
    ) {
        todoItemService.deleteTodoItem(id)
    }
}