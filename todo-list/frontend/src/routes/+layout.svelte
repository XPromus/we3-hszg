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
	<div class="flex flex-row space-x-5 align-middle">
		<span class="text-5xl font-extralight text-gray-400">TODO LIST</span>
		<div class="grow"></div>
		<a href="/" class="p-3 flex justify-center align-middle rounded-full bg-slate-200 hover:bg-slate-700 hover:text-slate-200 hover:cursor-pointer transition-all duration-200" title="Todo List Button">
			<iconify-icon icon="material-symbols:checklist" width="24" height="24"></iconify-icon>
		</a>
		<a href="/users" class="p-3 flex justify-center align-middle rounded-full bg-slate-200 hover:bg-slate-700 hover:text-slate-200 hover:cursor-pointer transition-all duration-200" title="Users Button">
			<iconify-icon icon="material-symbols:person" width="24" height="24"></iconify-icon>
		</a>
	</div>
	{@render children()}
</div>
