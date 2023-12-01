CREATE TABLE "planets"(
    "id" SERIAL NOT NULL,
    "planet_name" TEXT NOT NULL,
    "orbital_period_in_years" DOUBLE PRECISION NOT NULL,
    "orbits around" TEXT NOT NULL,
    "galaxy" BIGINT NOT NULL
);
ALTER TABLE
    "planets" ADD PRIMARY KEY("id");
CREATE TABLE "galaxies"(
    "id" SERIAL NOT NULL,
    "galaxy_name" TEXT NOT NULL
);
ALTER TABLE
    "galaxies" ADD PRIMARY KEY("id");
CREATE TABLE "moons"(
    "id" SERIAL NOT NULL,
    "moon_name" TEXT NOT NULL,
    "host_planet" BIGINT NOT NULL
);
ALTER TABLE
    "moons" ADD PRIMARY KEY("id");
ALTER TABLE
    "moons" ADD CONSTRAINT "moons_host_planet_foreign" FOREIGN KEY("host_planet") REFERENCES "planets"("id");
ALTER TABLE
    "planets" ADD CONSTRAINT "planets_galaxy_foreign" FOREIGN KEY("galaxy") REFERENCES "galaxies"("id");