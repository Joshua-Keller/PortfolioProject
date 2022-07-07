/******  

-- All code Used for Visualizations in Power BI

******/


--1. Finding number of shootings by Year and Category

SELECT 
[Shooting Category], 
count([Shooting Category]) as shootings,
Year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
where [Shooting category] != ('Zero')
group by Year, [Shooting Category]
Order by year DESC;



--2. Probability of a shooting in an incident 
with percentShooting (shootings,TotalIncidents)
as
( Select 
count([Shooting Category]) as shootings, 
(select count(INCIDENT_NUMBER) as TotalIncidents 
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
)
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
where [Shooting category] != ('Zero'))
Select *,(cast( shootings as Float)/ cast( TotalIncidents as Float)) as Probability_of_Shooting_In_Incident
from percentShooting;


--3. Viewing the Number of Incidents Over Time 

--crime Count by Month
SELECT count(INCIDENT_NUMBER) as number_incidents, Month, Year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Group By Month, Year
Order by Year, Month ASC;

--Crime for each day of the week by year
SELECT count(INCIDENT_NUMBER) as number_incidents, DAY_OF_WEEK,Year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
--where DAY_OF_WEEK = 'Friday'
Group By DAY_OF_WEEK,YEAR
Order By Year ASC, number_incidents DESC;



--4. Find that the worst year of crime came in 2017. Finding out why.
Select Top 15 OFFENSE_CODE_GROUP, count(OFFENSE_CODE_GROUP) as Count, year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
where Year = 2017
Group by OFFENSE_CODE_GROUP, Year
Order by Year ASC, Count DESC;


--5. Finding top crime codes from 2015 to 2020
Select OFFENSE_CODE, count(OFFENSE_CODE) as Count, year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Group by OFFENSE_CODE, Year
Having count(OFFENSE_CODE) > 2000
Order by Year ASC, Count DESC;


--6. Area overview for Boston


--All Districts involving crime
Select DISTRICT, Count(District) as number_of_incidents
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Where DISTRICT <> 'n/a'
Group by District
Order by number_of_incidents DESC;

--top 10 district to live in 
Select Top 10 DISTRICT, Count(District) as number_of_incidents
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Where DISTRICT <> 'n/a'
Group by District
Order by number_of_incidents ASC;

--Top 10 Worst Districts with corresponding Reporting Area

Select Top 10 DISTRICT, REPORTING_AREA, Count(District) as number_of_incidents
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
--9999 is a false area in place of n/a to keep format int
Where REPORTING_AREA != 9999 and DISTRICT <> 'n/a'
Group by District, REPORTING_AREA
Order by number_of_incidents DESC;

--Top 10 WORST Streets to live on in Boston
Select Top 10 STREET,Count(STREET) as number_of_incidents
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Where STREET <> 'n/a'
Group by STREET
Order by number_of_incidents DESC;

--Top 10 BEST Streets to live on in Boston
Select Top 10 STREET,Count(STREET) as number_of_incidents
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
--removing non-values and involving best 5 districts to live in
Where STREET <> 'n/a' and DISTRICT in ('External','A15','A7','E5','E13') 
Group by STREET
Order by number_of_incidents ASC;

--note: There are 300 streets with only one crime from 2015-2020. Therefore top 10 streets are not in any particular order.
--Chose top 10 simply for analysis 

 