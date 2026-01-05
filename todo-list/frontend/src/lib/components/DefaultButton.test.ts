import { expect, test, vi } from "vitest";
import { getByText, render, screen } from "@testing-library/svelte";
import { userEvent } from "@testing-library/user-event";

import Subject from "./DefaultButton.svelte";
import { createRawSnippet } from "svelte";

test("Check if clicked function gets triggered on click", async () => {
    const user = userEvent.setup();
    const handleClick = vi.fn();
    const buttonSnippet = createRawSnippet(() => {
        return {
            render: () => `<span>Test Button</span>`
        }
    });

    render(Subject, {onclick: handleClick, content: buttonSnippet});

    const button = screen.getByRole("button")
    await user.click(button);
    expect(handleClick).toHaveBeenCalledOnce();
});

test("Button with snippet is rendered correctly", () => {
    const expectedButtonText = "Test Button";
    const handleClick = vi.fn();
    const buttonSnippet = createRawSnippet(() => {
        return {
            render: () => `<span>${expectedButtonText}</span>`
        }
    });

    render(Subject, {onclick: handleClick, content: buttonSnippet});

    const button = screen.getByRole("button");
    getByText(button, `${expectedButtonText}`);
});
