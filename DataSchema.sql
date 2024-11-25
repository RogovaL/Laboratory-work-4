CREATE TABLE Dancer (
    id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE Survey (
    id INT PRIMARY KEY,
    psychological_type VARCHAR(255),
    completion_date DATE NOT NULL,
    dancer_id INT NOT NULL,
    FOREIGN KEY (dancer_id) REFERENCES Dancer(id)
);

CREATE TABLE Report (
    id INT PRIMARY KEY,
    result TEXT NOT NULL,
    recommendation TEXT,
    creation_date DATE NOT NULL,
    survey_id INT NOT NULL,
    FOREIGN KEY (survey_id) REFERENCES Survey(id)
);

CREATE TABLE Course (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    duration INT NOT NULL
);

CREATE TABLE Access (
    id INT PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    granted_date DATE NOT NULL,
    dancer_id INT NOT NULL,
    FOREIGN KEY (dancer_id) REFERENCES Dancer(id)
);

CREATE TABLE Notification (
    id INT PRIMARY KEY,
    message TEXT NOT NULL,
    sent_date DATE NOT NULL,
    access_id INT NOT NULL,
    FOREIGN KEY (access_id) REFERENCES Access(id)
);

CREATE TABLE Psychologist (
    id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    specialization VARCHAR(255),
    experience INT NOT NULL,
    dancer_id INT NOT NULL,
    FOREIGN KEY (dancer_id) REFERENCES Dancer(id)
);
