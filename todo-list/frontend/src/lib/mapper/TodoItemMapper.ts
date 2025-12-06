import type { GetTodoItemDto, UpdateTodoItemDto } from "$lib/types/api/TodoItems";

export const getTodoItemDtoToUpdateTodoItemDto = (
    getTodoItemDto: GetTodoItemDto
): UpdateTodoItemDto => {
    return {
        name: getTodoItemDto.name,
        description: getTodoItemDto.description,
        done: getTodoItemDto.done,
        created: getTodoItemDto.created,
        shouldBeDoneBy: getTodoItemDto.shouldBeDoneBy,
        userId: getTodoItemDto.userId
    }
}
