<script lang="ts">
    import DefaultButton from "$lib/components/DefaultButton.svelte";
    import TodoItem from "$lib/components/TodoItem.svelte";
    import type { GetTodoItemDto } from "$lib/types/api/TodoItems";

    const items: GetTodoItemDto[] = [
        {
            id: 0,
            name: "Name 1",
            description: "Description",
            done: false,
            created: "",
            shouldBeDoneBy: "",
            userId: 0
        },
        {
            id: 1,
            name: "Name 2",
            description: "Description",
            done: false,
            created: "",
            shouldBeDoneBy: "",
            userId: 0
        },
        {
            id: 2,
            name: "Name 3",
            description: "Description",
            done: false,
            created: "",
            shouldBeDoneBy: "",
            userId: 0
        }
    ]
</script>

<span class="text-5xl font-extralight text-gray-400">TODO LIST</span>
<div class="flex flex-col space-y-2">
    {#each items as item }
        <TodoItem todoItemDto={item}/>
    {/each}
</div>
