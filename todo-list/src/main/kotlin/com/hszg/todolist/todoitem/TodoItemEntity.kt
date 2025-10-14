package com.hszg.todolist.todoitem

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Table
import java.util.Date

@Entity(name = "todoitem")
@Table(name = "todoitem")
class TodoItemEntity (
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
    val shouldBeDoneBy: Date
)