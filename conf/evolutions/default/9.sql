# --- !Ups

ALTER TABLE "APP"."PROFILE_DATA" DROP CONSTRAINT "PROFILE_DATA_INTERNAL_SAMPLE_CODE_KEY";
CREATE UNIQUE INDEX "PROFILE_DATA_INTERNAL_SAMPLE_CODE_KEY" ON "APP"."PROFILE_DATA" ("INTERNAL_SAMPLE_CODE") WHERE "DELETED" = FALSE;

# --- !Downs

DELETE
  FROM "APP"."PROFILE_DATA"
  WHERE "ID" IN (SELECT "ID"
                FROM "APP"."PROFILE_DATA"
                WHERE "INTERNAL_SAMPLE_CODE" IN (SELECT "INTERNAL_SAMPLE_CODE"
                                        FROM "APP"."PROFILE_DATA"
                                        GROUP BY "INTERNAL_SAMPLE_CODE"
                                        HAVING COUNT("INTERNAL_SAMPLE_CODE") > 1));


DROP INDEX "APP"."PROFILE_DATA_INTERNAL_SAMPLE_CODE_KEY";

ALTER TABLE "APP"."PROFILE_DATA"
  ADD CONSTRAINT "PROFILE_DATA_INTERNAL_SAMPLE_CODE_KEY" UNIQUE("INTERNAL_SAMPLE_CODE");