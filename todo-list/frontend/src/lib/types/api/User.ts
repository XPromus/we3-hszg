export type GetUserDtoId = {
    id: number,
    username: string,
    todoItems: number[]
}

export type CreateUserDto = {
    username: string
}

export type UpdateUserDto = {
    username: string | undefined
}
