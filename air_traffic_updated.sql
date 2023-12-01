DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE "departures"(
    "id" SERIAL PRIMARY KEY,
    "time" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);

CREATE TABLE "arrivals"(
    "id" SERIAL PRIMARY KEY,
    "time" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);

CREATE TABLE "countries"(
    "id" SERIAL PRIMARY KEY,
    "country_name" TEXT NOT NULL FOREIGN KEY REFERENCES "cities"("country")
);

CREATE TABLE "ticket_holders"(
    "id" SERIAL PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "airline" BIGINT NOT NULL FOREIGN KEY REFERENCES "airline"("id"),
    "departing_from" BIGINT NOT NULL FOREIGN KEY REFERENCES "cities"("id"),
    "departure_time" BIGINT NOT NULL FOREIGN KEY REFERENCES "departures"("id"),
    "arrival_to" BIGINT NOT NULL FOREIGN KEY REFERENCES "cities"("id"),
    "arrival_time" BIGINT NOT NULL FOREIGN KEY REFERENCES "arrivals"("id"),
    "seat" BIGINT NOT NULL FOREIGN KEY REFERENCES "seat choices"("id")
);

CREATE TABLE "airline"(
    "id" SERIAL PRIMARY KEY,
    "airline_name" TEXT NOT NULL
);

CREATE TABLE "seat choices"(
    "id" SERIAL PRIMARY KEY,
    "seat_number" CHAR(255) NOT NULL,
    "plane" BIGINT NOT NULL
);

CREATE TABLE "cities"(
    "id" SERIAL PRIMARY KEY,
    "city_name" TEXT NOT NULL,
    "state/province_name" TEXT NOT NULL,
    "country" BIGINT NOT NULL
);