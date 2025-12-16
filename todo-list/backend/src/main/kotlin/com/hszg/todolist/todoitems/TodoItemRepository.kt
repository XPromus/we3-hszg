package com.hszg.todolist.todoitems

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository
import java.util.Date

@Repository
interface TodoItemRepository : JpaRepository<TodoItem, Long> {

    @Query(
        "SELECT t FROM todoitem t WHERE " +
                "(cast(:id as long) IS NULL OR t.id = :id) AND" +
                "(cast(:name as string) IS NULL OR t.name = :name) AND" +
                "(cast(:description as string) IS NULL OR t.description = :description) AND" +
                "(cast(:done as boolean) IS NULL OR t.done = :done) AND " +
                "(cast(:created as long) IS NULL OR t.created = :created) AND " +
                "(cast(:shouldBeDoneBy as long) IS NULL OR t.shouldBeDoneBy = :shouldBeDoneBy)"
    )
    fun findTodoItemEntityByField(
        id: Long?,
        name: String?,
        description: String?,
        done: Boolean?,
        created: Long?,
        shouldBeDoneBy: Long?
    ): MutableList<TodoItem>
}