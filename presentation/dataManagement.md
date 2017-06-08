Data Management Tips
========================================================
author: Charlie Labuzzetta
date: June 07, 2017
autosize: true
incremental: true


STRIPS-2 Data
========================================================

![caption](strips.png) ![caption](github.png)

- Over 350,000 collected datapoints
- Over 20,000 quadrat estimations
- Nearly 2,500 nest checks

## And that's just 2015-2016!


How to Make Data Storage and Analysis Easier?
========================================================

- Naming Standards
  - Filenames
  - Column names
- Data Types
  - Dates
  - Booleans vs. Yes/No
- Database Design
  - When to make a new table?
  - To ID or not to ID


Naming Standards - Poor Example
========================================================

In the column names, look for:
  - Inconsistency
  - Spaces / Weird Characters


|Observer |Location          |      Lat|       Lon|SPECIES |Date       |Time                |How recognized? |comments             |
|:--------|:-----------------|--------:|---------:|:-------|:----------|:-------------------|:---------------|:--------------------|
|JD       |Riverside         | 43.81403| -91.25306|AMRO    |2016-05-11 |1899-01-01 19:01:00 |Visual          |NA                   |
|JD       |Riverside Park    | 43.81403| -91.25306|EABL    |2016-05-11 |1899-01-01 19:53:00 |visual          |using bluebird house |
|mj       |Backyard          | 43.80368| -91.21175|DOWO    |2016-05-16 |1899-01-01 16:27:00 |Visual          |NA                   |
|Jd       |Backyard          | 43.84551| -91.30816|AMGO    |2016-05-17 |1899-01-01 06:55:00 |Visual          |NA                   |
|Mj       |backyard          | 43.80368| -91.21175|CLSW    |2016-06-03 |1899-01-01 21:43:00 |visual          |NA                   |
|Mj       |backyard          | 43.80368| -91.21175|GHOW    |2016-06-03 |1899-01-01 22:24:00 |auditory        |territorial hooting  |
|jd       |Park              | 43.81403| -91.25306|EABL    |2016-06-06 |1899-01-01 18:28:00 |visual          |NA                   |
|MJ       |in Riverside park | 43.81403| -91.25306|AMRO    |2016-06-17 |1899-01-01 14:43:00 |heard it        |none                 |
|MJ       |Riverside         | 43.81403| -91.25306|GBHE    |2016-06-17 |1899-01-01 15:07:00 |visual          |NA                   |
|mj       |RP                | 43.81403| -91.25306|PUFI    |2016-06-17 |15:45:00            |visual          |NA                   |
|mj       |RP                | 43.81403| -91.25306|EABL    |2016-06-17 |16:00:00            |visual          |NA                   |
|Jd       |yard              | 43.84551| -91.30816|AMGO    |2016-06-18 |07:42:00            |visual          |using thistle feeder |


Naming Standards - Better?
========================================================

In the column names, look for:
  - full words
  - lower case with underscores
  

| sighting_id| observer_id| location_id|species_id |date                |recognition_type |comments             |
|-----------:|-----------:|-----------:|:----------|:-------------------|:----------------|:--------------------|
|           1|         492|           1|AMRO       |2016-05-11 19:01:00 |visual           |NA                   |
|           2|         492|           1|EABL       |2016-05-11 19:53:00 |visual           |using bluebird house |
|           3|         213|           2|DOWO       |2016-05-16 16:27:00 |visual           |NA                   |
|           4|         492|           3|AMGO       |2016-05-17 06:55:00 |visual           |NA                   |
|           5|         213|           2|CLSW       |2016-06-03 21:43:00 |visual           |NA                   |
|           6|         213|           2|GHOW       |2016-06-03 22:24:00 |auditory         |territorial hooting  |
|           7|         492|           1|EABL       |2016-06-06 18:28:00 |visual           |NA                   |
|           8|         213|           1|AMRO       |2016-06-17 14:43:00 |auditory         |NA                   |
|           9|         213|           1|GBHE       |2016-06-17 15:07:00 |visual           |NA                   |
|          10|         213|           1|PUFI       |2016-06-17 15:45:00 |visual           |NA                   |
|          11|         213|           1|EABL       |2016-06-17 16:00:00 |visual           |NA                   |
|          12|         492|           3|AMGO       |2016-06-18 07:42:00 |visual           |using thistle feeder |


Discussion - Naming Standards
========================================================

There are many ways to name files / columns with consistency:
  - lowercase_underscore
  - camelCaseNoSpaces
  - CapitalizeEveryWord
  - PLEASE_DONT_DO_THIS
  
**Suggestion:** lowercase_underscore

Important People in the "R" World suggest: http://r-pkgs.had.co.nz/style.html


Data Types - Dates
========================================================

Confession: Dates are the worst...

