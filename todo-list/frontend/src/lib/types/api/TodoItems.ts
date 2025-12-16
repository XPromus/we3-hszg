export type GetTodoItemDto = {
    id: number,
    name: string,
    description: string,
    done: boolean,
    created: number,
    shouldBeDoneBy: number,
    userId: number
}

export type CreateTodoItemDto = {
    name: string,
    description: string,
    done: boolean,
    created: number,
    shouldBeDoneBy: number,
    userId: number
}

export type UpdateTodoItemDto = {
    name: string | undefined,
    description: string | undefined,
    done: boolean | undefined,
    created: number | undefined,
    shouldBeDoneBy: number | undefined,
    userId: number | undefined
}
