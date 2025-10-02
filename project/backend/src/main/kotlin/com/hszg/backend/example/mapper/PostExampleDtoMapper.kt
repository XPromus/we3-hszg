package com.hszg.backend.example.mapper

import com.hszg.backend.example.ExampleEntity
import com.hszg.backend.example.dtos.PostExampleDto

fun fromPostExampleDto(
    postExampleDto: PostExampleDto
): ExampleEntity {
    return ExampleEntity(
        field = postExampleDto.field
    )
}