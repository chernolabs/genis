# --- !Ups
create table "APP"."MUTATION_MODEL_TYPE"
(
  "ID" bigserial,
  "DESCRIPTION" text not null,
  primary key ("ID")
);
create table "APP"."MUTATION_MODEL"
(
  "ID" bigserial not null,
  "NAME" text not null,
  "MUTATION_MODEL_TYPE" BIGINT not null,
  "ACTIVE" BOOLEAN not null,
  "IGNORE_SEX" BOOLEAN not null,
  primary key ("ID"),
  CONSTRAINT "MUTATION_MODEL_FK" FOREIGN KEY ("MUTATION_MODEL_TYPE")
  REFERENCES "APP"."MUTATION_MODEL_TYPE" ("ID")
);

INSERT INTO "APP"."MUTATION_MODEL_TYPE" ("ID","DESCRIPTION") VALUES (1,'Equal');
INSERT INTO "APP"."MUTATION_MODEL_TYPE" ("ID","DESCRIPTION") VALUES (2,'Stepwise');
INSERT INTO "APP"."MUTATION_MODEL_TYPE" ("ID","DESCRIPTION") VALUES (3,'Stepwise extended');

create table "APP"."MUTATION_MODEL_PARAMETER"
(
  "ID" bigserial not null,
  "ID_MUTATION_MODEL" BIGINT not null,
  "LOCUS" character varying(50) not null,
  "SEX" VARCHAR(1) not null,
  "MUTATION_RATE" numeric(10,8),
  "MUTATION_RANGE" numeric(10,8),
  "MUTATION_RATE_MICROVARIANT" numeric(10,8),
  primary key ("ID"),
  CONSTRAINT "MUTATION_MODEL_PARAMETERS_FK" FOREIGN KEY ("ID_MUTATION_MODEL")
  REFERENCES "APP"."MUTATION_MODEL" ("ID"),
  CONSTRAINT "MUTATION_MODEL_PARAMETERS_UK" UNIQUE ("ID_MUTATION_MODEL","LOCUS","SEX"),
  CONSTRAINT "MUTATION_MODEL_PARAMETERS_FK2" FOREIGN KEY ("LOCUS")
  REFERENCES "APP"."LOCUS" ("ID")
);

CREATE INDEX "MUTATION_MODEL_PARAMETERS_IDX1" ON "APP"."MUTATION_MODEL_PARAMETER" ("ID_MUTATION_MODEL");

create table "APP"."MUTATION_MODEL_KI"
(
  "ID" bigserial not null,
  "ID_MUTATION_MODEL_PARAMETER" BIGINT not null,
  "ALLELE" double precision NOT NULL,
  "KI" numeric(10,8) NOT NULL,
  primary key ("ID"),
  CONSTRAINT "MUTATION_MODEL_KI_FK" FOREIGN KEY ("ID_MUTATION_MODEL_PARAMETER")
  REFERENCES "APP"."MUTATION_MODEL_PARAMETER" ("ID")
);
CREATE INDEX "MUTATION_MODEL_KI_IDX1" ON "APP"."MUTATION_MODEL_KI" ("ID_MUTATION_MODEL_PARAMETER");

create table "APP"."MUTATION_DEFAULT_PARAMETER"
(
  "ID" bigserial not null,
  "LOCUS" character varying(50) not null,
  "SEX" VARCHAR(1) not null,
  "MUTATION_RATE" numeric(10,8) NOT NULL,
  primary key ("ID")
);

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('CSF1PO','F','0.0003');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('CSF1PO','M','0.0015');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('CSF1PO','I','0.0016');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('FGA','F','0.0005');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('FGA','M','0.0032');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('FGA','I','0.0028');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('TH01','F','0.00009');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('TH01','M','0.00009');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('TH01','I','0.0001');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('TPOX','F','0.00004');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('TPOX','M','0.00012');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('TPOX','I','0.0001');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('vWA','F','0.0003');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('vWA','M','0.0017');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('vWA','I','0.0017');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D3S1358','F','0.00015');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D3S1358','M','0.0013');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D3S1358','I','0.0012');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D5S818','F','0.00025');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D5S818','M','0.0012');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D5S818','I','0.0011');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D7S820','F','0.00013');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D7S820','M','0.0012');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D7S820','I','0.0010');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D8S1179','F','0.0002');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D8S1179','M','0.0016');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D8S1179','I','0.0014');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D13S317','F','0.0004');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D13S317','M','0.0014');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D13S317','I','0.0014');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D16S539','F','0.0003');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D16S539','M','0.0011');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D16S539','I','0.0011');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D18S51','F','0.0006');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D18S51','M','0.0022');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D18S51','I','0.0022');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D21S11','F','0.0011');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D21S11','M','0.0015');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D21S11','I','0.0019');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('PentaD','F','0.0006');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('PentaD','M','0.0009');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('PentaD','I','0.0014');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('PentaE','F','0.00065');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('PentaE','M','0.00135');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('PentaE','I','0.0016');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D2S1338','F','0.00021');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D2S1338','M','0.0010');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D2S1338','I','0.0012');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D19S433','F','0.0005');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D19S433','M','0.00075');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('D19S433','I','0.0011');

INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('ACTBP2','F','0.0030');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('ACTBP2','M','0.0064');
INSERT INTO "APP"."MUTATION_DEFAULT_PARAMETER" ("LOCUS", "SEX", "MUTATION_RATE") VALUES ('ACTBP2','I','0.0064');

create table "APP"."LOCUS_ALLELE"
(
  "ID" bigserial not null,
  "LOCUS" character varying(50) not null,
  "ALLELE" double precision NOT NULL,
  primary key ("ID")
);
# --- !Downs
DROP TABLE IF EXISTS  "APP"."MUTATION_MODEL_KI";
DROP TABLE IF EXISTS  "APP"."MUTATION_MODEL_PARAMETER";
DROP TABLE IF EXISTS  "APP"."MUTATION_MODEL";
DROP TABLE IF EXISTS  "APP"."MUTATION_MODEL_TYPE";
DROP TABLE IF EXISTS  "APP"."MUTATION_DEFAULT_PARAMETER";
DROP TABLE IF EXISTS  "APP"."LOCUS_ALLELE";