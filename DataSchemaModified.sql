-- Table "Dancer"
CREATE TABLE Dancer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL CHECK (name REGEXP '^[A-Za-z\\s]+$'),
    age INT NOT NULL CHECK (age > 0)
);

-- Table "Questionnaire"
CREATE TABLE Questionnaire (
    id INT PRIMARY KEY AUTO_INCREMENT,
    psychological_condition VARCHAR(255) NOT NULL,
    filling_date DATE NOT NULL,
    dancer_id INT NOT NULL,
    FOREIGN KEY (dancer_id) REFERENCES Dancer(id)
);

-- Table "Report"
CREATE TABLE Report (
    id INT PRIMARY KEY AUTO_INCREMENT,
    analysis_result TEXT NOT NULL,
    recommendations TEXT,
    creation_date DATE NOT NULL,
    questionnaire_id INT NOT NULL,
    openai_api_id INT NOT NULL,
    FOREIGN KEY (questionnaire_id) REFERENCES Questionnaire(id),
    FOREIGN KEY (openai_api_id) REFERENCES OpenAI_API(id)
);

-- Table "TrainingModule"
CREATE TABLE TrainingModule (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    duration INT NOT NULL CHECK (duration > 0)
);

-- Table "Access"
CREATE TABLE Access (
    id INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(50) NOT NULL CHECK (status REGEXP '^(active|inactive)$'),
    grant_date DATE NOT NULL,
    dancer_id INT NOT NULL,
    FOREIGN KEY (dancer_id) REFERENCES Dancer(id)
);

-- Table "Message"
CREATE TABLE Message (
    id INT PRIMARY KEY AUTO_INCREMENT,
    text TEXT NOT NULL,
    sending_date DATETIME NOT NULL,
    access_id INT NOT NULL,
    FOREIGN KEY (access_id) REFERENCES Access(id)
);

-- Table "OpenAI API"
CREATE TABLE OpenAI_API (
    id INT PRIMARY KEY AUTO_INCREMENT,
    api_key VARCHAR(255) NOT NULL
);

-- Table "Psychologist"
CREATE TABLE Psychologist (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    work_area VARCHAR(150),
    work_experience INT CHECK (work_experience >= 0),
    dancer_id INT NOT NULL,
    FOREIGN KEY (dancer_id) REFERENCES Dancer(id)
);
