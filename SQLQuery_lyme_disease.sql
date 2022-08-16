-- Staging tables: 
--[LD Case Counts by County]
--Incidence_Rate
--Lyme disease incidence_ categories 
--Public_Use_Ixodes_County_Table_2018
--Public_Use_Ixodes_County_Table_2019
--Public_Use_Ixodes_County_Table_2020
--Public_Use_Ixodes_County_Table_2021
--State 
--County
--counties_pcpn
--temperature

select * from [LD Case Counts by County]
select * from Public_Use_Ixodes_County_Table_2018 
select * from Public_Use_Ixodes_County_Table_2019
select * from Public_Use_Ixodes_County_Table_2020
select * from Public_Use_Ixodes_County_Table_2021
select * from state
select * from county
select * from incidence_Rate
select * from counties_pcpn
select * from temperature



---create a year demention table 
create table Year (
YearID int not null primary key,
Year int not null
);

--create sequnce
create sequence Year_id_seq
start with 1
increment by 1;

insert into year (YearID, Year)
Values (next value for Year_id_seq, 2000)

insert into year (YearID, Year)
Values (next value for Year_id_seq, 2001)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2002)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2003)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2004)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2005)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2006)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2007)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2008)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2009)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2010)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2011)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2012)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2013)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2014)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2015)

insert into year (YearID, Year)
Values (next value for Year_id_seq, 2016)

insert into year (YearID, Year)
Values (next value for Year_id_seq, 2017)

insert into year (YearID, Year)
Values (next value for Year_id_seq, 2018)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2019)

insert into year (YearID, Year)
Values (next value for Year_id_seq, 2020)
insert into year (YearID, Year)
Values (next value for Year_id_seq, 2021)

select * from year

--- month 
Create table Month (
MonthID int not null primary key,
Month Varchar (25) not null);

insert into Month (MonthID, Month)
values (1, 'January')
insert into Month (MonthID, Month)
values (2, 'February')
insert into Month (MonthID, Month)
values (3, 'March')
insert into Month (MonthID, Month)
values (4, 'April')
insert into Month (MonthID, Month)
values (5, 'May')
insert into Month (MonthID, Month)
values (6, 'June')
insert into Month (MonthID, Month)
values (7, 'July')
insert into Month (MonthID, Month)
values (8, 'August')
insert into Month (MonthID, Month)
values (9, 'September')
insert into Month (MonthID, Month)
values (10, 'October')
insert into Month (MonthID, Month)
values (11, 'November')
insert into Month (MonthID, Month)
values (12, 'December')

select * from month


---- Season
Create table Season (
SeasonID int not null primary key,
Season Varchar (25) not null);

insert into Season (SeasonID, Season)
values (1, 'Spring')
insert into Season (SeasonID, Season)
values (2, 'Summer')
insert into Season (SeasonID, Season)
values (3, 'Fall')
insert into Season (SeasonID, Season)
values (4, 'Winter')

select * from season

-----------------------data transformation--------------------------------------

---Create the fact table - 'Incidence'------------------------------------

-- first create a temporary table
select State.StateCode, County.CountyCode,Cases2010, Cases2011, Cases2012, Cases2013, Cases2014, Cases2015, Cases2016, Cases2017, 
Cases2018, Cases2019 into Incidence_temp
from [LD Case Counts by County] 
join State on State.State=[LD Case Counts by County].Stname
join County on County.County=[LD Case Counts by County].Ctyname 
where County.State= [LD Case Counts by County].Stname

select * from incidence_temp

--decompose the table by each year and update the data in each new table
-- for year 2010
select StateCode, CountyCode, Cases2010, Year  into incidence_2010
from incidence_temp
select * from incidence_2010

update incidence_2010
set year=2010

--for year 2011
select StateCode, CountyCode, Cases2011, Year  into incidence_2011
from incidence_temp
select * from incidence_2011

update incidence_2011
set year=2011

--for 2012
select StateCode, CountyCode, Cases2012, Year  into incidence_2012
from incidence_temp
select * from incidence_2012

update incidence_2012
set year=2012

--for 2013
select StateCode, CountyCode, Cases2013, Year  into incidence_2013
from incidence_temp
select * from incidence_2013

update incidence_2013
set year=2013

--for year 2014
select StateCode, CountyCode, Cases2014, Year  into incidence_2014
from incidence_temp
select * from incidence_2014

update incidence_2014
set year=2014

--year 2015
select StateCode, CountyCode, Cases2015, Year  into incidence_2015
from incidence_temp
select * from incidence_2015

