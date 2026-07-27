package com.hszg.todolist.users.specification

import com.hszg.todolist.users.User
import com.hszg.todolist.users.dtos.UserFilter
import jakarta.persistence.criteria.Predicate
import org.springframework.data.jpa.domain.Specification

object UserSpecification {

    fun withFilter(
        filter: UserFilter
    ): Specification<User> {
        return Specification { root, _, cb ->
            val predicates = mutableListOf<Predicate>()

            filter.id?.let {
                predicates.add(
                    cb.equal(
                        root.get<Long>("id"),
                        it
                    )
                )
            }

            filter.username?.let {
                predicates.add(
                    cb.like(
                        cb.lower(
                            root.get<String>("username"))
                        ,
                        "%${it.lowercase()}%"
                    )
                )
            }

            cb.and(*predicates.toTypedArray())
        }
    }

}
