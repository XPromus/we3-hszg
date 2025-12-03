package com.hszg.todolist.todoitems

import com.fasterxml.jackson.annotation.JsonBackReference
import com.hszg.todolist.users.User
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.JoinColumn
import jakarta.persistence.ManyToOne
import jakarta.persistence.Table
import java.util.Date

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
    val created: Date,
    @Column(name = "shoudBeDoneBy", nullable = false)
    val shouldBeDoneBy: Date,
    @ManyToOne
    @JsonBackReference
    @JoinColumn(name = "user_id")
    val user: User = User()
)