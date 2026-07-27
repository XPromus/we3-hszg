package com.hszg.todolist.todoitems.dtos

import jakarta.validation.constraints.FutureOrPresent
import jakarta.validation.constraints.NotBlank
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.PastOrPresent
import jakarta.validation.constraints.Positive
import jakarta.validation.constraints.Size
import java.time.LocalDateTime

data class PutTodoItemDto(
    @field:NotBlank(message = "Name of todo item must not be blank")
    @field:Size(min = 1, max = 50, message = "Name must be between 1 and 50 characters")
    val name: String,
    @field:NotBlank(message = "Description of todo item must not be blank")
    @field:Size(min = 1, max = 200, message = "Description must be between 1 and 200 characters")
    val description: String,
    @field:NotNull(message = "Done of todo item must not be blank")
    val done: Boolean,
    @field:NotNull(message = "Created of todo item must not be blank")
    @field:PastOrPresent(message = "Created must be in the past or present")
    val created: LocalDateTime,
    @field:NotNull(message = "Should be done by of todo item must not be blank")
    @field:FutureOrPresent(message = "Should be done by should be in the future or present")
    val shouldBeDoneBy: LocalDateTime,
    @field:NotNull(message = "User id of todo item must not be blank")
    @field:Positive(message = "User id of todo item must be positive")
    val userId: Long,
)
