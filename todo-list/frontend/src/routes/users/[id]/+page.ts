import { getUsers } from "$lib/api/UserAPI";
import type { GetUserDtoId } from "$lib/types/api/User";
import { error } from "@sveltejs/kit";
import type { PageLoad } from "./$types";

export const load: PageLoad = async ({
    params
}) => {
    const id: number = Number.parseInt(params.id);
    const users: GetUserDtoId[] = await getUsers(id, undefined);

    if (users.length == 0) {
        error(404, "No user found!");
    } else {
        return { users };
    }
}
