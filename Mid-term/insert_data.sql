INSERT INTO [Language] (Id, value) VALUES
( 
	(SELECT max("Id") FROM [Language])+ 1,
	'FR'
),( 
	(SELECT max("Id") FROM [Language])+ 1,
	'KR'
),( 
	(SELECT max("Id") FROM [Language])+ 1,
	'EN'
);

INSERT INTO [Driver] VALUES
( 
	(SELECT max("Id") FROM [Driver])+ 1,
	'kim Soyeon',
	'200324581245860429',
	1,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	(SELECT "Id" from [Language] where value = "KR")
),(
	(SELECT max("Id") FROM [Driver])+ 1,
	'Smith Sam',
	'200324581245860429',
	1,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	(SELECT "Id" from [Language] where value = "EN")
),(
	(SELECT max("Id") FROM [Driver])+ 1,
	'Lee Jimin',
	'200324581245860429',
	1,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	(SELECT "Id" from [Language] where value = "KR")
);

INSERT INTO [Vehicle] (Id, Registration_Id, color, model, capacity, odometer, Manufacturer, available, Driver_Id) VALUES
( 
	(SELECT max("Id") FROM [Vehicle])+ 1,
	'2020 DCF',
	'Blue',
	'K7',
	4,
	1209,
	'Kia',
	1,
	(SELECT "Id" from [Driver] where name = "kim Soyeon")
),( 
	(SELECT max("Id") FROM [Vehicle])+ 1,
	'2021 AHR',
	'White',
	'model 3',
	4,
	304,
	'Tesla',
	1,
	(SELECT "Id" from [Driver] where name = "Smith Sam")
),( 
	(SELECT max("Id") FROM [Vehicle])+ 1,
	'2022 AFC',
	'Orange',
	'capture',
	4,
	842,
	'renault',
	0,
	(SELECT "Id" from [Driver] where name = "Lee Jimin")
);

INSERT INTO [Maintenance] (Id, type, date, description, cost, Vehicle_Id) VALUES
( 
	(SELECT max("Id") FROM [Maintenance])+ 1,
	'M',
	'2022-07-18',
	'Car review',
	150000,
	(SELECT "Id" from [Vehicle] where Registration_Id = "2022 AFC")
);

INSERT INTO [Country] VALUES
( 
	(SELECT max("Id") FROM [Country])+ 1,
	'Korea',
	(SELECT "Id" from [Language] where value = "KR")
),( 
	(SELECT max("Id") FROM [Country])+ 1,
	'USA',
	(SELECT "Id" from [Language] where value = "EN")
),( 
	(SELECT max("Id") FROM [Country])+ 1,
	'France',
	(SELECT "Id" from [Language] where value = "FR")
);

INSERT INTO [City] VALUES
( 
	(SELECT max("Id") FROM [City])+ 1,
	'Seoul',
	(SELECT "Id" from [Country] where name = "Korea")
),( 
	(SELECT max("Id") FROM [City])+ 1,
	'Incheon',
	(SELECT "Id" from [Country] where name = "Korea")
);

INSERT INTO [Location] VALUES
( 
	(SELECT max("Id") FROM [Location])+ 1,
	'address Hotel',
	204,
	'Hotel',
	(SELECT "Id" from [City] where name = "Incheon")
),( 
	(SELECT max("Id") FROM [Location])+ 1,
	'address Hotel2',
	505,
	'Hotel2',
	(SELECT "Id" from [City] where name = "Seoul")
),( 
	(SELECT max("Id") FROM [Location])+ 1,
	'address airport',
	104,
	'Airport',
	(SELECT "Id" from [City] where name = "Incheon")
),( 
	(SELECT max("Id") FROM [Location])+ 1,
	'address Aquatic Center',
	104,
	'Aquatic Center',
	(SELECT "Id" from [City] where name = "Incheon")
);

INSERT INTO [Trip] VALUES
( 
	(SELECT max("Id") FROM [Trip])+ 1,
	'2022-07-18 15:12:48',
	'2022-07-18 16:07:24',
	304,
	324,
	(SELECT "Id" from [Location] where type = "Airport"),
	(SELECT "Id" from [Location] where type = "Hotel")
);

INSERT INTO [Game_official] VALUES
(
	(SELECT max("Id") FROM [Game_official])+ 1,
	'Yeon Ki-yeon',
	'coach',
	(SELECT "Id" from [Language] where value = "KR"),
	(SELECT "Id" from [Country] where name = "Korea"),
	13
),(
	(SELECT max("Id") FROM [Game_official])+ 1,
	'Harry Eden',
	'judge',
	(SELECT "Id" from [Language] where value = "EN"),
	(SELECT "Id" from [Country] where name = "USA"),
	7
);
