import type { GetTodoItemDto, UpdateTodoItemDto } from "$lib/types/api/TodoItems";
import { expect, test } from "vitest";
import { getTodoItemDtoToUpdateTodoItemDto } from "./TodoItemMapper";

test('Convert GetTodoItemDto with default values to UpdateTodoItemDto', () => {
    const dto: GetTodoItemDto = {
        id: 0,
        name: "",
        description: "",
        done: false,
        created: 0,
        shouldBeDoneBy: 0,
        userId: 0
    };

    const expectedUpdateTodoItemDto: UpdateTodoItemDto = {
        name: "",
        description: "",
        done: false,
        created: 0,
        shouldBeDoneBy: 0,
        userId: 0
    };

    const convertedDto = getTodoItemDtoToUpdateTodoItemDto(dto);
    expect(convertedDto).toEqual(expectedUpdateTodoItemDto);
});
