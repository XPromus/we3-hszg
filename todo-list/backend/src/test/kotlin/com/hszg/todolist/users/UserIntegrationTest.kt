package com.hszg.todolist.users

import com.fasterxml.jackson.module.kotlin.jacksonObjectMapper
import com.fasterxml.jackson.module.kotlin.jsonMapper
import com.fasterxml.jackson.module.kotlin.readValue
import com.hszg.todolist.users.dtos.GetUserDto
import com.hszg.todolist.users.dtos.PostUserDto
import com.hszg.todolist.users.dtos.PutUserDto
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.http.MediaType
import org.springframework.test.web.servlet.*
import org.springframework.test.web.servlet.result.MockMvcResultHandlers
import kotlin.test.Test
import kotlin.test.assertTrue

@SpringBootTest
@AutoConfigureMockMvc
class UserIntegrationTest {

    @Autowired
    lateinit var mockMvc: MockMvc

    val mapper = jacksonObjectMapper()

    @Test
    fun `get users returns success`() {
       mockMvc.get("/users")
           .andDo { MockMvcResultHandlers.print() }
           .andExpect { status { isOk() } }
    }

    @Test
    fun `get users with queries return success and non empty list`() {
        val newUserGetDto = createNewUser()
        val result = mockMvc.get("/users?username=${newUserGetDto.username}")
            .andDo { MockMvcResultHandlers.print() }
            .andExpect { status { isOk() } }
            .andReturn()

        val foundUsersResponse = result.response.contentAsString
        val foundUsers = mapper.readValue<List<GetUserDto>>(foundUsersResponse)

        assertTrue { foundUsers.isNotEmpty() }
    }

    @Test
    fun `get users with queries check all returned users for any correct username`() {
        val newUserGetDto = createNewUser()
        val result = mockMvc.get("/users?username=${newUserGetDto.username}")
            .andDo { MockMvcResultHandlers.print() }
            .andExpect { status { isOk() } }
            .andReturn()

        val foundUsersResponse = result.response.contentAsString
        val foundUsers = mapper.readValue<List<GetUserDto>>(foundUsersResponse)

        assertTrue {
            var result = false

            run breaking@ {
                foundUsers.forEach {
                    if (it.username == newUserGetDto.username) {
                        result = true
                        return@breaking
                    }
                }
            }

            result
        }
    }

    @Test
    fun `post users returns success and get request for new user, filtering by id, contains new user`() {
        val newUser = createNewUser()

        val getRequestResult = mockMvc.get(
            urlTemplate = "/users?id=${newUser.id}"
        ) {
            accept = MediaType.APPLICATION_JSON
        }.andExpect {
            status { isOk() }
        }.andReturn()

        val getRequestUsersResponse = getRequestResult.response.contentAsString
        val getRequestUserDTOs = mapper.readValue<List<GetUserDto>>(getRequestUsersResponse)

        assertTrue {
            var result = false

            run breaking@ {
                getRequestUserDTOs.forEach {
                    if (it.id == newUser.id) {
                        result = true
                        return@breaking
                    }
                }
            }

            result
        }
    }

    @Test
    fun `put users returns success and get request for updated user has correct new username`() {
        val newUserGetDto = createNewUser()
        val newUserUpdateDto = PutUserDto(
            username = "New User Updated"
        )

        val putRequestResult = mockMvc.put(
            urlTemplate = "/users/${newUserGetDto.id}"
        ) {
            contentType = MediaType.APPLICATION_JSON
            content = jsonMapper().writeValueAsString(newUserUpdateDto)
            accept = MediaType.APPLICATION_JSON
        }.andExpect {
            status { isOk() }
        }.andReturn()

        val putRequestGetUserDto = mapper.readValue<GetUserDto>(
            putRequestResult.response.contentAsString
        )

        val getRequestResult = mockMvc.get(
            urlTemplate = "/users?id=${putRequestGetUserDto.id}"
        ) {
            accept = MediaType.APPLICATION_JSON
        }.andExpect {
            status { isOk() }
        }.andReturn()

        val getRequestUsersResponse = getRequestResult.response.contentAsString
        val getRequestUserDTOs = mapper.readValue<List<GetUserDto>>(getRequestUsersResponse)

        assertTrue {
            var result = false

            run breaking@ {
                getRequestUserDTOs.forEach {
                    if (
                        it.id == newUserGetDto.id &&
                        it.username == newUserUpdateDto.username
                    ) {
                        result = true
                        return@breaking
                    }
                }
            }

            result
        }

    }

    @Test
    fun `delete users returns success and get request for deleted user should be empty after delete`() {
        val newUserGetDto = createNewUser()
        mockMvc.delete(
            urlTemplate = "/users/${newUserGetDto.id}"
        )
            .andExpect {
                status { isNoContent() }
            }

        val getReturn = mockMvc.get(
            urlTemplate = "/users?id=${newUserGetDto.id}"
        )
            .andExpect {
                status { isOk() }
            }.andReturn()

        val getRequestUsersResponse = getReturn.response.contentAsString
        val getRequestUserDTOs = mapper.readValue<List<GetUserDto>>(getRequestUsersResponse)

        assertTrue { getRequestUserDTOs.isEmpty() }
    }

    fun createNewUser(): GetUserDto {
        val newUser = PostUserDto(
            username = "New User"
        )

        val postUserResult = mockMvc.post("/users") {
            contentType = MediaType.APPLICATION_JSON
            content = mapper.writeValueAsString(newUser)
            accept = MediaType.APPLICATION_JSON
        }.andExpect {
            status { isCreated() }
        }.andReturn()

        val newUserAsString = postUserResult.response.contentAsString
        return mapper.readValue<GetUserDto>(newUserAsString)
    }

}