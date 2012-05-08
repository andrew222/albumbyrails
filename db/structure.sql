CREATE TABLE "albums" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "album_id" integer, "photo_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "album_name" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "upload_photos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "description" text, "photoURL" varchar(255), "albumBelongTo" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120312033004');

INSERT INTO schema_migrations (version) VALUES ('20120313052652');

INSERT INTO schema_migrations (version) VALUES ('20120313075437');