package com.hszg.todolist.users

import com.hszg.todolist.users.dtos.CreateUserDto
import com.hszg.todolist.users.dtos.GetUserDto
import com.hszg.todolist.users.dtos.GetUserDtoId
import com.hszg.todolist.users.dtos.UpdateUserDto
import com.hszg.todolist.users.exceptions.UserNotFoundException
import com.hszg.todolist.users.mappers.fromCreateUserDto
import com.hszg.todolist.users.mappers.fromUpdateUserDto
import com.hszg.todolist.users.mappers.toGetUserDto
import com.hszg.todolist.users.mappers.toGetUserDtoId
import jakarta.transaction.Transactional
import org.springframework.stereotype.Service

@Service
class UserService(
    private val userRepository: UserRepository
) {
    fun getUserById(id: Long): User {
        return userRepository.findById(id).orElseThrow {
            UserNotFoundException(
                "User with id $id could not be found."
            )
        }
    }

    fun getUserByUsername(username: String): List<User> {
        return userRepository.findUserByUsernameIs(username)
    }

    fun getUsers(
        id: Long?,
        username: String?
    ): List<GetUserDto> {
        val retrievedUsers = userRepository.findUserByFields(
            id, username
        )
        return retrievedUsers.map { toGetUserDto(it) }
    }

    fun getUsersWithTodosAsIds(
        id: Long?,
        username: String?
    ): List<GetUserDtoId> {
        val retrievedUsers = userRepository.findUserByFields(
            id, username
        )
        return retrievedUsers.map { toGetUserDtoId(it) }
    }

    fun createUser(
        createUserDto: CreateUserDto
    ): GetUserDtoId {
        val checkedUsers = getUserByUsername(createUserDto.username)
        if (checkedUsers.isNotEmpty()) {
            throw IllegalStateException("User with username ${createUserDto.username} already exists.")
        }

        val newUser = fromCreateUserDto(createUserDto)
        val savedUser = userRepository.save(newUser)
        return toGetUserDtoId(savedUser)
    }

    fun updateUser(
        id: Long,
        updateUserDto: UpdateUserDto
    ): GetUserDtoId {
        return userRepository.findById(id).map {
            val updatedUser = fromUpdateUserDto(
                it, updateUserDto
            )
            val save = userRepository.save(updatedUser)
            toGetUserDtoId(save)
        }.orElseThrow{
            UserNotFoundException(
                "Todo item with id $id could not be found."
            )
        }
    }

    @Transactional
    fun deleteUser(
        id: Long
    ) {
        userRepository.deleteById(id)
    }
}