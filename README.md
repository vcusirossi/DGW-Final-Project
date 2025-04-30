# DGW-Final-Project
This repository is a compilation of all material created for our final assignment in our class Data Gathering and Warehousing

## Where is the data from?
This data was sourced from the Dead Birds iNaturalist project


## How was it collected?
iNaturalist data is collected through citizen science observations and uploaded to the iNaturalist website

## How was it extracted?
A custom export was requested that collected all observations within the United States within the Dead Birds project

## What program was used to clean the data?
Jupyter Notebook was used to clean the data

## How was the data cleaned/transformed?

In iNaturalist
All observations outside of the United States were dropped
All observations not given a “research” quality grade were dropped
All observations without a likely cause of death being listed as ‘Window’, Window Collision’, Window Strike’, or unknown were dropped.

In Jupyter Notebook
All column names were made lowercase
All spaces were stripped from column names; replaced with ‘_’
Column ‘field:likely_cause_of_death?’ was renamed to ‘field_likely_cause_of_death’
Column ‘place_county_name’ was renamed to ‘county’
Column ‘place_state_name’ was renamed to ‘state’
The following columns are dropped from the dataset: ‘num_identification_agreement’, ‘num_indentification_disagreement’, ‘private_latitude’, ‘private_longitude’, ‘’private_place_guess’, ‘geoprivacy’ 
Column ‘observed_on’ is transformed into a datetime format  (y:m:d)
Columns ‘year’ and ‘month’ are created from column ‘observed_on’
Columns ‘time_zone’ and ‘time_observed_on’ were standardized from UTC to US EST time
Null values are removed from the following columns: ‘species_guess’, ‘scientific_name’, ‘common_name’, ‘iconic_taxon_name’, ‘taxon_id’, ‘user_id’, ‘user_login’, ‘user_name’, ‘description’, ‘taxon_genus_name’, ‘taxon_species_name’, ‘taxon_order_name’, ‘taxon_family_name’, ‘field_likely_cause_of_death’, and ‘time_observed_on’

## What are the units for numeric data?

Observed_on (datetime64[ns]): y:m:d
User_id: none
Latitude: degrees
Longitude: degrees
Taxon_id: none
Year: y (year)
Month: m (month)



## What formulas were used in column creation
Year column creation:
 bird['year'] = pd.to_datetime(bird['observed_on'], errors='coerce').dt.year <br>
 <br>
Month column creation: 
bird['month'] = pd.to_datetime(bird['observed_on'], errors='coerce').dt.month


## Definition of Columns:

**uuid:** Universally unique identifier for the observation. See https://datatracker.ietf.org/doc/html/rfc9562 <br>
**observed_on:** Normalized date of observation <br>
**time_observed_at:** Normalized datetime of observation <br>
**year:** Derived from the observed_on column, displays the year integer of observation on its own <br>
**month:** Derived from the observed_on column, displays the month integer of observation on its own <br>
**time_zone:** Time zone of observation <br>
**user_id:** Unique, sequential identifier for the observer <br>
**user_login:** Handle / username of the observer, i.e. a short, unique, alphanumeric identifier for a user <br>
**quality_grade:** Quality grade of this observation. See Help section for details on what this means. See https://help.inaturalist.org/support/solutions/articles/151000169936 <br>
**description:** Text written by the observer describing the observation or recording any other notes that seem relevant <br>
**place_guess:** Locality description as entered by the observer <br>
**latitude:** Publicly visible latitude from the observation location <br>
**longitude:** Publicly visible longitude from the observation location <br>
**town:** Shortened version of place_town_name -  The name of the town or city that contains this observation's coordinates, if known <br>
**county:** Shortened version of place_county_name - The name of the third-level administrative area that contains this observation's coordinates (e.g. a county in most parts of the United States) <br>
**state:** Shortened version of place_state_name - The name of the second-level administrative area that contains this observation's coordinates (e.g. a state in most parts of the United States) <br>
**country:** Shortened version of place_country_name - The name of the first-level administrative area that contains this observation’s coordinates (e.g. United States) <br>
**species_guess:** Plain text name of the observed taxon; can be set by the observer during observation creation, but can get replaced with canonical, localized names when the taxon changes <br>
**scientific_name:** Scientific name of the observed taxon according to iNaturalist <br>
**common_name:** Common or vernacular name of the observed taxon according to iNaturalist <br>
**iconic_taxon_name:** Higher-level taxonomic category for the observed taxon <br>
**taxon_id:** Unique, sequential identifier for the observed taxon <br>
**taxon_kingdom_name:** Name of the taxonomic kingdom containing the observed taxon <br>
**taxon_phylum_name:** Name of the taxonomic phylum containing the observed taxon <br>
**taxon_class_name:** Name of the taxonomic class containing the observed taxon<br>
**taxon_order_name:** Name of the taxonomic order containing the observed taxon<br>
**taxon_family_name:** Name of the taxonomic family containing the observed taxon<br>
**taxon_genus_name:** Name of the taxonomic genus containing the observed taxon<br>
**taxon_species_name:** Name of the taxonomic species containing the observed taxon<br>
**field_likely_cause_of_death:** Text written by the observer describing the suspected cause of death <br>


#### For more information about column headers, see Terminology · iNaturalist


If there are set variable options in your dataset, what are their definitions?


## What are the regulations to using the data?
The license for the data in iNaturalist is public domain

## References/Citations
iNaturalist. Available from https://www.inaturalist.org. Accessed 3/20/2025
Dead Birds · iNaturalist
