package com.hszg.todolist.users

import com.hszg.todolist.users.dtos.*
import com.hszg.todolist.users.mappers.toGetUserDto
import com.hszg.todolist.users.mappers.toGetUserDtoWithChildrenPage
import com.hszg.todolist.users.mappers.toNewUser
import com.hszg.todolist.users.mappers.toUpdatedUser
import com.hszg.todolist.users.specification.UserSpecification
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class UserService(
    private val userRepository: UserRepository
) {

    @Transactional(readOnly = true)
    fun findUsers(
        filter: UserFilter,
        pageable: Pageable
    ): Page<GetUserDto> {
        val spec = UserSpecification.withFilter(filter)
        return userRepository.findAll(spec, pageable).map { it.toGetUserDto() }
    }

    @Transactional(readOnly = true)
    fun findUsersWithChildren(
        filter: UserFilter,
        pageable: Pageable
    ): Page<GetUserDtoWithChildren> {
        val spec = UserSpecification.withFilter(filter)
        return userRepository.findAll(
            spec, pageable
        ).toGetUserDtoWithChildrenPage()
    }

    @Transactional
    fun putUser(
        id: Long,
        putUserDto: PutUserDto
    ): Pair<GetUserDto, Boolean> {
        val existingUser = userRepository.findByIdOrNull(id)
        val userToSave: User = existingUser?.let {
            putUserDto.toUpdatedUser(
                existingUser = it
            )
        } ?: run {
            putUserDto.toNewUser()
        }

        val savedUser = userRepository.save(userToSave)
        return savedUser.toGetUserDto() to (existingUser == null)
    }

    @Transactional
    fun createUser(
        postUserDto: PostUserDto
    ): GetUserDto {
        val newUser = postUserDto.toNewUser()
        return userRepository.save(newUser).toGetUserDto()
    }

    @Transactional
    fun deleteUser(
        id: Long
    ) {
        userRepository.deleteById(id)
    }
}