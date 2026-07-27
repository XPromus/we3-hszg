package com.hszg.todolist.todoitems.validators

import jakarta.validation.Constraint
import jakarta.validation.Payload
import kotlin.reflect.KClass

@Target(AnnotationTarget.CLASS)
@Retention(AnnotationRetention.RUNTIME)
@Constraint(validatedBy = [TodoItemFilterDateRangeValidator::class])
annotation class ValidTodoItemFilterRange(
    val message: String = "Invalid date range",
    val groups: Array<KClass<*>> = [],
    val payload: Array<KClass<out Payload>> = []
)
