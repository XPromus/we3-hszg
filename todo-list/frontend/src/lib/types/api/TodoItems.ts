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
    name: string,
    description: string,
    done: boolean,
    created: number,
    shouldBeDoneBy: number,
    userId: number
}
