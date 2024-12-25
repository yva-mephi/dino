import { initUserData } from "./users_init";

export class UserData {
    constructor() {
        this.users = {};
    }

    addUser ({ lastName, firstName, patronymic, nickname, password, about, avatar, role }) {
        const id = (Object.keys(this.users).length + 1).toString();
        this.users[id] = {
            id,
            lastName,
            firstName,
            patronymic,
            nickname,
            password,
            about,
            avatar,
            role // Добавляем роль пользователя
        };
    }

    getUser(id) {
        return this.users[id];
    }

    getAllUsers() {
        return Object.values(this.users);
    }

    getUserByNickname(nickname) {
        for (const userId in this.users) {
            if (this.users[userId].nickname === nickname) {
                return this.users[userId];
            }
        }
        return null;
    }

    getUserRole(id) {
        const user = this.getUser(id);
        return user ? user.role : null;
    }
}

const userData = initUserData();
export { userData };
