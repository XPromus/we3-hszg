<script lang="ts">
    import type { Snippet } from 'svelte';

    let {
        onclick,
        content
    }: {
        onclick: any,
        content: Snippet
    } = $props()
</script>

<button onclick={onclick} class="px-5 py-2 rounded-md bg-slate-300 outline-1 outline-slate-800 hover:bg-slate-700 hover:outline-slate-900 hover:text-white hover:cursor-pointer active:bg-slate-600 hover:drop-shadow-md transition-all duration-200">
    {@render content()}
</button>
