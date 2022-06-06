# --- !Ups
TRUNCATE "APP"."MUTATION_MODEL_KI";
ALTER TABLE "APP"."MUTATION_MODEL_KI" ALTER COLUMN "KI" TYPE DOUBLE PRECISION;

# --- !Downs
TRUNCATE "APP"."MUTATION_MODEL_KI";
ALTER TABLE "APP"."MUTATION_MODEL_KI" ALTER COLUMN "KI" TYPE NUMERIC(10, 8);

