SELECT * FROM f1_cleaned;
SELECT COUNT(*) FROM f1_cleaned;

CREATE TABLE f1_dataset.f1_cleaned AS 
SELECT * FROM f1_dataset.results1;

#Obtain Columns from races1 table

ALTER TABLE f1_cleaned
ADD COLUMN year INT,
ADD COLUMN round INT,
ADD COLUMN name VARCHAR(255),
ADD COLUMN date DATE;

ALTER TABLE f1_cleaned
ADD COLUMN circuitId INT;


UPDATE f1_cleaned f
JOIN f1_dataset.races1 r ON f.raceId = r.raceId
SET f.year = r.year, f.round = r.round, f.name = r.name, f.date=r.date;

UPDATE f1_cleaned f
JOIN f1_dataset.races1 r ON f.raceId = r.raceId
SET f.circuitId = r.circuitId;


#MAtch Circuit ID with circuits1 table - Obtain Location and Country of Circuit 
ALTER TABLE f1_cleaned
ADD COLUMN location VARCHAR(255),
ADD COLUMN country VARCHAR(255);

UPDATE f1_cleaned f
JOIN f1_dataset.circuits1 c ON f.circuitId = c.circuitId
SET f.location = c.location, f.country=c.country;

#MAtch driverID to get driver name from drivers1, then CONCAT
ALTER TABLE f1_cleaned
ADD COLUMN driver_name VARCHAR(255),
ADD COLUMN dob DATE,
ADD COLUMN nationality VARCHAR(255);

UPDATE f1_cleaned f
JOIN f1_dataset.drivers1 d ON f.driverId = d.driverId
SET f.driver_name = concat(d.forename," ",d.surname), f.dob = d.dob, f.nationality = d.nationality;


#MAtch drivers id and race id to get points and wins column from driver_standings
ALTER TABLE f1_cleaned
ADD COLUMN points INT,
ADD COLUMN wins INT;

UPDATE f1_cleaned f
JOIN f1_dataset.driver_standings ds ON f.driverId = ds.driverId AND f.raceId = ds.raceId
SET f.points = ds.points, f.wins = ds.wins; 

############ continue here lol 
#These selected rows are all NULL because they failed to earn any points
SELECT *
FROM f1_cleaned
WHERE wins IS NULL AND points IS NULL;

#Changed all NULL to 0 
UPDATE f1_cleaned
SET wins=0, points=0
WHERE wins is NULL and points is NULL;

####################################

#MAtch constructor Id to get the team nane
ALTER TABLE f1_cleaned
ADD COLUMN team_name VARCHAR(255);

UPDATE f1_cleaned f
JOIN f1_dataset.constructors c ON f.constructorId = c.constructorId 
SET f.team_name = c.name;

#Match constructor Id to get constructor points
ALTER TABLE f1_cleaned
ADD COLUMN team_points INT;

UPDATE f1_cleaned f
JOIN f1_dataset.constructor_results cr ON f.constructorId = cr.constructorId AND f.raceId = cr.raceId
SET f.team_points = cr.points;

############

UPDATE f1_cleaned t
JOIN f1_dataset.races1 r ON t.raceID = r.raceID
JOIN f1_dataset.circuits1 c ON r.circuitID = c.circuitID
SET t.year = r.year,
    t.round = r.round,
    t.circuitId = c.circuitID,
    t.name = c.name;
    
ALTER TABLE f1_cleaned
ADD COLUMN driver_name VARCHAR(255),
ADD COLUMN dob VARCHAR(255),
ADD COLUMN nationality VARCHAR(255);

UPDATE f1_cleaned t
JOIN f1_dataset.drivers1 d ON t.driverID = d.driverId
SET t.driver_name = d.driverRef,
    t.dob = d.dob,
    t.nationality = d.nationality;
    
ALTER TABLE f1_cleaned
ADD COLUMN driver_name VARCHAR(255);

UPDATE f1_cleaned t
JOIN f1_dataset.drivers1 d ON t.driverID = d.driverId
SET t.driver_name = CONCAT(d.forename, ' ', d.surname);
    
ALTER TABLE f1_cleaned
ADD COLUMN constructorId VARCHAR(255);

UPDATE f1_cleaned t
JOIN f1.results1 r ON t.driverID = r.driverID
SET t.constructorId = r.constructorId;

ALTER TABLE f1_cleaned
ADD COLUMN team_name VARCHAR(255);

#
UPDATE f1_cleaned t
JOIN f1.constructors c ON t.constructorID = c.constructorID
SET t.team_name = c.name;


#Select 2024 Drivers Only
SELECT DISTINCT driver_name FROM f1_cleaned
WHERE year = "2024";

SELECT 
    driver_name,
    CASE 
        WHEN driver_name = 'Max Verstappen' THEN 'https://cdn.racingnews365.com/Riders/Verstappen/_570x570_crop_center-center_none/f1_2024_mv_red_lg.png?v=1708703879'
        WHEN driver_name = 'Sergio Pérez' THEN 'hhttps://cdn.racingnews365.com/Riders/Perez/_570x570_crop_center-center_none/f1_2024_sp_red_lg.png?v=1708703879'
        WHEN driver_name = 'Carlos Sainz' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Charles Leclerc' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'George Russell' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Lando Norris' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Lewis Hamilton' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Oscar Piastri' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Fernando Alonso' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Lance Stroll' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Guanyu Zhou' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Kevin Magnussen' THEN 'https://example.com/charles-leclerc'
		WHEN driver_name = 'Daniel Ricciardo' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Yuki Tsunoda' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Alexander Albon' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Nico Hülkenberg' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Esteban Ocon' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Pierre Gasly' THEN 'https://example.com/charles-leclerc'
		WHEN driver_name = 'Valtteri Bottas' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Logan Sargeant' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Oliver Bearman' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Franco Colapinto' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Liam Lawson' THEN 'https://example.com/charles-leclerc'
        WHEN driver_name = 'Jack Doohan' THEN 'https://example.com/charles-leclerc'
        ELSE NULL
    END AS driver_url
FROM 
    f1_dataset
WHERE 
    year = '2024';
    
    
