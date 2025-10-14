package com.hszg.todolist.todoitem

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository
import java.util.Date

@Repository
interface TodoItemRepository : JpaRepository<TodoItemEntity, Long> {

    @Query(
        "SELECT t FROM todoitem t WHERE " +
                "(cast(:id as uuid) IS NULL OR t.id = :id) AND" +
                "(cast(:name as string) IS NULL OR t.name = :name) AND" +
                "(cast(:description as string) IS NULL OR t.description = :description) AND" +
                "(cast(:done as boolean) IS NULL OR t.done = :done) AND " +
                "(cast(:created as timestamp) IS NULL OR t.created = :created) AND " +
                "(cast(:shouldBeDoneBy as timestamp) IS NULL OR t.shouldBeDoneBy = :shouldBeDoneBy)"
    )
    fun findTodoItemEntityByField(
        id: Long?,
        name: String?,
        description: String?,
        done: Boolean?,
        created: Date?,
        shouldBeDoneBy: Date?
    ): MutableList<TodoItemEntity>

}