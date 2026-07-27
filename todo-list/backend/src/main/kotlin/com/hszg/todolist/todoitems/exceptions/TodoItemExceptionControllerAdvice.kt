package com.hszg.todolist.todoitems.exceptions

import com.hszg.todolist.errors.ErrorMessageModel
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler

@ControllerAdvice
class TodoItemExceptionControllerAdvice {

    @ExceptionHandler
    fun handleTodoItemNotFoundException(
        exception: TodoItemNotFoundException
    ): ResponseEntity<ErrorMessageModel> {
        val errorMessage = ErrorMessageModel(
            HttpStatus.NOT_FOUND.value(),
            exception.message
        )

        return ResponseEntity(errorMessage, HttpStatus.NOT_FOUND)
    }

}
