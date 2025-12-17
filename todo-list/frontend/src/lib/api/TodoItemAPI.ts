import { baseURL } from "$lib/config/consts";
import type { CreateTodoItemDto, GetTodoItemDto, UpdateTodoItemDto } from "$lib/types/api/TodoItems";
import { deleteRequest, getRequest, postRequest, putRequest } from "./GenericAPI";

const apiBasePath: string = "/todos";
const apiURL: string = baseURL + apiBasePath;

export const getAllTodoItems = async (): Promise<GetTodoItemDto[]> => {
    return await getRequest<GetTodoItemDto[]>(apiURL, undefined);
}

export const getTodoItems = async (
    id: number | undefined,
    name: string | undefined,
    description: string | undefined,
    done: boolean | undefined,
    created: number | undefined,
    shouldBeDoneBy: number | undefined
): Promise<GetTodoItemDto[]> => {
    const params: Record<string, string | boolean | number | undefined> = {
        id: id,
        name: name,
        description: description,
        done: done,
        created: created,
        shouldBeDoneBy: shouldBeDoneBy
    };
    return await getRequest<GetTodoItemDto[]>(apiURL, params);
}

export const postCreateTodoItem = async (
    createTodoItemDto: CreateTodoItemDto
): Promise<GetTodoItemDto> => {
    return await postRequest<CreateTodoItemDto, GetTodoItemDto>(
        apiURL, createTodoItemDto
    )
}

export const putUpdateTodoItem = async (
    id: number,
    updateTodoItemDto: UpdateTodoItemDto
): Promise<GetTodoItemDto> => {
    console.log(updateTodoItemDto)
    const url = `${apiURL}/${id}`;
    return await putRequest<UpdateTodoItemDto, GetTodoItemDto>(
        url, updateTodoItemDto
    );
}

export const deleteTodoItem = async (
    id: number
): Promise<boolean> => {
    const url = `${apiURL}/${id}`;
    return await deleteRequest(url);
}
