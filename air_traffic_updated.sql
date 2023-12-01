CREATE TABLE "departures"(
    "id" SERIAL NOT NULL,
    "time" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "departures" ADD PRIMARY KEY("id");
CREATE TABLE "arrivals"(
    "id" SERIAL NOT NULL,
    "time" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "arrivals" ADD PRIMARY KEY("id");
CREATE TABLE "countries"(
    "id" SERIAL NOT NULL,
    "country_name" TEXT NOT NULL
);
ALTER TABLE
    "countries" ADD PRIMARY KEY("id");
CREATE TABLE "ticket_holders"(
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "airline" BIGINT NOT NULL,
    "departing_from" BIGINT NOT NULL,
    "departure_time" BIGINT NOT NULL,
    "arrival_to" BIGINT NOT NULL,
    "arrival_time" BIGINT NOT NULL,
    "seat" BIGINT NOT NULL
);
ALTER TABLE
    "ticket_holders" ADD PRIMARY KEY("id");
CREATE TABLE "airline"(
    "id" SERIAL NOT NULL,
    "airline_name" TEXT NOT NULL
);
ALTER TABLE
    "airline" ADD PRIMARY KEY("id");
CREATE TABLE "seat choices"(
    "id" SERIAL NOT NULL,
    "seat_number" CHAR(255) NOT NULL,
    "plane" BIGINT NOT NULL
);
ALTER TABLE
    "seat choices" ADD PRIMARY KEY("id");
CREATE TABLE "cities"(
    "id" SERIAL NOT NULL,
    "city_name" TEXT NOT NULL,
    "state/province_name" TEXT NOT NULL,
    "country" BIGINT NOT NULL
);
ALTER TABLE
    "cities" ADD PRIMARY KEY("id");
ALTER TABLE
    "ticket_holders" ADD CONSTRAINT "ticket_holders_arrival_time_foreign" FOREIGN KEY("arrival_time") REFERENCES "arrivals"("id");
ALTER TABLE
    "ticket_holders" ADD CONSTRAINT "ticket_holders_departure_time_foreign" FOREIGN KEY("departure_time") REFERENCES "departures"("id");
ALTER TABLE
    "ticket_holders" ADD CONSTRAINT "ticket_holders_departing_from_foreign" FOREIGN KEY("departing_from") REFERENCES "cities"("id");
ALTER TABLE
    "ticket_holders" ADD CONSTRAINT "ticket_holders_seat_foreign" FOREIGN KEY("seat") REFERENCES "seat choices"("id");
ALTER TABLE
    "ticket_holders" ADD CONSTRAINT "ticket_holders_airline_foreign" FOREIGN KEY("airline") REFERENCES "airline"("id");
ALTER TABLE
    "countries" ADD CONSTRAINT "countries_country_name_foreign" FOREIGN KEY("country_name") REFERENCES "cities"("country");
ALTER TABLE
    "ticket_holders" ADD CONSTRAINT "ticket_holders_arrival_to_foreign" FOREIGN KEY("arrival_to") REFERENCES "cities"("id");