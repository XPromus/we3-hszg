package com.hszg.todolist.users

import com.hszg.todolist.users.dtos.CreateUserDto
import io.mockk.every
import io.mockk.mockk
import kotlin.test.Test
import kotlin.test.assertEquals

class UserServiceTest {

    private val userRepository: UserRepository = mockk()
    private val userService = UserService(userRepository)

    @Test
    fun testCreateUser() {
        val newUserDto = CreateUserDto(
            username = "New User"
        )

        every { userRepository.save(any()) } returns User(
            username = "New User"
        )

        val actual = userService.createUser(newUserDto)

        assertEquals(newUserDto.username, actual.username)
    }

}