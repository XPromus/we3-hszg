<script lang="ts">
    import { getAllTodoItems, postCreateTodoItem } from "$lib/api/TodoItemAPI";
    import TodoItem from "$lib/components/TodoItem.svelte";
    import type { GetTodoItemDto } from "$lib/types/api/TodoItems";
    import type { GetUserDtoId } from "$lib/types/api/User";
    import type { PageData } from "./$types";

    let { data }: { data: PageData } = $props();
    let todos: GetTodoItemDto[] = $derived(data.todos);
    let users: GetUserDtoId[] = $derived(data.users);

    let todoNameInput: string = $state("");
    let descriptionInput: string = $state("");
    let shouldBeDoneByInput: string = $state("");
    let userId: number = $state(0);

    const items: GetTodoItemDto[] = [
        {
            id: 0,
            name: "Name 1",
            description: "Description",
            done: false,
            created: 0,
            shouldBeDoneBy: 0,
            userId: 0
        },
        {
            id: 1,
            name: "Name 2",
            description: "Description",
            done: false,
            created: 0,
            shouldBeDoneBy: 0,
            userId: 0
        },
        {
            id: 2,
            name: "Name 3",
            description: "Description",
            done: false,
            created: 0,
            shouldBeDoneBy: 0,
            userId: 0
        }
    ]

    const onNewTodoItemCreate = async () => {
        await postCreateTodoItem(
            {
                name: todoNameInput,
                description: descriptionInput,
                done: false,
                created: Date.now(),
                shouldBeDoneBy: Date.parse(shouldBeDoneByInput),
                userId: userId
            }
        )
        todos = await getAllTodoItems();
    }
    
</script>

<div class="flex flex-col space-y-2">
    <div class="flex flex-row space-x-5">
        <input class="border" type="text" bind:value={todoNameInput} placeholder="Todo Name">
        <input class="border" type="text" bind:value={descriptionInput} placeholder="Description">
        <input class="border" bind:value={shouldBeDoneByInput} type="date" name="" id="">
        <select class="border px-5" bind:value={userId} placeholder="User">
            {#each users as user, i }
                <option value={user.id}>{user.username}</option>
            {/each}
        </select>
        <button class="p-1 bg-green-500 rounded-md text-white font-bold hover:cursor-pointer hover:bg-green-700 transition-all duration-200" onclick={onNewTodoItemCreate} type="submit">
            Create
        </button>
    </div>
    {#each todos as todo }
        <TodoItem todoItemDto={todo}/>
    {/each}
</div>
