import { getAllUsers } from "$lib/api/UserAPI";
import type { GetUserDtoId } from "$lib/types/api/User";
import type { PageLoad } from "./$types";

export const load: PageLoad = async () => {
    const users: GetUserDtoId[] = await getAllUsers();
    return { users };
}
