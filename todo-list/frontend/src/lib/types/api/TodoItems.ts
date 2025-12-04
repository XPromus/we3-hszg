export type GetTodoItemDto = {
    id: number,
    name: string,
    description: string,
    done: boolean,
    created: string,
    shouldBeDoneBy: string,
    userId: number
}

export type CreateTodoItemDto = {
    name: string,
    description: string,
    done: boolean,
    created: string,
    shouldBeDoneBy: string,
    userId: number
}

export type UpdateTodoItemDto = {
    name: string | undefined,
    description: string | undefined,
    done: boolean | undefined,
    created: string | undefined,
    shouldBeDoneBy: string | undefined,
    userId: number | undefined
}
