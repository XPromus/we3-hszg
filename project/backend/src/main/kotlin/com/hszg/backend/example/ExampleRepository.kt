package com.hszg.backend.example

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@Repository
interface ExampleRepository: JpaRepository<ExampleEntity, Long> {

    @Query(
        "SELECT e FROM example e WHERE " +
                "(cast(:id as long) IS NULL OR e.id = :id) AND " +
                "(cast(:field as string) IS NULL OR e.field = :field)"
    )
    fun findExamplesByFields(
        id: Long?,
        field: String?
    ): List<ExampleEntity>

}