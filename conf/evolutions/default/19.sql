# --- !Ups
INSERT INTO "APP"."INFERIOR_INSTANCE_PROFILE_STATUS" ("ID", "STATUS") VALUES (5, 'Pendiente de borrado en instancia superior');
INSERT INTO "APP"."INFERIOR_INSTANCE_PROFILE_STATUS" ("ID", "STATUS") VALUES (6, 'Borrado en instancia superior');

# --- !Downs
DELETE FROM "APP"."INFERIOR_INSTANCE_PROFILE_STATUS" WHERE "ID" = 5;
DELETE FROM "APP"."INFERIOR_INSTANCE_PROFILE_STATUS" WHERE "ID" = 6;