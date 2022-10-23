
DROP TABLE IF EXISTS "Booking";

DROP TABLE IF EXISTS "Game_official";

DROP TABLE IF EXISTS "Trip";

DROP TABLE IF EXISTS "Location";

DROP TABLE IF EXISTS "City";

DROP TABLE IF EXISTS "Country";

DROP TABLE IF EXISTS "Maintenance";

DROP TABLE IF EXISTS "Vehicle";

DROP TABLE IF EXISTS "Driver";

DROP TABLE IF EXISTS "Language";

CREATE TABLE "Language"
(
	"value"              VARCHAR(2) NOT NULL,
	"Id"                 INTEGER NOT NULL,
	PRIMARY KEY ("Id")
);

CREATE TABLE "Driver"
(
	"Id"                 INTEGER NOT NULL,
	"name"               VARCHAR(20) NOT NULL,
	"license"            VARCHAR(18) NOT NULL,
	"clearance_level"    INTEGER NOT NULL,
	"FATL"               VARCHAR(20) NULL,
	"FATL_date"          DATE NULL,
	"STLVT"              VARCHAR(20) NULL,
	"STLVT_date"         DATE NULL,
	"STLVT_cetifying_authority" VARCHAR(20) NULL,
	"Language_Id"        INTEGER NOT NULL,
	PRIMARY KEY ("Id"),
	CONSTRAINT "R_5" FOREIGN KEY ("Language_Id") REFERENCES "Language" ("Id")
);

CREATE TABLE "Vehicle"
(
	"Id"                 INTEGER NOT NULL,
	"color"              VARCHAR(20) NOT NULL,
	"model"              VARCHAR(20) NOT NULL,
	"capacity"           INTEGER NOT NULL,
	"odometer"           INTEGER NOT NULL,
	"Manufacturer"       VARCHAR(20) NOT NULL,
	"available"          BIT NOT NULL,
	"Registration_Id"    VARCHAR(20) NULL,
	"Driver_Id"          INTEGER NULL,
	PRIMARY KEY ("Id"),
	CONSTRAINT "R_16" FOREIGN KEY ("Driver_Id") REFERENCES "Driver" ("Id")
);

CREATE TABLE "Maintenance"
(
	"Id"                 INTEGER NOT NULL,
	"type"               VARCHAR(20) NOT NULL,
	"date"               DATE NOT NULL,
	"description"        LONG VARCHAR NOT NULL,
	"cost"               INTEGER NOT NULL,
	"Vehicle_Id"         INTEGER NOT NULL,
	PRIMARY KEY ("Id"),
	CONSTRAINT "R_11" FOREIGN KEY ("Vehicle_Id") REFERENCES "Vehicle" ("Id")
);

CREATE TABLE "Country"
(
	"Id"                 INTEGER NOT NULL,
	"name"               VARCHAR(20) NOT NULL,
	"Language_Id"        INTEGER NOT NULL,
	PRIMARY KEY ("Id"),
	CONSTRAINT "R_10" FOREIGN KEY ("Language_Id") REFERENCES "Language" ("Id")
);

CREATE TABLE "City"
(
	"Id"                 INTEGER NOT NULL,
	"name"               VARCHAR(20) NOT NULL,
	"County_Id"          INTEGER NOT NULL,
	PRIMARY KEY ("Id"),
	CONSTRAINT "R_18" FOREIGN KEY ("County_Id") REFERENCES "Country" ("Id")
);

CREATE TABLE "Location"
(
	"Id"                 INTEGER NOT NULL,
	"address"            VARCHAR(20) NULL,
	"street_number"      INTEGER NULL,
	"type"               VARCHAR(20) NULL,
	"City_Id"            INTEGER NULL,
	PRIMARY KEY ("Id"),
	CONSTRAINT "R_11" FOREIGN KEY ("City_Id") REFERENCES "City" ("Id")
);

CREATE TABLE "Trip"
(
	"Id"                 INTEGER NOT NULL,
	"start_time"         DATE NOT NULL,
	"end_time"           DATE NULL,
	"start_odometer"     INTEGER NOT NULL,
	"end_odometer"       INTEGER NULL,
	"Pickup_location_Id" INTEGER NULL,
	"Drop_off_location_Id" INTEGER NULL,
	PRIMARY KEY ("Id"),
	CONSTRAINT "R_13" FOREIGN KEY ("Pickup_location_Id") REFERENCES "Location" ("Id"),
	CONSTRAINT "R_14" FOREIGN KEY ("Drop_off_location_Id") REFERENCES "Location" ("Id")
);

CREATE TABLE "Game_official"
(
	"Id"                 INTEGER NOT NULL,
	"name"               VARCHAR(20) NOT NULL,
	"role"               VARCHAR(20) NOT NULL,
	"Language_Id"        INTEGER NOT NULL,
	"Incheon_based_city_id" INTEGER NULL,
	"Country_Id"         INTEGER NULL,
	PRIMARY KEY ("Id"),
	CONSTRAINT "R_13" FOREIGN KEY ("Language_Id") REFERENCES "Language" ("Id"),
	CONSTRAINT "R_15" FOREIGN KEY ("Country_Id") REFERENCES "Country" ("Id")
);

CREATE TABLE "Booking"
(
	"Id"                 INTEGER NOT NULL,
	"number"             INTEGER NOT NULL,
	"Trip_Id"            INTEGER NOT NULL,
	"Vehicle_Id"         INTEGER NOT NULL,
	"Driver_Id"          INTEGER NOT NULL,
	"Game_official_Id"   INTEGER NOT NULL,
	PRIMARY KEY ("Id"),
	CONSTRAINT "R_12" FOREIGN KEY ("Trip_Id") REFERENCES "Trip" ("Id"),
	CONSTRAINT "R_15" FOREIGN KEY ("Vehicle_Id") REFERENCES "Vehicle" ("Id"),
	CONSTRAINT "R_16" FOREIGN KEY ("Driver_Id") REFERENCES "Driver" ("Id"),
	CONSTRAINT "R_17" FOREIGN KEY ("Game_official_Id") REFERENCES "Game_official" ("Id")
);
