package com.hszg.backend.example

import com.hszg.backend.example.dtos.GetExampleDto
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/examples")
class ExampleController(
    private val exampleService: ExampleService
){
    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    fun getExamples(
        @RequestParam(name = "id", required = false) id: Long?,
        @RequestParam(name = "field", required = false) field: String?
    ): List<GetExampleDto> {
        return exampleService.getExamples(id, field)
    }
}