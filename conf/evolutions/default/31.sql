# --- !Ups
ALTER TABLE "APP"."CATEGORY" ADD COLUMN "TYPE" SMALLINT NOT NULL DEFAULT '1';

# --- !Downs
ALTER TABLE "APP"."CATEGORY" DROP COLUMN "TYPE";
