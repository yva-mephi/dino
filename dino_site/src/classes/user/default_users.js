const DEFAULT_USERS = [
    { lastName: 'Баранников', firstName: 'Роман', patronymic: 'Романович', nickname: 'rbarannikov', password: 'roman', about: 'Hello, I am Roma!', avatar: './avatar.png', role: 'teacher' },
    { lastName: 'Иванов', firstName: 'Иван', patronymic: 'Иванович', nickname: 'ivan_ivanov', password: 'password123', about: 'Hello, I am Ivan!', avatar: './avatar1.png', role: 'teacher' },
    { lastName: 'Петров', firstName: 'Петр', patronymic: 'Петрович', nickname: 'petr_petrov', password: 'password456', about: 'Hello, I am Petr!', avatar: './avatar2.png', role: 'teacher' },
    { lastName: 'Якимов', firstName: 'Виктор', patronymic: 'Андреевич', nickname: 'yava', password: '0123456', about: 'Hello, I am Viktor!', avatar: './avatar3.png', role: 'teacher' },
    { lastName: 'Федоров', firstName: 'Иосиф', patronymic: 'Гундабадович', nickname: 'iosif', password: '6543210', about: 'Hello, I am Iosif!', avatar: './avatar4.png', role: 'teacher' },
    // Добавляем 45 учеников
];

for (let i = 1; i <= 45; i++) {
    DEFAULT_USERS.push({
        lastName: `Ученик${i}`,
        firstName: `Имя${i}`,
        patronymic: `Отчество${i}`,
        nickname: `student_${i}`,
        password: `password${i}`,
        about: `Hello, I am Student${i}!`,
        avatar: './avatar_student.png',
        role: 'student'
    });
}

// Добавляем родителей (52 родителя)
for (let i = 1; i <= 52; i++) {
    DEFAULT_USERS.push({
        lastName: `Родитель${i}`,
        firstName: `ИмяРодителя${i}`,
        patronymic: `ОтчествоРодителя${i}`,
        nickname: `parent_${i}`,
        password: `password${i + 45}`,
        about: `Hello, I am Parent${i}!`,
        avatar: './avatar_parent.png',
        role: 'parent'
    });
}

export { DEFAULT_USERS };
