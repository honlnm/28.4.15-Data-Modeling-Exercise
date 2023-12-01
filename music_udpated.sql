DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE "calendar"(
    "id" SERIAL PRIMARY KEY,
    "date" DATE NOT NULL
);

CREATE TABLE "songs"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "duration_in_seconds" BIGINT NOT NULL,
    "release_date" BIGINT NOT NULL FOREIGN KEY REFERENCES "calendar"("id"),
    "album" BIGINT NOT NULL
);

CREATE TABLE "artists"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NULL
);

CREATE TABLE "artist_songs"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "artist_id" BIGINT NOT NULL FOREIGN KEY REFERENCES "artists"("id"),
    "song_id" BIGINT NOT NULL FOREIGN KEY REFERENCES "songs"("id")
);

CREATE TABLE "producers"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "producer_songs"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "producer_id" BIGINT NOT NULL FOREIGN KEY REFERENCES "producers"("id"),
    "song_id" BIGINT NOT NULL FOREIGN KEY REFERENCES "songs"("id")
);