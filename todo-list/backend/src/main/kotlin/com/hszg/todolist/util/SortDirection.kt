package com.hszg.todolist.util

import org.springframework.data.domain.Sort

enum class SortDirection {
    ASCENDING, DESCENDING
}

fun SortDirection.toSpringSortDir(): Sort.Direction = when (this) {
    SortDirection.ASCENDING -> Sort.Direction.ASC
    SortDirection.DESCENDING -> Sort.Direction.DESC
}
