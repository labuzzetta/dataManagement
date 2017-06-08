Data Management Tips
========================================================
author: Charlie Labuzzetta
date: June 08, 2017
autosize: true
incremental: true
depends: dplyr, dataManagement, tidyr


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


|Observer |Location          |SPECIES |Date       |Time                | distance(m)|How recognized? | making sound|
|:--------|:-----------------|:-------|:----------|:-------------------|-----------:|:---------------|------------:|
|JD       |Riverside         |AMRO    |2016-05-11 |1899-01-01 19:01:00 |          45|Visual          |            0|
|JD       |Riverside Park    |EABL    |05/11/2016 |1899-01-01 19:53:00 |          90|visual          |            0|
|mj       |Backyard          |DOWO    |2016-05-16 |1899-01-01 16:27:00 |          24|Visual          |            1|
|Jd       |Backyard          |AMGO    |05-17-2016 |1899-01-01 06:55:00 |          53|Visual          |            0|
|Mj       |backyard          |CLSW    |2016-06-03 |1899-01-01 21:43:00 |          31|visual          |            0|
|Mj       |backyard          |GHOW    |06-03-2016 |1899-01-01 22:24:00 |          20|auditory        |            1|
|jd       |Park              |EABL    |06/06/2016 |1899-01-01 18:28:00 |          34|visual          |            0|
|MJ       |in Riverside park |AMRO    |2016-06-17 |1899-01-01 14:43:00 |          20|heard it        |            1|
|MJ       |Riverside         |GBHE    |2016-06-17 |1899-01-01 15:07:00 |          60|visual          |            0|
|mj       |RP                |PUFI    |06/17/2016 |15:45:00            |          40|visual          |            0|
|mj       |RP                |EABL    |2016-06-17 |16:00:00            |          34|visual          |            0|
|Jd       |yard              |AMGO    |2016-06-18 |07:42:00            |          23|visual          |            0|


Naming Standards - Better?
========================================================

In the column names, look for:
  - full words
  - lower case with underscores
  

| sighting_id| observer_id| location_id|species_id |date                |visual_recognition |audio_recognition |
|-----------:|-----------:|-----------:|:----------|:-------------------|:------------------|:-----------------|
|           1|         492|           1|AMRO       |2016-05-11 19:01:00 |yes                |no                |
|           2|         492|           1|EABL       |2016-05-11 19:53:00 |yes                |no                |
|           3|         213|           2|DOWO       |2016-05-16 16:27:00 |yes                |yes               |
|           4|         492|           3|AMGO       |2016-05-17 06:55:00 |yes                |no                |
|           5|         213|           2|CLSW       |2016-06-03 21:43:00 |yes                |no                |
|           6|         213|           2|GHOW       |2016-06-03 22:24:00 |no                 |yes               |
|           7|         492|           1|EABL       |2016-06-06 18:28:00 |yes                |no                |
|           8|         213|           1|AMRO       |2016-06-17 14:43:00 |yes                |yes               |
|           9|         213|           1|GBHE       |2016-06-17 15:07:00 |yes                |no                |
|          10|         213|           1|PUFI       |2016-06-17 15:45:00 |yes                |no                |
|          11|         213|           1|EABL       |2016-06-17 16:00:00 |yes                |no                |
|          12|         492|           3|AMGO       |2016-06-18 07:42:00 |yes                |no                |


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


|Observer |Location          |SPECIES |Date       |Time                | distance(m)|How recognized? | making sound|
|:--------|:-----------------|:-------|:----------|:-------------------|-----------:|:---------------|------------:|
|JD       |Riverside         |AMRO    |2016-05-11 |1899-01-01 19:01:00 |          45|Visual          |            0|
|JD       |Riverside Park    |EABL    |05/11/2016 |1899-01-01 19:53:00 |          90|visual          |            0|
|mj       |Backyard          |DOWO    |2016-05-16 |1899-01-01 16:27:00 |          24|Visual          |            1|
|Jd       |Backyard          |AMGO    |05-17-2016 |1899-01-01 06:55:00 |          53|Visual          |            0|
|Mj       |backyard          |CLSW    |2016-06-03 |1899-01-01 21:43:00 |          31|visual          |            0|
|Mj       |backyard          |GHOW    |06-03-2016 |1899-01-01 22:24:00 |          20|auditory        |            1|
|jd       |Park              |EABL    |06/06/2016 |1899-01-01 18:28:00 |          34|visual          |            0|
|MJ       |in Riverside park |AMRO    |2016-06-17 |1899-01-01 14:43:00 |          20|heard it        |            1|
|MJ       |Riverside         |GBHE    |2016-06-17 |1899-01-01 15:07:00 |          60|visual          |            0|
|mj       |RP                |PUFI    |06/17/2016 |15:45:00            |          40|visual          |            0|
|mj       |RP                |EABL    |2016-06-17 |16:00:00            |          34|visual          |            0|
|Jd       |yard              |AMGO    |2016-06-18 |07:42:00            |          23|visual          |            0|
  
