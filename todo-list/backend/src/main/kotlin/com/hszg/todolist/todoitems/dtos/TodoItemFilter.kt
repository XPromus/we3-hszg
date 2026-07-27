package com.hszg.todolist.todoitems.dtos

import com.hszg.todolist.todoitems.validators.ValidTodoItemFilterRange
import jakarta.validation.constraints.PastOrPresent
import jakarta.validation.constraints.Pattern
import jakarta.validation.constraints.Positive
import jakarta.validation.constraints.Size
import java.time.LocalDateTime

@ValidTodoItemFilterRange
data class TodoItemFilter(
    @field:Positive(message = "ID must be a positive number")
    val id: Long? = null,
    @field:Size(max = 100, message = "Todo item name must not exceed 100 characters")
    @field:Pattern(regexp = "^[a-zA-Z0-9äöüÄÖÜ]*$", message = "Name filter contains invalid characters")
    val name: String? = null,
    @field:Size(max = 200, message = "Todo item description must not exceed 200 characters")
    @field:Pattern(regexp = "^[a-zA-Z0-9äöüÄÖÜ]*$", message = "Description filter contains invalid characters")
    val description: String? = null,
    val done: Boolean? = null,
    @field:PastOrPresent(message = "The created date should be in the past or present")
    val created: LocalDateTime? = null,
    @field:PastOrPresent(message = "The created minimum date should be in the past or present")
    val createdMinDate: LocalDateTime? = null,
    @field:PastOrPresent(message = "The created maximum date should be in the past or present")
    val createdMaxDate: LocalDateTime? = null,
    val shouldBeDoneBy: LocalDateTime? = null,
    val shouldBeDoneByMinDate: LocalDateTime? = null,
    val shouldBeDoneByMaxDate: LocalDateTime? = null,
)
