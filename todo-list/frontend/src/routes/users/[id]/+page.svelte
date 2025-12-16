<script lang="ts">
    import type { GetUserDtoId } from "$lib/types/api/User";
    import type { PageData } from "./$types";

    let { data }: { data: PageData } = $props();
    let users: GetUserDtoId[] = $derived(data.users);

</script>

<div>
    User Found
    {#each users as user, i }
        <div class="w-full p-5 flex flex-row space-x-5">
            <span>ID: {user.id}</span>
            <span>Username: {user.username}</span>
            <span>Number of Todos: {user.todoItems.length}</span>
        </div>
    {/each}
</div>
