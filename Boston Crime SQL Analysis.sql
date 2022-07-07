/****** Script for SelectTopNRows command from SSMS  ******/

--Viewing the Data 
SELECT *
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$'];


--Finding number of shootings by Year and Category
SELECT 
[Shooting Category], 
count([Shooting Category]) as shootings,
Year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
where [Shooting category] != ('Zero')
group by Year, [Shooting Category]
Order by year DESC;


--Finding the number of Shootings Total by Year 
Select 
count([Shooting Category]) as shootings,
Year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
where [Shooting category] != ('Zero')
group by Year
Order by year DESC;

--Code Testing
--SELECT INCIDENT_NUMBER, [Shooting Category], YEAR 
--FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
--Where Year = 2015 and [Shooting Category] != ('Zero')
--Order by Year ASC;

--select [Shooting Category] as Category, Year
--FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
--Where Year = 2015 and [Shooting Category] = ('One')
--Order by Year ASC;


--Probability of a shooting in an incident 
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




--finding average growth rate for shootings 
declare @Last Float = 627;
declare @First Float = 251;
declare @ans1 Float = @Last/@First;
declare @exp Float = .2;
declare @one Float = 1;
declare @ans2 Float = Power(@ans1,@exp)
select @ans2 - @one as Avg_Growth_Rate



--Viewing the number of incidents over time  
-- Crime Count by Year
SELECT count(INCIDENT_NUMBER) as number_crimes, Year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Group By Year
Order by Year ASC;

--crime Count by Month
SELECT count(INCIDENT_NUMBER) as number_crimes, Month, Year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Group By Month, Year
Order by Year, Month ASC;

--Crime for each day of the week by year
SELECT count(INCIDENT_NUMBER) as number_crimes, DAY_OF_WEEK,Year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
--where DAY_OF_WEEK = 'Friday'
Group By DAY_OF_WEEK,YEAR
Order By Year ASC, number_crimes DESC;

--Rolling Crime Count by Occurred Date for every month 
SELECT count(INCIDENT_NUMBER) over (Partition by Month Order by OCCURRED_ON_DATE) as RollingCrimeCount, Month, OCCURRED_ON_DATE
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Group by OCCURRED_ON_DATE,Month, INCIDENT_NUMBER
Order by OCCURRED_ON_DATE ASC;


--Find that the worst year of crime came in 2017. Finding out why.
Select Top 15 OFFENSE_CODE_GROUP, count(OFFENSE_CODE_GROUP) as Count, year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
where Year = 2017
Group by OFFENSE_CODE_GROUP, Year
Order by Year ASC, Count DESC;

--Finding top crime codes from 2015 to 2020
Select OFFENSE_CODE, count(OFFENSE_CODE) as Count, year
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Group by OFFENSE_CODE, Year
Having count(OFFENSE_CODE) > 2000
Order by Year ASC, Count DESC;



--Top 10 Worst Districts involving crime
Select Top 10 DISTRICT, Count(District) as number_of_crimes
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Where DISTRICT <> 'n/a'
Group by District
Order by number_of_crimes DESC;

--top 10 district to live in 
Select Top 10 DISTRICT, Count(District) as number_of_crimes
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Where DISTRICT <> 'n/a'
Group by District
Order by number_of_crimes ASC;

--Top 10 Worst Districts with corresponding Reporting Area

Select Top 10 DISTRICT, REPORTING_AREA, Count(District) as number_of_crimes
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
--9999 is a false area in place of n/a to keep format int
Where REPORTING_AREA != 9999 and DISTRICT <> 'n/a'
Group by District, REPORTING_AREA
Order by number_of_crimes DESC;

--Top 10 WORST Streets to live on in Boston
Select Top 10 STREET,Count(STREET) as number_of_crimes
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
Where STREET <> 'n/a'
Group by STREET
Order by number_of_crimes DESC;

--Top 10 BEST Streets to live on in Boston
Select Top 10 STREET,Count(STREET) as number_of_crimes
FROM [Boston Crime Project].[dbo].['Boston Crime Dataset (updated J$']
--removing non-values and involving best 5 districts to live in
Where STREET <> 'n/a' and DISTRICT in ('External','A15','A7','E5','E13') 
Group by STREET
Order by number_of_crimes ASC;

--note: There are 300 streets with only one crime from 2015-2020. Therefore top 10 streets are not in any particular order.
--Chose top 10 simply for analysis 

 