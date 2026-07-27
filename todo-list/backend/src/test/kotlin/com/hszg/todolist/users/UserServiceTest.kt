package com.hszg.todolist.users

import com.hszg.todolist.users.dtos.PostUserDto
import io.mockk.every
import io.mockk.mockk
import kotlin.test.Test
import kotlin.test.assertEquals

class UserServiceTest {

    private val userRepository: UserRepository = mockk()
    private val userService = UserService(userRepository)

    @Test
    fun testCreateUser() {
        val postUserDto = PostUserDto(
            username = "New User"
        )

        every { userRepository.save(any()) } returns User(
            username = "New User"
        )

        val actual = userService.createUser(postUserDto)

        assertEquals(postUserDto.username, actual.username)
    }

}