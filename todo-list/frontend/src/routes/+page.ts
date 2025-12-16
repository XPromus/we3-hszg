import { getAllTodoItems } from "$lib/api/TodoItemAPI";
import { getAllUsers } from "$lib/api/UserAPI";
import type { GetTodoItemDto } from "$lib/types/api/TodoItems";
import type { GetUserDtoId } from "$lib/types/api/User";
import type { PageLoad } from "./$types";

export const load: PageLoad = async () => {
    const todos: GetTodoItemDto[] = await getAllTodoItems();
    const users: GetUserDtoId[] = await getAllUsers();
    return { todos, users }
}
