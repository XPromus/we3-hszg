package com.hszg.backend.example

import com.hszg.backend.example.dtos.GetExampleDto
import com.hszg.backend.example.dtos.PostExampleDto
import com.hszg.backend.example.dtos.PutExampleDto
import com.hszg.backend.example.mapper.fromPostExampleDto
import com.hszg.backend.example.mapper.fromPutExampleDto
import com.hszg.backend.example.mapper.toGetExampleDto
import org.springframework.stereotype.Service
import jakarta.transaction.Transactional

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

    fun createExample(
        postExampleDto: PostExampleDto
    ): GetExampleDto {
        val exampleToSave = fromPostExampleDto(postExampleDto)
        val savedExample = exampleRepository.save(exampleToSave)
        return toGetExampleDto(savedExample)
    }

    fun updateExample(
        id: Long, putExampleDto: PutExampleDto
    ): GetExampleDto {
        return exampleRepository.findById(id).map {
            val save = exampleRepository.save(
                fromPutExampleDto(it, putExampleDto)
            )
            toGetExampleDto(save)
        }.orElseGet(null)
    }

    @Transactional
    fun deleteExample(id: Long) {
        exampleRepository.deleteById(id)
    }
}