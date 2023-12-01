CREATE TABLE "goals"(
    "id" SERIAL NOT NULL,
    "game" BIGINT NOT NULL,
    "player" BIGINT NOT NULL,
    "goals_scored" BIGINT NOT NULL
);
ALTER TABLE
    "goals" ADD PRIMARY KEY("id");
CREATE TABLE "players"(
    "id" BIGINT NOT NULL,
    "player_name" TEXT NOT NULL,
    "team" BIGINT NOT NULL,
    "league" BIGINT NOT NULL
);
ALTER TABLE
    "players" ADD PRIMARY KEY("id");
CREATE TABLE "games"(
    "id" SERIAL NOT NULL,
    "team1" BIGINT NOT NULL,
    "team2" BIGINT NOT NULL,
    "date" DATE NOT NULL
);
ALTER TABLE
    "games" ADD PRIMARY KEY("id");
CREATE TABLE "game referees"(
    "id" SERIAL NOT NULL,
    "game_id" BIGINT NOT NULL,
    "referee_id" BIGINT NOT NULL
);
ALTER TABLE
    "game referees" ADD PRIMARY KEY("id");
CREATE TABLE "leagues"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL
);
ALTER TABLE
    "leagues" ADD PRIMARY KEY("id");
CREATE TABLE "referees"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "referees" ADD PRIMARY KEY("id");
CREATE TABLE "teams"(
    "id" BIGINT NOT NULL,
    "name" BIGINT NOT NULL,
    "league" BIGINT NOT NULL,
    "ranking_within_league" BIGINT NOT NULL
);
ALTER TABLE
    "teams" ADD PRIMARY KEY("id");
ALTER TABLE
    "teams" ADD CONSTRAINT "teams_league_foreign" FOREIGN KEY("league") REFERENCES "leagues"("id");
ALTER TABLE
    "players" ADD CONSTRAINT "players_team_foreign" FOREIGN KEY("team") REFERENCES "teams"("id");
ALTER TABLE
    "goals" ADD CONSTRAINT "goals_game_foreign" FOREIGN KEY("game") REFERENCES "games"("id");
ALTER TABLE
    "teams" ADD CONSTRAINT "teams_name_foreign" FOREIGN KEY("name") REFERENCES "games"("team2");
ALTER TABLE
    "game referees" ADD CONSTRAINT "game referees_referee_id_foreign" FOREIGN KEY("referee_id") REFERENCES "referees"("id");
ALTER TABLE
    "goals" ADD CONSTRAINT "goals_player_foreign" FOREIGN KEY("player") REFERENCES "players"("id");
ALTER TABLE
    "teams" ADD CONSTRAINT "teams_name_foreign" FOREIGN KEY("name") REFERENCES "games"("team1");
ALTER TABLE
    "game referees" ADD CONSTRAINT "game referees_game_id_foreign" FOREIGN KEY("game_id") REFERENCES "games"("id");
ALTER TABLE
    "players" ADD CONSTRAINT "players_league_foreign" FOREIGN KEY("league") REFERENCES "leagues"("id");