update incidence_2015
set year=2015

-- for year 2016
select StateCode, CountyCode, Cases2016, Year  into incidence_2016
from incidence_temp
select * from incidence_2016

update incidence_2016
set year=2016

-- for year 2017
select StateCode, CountyCode, Cases2017, Year  into incidence_2017
from incidence_temp
select * from incidence_2017

update incidence_2017
set year=2017

-- for year 2018
select StateCode, CountyCode, Cases2018, Year  into incidence_2018
from incidence_temp

update incidence_2018
set year=2018
select * from incidence_2018

-- for year 2019
select StateCode, CountyCode, Cases2019, Year  into incidence_2019
from incidence_temp

update incidence_2019
set year=2019
select * from incidence_2019

--- combining all years data using union

select * into IncidenceByYear
from incidence_2010
union all 
select * from incidence_2011
union all
select * from incidence_2012
union all 
select * from incidence_2013
union all
select * from incidence_2014
union all 
select * from incidence_2015
union all
select * from incidence_2016
union all 
select * from incidence_2017
union all
select * from incidence_2018
union all 
select * from incidence_2019

-- create the fact table incidence

select IncidenceByYear.StateCode, IncidenceByYear.CountyCode, Year.YearID,IncidenceByYear.NumOfCases, 
incidence_rate.IncidenceRate, [Lyme disease incidence_ categories].Incidence_category
into Incidence
from IncidenceByYear
JOIN State on state.stateCode = IncidenceByYear.StateCode
JOIN Year on Year.Year = IncidenceByYear.Year
left Join incidence_rate on incidence_rate.state=state.state and incidence_rate.year = Year.year
left join [Lyme disease incidence_ categories] on incidence_rate.state=[Lyme disease incidence_ categories].state


-- add 'StateID', 'CountyCode','year' as foreign key constraints to the Incidence table

alter table Incidence
add foreign key (YearID) REFERENCES Year(YearID);

alter table Incidence
add foreign key (StateCode) REFERENCES State(StateCode);

alter table Incidence
add foreign key (CountyCode) REFERENCES County(CountyCode);

----------create indexes 
CREATE INDEX county_idx
ON incidence (CountyCode);

CREATE INDEX NumofCases_idx
ON incidence (NumOfCases);

CREATE INDEX IncidenceRate_idx
ON incidence (IncidenceRate);


select * from incidence



---- the fact table 'IxodesTransmission-------


--keep data consistant for the state column


--create table  IxodesTransmission for 2021 data
Select State.StateCode, County.CountyCode, Ixodes_scapularis_County_Status, Ixodes_pacificus_county_Status
into  IxodesTransmission_2021
from Public_Use_Ixodes_County_Table_2021
join State on Public_Use_Ixodes_County_Table_2021.State=State.Initial 
join County on County.County=Public_Use_Ixodes_County_Table_2021.County and County.State=State.state
order by State.StateCode

Alter table IxodesTransmission_2021
ADD Year numeric; 
update  IxodesTransmission_2021
set Year=2021

select * from  IxodesTransmission_2021

-- add 2020 data into IxodesTransmission_2020
Select State.StateCode, County.CountyCode, Ixodes_scapularis_County_Status, Ixodes_pacificus_county_Status
into  IxodesTransmission_2020
from Public_Use_Ixodes_County_Table_2020
join State on Public_Use_Ixodes_County_Table_2020.State=State.Initial 
join County on County.County=Public_Use_Ixodes_County_Table_2020.County and County.State=State.state
order by State.StateCode

Alter table IxodesTransmission_2020
ADD Year numeric; 
update  IxodesTransmission_2020
set Year=2020

select * from  IxodesTransmission_2020

-- add 2019 data into IxodesTransmission_2019
Select State.StateCode, County.CountyCode, Ixodes_scapularis_County_Status, Ixodes_pacificus_county_Status
into  IxodesTransmission_2019
from Public_Use_Ixodes_County_Table_2019
join State on Public_Use_Ixodes_County_Table_2019.State=State.Initial 
join County on County.County=Public_Use_Ixodes_County_Table_2019.County and County.State=State.state
order by State.StateCode


Alter table IxodesTransmission_2019
ADD Year numeric; 
update  IxodesTransmission_2019
set Year=2019

select * from  IxodesTransmission_2019

-- add 2018 data into IxodesTransmission_2018
Select State.StateCode, County.CountyCode, Ixodes_scapularis_County_Status, Ixodes_pacificus_county_Status
into  IxodesTransmission_2018
from Public_Use_Ixodes_County_Table_2018
join State on Public_Use_Ixodes_County_Table_2018.State=State.Initial 
join County on County.County=Public_Use_Ixodes_County_Table_2018.County and County.State=State.state
order by State.StateCode