There are so many ways to store dates:
  - 2000-07-04 14:00:00
  - 2000-07-04 2:00 PM
  - 2000/07/04 02:00:00 PM
  - 04/07/2000

Sometimes when converting from Excel:
  - 07/04/2000 23:59:59
  - 01/01/1899 12:00:00
  
  
Data Types - Dates
========================================================

**Suggestion:** When possible, YYYY-mm-dd hh:mm:ss
  - Stores in chronological order
  - Bypasses AM/PM Errors
  - Reduces Month/Day confusion
  
**Suggestion:** If using R, look into the *lubridate* package

Try to store dates and times in the same column


| sighting_id| observer_id| location_id|species_id |date                |recognition_type |comments             |
|-----------:|-----------:|-----------:|:----------|:-------------------|:----------------|:--------------------|
|           1|         492|           1|AMRO       |2016-05-11 19:01:00 |visual           |NA                   |
|           2|         492|           1|EABL       |2016-05-11 19:53:00 |visual           |using bluebird house |
|           3|         213|           2|DOWO       |2016-05-16 16:27:00 |visual           |NA                   |
|           4|         492|           3|AMGO       |2016-05-17 06:55:00 |visual           |NA                   |
|           5|         213|           2|CLSW       |2016-06-03 21:43:00 |visual           |NA                   |
|           6|         213|           2|GHOW       |2016-06-03 22:24:00 |auditory         |territorial hooting  |
|           7|         492|           1|EABL       |2016-06-06 18:28:00 |visual           |NA                   |
|           8|         213|           1|AMRO       |2016-06-17 14:43:00 |auditory         |NA                   |
|           9|         213|           1|GBHE       |2016-06-17 15:07:00 |visual           |NA                   |
|          10|         213|           1|PUFI       |2016-06-17 15:45:00 |visual           |NA                   |
|          11|         213|           1|EABL       |2016-06-17 16:00:00 |visual           |NA                   |
|          12|         492|           3|AMGO       |2016-06-18 07:42:00 |visual           |using thistle feeder |


Data Types - Units
========================================================

How/where should measurement units be stored?
  - Avoid putting units in column names
  - Make documentation / metadata files
  - Consider changing booleans to "Yes"/"No"
  
Look at Jarad Niemi's RDataPackageTemplate: https://github.com/jarad/RDataPackageTemplate

What's wrong with the table below?


|Observer |Location          |      Lat|       Lon|SPECIES |Date       |Time                |How recognized? |comments             |
|:--------|:-----------------|--------:|---------:|:-------|:----------|:-------------------|:---------------|:--------------------|
|JD       |Riverside         | 43.81403| -91.25306|AMRO    |2016-05-11 |1899-01-01 19:01:00 |Visual          |NA                   |
|JD       |Riverside Park    | 43.81403| -91.25306|EABL    |2016-05-11 |1899-01-01 19:53:00 |visual          |using bluebird house |
|mj       |Backyard          | 43.80368| -91.21175|DOWO    |2016-05-16 |1899-01-01 16:27:00 |Visual          |NA                   |
|Jd       |Backyard          | 43.84551| -91.30816|AMGO    |2016-05-17 |1899-01-01 06:55:00 |Visual          |NA                   |
|Mj       |backyard          | 43.80368| -91.21175|CLSW    |2016-06-03 |1899-01-01 21:43:00 |visual          |NA                   |
|Mj       |backyard          | 43.80368| -91.21175|GHOW    |2016-06-03 |1899-01-01 22:24:00 |auditory        |territorial hooting  |
|jd       |Park              | 43.81403| -91.25306|EABL    |2016-06-06 |1899-01-01 18:28:00 |visual          |NA                   |
|MJ       |in Riverside park | 43.81403| -91.25306|AMRO    |2016-06-17 |1899-01-01 14:43:00 |heard it        |none                 |
|MJ       |Riverside         | 43.81403| -91.25306|GBHE    |2016-06-17 |1899-01-01 15:07:00 |visual          |NA                   |
|mj       |RP                | 43.81403| -91.25306|PUFI    |2016-06-17 |15:45:00            |visual          |NA                   |
|mj       |RP                | 43.81403| -91.25306|EABL    |2016-06-17 |16:00:00            |visual          |NA                   |
|Jd       |yard              | 43.84551| -91.30816|AMGO    |2016-06-18 |07:42:00            |visual          |using thistle feeder |


Database Design - Goals
========================================================


A good database will (be):
  - Reduce Redundancy
  - Reduce NA's
  - Easy to Manipulate
  
Again, when making an R Data Package, look at: https://github.com/jarad/RDataPackageTemplate
  - Store raw data in /data-raw
  - Clean raw data with R scripts
  - Import clean data to R package
  - Easily manipulate and analyze clean data
  
  
Database Design - Thought Process
========================================================

How to think about database design:

