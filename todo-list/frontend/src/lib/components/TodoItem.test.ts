import { expect, test } from "vitest";
import { render, screen } from "@testing-library/svelte";
import type { GetTodoItemDto } from "$lib/types/api/TodoItems";

import Subject from "./TodoItem.svelte";

test("Render todo item", () => {
    const todoItemDto: GetTodoItemDto = {
        id: 0,
        name: "Test Name",
        description: "Test Description",
        done: false,
        created: 0,
        shouldBeDoneBy: 0,
        userId: 0
    }

    render(Subject, {todoItemDto: todoItemDto, onTodoItemDelete: () => {}, onTodoItemUpdate: () => {}});    
    const nameInput = screen.getByDisplayValue("Test Name");
    const descriptionInput = screen.getByDisplayValue("Test Description");
    const doneInput = screen.getByRole("checkbox", {name: "/input/done"});

    expect(nameInput).toBeInTheDocument();
    //@ts-ignore
    expect(nameInput.value).toBe(todoItemDto.name);

    expect(descriptionInput).toBeInTheDocument();
    //@ts-ignore
    expect(descriptionInput.value).toBe(todoItemDto.description);

    expect(doneInput).toBeInTheDocument();
    //@ts-ignore
    expect(doneInput.checked).toBe(todoItemDto.done);
});
