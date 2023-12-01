DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE "planets"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "planet_name" TEXT NOT NULL,
    "orbital_period_in_years" DOUBLE PRECISION NOT NULL,
    "orbits around" TEXT NOT NULL,
    "galaxy" BIGINT NOT NULL FOREIGN KEY REFERENCES "galaxies"("id")
);

CREATE TABLE "galaxies"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "galaxy_name" TEXT NOT NULL
);

CREATE TABLE "moons"(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "moon_name" TEXT NOT NULL,
    "host_planet" BIGINT NOT NULL FOREIGN KEY REFERENCES "planets"("id")
);