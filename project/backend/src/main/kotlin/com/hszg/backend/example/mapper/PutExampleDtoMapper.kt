package com.hszg.backend.example.mapper

import com.hszg.backend.example.ExampleEntity
import com.hszg.backend.example.dtos.PutExampleDto

fun fromPutExampleDto(
    exampleEntity: ExampleEntity,
    putExampleDto: PutExampleDto
): ExampleEntity {
    return ExampleEntity(
        id = exampleEntity.id,
        field = putExampleDto.field ?: exampleEntity.field
    )
}