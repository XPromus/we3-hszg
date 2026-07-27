package com.hszg.todolist.users

import com.hszg.todolist.users.dtos.GetUserDto
import com.hszg.todolist.users.dtos.GetUserDtoWithChildren
import com.hszg.todolist.users.dtos.PostUserDto
import com.hszg.todolist.users.dtos.PutUserDto
import com.hszg.todolist.users.dtos.UserFilter
import com.hszg.todolist.users.sort.UserSortField
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
    name = "user_controller",
    description = "Controller for CRUD operations on the user"
)
@RestController
@RequestMapping("/api/v1/users")
class UserController(
    private val userService: UserService
) {

    @Operation(
        summary = "Get a list of User DTOs according to provided id and username. The todo items are provided by their id."
    )
    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    fun getUsers(
        @Valid @ModelAttribute filter: UserFilter,
        @RequestParam(defaultValue = "0") page: Int,
        @RequestParam(defaultValue = "20") size: Int,
        @RequestParam(name = "sortBy", defaultValue = "USERNAME") sortBy: UserSortField,
        @RequestParam(name = "sortDir", defaultValue = "ASCENDING") sortDirection: SortDirection
    ): ResponseEntity<Page<GetUserDto>> {

        val sort = Sort.by(sortDirection.toSpringSortDir(), sortBy.propertyName)
        val boundedSize = size.coerceIn(0, 100)
        val pageable = PageRequest.of(page, boundedSize, sort)

        val users = userService.findUsers(
            filter,
            pageable
        )
        return ResponseEntity.ok(users)
    }

    @Operation(
        summary = "Get a list of GetUserDtos with the children being provided as descriptor DTOs."
    )
    @GetMapping("/full")
    @ResponseStatus(HttpStatus.OK)
    fun getUsersWithChildren(
        @Valid @ModelAttribute filter: UserFilter,
        @RequestParam(defaultValue = "0") page: Int,
        @RequestParam(defaultValue = "20") size: Int,
        @RequestParam(name = "sortBy", defaultValue = "USERNAME") sortBy: UserSortField,
        @RequestParam(name = "sortDir", defaultValue = "ASCENDING") sortDirection: SortDirection
    ): ResponseEntity<Page<GetUserDtoWithChildren>> {
        val sort = Sort.by(sortDirection.toSpringSortDir(), sortBy.propertyName)
        val boundedSize = size.coerceIn(0, 100)
        val pageable = PageRequest.of(page, boundedSize, sort)

        val users = userService.findUsersWithChildren(filter, pageable)
        return ResponseEntity.ok(users)
    }

    @Operation(
        summary = "Update an existing user according to the PutUserDto. If the user doesn't exist, a new user gets created."
    )
    @PutMapping("/{id}")
    fun putUser(
        @PathVariable id: Long,
        @Valid @RequestBody putUserDto: PutUserDto
    ): ResponseEntity<GetUserDto> {
        val (body, wasCreated) = userService.putUser(id, putUserDto)
        val status = if (wasCreated) HttpStatus.CREATED else HttpStatus.OK
        return ResponseEntity(body, status)
    }

    @Operation(
        summary = "Create a new User according to a provided CreateUserDto. A username can only exist once."
    )
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createUser(
        @Valid @RequestBody postUserDto: PostUserDto
    ): ResponseEntity<GetUserDto> {
        val savedUser = userService.createUser(postUserDto)
        val location = URI.create("/users/${savedUser.id}")
        return ResponseEntity.created(location).body(savedUser)
    }

    @Operation(
        summary = "Deletes a user by an id. Returns 204 no matter if the user exists or not."
    )
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteUser(
        @PathVariable id: Long
    ) {
        userService.deleteUser(id)
    }
}