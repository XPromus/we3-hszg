package com.hszg.backend.example.mapper

import com.hszg.backend.example.ExampleEntity
import com.hszg.backend.example.dtos.GetExampleDto

fun toGetExampleDto(exampleEntity: ExampleEntity): GetExampleDto {
    return GetExampleDto(
        id = exampleEntity.id!!,
        field = exampleEntity.field
    )
}