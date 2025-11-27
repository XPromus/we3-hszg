package com.hszg.todolist.users

import com.hszg.todolist.users.dtos.CreateUserDto
import com.hszg.todolist.users.dtos.GetUserDto
import com.hszg.todolist.users.dtos.UpdateUserDto
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

@Tag(
    name = "user_controller",
    description = "Controller for CRUD operations on the user"
)
@RestController
@RequestMapping("/users")
class UserController(
    private val userService: UserService
) {

    @Tag(
        name = "getUsers",
        description = "Get a List of users according to provided id and username."
    )
    @Tag(
        name = "GET Methods"
    )
    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    fun getUsers(
        @RequestParam id: Long?,
        @RequestParam username: String?
    ): List<GetUserDto> {
        return userService.getUsers(id, username)
    }

    @Tag(
        name = "createUser",
        description = "Create a new user according to the CreateUserDto."
    )
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createUser(
        @RequestBody createUserDto: CreateUserDto
    ): GetUserDto {
        return userService.createUser(createUserDto)
    }

    @Tag(
        name = "updateUser",
        description = "Update an existing user according to the UpdateUserDto. " +
                "The user is chosen by a provided id in the url. " +
                "If the user doesn't exist, this operation will fail."
    )
    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    fun updateUser(
        @PathVariable id: Long,
        @RequestBody updateUserDto: UpdateUserDto
    ): GetUserDto {
        return userService.updateUser(id, updateUserDto)
    }

    @Tag(
        name = "deleteUser",
        description = "An existing user will be deleted. " +
                "The user to be deleted is chosen by the provided id. " +
                "If the user doesn't exist, this operation will fail."
    )
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteUser(
        @PathVariable id: Long
    ) {
        userService.deleteUser(id)
    }
}