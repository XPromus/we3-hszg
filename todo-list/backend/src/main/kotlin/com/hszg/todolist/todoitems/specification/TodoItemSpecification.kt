package com.hszg.todolist.todoitems.specification

import com.hszg.todolist.todoitems.TodoItem
import com.hszg.todolist.todoitems.dtos.TodoItemFilter
import org.springframework.data.jpa.domain.Specification
import jakarta.persistence.criteria.Predicate
import java.time.LocalDateTime

object TodoItemSpecification {

    fun withFilter(
        filter: TodoItemFilter
    ): Specification<TodoItem> {
        return Specification { root, _, builder ->
            val predicates = mutableListOf<Predicate>()

            filter.id?.let {
                predicates.add(
                    builder.equal(
                        root.get<Long>("id"),
                        it
                    )
                )
            }

            filter.name?.let {
                predicates.add(
                    builder.like(
                        builder.lower(
                            root.get<String>("name")
                        ),
                        "%${it.lowercase()}%"
                    )
                )
            }

            filter.description?.let {
                predicates.add(
                    builder.like(
                        builder.lower(
                            root.get<String>("description")
                        ),
                        "%${it.lowercase()}%"
                    )
                )
            }

            filter.done?.let {
                predicates.add(
                    builder.equal(
                        root.get<Boolean>("done"),
                        it
                    )
                )
            }

            filter.created?.let {
                predicates.add(
                    builder.equal(
                        root.get<LocalDateTime>("created"),
                        it
                    )
                )
            }

            filter.createdMinDate?.let {
                predicates.add(
                    builder.greaterThanOrEqualTo(
                        root.get<LocalDateTime>("created"),
                        it
                    )
                )
            }

            filter.createdMaxDate?.let {
                predicates.add(
                    builder.lessThanOrEqualTo(
                        root.get<LocalDateTime>("created"),
                        it
                    )
                )
            }

            filter.shouldBeDoneBy?.let {
                predicates.add(
                    builder.equal(
                        root.get<LocalDateTime>("shouldBeDoneBy"),
                        it
                    )
                )
            }

            filter.shouldBeDoneByMinDate?.let {
                predicates.add(
                    builder.greaterThanOrEqualTo(
                        root.get<LocalDateTime>("shouldBeDoneBy"),
                        it
                    )
                )
            }

            filter.shouldBeDoneByMaxDate?.let {
                predicates.add(
                    builder.lessThanOrEqualTo(
                        root.get<LocalDateTime>("shouldBeDoneBy"),
                        it
                    )
                )
            }

            builder.and(*predicates.toTypedArray())
        }
    }

}