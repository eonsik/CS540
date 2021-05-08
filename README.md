# CS540 Storm Surge
The goal of this project is to identify an attribute to the dataset that's useful for the class by providing code, database table, zip file for easy download to see the difference between predicted price and zillow price.

# 1. Download Strm_SurgeFDEM2017 Files
Download storm surge data from http://maps.vcgov.org/gis/download/shapes.htm

# 2. Use Data Queries
“C:\temp\cs540\Postgres\bin\psql.exe” -d -I -s 2236 -W “latin1” -g geom Strm_SurgeFDEM2017.shp volusia.stormsurge > stormsurge.sql
“C:\temp\cs540\Postgres\bin\psql.exe” -U postgres -d spatial -f stormsurge.sql


# 3. Use QGIS
Download the Stormsurge.zip.

![Storm Surge Image](https://i.imgur.com/XVheBF3.png)


Load the .shp file (Strm_SurgeFDEM2017.shp) into QGIS using Import Vector Layer.
Use Postgres import and DB Manager Import/Export to import data.

# 4. Use Python
StormSurge.ipynb
