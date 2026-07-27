package com.hszg.todolist.todoitems

import com.hszg.todolist.todoitems.dtos.*
import com.hszg.todolist.todoitems.sort.TodoItemSortField
import com.hszg.todolist.util.SortDirection
import com.hszg.todolist.util.toSpringSortDir
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import jakarta.validation.Valid
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import java.net.URI

@Tag(
    name = "todo_item_controller",
    description = "Controller for CRUD operations on the todo items"
)
@RestController
@RequestMapping("/api/v1/todos")
class TodoItemController (
    private val todoItemService: TodoItemService
) {

    @Operation(
        summary = "Get a List of todo items according to provided parameters."
    )
    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    fun getTodoItems(
        @Valid @ModelAttribute filter: TodoItemFilter,
        @RequestParam(defaultValue = "0") page: Int,
        @RequestParam(defaultValue = "20") size: Int,
        @RequestParam(name = "sortBy", defaultValue = "NAME") sortBy: TodoItemSortField,
        @RequestParam(name = "sortDir", defaultValue = "ASCENDING") sortDirection: SortDirection,
    ): ResponseEntity<Page<GetTodoItemDto>> {
        val sort = Sort.by(sortDirection.toSpringSortDir(), sortBy.propertyName)
        val boundedSize = size.coerceIn(0, 100)
        val pageable = PageRequest.of(page, boundedSize, sort)

        val todoItems: Page<GetTodoItemDto> = todoItemService.findTodoItems(
            filter = filter,
            pageable = pageable
        )
        return ResponseEntity.ok(todoItems)
    }

    @Operation(
        summary = "Get a List of todo items with children as descriptors according to provided parameters."
    )
    @GetMapping("/full")
    @ResponseStatus(HttpStatus.OK)
    fun getTodoItemsWithChildren(
        @Valid @ModelAttribute filter: TodoItemFilter,
        @RequestParam(defaultValue = "0") page: Int,
        @RequestParam(defaultValue = "20") size: Int,
        @RequestParam(name = "sortBy", defaultValue = "NAME") sortBy: TodoItemSortField,
        @RequestParam(name = "sortDir", defaultValue = "ASCENDING") sortDirection: SortDirection,
    ): ResponseEntity<Page<GetTodoItemDtoWithChildren>> {
        val sort = Sort.by(sortDirection.toSpringSortDir(), sortBy.propertyName)
        val boundedSize = size.coerceIn(0, 100)
        val pageable = PageRequest.of(page, boundedSize, sort)

        val todoItems: Page<GetTodoItemDtoWithChildren> = todoItemService.findTodoItemsWithChildren(
            filter = filter,
            pageable = pageable
        )
        return ResponseEntity.ok(todoItems)
    }

    @Operation(
        summary = "Update an existing todo item according to the PutTodoItemDto. If the todo item doesn't exist, a new item gets created."
    )
    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    fun putTodoItem(
        @PathVariable id: Long,
        @Valid @RequestBody putTodoItemDto: PutTodoItemDto
    ): ResponseEntity<GetTodoItemDto> {
        val (body, wasCreated) = todoItemService.putTodoItem(id, putTodoItemDto)
        val status = if (wasCreated) HttpStatus.CREATED else HttpStatus.OK
        return ResponseEntity(body, status)
    }

    @Operation(
        summary = "Create a new todo item according to the CreateTodoItemDto."
    )
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createTodoItem(
        @Valid @RequestBody postTodoItemDto: PostTodoItemDto
    ): ResponseEntity<GetTodoItemDto> {
        val savedTodoItem = todoItemService.createTodoItem(postTodoItemDto)
        val location = URI.create("/todos/${savedTodoItem.id}")
        return ResponseEntity.created(location).body(savedTodoItem)
    }

    @Operation(
        summary = "Deletes a todo item by an id. Returns 204 no matter if the todo item exists or not."
    )
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteTodoItem(
        @PathVariable id: Long,
    ) {
        todoItemService.deleteTodoItem(id)
    }
}