Alter table IxodesTransmission_2018
ADD Year numeric; 
update  IxodesTransmission_2018
set Year=2018

select * from  IxodesTransmission_2018

--create the fact table IxodesTransmission

select * into IxodesTransmission
from IxodesTransmission_2018
union all 
select * from IxodesTransmission_2019
union all
select * from IxodesTransmission_2020
union all 
select * from IxodesTransmission_2021 

select * from IxodesTransmission
order by Statecode

--add foreign key constraints on this fact table

Alter table IxodesTransmission
add foreign key (StateCode) references State (StateCode)

Alter table IxodesTransmission
add foreign key (CountyCode) references County (CountyCode)

Alter table IxodesTransmission
add foreign key (YearID) references Year (YearID)

----------create indexes on the foreign key
CREATE INDEX county_idx
ON IxodesTransmission (CountyCode);

select * from IxodesTransmission



---------Create the fact table 'EnviromentalFactor'---------------------------------------------------------

-- only 2010-2020 data will be needed for the analysis
delete FROM counties_pcpn
where year<2010


select * from counties_pcpn

-- Add new columns: MonthID and SeasonID into the staging table counties_pcpn 

alter table counties_pcpn
add MonthID int;
alter table counties_pcpn
add SeasonID int

UPDATE counties_pcpn
SET MonthID =1
UPDATE counties_pcpn
SET SeasonID =4

-- prepare the fact table: get state, county, year, monthid, seasonid and Jan data from the staging table 
select State, County, Year, MonthID, SeasonID, JAN AS Total_precipitation into temp1
from counties_pcpn


--get state, county, year, monthid, seasonid and FEB data from the staging table 
UPDATE counties_pcpn
SET MonthID =2
UPDATE counties_pcpn
SET SeasonID =4
DROP table temp2
select State, County, Year, MonthID, SeasonID, FEB AS Total_precipitation into temp2
from counties_pcpn

--get state, county, year, monthid, seasonid and Mar data from the staging table 
UPDATE counties_pcpn
SET MonthID =3

UPDATE counties_pcpn
SET SeasonID =1

select State, County, Year, MonthID, SeasonID, MAR AS Total_precipitation into temp3
from counties_pcpn

--get state, county, year, monthid, seasonid and Apr data from the staging table 

UPDATE counties_pcpn
SET MonthID =4

UPDATE counties_pcpn
SET SeasonID =1
DROP table temp2
select State, County, Year, MonthID, SeasonID, Apr AS Total_precipitation into temp4
from counties_pcpn

SELECT * FROM TEMP4


--get state, county, year, monthid, seasonid and May data from the staging table 
UPDATE counties_pcpn
SET MonthID =5

UPDATE counties_pcpn
SET SeasonID =1
DROP table temp2
select State, County, Year, MonthID, SeasonID, May AS Total_precipitation into temp5
from counties_pcpn

SELECT * FROM TEMP5


--get state, county, year, monthid, seasonid and Jun data from the staging table 
UPDATE counties_pcpn
SET MonthID =6

UPDATE counties_pcpn
SET SeasonID =2

select State, County, Year, MonthID, SeasonID, JUN AS Total_precipitation into temp6
from counties_pcpn

SELECT * FROM TEMP6

-- get state, county, year, monthid, seasonid and Jul data from the staging table 
UPDATE counties_pcpn
SET MonthID =7

UPDATE counties_pcpn
SET SeasonID =2

select State, County, Year, MonthID, SeasonID, JUL AS Total_precipitation into temp7
from counties_pcpn

SELECT * FROM TEMP7

--get state, county, year, monthid, seasonid and Aug data from the staging table 
UPDATE counties_pcpn
SET MonthID =8

UPDATE counties_pcpn
SET SeasonID =2

select State, County, Year, MonthID, SeasonID, AUG AS Total_precipitation into temp8
from counties_pcpn

SELECT * FROM TEMP8

-- get state, county, year, monthid, seasonid and Sep data from the staging table 
UPDATE counties_pcpn
SET MonthID =9
UPDATE counties_pcpn
SET SeasonID =3

select State, County, Year, MonthID, SeasonID, SEP AS Total_precipitation into temp9
from counties_pcpn
SELECT * FROM TEMP9

--get state, county, year, monthid, seasonid and Oct data from the staging table 
UPDATE counties_pcpn
SET MonthID =10
UPDATE counties_pcpn
SET SeasonID =3

