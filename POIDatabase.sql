/*
 * Senior Design Team 13
 * POIDatabase.sql
 * Boeing AR App
 * POI Database Implementation 
 */

 SET sql_mode = STRICT_ALL_TABLES;

 DROP TABLE IF EXISTS Border, City, Province, Country;


Airport(Airport_Code, Airport_Name, City, State)
Flight(Flight_Code, Departure_City, Departure_State, Arrival_City, Arrival_State)
City(City_Name, State_Name)
PointOfInterest(POI_Code, POI_Name, POI_City, POI_State, POI_Lat, POI_Long, POI_Description)

CREATE TABLE City (
	City_Name VARCHAR(60),
	State_Name VARCHAR(60),
	PRIMARY KEY (City_Name, State_Name)
);

CREATE TABLE Airport (
	Airport_Code INT,
	Airport_Name VARCHAR(60),
	City VARCHAR(60),
	State VARCHAR(60),
	PRIMARY KEY (Airport_Code), 
	FOREIGN KEY (City, State) REFERENCES City(City_Name, State_Name)
);

CREATE TABLE Flight (
	Flight_Code INT,
	Departure_City VARCHAR(60),
	Departure_State VARCHAR(60),
	Arrival_City VARCHAR(60),
	Arrival_State VARCHAR(60),
	PRIMARY KEY (Flight_Code),
	FOREIGN KEY (Departure_City, Departure_State) REFERENCES City(City_Name, State_Name),
	FOREIGN KEY (Arrival_City, Arrival_State) REFERENCES City(City_Name, State_Name)
);

CREATE TABLE PointOfInterest (
	POI_Code INT,
	POI_Name VARCHAR(60),
	POI_City VARCHAR(60),
	POI_State VARCHAR(60),
	POI_Lat DECIMAL(9,6),
	POI_Long DECIMAL(9,6),
	POI_Description VARCHAR(250),
	PRIMARY KEY (POI_Code),
	FOREIGN KEY (POI_City, POI_State) REFERENCES City(City_Name, State_Name)
);