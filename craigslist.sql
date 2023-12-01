CREATE TABLE "location"(
    "id" SERIAL NOT NULL,
    "location" BIGINT NOT NULL
);
ALTER TABLE
    "location" ADD PRIMARY KEY("id");
CREATE TABLE "posts"(
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "user" BIGINT NOT NULL,
    "location" BIGINT NOT NULL,
    "region" BIGINT NOT NULL,
    "text" TEXT NOT NULL,
    "category" BIGINT NOT NULL
);
ALTER TABLE
    "posts" ADD PRIMARY KEY("id");
CREATE TABLE "region"(
    "id" SERIAL NOT NULL,
    "region" TEXT NOT NULL
);
ALTER TABLE
    "region" ADD PRIMARY KEY("id");
CREATE TABLE "users"(
    "id" SERIAL NOT NULL,
    "preferred_region" BIGINT NOT NULL,
    "username" BIGINT NOT NULL,
    "password" BIGINT NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_username_unique" UNIQUE("username");
CREATE TABLE "categories"(
    "id" SERIAL NOT NULL,
    "category_name" BIGINT NOT NULL
);
ALTER TABLE
    "categories" ADD PRIMARY KEY("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_location_foreign" FOREIGN KEY("location") REFERENCES "location"("id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_preferred_region_foreign" FOREIGN KEY("preferred_region") REFERENCES "region"("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_user_foreign" FOREIGN KEY("user") REFERENCES "users"("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_region_foreign" FOREIGN KEY("region") REFERENCES "region"("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_category_foreign" FOREIGN KEY("category") REFERENCES "categories"("id");