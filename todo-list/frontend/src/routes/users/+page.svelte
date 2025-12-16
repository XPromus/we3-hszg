<script lang="ts">
    import { deleteUser, getAllUsers, postCreateUser } from "$lib/api/UserAPI";
    import type { GetUserDtoId } from "$lib/types/api/User";
    import type { PageData } from "./$types";

    let { data }: { data: PageData } = $props();
    let users: GetUserDtoId[] = $derived(data.users);

    let usernameInputValue: string = $state("");

    const onNewUserCreate = async () => {
        await postCreateUser(
            {
                username: usernameInputValue
            }
        );
        users = await getAllUsers();
    }

    const onUserDelete = async (id: number) => {
        await deleteUser(id);
        users = await getAllUsers();
    }
</script>

<div class="w-full h-full flex flex-col space-y-5">
    <div class="flex flex-row space-x-5">
        <input class="border" type="text" name="" id="" bind:value={usernameInputValue}>
        <button class="p-1 bg-green-500 rounded-md text-white font-bold hover:cursor-pointer hover:bg-green-700 transition-all duration-200" onclick={onNewUserCreate} type="submit">
            Create
        </button>
    </div>
    {#if users.length == 0}
        <span>No Users exist</span>
    {/if}
    {#each users as user, i }
        <div class="w-full p-5 flex flex-row space-x-5">
            <span>ID: {user.id}</span>
            <span>Username: {user.username}</span>
            <span>Number of Todos: {user.todoItems.length}</span>
            <button class="p-1 bg-red-500 rounded-md text-white font-bold hover:cursor-pointer hover:bg-red-700 transition-all duration-200" onclick={() => onUserDelete(user.id)}>
                Delete
            </button>
        </div>
    {/each}
</div>
