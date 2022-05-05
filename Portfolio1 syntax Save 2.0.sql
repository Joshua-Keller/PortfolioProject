--Covid 19 Data Analysis 

--Skills performed: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types 

select * from PortfolioProject..CovidDeaths
where continent is not null
order by 3, 4;

--Selecting the data that we are going to start with

select Location, Date, Total_cases, New_cases, Total_deaths, Population
from PortfolioProject..CovidDeaths
where Continent is not null
order by 1,2;

--Total Cases vs Total Deaths 
--Shows likelihood of dying if you contract covid in your Country

select Location, Date, Total_cases, Total_deaths, (Total_deaths/Total_cases) * 100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%States%'
and continent is not null
order by 1,2;

--Total Cases vs Population
--Shows what percentage of population became infected with Covid

select Location, Date, Population, Total_cases, (Total_cases/Population) * 100 as PercentofPopulationInfected
from PortfolioProject..CovidDeaths
--where location like '%States%'
where continent is not null
order by 1,2; 


--Countries with Highest Infection Rate Compared to Population 

select location, Population, Max(Total_cases) as HighestInfectionCount, Max((Total_cases/Population)) * 100 as PercentofPopulationInfected
from PortfolioProject..CovidDeaths
--where location like '%States%'
where continent is not null
Group by Location, Population
order by PercentofPopulationInfected DESC;



--Countries with the Highest Death Count per Population

select location, max(cast(Total_Deaths as int)) as totalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%States%'
where continent is not null
Group by location
order by TotalDeathCount DESC;


--BREAKING ANALYSIS DOWN BY CONTINENT 

--Showing Continents with Highest Death Count per Population 

select location, max(cast(Total_Deaths as int)) as totalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%States%'
where continent is null
and location not in ('World', 'High income', 'Upper middle income', 'Lower middle income', 'Low income', 'International')
Group by Location
order by TotalDeathCount DESC;

--Global Numbers in Three Versions 

--1. Total of reported cases

select sum(new_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths, (sum(cast(new_deaths as int))/sum(new_cases))*100 as DeathPercentage
from PortfolioProject..CovidDeaths
--where location like '%States%'
where continent is not null
--Group by Date
order by 1,2;

--or

--2. Running count of reported cases by date

select date, sum(new_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths, (sum(cast(new_deaths as int))/sum(new_cases))*100 as DeathPercentage
from PortfolioProject..CovidDeaths
--where location like '%States%'
where continent is not null
Group by Date
order by 1,2;

--or

--3. Reported total cases within data 

Select Location
,Max(total_cases) as Total_Cases
,Max(cast(total_deaths as int)) as Total_Deaths,
(Max(cast(total_deaths as int)) / Max(total_cases))*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location = 'world'
Group by location;


--Total Population vs Vaccinations
--Percentage of population that has received at least one Covid Vaccine

select DEA.Continent
, DEA.Location
, DEA.Date
, DEA.Population
, VAC.New_vaccinations
, SUM(Cast(VAC.New_vaccinations as bigint)) 
over (Partition by DEA.Location Order by DEA.Location, cast(DEA.Date as datetime)) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths DEA
Join PortfolioProject..CovidVaccinations VAC
	on DEA.Location = VAC.Location 
	and DEA.Date = VAC.Date
where DEA.Continent is not null
Order by 2,3;


--Using CTE to perform Calculations on Partition By in Previous Query 

with PopvsVac(continent, location, date, population, New_Vaccinations, RollingPeopleVaccinated)
as
( 
Select DEA.Continent, DEA.Location, DEA.Date, DEA.Population, VAC.new_vaccinations
, SUM(Cast(VAC.New_vaccinations as bigint)) over (Partition by DEA.Location Order by DEA.Location, cast(DEA.Date as datetime))as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths DEA
Join PortfolioProject..CovidVaccinations VAC
	on DEA.Location = VAC.Location 
	and DEA.Date = VAC.Date
where DEA.Continent is not null
--Order by 2,3 
)
Select *, (RollingPeopleVaccinated/Population) * 100 as RollingPercentageVaccinations
From PopvsVac;


--Using Temp Table to Perform Calculation on Partition By in Previous Query

Drop table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
( 
Continent Nvarchar(255),
Location Nvarchar(255),
Date datetime, 
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)
Insert into #PercentPopulationVaccinated
Select DEA.Continent, DEA.Location, DEA.Date, DEA.Population, VAC.new_vaccinations
, SUM(Cast(VAC.New_vaccinations as bigint)) over (Partition by DEA.Location Order by DEA.Location, cast(DEA.Date as datetime)) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths DEA
Join PortfolioProject..CovidVaccinations VAC
	on DEA.Location = VAC.Location 
	and DEA.Date = VAC.Date
where DEA.Continent is not null
--Order by 2,3 
Select *, (RollingPeopleVaccinated/Population) * 100 
From #PercentPopulationVaccinated;


--Creating View to Store Data for Later Visualizations 

Create View PercentPopulationVaccinated as 
select DEA.Continent, DEA.Location, DEA.Date, DEA.Population, VAC.new_vaccinations
, SUM(Cast(VAC.New_vaccinations as bigint)) over (Partition by DEA.Location Order by DEA.Location, cast(DEA.Date as datetime)) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths DEA
Join PortfolioProject..CovidVaccinations VAC
	on DEA.Location = VAC.Location 
	and DEA.Date = VAC.Date
where DEA.Continent is not null;