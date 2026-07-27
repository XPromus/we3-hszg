package com.hszg.todolist.users.dtos

import jakarta.validation.constraints.Pattern
import jakarta.validation.constraints.Positive
import jakarta.validation.constraints.Size

data class UserFilter(
    @field:Positive(message = "ID must be a positive number")
    val id: Long? = null,
    @field:Size(max = 100, message = "Username filter must not exceed 100 characters")
    @field:Pattern(regexp = "^[a-zA-Z0-9äöüÄÖÜ]*$", message = "Username filter contains invalid characters")
    val username: String? = null
)
