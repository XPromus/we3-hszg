<script lang="ts">
    import { putUpdateTodoItem } from "$lib/api/TodoItemAPI";
    import { getTodoItemDtoToUpdateTodoItemDto } from "$lib/mapper/TodoItemMapper";
    import type { GetTodoItemDto } from "$lib/types/api/TodoItems";
    import { onMount } from "svelte";

    let {
        todoItemDto,
        onTodoItemDelete,
        onTodoItemUpdate,
    }: {
        todoItemDto: GetTodoItemDto,
        onTodoItemDelete: any,
        onTodoItemUpdate: any,
    } = $props();

    let nameInput: string = $derived(todoItemDto.name);
    let descriptionInput: string = $derived(todoItemDto.description);
    let doneInput: boolean = $derived(todoItemDto.done);

    const onTodoItemValueChange = async () => {
        const updatedTodoItem: GetTodoItemDto = {
            id: todoItemDto.id,
            name: nameInput,
            description: descriptionInput,
            done: doneInput,
            created: todoItemDto.created,
            shouldBeDoneBy: todoItemDto.shouldBeDoneBy,
            userId: todoItemDto.userId 
        };

        todoItemDto = await putUpdateTodoItem(
            todoItemDto.id,
            getTodoItemDtoToUpdateTodoItemDto(updatedTodoItem)
        );
        await onTodoItemUpdate();
    }

    onMount(() => {
        console.log(todoItemDto);
    })
</script>

<div class="w-full p-2 flex flex-row space-x-5 outline-1 outline-slate-200 bg-slate-100 drop-shadow-md rounded-md">
    <div class="grow flex flex-row space-x-5">
        <span class="text-gray-400 font-bold py-1">Name</span>
        <input bind:value={nameInput} class="grow bg-slate-200 px-2 py-1 rounded-md" type="text">
    </div>
    <div class="grow flex flex-row space-x-5">
        <span class="text-gray-400 font-bold py-1">Description</span>
        <input bind:value={descriptionInput} class="grow bg-slate-200 px-2 py-1 rounded-md" type="text">
    </div>
    <div class="shrink flex flex-row space-x-5">
        <span class="text-gray-400 font-bold py-1">Done</span>
        <div class="grow flex justify-center">
            <input bind:checked={doneInput} type="checkbox">
        </div>
    </div>
    <div class="shrink flex justify-center align-middle">
        <button onclick={onTodoItemDelete} class="flex justify-center align-middle text-red-500 rounded-full bg-red-100 p-1 hover:bg-red-300 hover:cursor-pointer hover:text-red-700 transition-all duration-200" title="Delete Button">
            <iconify-icon icon="material-symbols:delete" width="24" height="24"></iconify-icon>
        </button>
        <button onclick={onTodoItemValueChange} class="flex justify-center align-middle text-breen-500 rounded-full bg-green-100 p-1 hover:bg-green-300 hover:cursor-pointer hover:text-green-700 transition-all duration-200" title="Apply Button">
            <iconify-icon icon="material-symbols:check-small-rounded" width="24" height="24"></iconify-icon>
        </button>
    </div>
</div>
