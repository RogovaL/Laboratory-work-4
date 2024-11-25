-- Таблиця "Танцівник"
CREATE TABLE Танцівник (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ім'я VARCHAR(100) NOT NULL CHECK (ім'я REGEXP '^[А-ЯҐЄІЇа-яґєії\\s]+$'),
-- Для атрибуту ім'я Регулярний вираз '^[А-ЯҐЄІЇа-яґєії\\s]+$' забезпечує, що значення поля може містити лише літери українського алфавіту та пробіли.
    вік INT NOT NULL CHECK (вік > 0)
);


-- Таблиця "Анкета"
CREATE TABLE Анкета (
    id INT PRIMARY KEY AUTO_INCREMENT,
    психологічний_стан VARCHAR(255) NOT NULL,
    дата_заповнення DATE NOT NULL,
    танцівник_id INT NOT NULL,
    FOREIGN KEY (танцівник_id) REFERENCES Танцівник(id)
);

-- Таблиця "Звіт"
CREATE TABLE Звіт (
    id INT PRIMARY KEY AUTO_INCREMENT,
    результат_аналізу TEXT NOT NULL,
    рекомендації TEXT,
    дата_створення DATE NOT NULL,
    анкета_id INT NOT NULL,
    openai_api_id INT NOT NULL,
    FOREIGN KEY (анкета_id) REFERENCES Анкета(id),
    FOREIGN KEY (openai_api_id) REFERENCES OpenAI_API(id)
);

-- Таблиця "НавчальнийМодуль"
CREATE TABLE НавчальнийМодуль (
    id INT PRIMARY KEY AUTO_INCREMENT,
    назва VARCHAR(150) NOT NULL,
    опис TEXT,
    тривалість INT NOT NULL CHECK (тривалість > 0)
);

-- Таблиця "Доступ"
CREATE TABLE Доступ (
    id INT PRIMARY KEY AUTO_INCREMENT,
    статус VARCHAR(50) NOT NULL CHECK (статус REGEXP '^(активний|неактивний)$'),
-- Для атрибуту статус Регулярний вираз '^(активний|неактивний)$' обмежує значення поля до допустимих варіантів: "активний" або "неактивний".
    дата_надання DATE NOT NULL,
    танцівник_id INT NOT NULL,
    FOREIGN KEY (танцівник_id) REFERENCES Танцівник(id)
);

-- Таблиця "Повідомлення"
CREATE TABLE Повідомлення (
    id INT PRIMARY KEY AUTO_INCREMENT,
    текст TEXT NOT NULL,
    дата_надсилання DATETIME NOT NULL,
    доступ_id INT NOT NULL,
    FOREIGN KEY (доступ_id) REFERENCES Доступ(id)
);

-- Таблиця "OpenAI API"
CREATE TABLE OpenAI_API (
    id INT PRIMARY KEY AUTO_INCREMENT,
    API VARCHAR(255) NOT NULL
);

-- Таблиця "Психолог"
CREATE TABLE Психолог (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ім'я VARCHAR(100) NOT NULL,
    напрям_роботи VARCHAR(150),
    досвід_роботи INT CHECK (досвід_роботи >= 0),
    танцівник_id INT NOT NULL,
    FOREIGN KEY (танцівник_id) REFERENCES Танцівник(id)
);
