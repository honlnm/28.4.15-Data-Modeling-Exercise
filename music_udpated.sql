CREATE TABLE "calendar"(
    "id" SERIAL NOT NULL,
    "date" DATE NOT NULL
);
ALTER TABLE
    "calendar" ADD PRIMARY KEY("id");
CREATE TABLE "songs"(
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "duration_in_seconds" BIGINT NOT NULL,
    "release_date" BIGINT NOT NULL,
    "album" BIGINT NOT NULL
);
ALTER TABLE
    "songs" ADD PRIMARY KEY("id");
CREATE TABLE "artists"(
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NULL
);
ALTER TABLE
    "artists" ADD PRIMARY KEY("id");
CREATE TABLE "artist_songs"(
    "id" SERIAL NOT NULL,
    "artist_id" BIGINT NOT NULL,
    "song_id" BIGINT NOT NULL
);
ALTER TABLE
    "artist_songs" ADD PRIMARY KEY("id");
CREATE TABLE "producers"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "producers" ADD PRIMARY KEY("id");
CREATE TABLE "producer_songs"(
    "id" SERIAL NOT NULL,
    "producer_id" BIGINT NOT NULL,
    "song_id" BIGINT NOT NULL
);
ALTER TABLE
    "producer_songs" ADD PRIMARY KEY("id");
ALTER TABLE
    "artist_songs" ADD CONSTRAINT "artist_songs_song_id_foreign" FOREIGN KEY("song_id") REFERENCES "songs"("id");
ALTER TABLE
    "songs" ADD CONSTRAINT "songs_release_date_foreign" FOREIGN KEY("release_date") REFERENCES "calendar"("id");
ALTER TABLE
    "producer_songs" ADD CONSTRAINT "producer_songs_song_id_foreign" FOREIGN KEY("song_id") REFERENCES "songs"("id");
ALTER TABLE
    "producer_songs" ADD CONSTRAINT "producer_songs_producer_id_foreign" FOREIGN KEY("producer_id") REFERENCES "producers"("id");
ALTER TABLE
    "artist_songs" ADD CONSTRAINT "artist_songs_artist_id_foreign" FOREIGN KEY("artist_id") REFERENCES "artists"("id");