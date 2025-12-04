<script lang="ts">
    import type { GetTodoItemDto } from "$lib/types/api/TodoItems";

    let {
        todoItemDto
    }: {
        todoItemDto: GetTodoItemDto
    } = $props();
</script>

<div class="w-full p-2 flex flex-row space-x-5 outline-1 outline-slate-200 bg-slate-100 drop-shadow-md rounded-md">
    <div class="grow flex flex-row space-x-5">
        <span class="text-gray-400 font-bold py-1">Name</span>
        <div class="grow bg-slate-200 px-2 py-1">
            {todoItemDto.name}
        </div>
    </div>
    <div class="grow flex flex-row space-x-5">
        <span class="text-gray-400 font-bold py-1">Description</span>
        <div class="grow bg-slate-200 px-2 py-1">
            {todoItemDto.description}
        </div>
    </div>
    <div class="shrink flex flex-row space-x-5">
        <span class="text-gray-400 font-bold py-1">Done</span>
        <div class="grow flex justify-center">
            <input type="checkbox" name="" id="" value={todoItemDto.done}>
        </div>
    </div>
    <div class="shrink flex justify-center align-middle">
        <button class="flex justify-center align-middle text-red-500 rounded-full bg-red-100 p-1 hover:bg-red-300 hover:cursor-pointer hover:text-red-700 transition-all duration-200" onclick={() => console.log("Delete")} title="Delete Button">
            <iconify-icon icon="material-symbols:delete" width="24" height="24"></iconify-icon>
        </button>
    </div>
</div>