select State, County, Year, MonthID, SeasonID, OCT AS Total_precipitation into temp10
from counties_pcpn

--get state, county, year, monthid, seasonid and Nov data from the staging table 
UPDATE counties_pcpn
SET MonthID =11
UPDATE counties_pcpn
SET SeasonID =3

select State, County, Year, MonthID, SeasonID, NOV AS Total_precipitation into temp11
from counties_pcpn

SELECT * FROM TEMP11

--get state, county, year, monthid, seasonid and Dec data from the staging table 
UPDATE counties_pcpn
SET MonthID =12

UPDATE counties_pcpn
SET SeasonID =4

select State, County, Year, MonthID, SeasonID, DEC AS Total_precipitation into temp12
from counties_pcpn


select * into TEMP_precipitation
from TEMP1
union all 
select * from TEMP2
union all
select * from TEMP3
union all 
select * from TEMP4
union all
select * from TEMP5
union all
select * from TEMP6
union all
select * from TEMP7
union all
select * from TEMP8
union all
select * from TEMP9
union all
select * from TEMP10
union all
select * from TEMP11
union all
select * from TEMP12

-- add avg_temperature column to the TEMP_precipitation table
ALTER TABLE TEMP_precipitation
Add Avg_temperature decimal(8,2)


-- only 2010-2020 data will be needed from the temperature staging table
delete from temperature
where year<2010

alter table temperature
drop column STCODE


-- add temperature data to the TEMP_precipitation table

update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature= temperature.JAN
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=1 AND TEMP_precipitation.Year=temperature.Year

update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature = temperature.FEB
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=2 AND TEMP_precipitation.Year=temperature.Year

update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature = temperature.Mar
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=3 AND TEMP_precipitation.Year=temperature.Year


update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature = temperature.Apr
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=4 AND TEMP_precipitation.Year=temperature.Year


update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature = temperature.MAY
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=5 AND TEMP_precipitation.Year=temperature.Year


update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature = temperature.JUN
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=6 AND TEMP_precipitation.Year=temperature.Year

update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature = temperature.JUL
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=7 AND TEMP_precipitation.Year=temperature.Year


update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature = temperature.Aug
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=8 AND TEMP_precipitation.Year=temperature.Year

update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature = temperature.Sep
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=9 AND TEMP_precipitation.Year=temperature.Year

update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature = temperature.Oct
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=10 AND TEMP_precipitation.Year=temperature.Year

update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature = temperature.Nov
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=11 AND TEMP_precipitation.Year=temperature.Year

update TEMP_precipitation
SET TEMP_precipitation.Avg_temperature = temperature.Dec
FROM TEMP_precipitation
JOIN temperature ON temperature.stname=TEMP_precipitation.state and TEMP_precipitation.County=temperature.CTYNAME
WHERE TEMP_precipitation.MonthID=12 AND TEMP_precipitation.Year=temperature.Year

select * from TEMP_precipitation
where year=2010 and seasonid=4 and state='New York' and COUNTY='Lewis County'


---create the fact table 'EnviromentalFactor' 
Select State.StateCode, County.CountyCode, Year.YearID, MonthID, SeasonID, Total_precipitation, Avg_temperature
into EnviromentalFactor
FROM TEMP_precipitation
JOIN State on state.state=TEMP_precipitation.state
JOIN County on county.state = TEMP_precipitation.state and county.county=TEMP_precipitation.county
JOIN Year on year.year = TEMP_precipitation.year


-- add 'StateID', 'CountyCode','year' as foreign key constraints to the Incidence table

alter table EnviromentalFactor
add foreign key (YearID) REFERENCES Year(YearID);

alter table EnviromentalFactor
add foreign key (StateCode) REFERENCES State(StateCode);

alter table EnviromentalFactor
add foreign key (CountyCode) REFERENCES County(CountyCode);

alter table EnviromentalFactor
add foreign key (MonthID) REFERENCES Month(MonthID);

alter table EnviromentalFactor
add foreign key (SeasonID) REFERENCES Season(SeasonID);

----------create indexes 
CREATE INDEX county_idx
ON EnviromentalFactor (CountyCode);

CREATE INDEX precipitation_idx
ON EnviromentalFactor (Total_precipitation);

CREATE INDEX temperature_idx
ON EnviromentalFactor (CountyCode);


select * from EnviromentalFactor



select * from incidence
select * from IxodesTransmission
where StateCode=20
select * from state
where state='Maine'











