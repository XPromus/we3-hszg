package com.hszg.todolist.users

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@Repository
interface UserRepository : JpaRepository<User, Long> {
    @Query(
        "SELECT u FROM todouser u WHERE " +
                "(cast(:id as long) IS NULL OR u.id = :id) AND " +
                "(cast(:username as string) IS NULL OR u.username = :username)"
    )
    fun findUserByFields(
        id: Long?,
        username: String?
    ): MutableList<User>

    fun findUserByUsernameIs(username: String): MutableList<User>
}