<script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.svg';
	
	import "iconify-icon";

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<div class="w-screen h-screen flex flex-col space-y-5 p-5">
	{@render children()}
</div>
