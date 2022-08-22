# --- !Ups

CREATE TABLE   "APP"."CONNECTION"
(
  "ID" bigserial,
  "NAME" character varying(200) NOT NULL,
  "URL" character varying(200) NOT NULL,
  "DELETED" boolean NOT NULL DEFAULT false,
  CONSTRAINT "APP_CONNECTION_ID_PKEY" PRIMARY KEY ("ID"),
  CONSTRAINT "APP_CONNECTION_NAME_UK" UNIQUE ("NAME")
);

CREATE TABLE "APP"."CATEGORY_MAPPING"
(
  "ID" varchar(50),
  "ID_SUPERIOR" varchar(50),
  CONSTRAINT "APP_CATEGORY_MAPPING_ID_PKEY" PRIMARY KEY ("ID"),
  CONSTRAINT "APP_CATEGORY_MAPPING_FK" FOREIGN KEY ("ID")
  REFERENCES "APP"."CATEGORY" ("ID")
);

CREATE TABLE   "APP"."INSTANCE_STATUS"
(
  "ID" bigserial,
  "STATUS" character varying(200) NOT NULL,
  CONSTRAINT "INSTANCE_STATUS_ID_PKEY" PRIMARY KEY ("ID"),
  CONSTRAINT "APP_INFERIOR_INSTANCE_STATUS_UK" UNIQUE ("STATUS")
);

INSERT INTO "APP"."INSTANCE_STATUS" ("ID", "STATUS") VALUES (1, 'Pendiente');
INSERT INTO "APP"."INSTANCE_STATUS" ("ID", "STATUS") VALUES (2, 'Aprobada');
INSERT INTO "APP"."INSTANCE_STATUS" ("ID", "STATUS") VALUES (3, 'Desaprobada');

CREATE TABLE   "APP"."INFERIOR_INSTANCE"
(
  "ID" bigserial,
  "URL" character varying(200) NOT NULL,
  "LABORATORY" VARCHAR(50) NOT NULL,
  "STATUS" bigint DEFAULT 1,
  CONSTRAINT "APP_INFERIOR_INSTANCE_ID_PKEY" PRIMARY KEY ("ID"),
  CONSTRAINT "APP_INFERIOR_INSTANCE_URL_UK" UNIQUE ("URL"),
  CONSTRAINT "APP_INFERIOR_INSTANCE_LABORATORY_UK" UNIQUE ("LABORATORY"),
  CONSTRAINT "APP_INFERIOR_INSTANCE_STATUS_FK" FOREIGN KEY ("STATUS") REFERENCES "APP"."INSTANCE_STATUS" ("ID")
);

CREATE TABLE "APP"."EXTERNAL_PROFILE_DATA"
(
  "ID" bigserial,
  "LABORATORY_INSTANCE_ORIGIN" TEXT NOT NULL,
  "LABORATORY_INSTANCE_INMEDIATE" TEXT NOT NULL,
  CONSTRAINT "EXTERNAL_PROFILE_DATA_PKEY" PRIMARY KEY ("ID")
);

CREATE TABLE "APP"."SUPERIOR_INSTANCE_PROFILE_APPROVAL"
(
  "ID" bigserial,
  "GLOBAL_CODE" VARCHAR(100) NOT NULL
    CONSTRAINT "SUPERIOR_INSTANCE_PROFILE_APPROVAL_CODE_KEY"
    UNIQUE,
  "PROFILE" TEXT NOT NULL,
  "LABORATORY" VARCHAR(50) NOT NULL,
  "LABORATORY_INSTANCE_ORIGIN" VARCHAR(50) NOT NULL,
  "LABORATORY_INSTANCE_INMEDIATE" VARCHAR(50) NOT NULL,
  "SAMPLE_ENTRY_DATE" DATE,
  "RECEPTION_DATE" TIMESTAMP DEFAULT NOW(),
  "ERRORS" TEXT,
  CONSTRAINT "SUPERIOR_INSTANCE_PROFILE_APPROVAL_ID_PKEY" PRIMARY KEY ("ID")
);

# --- !Downs

DROP TABLE "APP"."CONNECTION";
DROP TABLE "APP"."CATEGORY_MAPPING";
DROP TABLE "APP"."INFERIOR_INSTANCE";
DROP TABLE "APP"."INSTANCE_STATUS";
DROP TABLE "APP"."EXTERNAL_PROFILE_DATA";
DROP TABLE "APP"."SUPERIOR_INSTANCE_PROFILE_APPROVAL";
