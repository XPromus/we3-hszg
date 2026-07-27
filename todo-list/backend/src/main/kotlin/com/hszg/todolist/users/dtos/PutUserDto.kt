package com.hszg.todolist.users.dtos

import jakarta.validation.constraints.NotBlank
import jakarta.validation.constraints.Size

data class PutUserDto(
    @field:NotBlank(message = "Username must not be blank")
    @field:Size(min = 1, max = 50, message = "Username must be between 1 and 50 characters")
    val username: String,
)