Data Types - Dates
========================================================

**Suggestion:** When possible, YYYY-mm-dd hh:mm:ss
  - Stores in chronological order
  - Bypasses AM/PM Errors
  - Reduces Month/Day confusion
  
**Suggestion:** If using R, look into the *lubridate* package

Try to store dates and times in the same column


| sighting_id| observer_id| location_id|species_id |date                |visual_recognition |audio_recognition |
|-----------:|-----------:|-----------:|:----------|:-------------------|:------------------|:-----------------|
|           1|         492|           1|AMRO       |2016-05-11 19:01:00 |yes                |no                |
|           2|         492|           1|EABL       |2016-05-11 19:53:00 |yes                |no                |
|           3|         213|           2|DOWO       |2016-05-16 16:27:00 |yes                |yes               |
|           4|         492|           3|AMGO       |2016-05-17 06:55:00 |yes                |no                |
|           5|         213|           2|CLSW       |2016-06-03 21:43:00 |yes                |no                |
|           6|         213|           2|GHOW       |2016-06-03 22:24:00 |no                 |yes               |
|           7|         492|           1|EABL       |2016-06-06 18:28:00 |yes                |no                |
|           8|         213|           1|AMRO       |2016-06-17 14:43:00 |yes                |yes               |
|           9|         213|           1|GBHE       |2016-06-17 15:07:00 |yes                |no                |
|          10|         213|           1|PUFI       |2016-06-17 15:45:00 |yes                |no                |
|          11|         213|           1|EABL       |2016-06-17 16:00:00 |yes                |no                |
|          12|         492|           3|AMGO       |2016-06-18 07:42:00 |yes                |no                |


Data Types - Units
========================================================

How/where should measurement units be stored?
  - Avoid putting units in column names
  - Make documentation / metadata files
  - Consider changing booleans to "Yes"/"No"
  
Look at Jarad Niemi's RDataPackageTemplate: https://github.com/jarad/RDataPackageTemplate

What's wrong with the table below?


|Observer |Location          |SPECIES |Date       |Time                | distance(m)|How recognized? | making sound|
|:--------|:-----------------|:-------|:----------|:-------------------|-----------:|:---------------|------------:|
|JD       |Riverside         |AMRO    |2016-05-11 |1899-01-01 19:01:00 |          45|Visual          |            0|
|JD       |Riverside Park    |EABL    |05/11/2016 |1899-01-01 19:53:00 |          90|visual          |            0|
|mj       |Backyard          |DOWO    |2016-05-16 |1899-01-01 16:27:00 |          24|Visual          |            1|
|Jd       |Backyard          |AMGO    |05-17-2016 |1899-01-01 06:55:00 |          53|Visual          |            0|
|Mj       |backyard          |CLSW    |2016-06-03 |1899-01-01 21:43:00 |          31|visual          |            0|
|Mj       |backyard          |GHOW    |06-03-2016 |1899-01-01 22:24:00 |          20|auditory        |            1|
|jd       |Park              |EABL    |06/06/2016 |1899-01-01 18:28:00 |          34|visual          |            0|
|MJ       |in Riverside park |AMRO    |2016-06-17 |1899-01-01 14:43:00 |          20|heard it        |            1|
|MJ       |Riverside         |GBHE    |2016-06-17 |1899-01-01 15:07:00 |          60|visual          |            0|
|mj       |RP                |PUFI    |06/17/2016 |15:45:00            |          40|visual          |            0|
|mj       |RP                |EABL    |2016-06-17 |16:00:00            |          34|visual          |            0|
|Jd       |yard              |AMGO    |2016-06-18 |07:42:00            |          23|visual          |            0|


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
