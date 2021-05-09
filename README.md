# CS540 Storm Surge
The goal of this project is to identify an attribute to the dataset that's useful for the class by providing code, database table, zip file for easy download to see the difference between predicted price and zillow price. For this project, my goal was to identify the impact on the price of the parcels that are currently located in or close to storm surge area, as well as to help future homebuyers to make an informed decision when making a purchase. The data can be downloaded from the Volusia County website. 

# 1. Download Strm_SurgeFDEM2017 Files
Download storm surge data from http://maps.vcgov.org/gis/download/shapes.htm

# 2. Use Data Queries
This data sets use is to locate or pick a piece of property and check whether the selected property is located within a storm surge zone and if not, how far it is located from the storm surge zone. This piece of information maybe valuable to people who are trying to move into the county or move within the county, and roughly determine and estimate the amount of home insurance, as well as make an educated decision to evacuate when the storm approaches.

## To use the dataset by data queries:
First download the StormSurge.query.sql file from the repository. This StormSurge.query.sql file should be then opened within a query tool in pgAdmin.

```
“C:\temp\cs540\Postgres\bin\psql.exe” -d -I -s 2236 -W “latin1” -g geom Strm_SurgeFDEM2017.shp volusia.stormsurge > stormsurge.sql
“C:\temp\cs540\Postgres\bin\psql.exe” -U postgres -d spatial -f stormsurge.sql
```



# 3. Use QGIS
Download the Stormsurge.zip.

Load the .shp file (Strm_SurgeFDEM2017.shp) into QGIS using Import Vector Layer.
Use Postgres import and DB Manager Import/Export to import data.

After the import, your QGIS map should look simliar to the figure below. 

![Storm Surge Image](https://i.imgur.com/XVheBF3.png)



# 4. Use Python
StormSurge.ipynb
