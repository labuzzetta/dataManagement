# dataManagement
Data package with example database management vignettes, presentation, and
datasets

## Installing this package

Install the package from github using devtools:

```{r}
library(devtools)
install_github("clabuzze/dataManagement")
```

Make sure the following dependencies are installed:
- *dplyr*
- *readr*
- *knitr*
- *tidyr*
- *lubridate*

```{r}
install.packages("insert_package_name")
```

## Exploring this package

### First, load the package!
```{r}
library(dataManagement)
```

### Take a look at the datasets

There are datasets that are set up well and others that are poorly constructed.
To load a dataset in a readable format use the following commands:

```{r}
View(dataManagement::package_name)
```

After typing "View(dataManagment::" a list of all the datasets should appear:
- *full*
- *locations*
- *observers*
- *sightings*
- *sightings_bad*
- *sightings_really_bad*
- *species*
- *species_bad*

### Learn what not to do

Take a look at the *sightings_bad*, *sightings_really_bad*, and *species_bad*
datasets

Also, look at the documentation for each of the datasets, to learn what might
be wrong with each of them

```{r}
?dataManagement::sightings_bad
?dataManagement::sightings_really_bad
?dataManagement::species_bad
```

### How to better manage data

Consider viewing the Beamer presentation in the /presentation directory
1. Navigate to the /presentation directory in the dataManagement package
2. Open the presentation.Rpres file
3. Click "Preview" next to the Icon that looks like an "Arrow and World on
   Sheet of Paper" in the toolbar under the open tab for presentation.Rpres
4. The presentation should appear in a new window
5. In that window, select "More" -> "View in Browser" for better display

Note: the R-Markdown version of the presentation ("presentation.md") can also be 
viewed in document format.

Look at the following datasets and their documentation as examples:
- *full*
- *locations*
- *observers*
- *sightings*
- *species*

Consider learning about making your own R Data Package:
https://github.com/jarad/RDataPackageTemplate