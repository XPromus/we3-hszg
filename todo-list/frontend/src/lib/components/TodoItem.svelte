<script lang="ts">
    import { putUpdateTodoItem } from "$lib/api/TodoItemAPI";
    import { getTodoItemDtoToUpdateTodoItemDto } from "$lib/mapper/TodoItemMapper";
    import type { GetTodoItemDto } from "$lib/types/api/TodoItems";

    let {
        todoItemDto
    }: {
        todoItemDto: GetTodoItemDto
    } = $props();

    const onTodoItemValueChange = async () => {
        alert("onTodoItemValueChange");
        todoItemDto = await putUpdateTodoItem(
            todoItemDto.id,
            getTodoItemDtoToUpdateTodoItemDto(todoItemDto)
        );
    }
</script>

<div class="w-full p-2 flex flex-row space-x-5 outline-1 outline-slate-200 bg-slate-100 drop-shadow-md rounded-md">
    <div class="grow flex flex-row space-x-5">
        <span class="text-gray-400 font-bold py-1">Name</span>
        <input onchange={onTodoItemValueChange} value={todoItemDto.name} class="grow bg-slate-200 px-2 py-1 rounded-md" type="text" name="" id="">
    </div>
    <div class="grow flex flex-row space-x-5">
        <span class="text-gray-400 font-bold py-1">Description</span>
        <input onchange={onTodoItemValueChange} value={todoItemDto.description} class="grow bg-slate-200 px-2 py-1 rounded-md" type="text" name="" id="">
    </div>
    <div class="shrink flex flex-row space-x-5">
        <span class="text-gray-400 font-bold py-1">Done</span>
        <div class="grow flex justify-center">
            <input onchange={onTodoItemValueChange} value={todoItemDto.done} type="checkbox" name="" id="">
        </div>
    </div>
    <div class="shrink flex justify-center align-middle">
        <button class="flex justify-center align-middle text-red-500 rounded-full bg-red-100 p-1 hover:bg-red-300 hover:cursor-pointer hover:text-red-700 transition-all duration-200" onclick={() => console.log("Delete")} title="Delete Button">
            <iconify-icon icon="material-symbols:delete" width="24" height="24"></iconify-icon>
        </button>
    </div>
</div>
