package com.hszg.todolist.errors

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import java.sql.SQLIntegrityConstraintViolationException

@ControllerAdvice
class ExceptionControllerAdvice {

    @ExceptionHandler(IllegalStateException::class)
    fun handleIllegalStateException(
        exception: IllegalStateException
    ): ResponseEntity<ErrorMessageModel> {
        val errorStatus = HttpStatus.BAD_REQUEST
        val errorMessage = ErrorMessageModel(
            errorStatus.value(),
            exception.message
        )

        return ResponseEntity(
            errorMessage,
            errorStatus
        )
    }

    @ExceptionHandler(DataIntegrityViolationException::class)
    fun handleDataIntegrityViolationException(
        exception: DataIntegrityViolationException
    ): ResponseEntity<ErrorMessageModel> {
        val message = when (
            val rootCause = exception.rootCause
        ) {
            is SQLIntegrityConstraintViolationException -> {
                rootCause.message ?: "A constraint was violated."
            } else -> {
                "A constraint was violated."
            }
        }

        val errorStatus = HttpStatus.CONFLICT
        val errorMessage = ErrorMessageModel(
            errorStatus.value(),
            message
        )

        return ResponseEntity(
            errorMessage,
            errorStatus
        )
    }

    @ExceptionHandler(MethodArgumentNotValidException::class)
    fun handleValidation(
        exception: MethodArgumentNotValidException
    ): ResponseEntity<ErrorMessageModel> {
        val errors = exception.bindingResult.fieldErrors.joinToString {
            "${it.field}: ${it.defaultMessage}"
        }

        val errorStatus = HttpStatus.BAD_REQUEST
        val errorMessage = ErrorMessageModel(
            errorStatus.value(),
            errors
        )

        return ResponseEntity(
            errorMessage,
            errorStatus
        )
    }

}