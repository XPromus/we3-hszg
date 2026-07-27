package com.hszg.todolist.todoitems.validators

import com.hszg.todolist.todoitems.dtos.TodoItemFilter
import jakarta.validation.ConstraintValidator
import jakarta.validation.ConstraintValidatorContext

class TodoItemFilterDateRangeValidator : ConstraintValidator<ValidTodoItemFilterRange, TodoItemFilter> {
    override fun isValid(
        filter: TodoItemFilter,
        context: ConstraintValidatorContext?
    ): Boolean {
        if (
            filter.createdMinDate != null &&
            filter.createdMaxDate != null &&
            filter.createdMinDate.isAfter(filter.createdMaxDate)
        ) return false

        if (
            filter.shouldBeDoneByMinDate != null &&
            filter.shouldBeDoneByMaxDate != null &&
            filter.shouldBeDoneByMinDate.isAfter(filter.shouldBeDoneByMaxDate)
        ) return false

        return true
    }
}
