package com.hszg.todolist.todoitems

import com.hszg.todolist.users.User
import jakarta.persistence.*
import java.time.LocalDateTime

@Entity(name = "todoitem")
@Table(name = "todoitem")
class TodoItem (
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long? = null,
    @Column(name = "name", nullable = false)
    val name: String = "",
    @Column(name = "description", nullable = false)
    val description: String = "",
    @Column(name = "done", nullable = false)
    val done: Boolean = false,
    @Column(name = "created", nullable = false)
    val created: LocalDateTime,
    @Column(name = "shouldBeDoneBy", nullable = false)
    val shouldBeDoneBy: LocalDateTime,
    @ManyToOne
    @JoinColumn(name = "user_id")
    val user: User = User()
)