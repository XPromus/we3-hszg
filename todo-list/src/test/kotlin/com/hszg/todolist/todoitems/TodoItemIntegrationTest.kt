package com.hszg.todolist.todoitems

import com.fasterxml.jackson.module.kotlin.jacksonObjectMapper
import com.fasterxml.jackson.module.kotlin.readValue
import com.hszg.todolist.todoitem.dtos.CreateTodoItemDto
import com.hszg.todolist.todoitem.dtos.GetTodoItemDto
import com.hszg.todolist.todoitem.dtos.UpdateTodoItemDto
import com.hszg.todolist.users.dtos.CreateUserDto
import com.hszg.todolist.users.dtos.GetUserDto
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
import java.util.Date
import kotlin.test.Test

@SpringBootTest
@AutoConfigureMockMvc
class TodoItemIntegrationTest {

    @Autowired
    lateinit var mockMvc: MockMvc

    val mapper = jacksonObjectMapper()

    @Test
    fun `get todoItems return success`() {
        mockMvc.get("/todos")
            .andDo { MockMvcResultHandlers.print() }
            .andExpect { status { isOk() } }
    }

    @Test
    fun `post todoItems returns success`() {
        val newUserGetDto: GetUserDto = createNewUser()

        val newTodoItem = CreateTodoItemDto(
            name = "Test Todo Name",
            description = "Test Todo Description",
            done = false,
            created = Date(),
            shouldBeDoneBy = Date(),
            userId = newUserGetDto.id
        )

        mockMvc.post("/todos") {
            contentType = MediaType.APPLICATION_JSON
            content = mapper.writeValueAsString(newTodoItem)
            accept = MediaType.APPLICATION_JSON
        }.andExpect {
            status { isCreated() }
        }
    }

    @Test
    fun `put todoItems returns success`() {
        val newUserGetDto: GetUserDto = createNewUser()
        val newTodoItemGetDto: GetTodoItemDto = createNewTodoItem(newUserGetDto.id)

        val updatedTodoItemDto = UpdateTodoItemDto(
            name = "Test Todo Name Updated",
            description = "Test Todo Description Updated",
            done = true,
            created = Date(),
            shouldBeDoneBy = Date(),
            userId = newUserGetDto.id
        )

        mockMvc.put("/todos/${newTodoItemGetDto.id}") {
            contentType = MediaType.APPLICATION_JSON
            content = mapper.writeValueAsString(updatedTodoItemDto)
            accept = MediaType.APPLICATION_JSON
        }.andExpect {
            status { isOk() }
        }
    }

    @Test
    fun `delete todoItem returns success`() {
        val newUserGetDto: GetUserDto = createNewUser()
        val newTodoItemGetDto: GetTodoItemDto = createNewTodoItem(newUserGetDto.id)

        mockMvc.delete("/todos/${newTodoItemGetDto.id}")
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

    fun createNewTodoItem(userId: Long): GetTodoItemDto {
        val newTodoItem = CreateTodoItemDto(
            name = "Test Todo Name",
            description = "Test Todo Description",
            done = false,
            created = Date(),
            shouldBeDoneBy = Date(),
            userId = userId
        )

        val postTodoItemResult = mockMvc.post("/todos") {
            contentType = MediaType.APPLICATION_JSON
            content = mapper.writeValueAsString(newTodoItem)
            accept = MediaType.APPLICATION_JSON
        }.andExpect {
            status { isCreated() }
        }.andReturn()

        val newTodoItemAsString = postTodoItemResult.response.contentAsString
        return mapper.readValue<GetTodoItemDto>(newTodoItemAsString)
    }

}