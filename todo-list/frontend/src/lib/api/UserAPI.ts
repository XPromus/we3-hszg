import { baseURL } from "$lib/config/consts";
import type { CreateUserDto, GetUserDtoId, UpdateUserDto } from "$lib/types/api/User";
import { deleteRequest, getRequest, postRequest, putRequest } from "./GenericAPI";

const apiBasePath: string = "/users";
const apiURL: string = baseURL + apiBasePath;

export const getAllUsers = async (): Promise<GetUserDtoId[]> => {
    return await getRequest<GetUserDtoId[]>(apiURL, undefined);
}

export const getUsers = async (
    id: number | undefined,
    username: string | undefined
): Promise<GetUserDtoId[]> => {
    const params: Record<string, string | number | undefined> = {
        id: id,
        username: username
    };
    return await getRequest<GetUserDtoId[]>(apiURL, params);
}

export const postCreateUser = async (
    createUserDto: CreateUserDto
): Promise<GetUserDtoId> => {
    return await postRequest<CreateUserDto, GetUserDtoId>(
        apiURL, createUserDto
    );
}

export const putUpdateUser = async (
    id: number,
    updateUserDto: UpdateUserDto
): Promise<GetUserDtoId> => {
    const url = `${apiURL}/${id}`;
    return await putRequest<UpdateUserDto, GetUserDtoId>(
        url, updateUserDto
    );
}

export const deleteUser = async (
    id: number
): Promise<boolean> => {
    const url = `${apiURL}/${id}`;
    return await deleteRequest(url);
}
