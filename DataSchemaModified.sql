-- Table "Dancer"
CREATE TABLE dancer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL CHECK (name ~ '^[A-Za-z\\s]+$'),
    age INT NOT NULL CHECK (age > 0)
);

-- Table "Questionnaire"
CREATE TABLE questionnaire (
    id SERIAL PRIMARY KEY,
    psychological_condition VARCHAR(255) NOT NULL,
    filling_date DATE NOT NULL,
    dancer_id INT NOT NULL,
    FOREIGN KEY (dancer_id) REFERENCES dancer(id) ON DELETE CASCADE
);

-- Table "Report"
CREATE TABLE report (
    id SERIAL PRIMARY KEY,
    analysis_result TEXT NOT NULL,
    recommendations TEXT,
    creation_date DATE NOT NULL,
    questionnaire_id INT NOT NULL,
    openai_api_id INT NOT NULL,
    FOREIGN KEY (questionnaire_id) REFERENCES questionnaire(id) ON DELETE CASCADE,
    FOREIGN KEY (openai_api_id) REFERENCES openai_api(id) ON DELETE CASCADE
);

-- Table "TrainingModule"
CREATE TABLE training_module (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    duration INT NOT NULL CHECK (duration > 0)
);

-- Table "Access"
CREATE TABLE access_entry (
    id SERIAL PRIMARY KEY,
    status VARCHAR(50) NOT NULL CHECK (status ~ '^(active|inactive)$'),
    grant_date DATE NOT NULL,
    dancer_id INT NOT NULL,
    FOREIGN KEY (dancer_id) REFERENCES dancer(id) ON DELETE CASCADE
);

-- Table "Message"
CREATE TABLE message (
    id SERIAL PRIMARY KEY,
    text TEXT NOT NULL,
    sending_date TIMESTAMP NOT NULL,
    access_id INT NOT NULL,
    FOREIGN KEY (access_id) REFERENCES access_entry(id) ON DELETE CASCADE
);

-- Table "OpenAI_API"
CREATE TABLE openai_api (
    id SERIAL PRIMARY KEY,
    api_key VARCHAR(255) NOT NULL
);

-- Table "Psychologist"
CREATE TABLE psychologist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL CHECK (name ~ '^[A-Za-z\\s]+$'),
    work_area VARCHAR(150),
    work_experience INT CHECK (work_experience >= 0),
    dancer_id INT NOT NULL,
    FOREIGN KEY (dancer_id) REFERENCES dancer(id) ON DELETE CASCADE
);
