package com.hszg.todolist.users

import com.hszg.todolist.todoitems.TodoItem
import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.FetchType
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.OneToMany
import jakarta.persistence.Table

@Entity(name = "todouser")
@Table(name = "todouser")
class User(
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long? = null,
    @Column(name = "username", unique = true)
    val username: String = "",
    @OneToMany(
        mappedBy = "user",
        cascade = [CascadeType.REMOVE],
        orphanRemoval = true,
        fetch = FetchType.LAZY
    )
    val todoItems: MutableList<TodoItem> = mutableListOf()
)
