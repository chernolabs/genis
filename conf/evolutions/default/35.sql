# --- !Ups
UPDATE "APP"."BATCH_PROTO_PROFILE" SET "LABEL" = '' WHERE "LABEL" IS NULL;
# --- !Downs