-- Using the two datasets: US population by counties for year 2000 and year 2010,
-- it was discovered that the number of counties for both years differ by 2 (year 2000 = 3141 and year 2010 = 3143)
-- The goal is to find the differing counties in both years
-- I used full outer join, NULL function and AND and OR operation to achieve my goal
-- This code counts the differences in both counties

SELECT 
COUNT (p2010.geo_name) AS count_year_2010_counties,
COUNT (p2000.geo_name) AS count_year_2000_counties
FROM
us_counties_2010 p2010
FULL OUTER JOIN
us_counties_2000 p2000
ON
p2010.state_fips = p2000.state_fips
AND 
p2010.county_fips = p2000.county_fips
WHERE 
p2000.county_fips IS NULL
OR
p2010.county_fips IS NULL;

-- From this code, I discovered that 6 counties in year 2010 were not found in year 2000
---while 4 counties in year 2000 were not in year 2010 bringing the difference to 2 counties.
--This code lists the names of the missing counties on both tables.

SELECT 
p2010.geo_name AS year_2010_counties,
p2000.geo_name AS year_2000_counties
FROM
us_counties_2010 p2010
FULL OUTER JOIN
us_counties_2000 p2000
ON
p2010.state_fips = p2000.state_fips
AND 
p2010.county_fips = p2000.county_fips
WHERE 
p2000.county_fips IS NULL
OR
p2010.county_fips IS NULL;
