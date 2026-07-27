package com.hszg.todolist.todoitems.sort

enum class TodoItemSortField(
    val propertyName: String
) {
    NAME("name"),
    DESCRIPTION("description"),
    DONE("done"),
    CREATED("created"),
    SHOULD_BE_DONE_BY("shouldBeDoneBy"),
}