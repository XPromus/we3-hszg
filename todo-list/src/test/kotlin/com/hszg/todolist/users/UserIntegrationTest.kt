package com.hszg.todolist.users

import com.fasterxml.jackson.module.kotlin.jacksonObjectMapper
import com.fasterxml.jackson.module.kotlin.jsonMapper
import com.fasterxml.jackson.module.kotlin.readValue
import com.hszg.todolist.users.dtos.CreateUserDto
import com.hszg.todolist.users.dtos.GetUserDto
import com.hszg.todolist.users.dtos.UpdateUserDto
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.http.MediaType
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.delete
import org.springframework.test.web.servlet.get
import org.springframework.test.web.servlet.post
import org.springframework.test.web.servlet.put
import org.springframework.test.web.servlet.result.MockMvcResultHandlers
import kotlin.test.Test
import kotlin.test.assertTrue

//@Testcontainers
//@ContextConfiguration(initializers = [DataSourceInitializer::class])
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
    fun `get users with queries check username`() {
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
    fun `post users returns success`() {
        createNewUser()
    }

    @Test
    fun `put users returns success`() {
        val newUserGetDto = createNewUser()
        val updatedUser = UpdateUserDto(
            username = "New User Updated"
        )

        mockMvc.put("/users/${newUserGetDto.id}") {
            contentType = MediaType.APPLICATION_JSON
            content = jsonMapper().writeValueAsString(updatedUser)
            accept = MediaType.APPLICATION_JSON
        }.andExpect {
            status { isOk() }
        }
    }

    @Test
    fun `delete users returns success`() {
        val newUserGetDto = createNewUser()
        mockMvc.delete("/users/${newUserGetDto.id}")
            .andExpect {
                status { isNoContent() }
            }
    }

    fun createNewUser(): GetUserDto {
        val newUser = CreateUserDto(
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