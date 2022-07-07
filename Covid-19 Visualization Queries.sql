
--Queries Used in Tableau Project 


--1. 


select sum(new_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths, (sum(cast(new_deaths as int))/sum(new_cases))*100 as DeathPercentage
from PortfolioProject..CovidDeaths
--where location like '%States%'
where continent is not null
--Group by Date
order by 1,2;


--2. 


select location,
max(cast(Total_Deaths as int)) as totalDeathCount
from PortfolioProject..CovidDeaths
where continent is null
and location not in
('World',
'European Union',
'International',
'High income',
'Upper middle income',
'Lower middle income',
'Low income')
Group by Location
order by TotalDeathCount DESC;


--3. 


select location, Population
, Max(Total_cases) as HighestInfectionCount
, Max((Total_cases/Population)) * 100 as PercentofPopulationInfected
from PortfolioProject..CovidDeaths
Group by Location, Population
order by PercentofPopulationInfected DESC;


--4.


select location, Population, Date
, Max(Total_cases) as HighestInfectionCount
, Max((Total_cases/Population)) * 100 as PercentofPopulationInfected
from PortfolioProject..CovidDeaths
Group by Location, Population, Date
order by PercentofPopulationInfected DESC;