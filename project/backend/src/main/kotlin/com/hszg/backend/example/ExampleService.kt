package com.hszg.backend.example

import com.hszg.backend.example.dtos.GetExampleDto
import com.hszg.backend.example.mapper.toGetExampleDto
import org.springframework.stereotype.Service

@Service
class ExampleService(
    private val exampleRepository: ExampleRepository
) {

    fun getExamples(
        id: Long?,
        field: String?
    ): List<GetExampleDto> {
        val examples = exampleRepository.findExamplesByFields(
            id, field
        )
        return examples.map { toGetExampleDto(it) }
    }

}