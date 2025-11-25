package com.hszg.todolist.users

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager
import org.springframework.data.repository.findByIdOrNull
import org.springframework.test.context.junit.jupiter.SpringExtension

@ExtendWith(SpringExtension::class)
@DataJpaTest
class UserRepositoryTest {

    @Autowired
    lateinit var entityManager: TestEntityManager
    @Autowired
    lateinit var userRepository: UserRepository

    @Test
    fun whenFindById_thenReturnUser() {
        val newUser = User(
            username = "New User"
        )
        entityManager.persist(newUser)
        entityManager.flush()
        val newUserFound = userRepository.findByIdOrNull(newUser.id!!)
        assertThat(newUserFound == newUser)
    }

}