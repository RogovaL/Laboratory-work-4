-- Drop tables if they exist to reset the schema
DROP TABLE IF EXISTS "Psyholog" CASCADE;
DROP TABLE IF EXISTS "OpenAI_API" CASCADE;
DROP TABLE IF EXISTS "Povidomlennya" CASCADE;
DROP TABLE IF EXISTS "Dostup" CASCADE;
DROP TABLE IF EXISTS "NavchalnyyModul" CASCADE;
DROP TABLE IF EXISTS "Zvit" CASCADE;
DROP TABLE IF EXISTS "Anketa" CASCADE;
DROP TABLE IF EXISTS "Dancivnyk" CASCADE;

-- Create Dancivnyk table
CREATE TABLE "Dancivnyk" (
    "dancivnyk_id" SERIAL PRIMARY KEY,
    "imya" VARCHAR(100) NOT NULL,
    "vik" INT NOT NULL CHECK ("vik" > 0)
);

-- Create Anketa table
CREATE TABLE "Anketa" (
    "anketa_id" SERIAL PRIMARY KEY,
    "psyhologichnyy_stan" VARCHAR(255) NOT NULL,
    "data_zapovnennya" DATE NOT NULL,
    "dancivnyk_id" INT NOT NULL,
    FOREIGN KEY ("dancivnyk_id") REFERENCES "Dancivnyk" ("dancivnyk_id")
);

-- Create Zvit table
CREATE TABLE "Zvit" (
    "zvit_id" SERIAL PRIMARY KEY,
    "rezultat_analizu" TEXT NOT NULL,
    "rekomendatsiyi" TEXT,
    "data_stvorennya" DATE NOT NULL,
    "anketa_id" INT NOT NULL,
    "openai_api_id" INT NOT NULL,
    FOREIGN KEY ("anketa_id") REFERENCES "Anketa" ("anketa_id"),
    FOREIGN KEY ("openai_api_id") REFERENCES "OpenAI_API" ("openai_api_id")
);

-- Create NavchalnyyModul table
CREATE TABLE "NavchalnyyModul" (
    "modul_id" SERIAL PRIMARY KEY,
    "nazva" VARCHAR(150) NOT NULL,
    "opys" TEXT,
    "tryvalist" INT NOT NULL CHECK ("tryvalist" > 0)
);

-- Create Dostup table
CREATE TABLE "Dostup" (
    "dostup_id" SERIAL PRIMARY KEY,
    "status" VARCHAR(50) NOT NULL CHECK (
        "status" IN ('aktyvnyy', 'neaktyvnyy')
    ),
    "data_nadannya" DATE NOT NULL,
    "dancivnyk_id" INT NOT NULL,
    FOREIGN KEY ("dancivnyk_id") REFERENCES "Dancivnyk" ("dancivnyk_id")
);

-- Create Povidomlennya table
CREATE TABLE "Povidomlennya" (
    "povidomlennya_id" SERIAL PRIMARY KEY,
    "tekst" TEXT NOT NULL,
    "data_nadslannya" TIMESTAMP NOT NULL,
    "dostup_id" INT NOT NULL,
    FOREIGN KEY ("dostup_id") REFERENCES "Dostup" ("dostup_id")
);

-- Create OpenAI_API table
CREATE TABLE "OpenAI_API" (
    "openai_api_id" SERIAL PRIMARY KEY,
    "api_key" VARCHAR(255) NOT NULL
);

-- Create Psyholog table
CREATE TABLE "Psyholog" (
    "psyholog_id" SERIAL PRIMARY KEY,
    "imya" VARCHAR(100) NOT NULL,
    "napryam_roboti" VARCHAR(150),
    "dosvid_roboti" INT CHECK ("dosvid_roboti" >= 0),
    "dancivnyk_id" INT NOT NULL,
    FOREIGN KEY ("dancivnyk_id") REFERENCES "Dancivnyk" ("dancivnyk_id")
);
