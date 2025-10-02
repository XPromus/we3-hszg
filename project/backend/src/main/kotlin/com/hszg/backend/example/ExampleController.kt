package com.hszg.backend.example

import com.hszg.backend.example.dtos.GetExampleDto
import com.hszg.backend.example.dtos.PostExampleDto
import com.hszg.backend.example.dtos.PutExampleDto
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

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun postExample(
        @RequestBody postExampleDto: PostExampleDto
    ): GetExampleDto {
        return exampleService.createExample(postExampleDto)
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    fun putExample(
        @PathVariable id: Long,
        @RequestBody putExampleDto: PutExampleDto
    ): GetExampleDto {
        return exampleService.updateExample(id, putExampleDto)
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteExample(
        @PathVariable id: Long
    ) {
        exampleService.deleteExample(id)
    }
}