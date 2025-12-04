<script>
    import DefaultButton from "$lib/components/DefaultButton.svelte";

</script>
<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://svelte.dev/docs/kit">svelte.dev/docs/kit</a> to read the documentation</p>

<DefaultButton onclick={() => {console.log("Test")}}>
    {#snippet content()}
        Button
    {/snippet}
</DefaultButton>

<DefaultButton onclick={() => {console.log("Test")}}>
    {#snippet content()}
        <iconify-icon icon="material-symbols:delete-rounded" width="24" height="24"></iconify-icon>
    {/snippet}
</DefaultButton>
