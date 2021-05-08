select * from volusia.stormsurge
select * from volusia.parcel 
select * from volusia.gis_parcels

--locating the closest storm surge to 3565215
select ST_Distance(ST_SetSRID(s.geom, 2236), (select geom from volusia.gis_parcels p2 where altkey=3565215))/5280 as distance
from volusia.storm_surge s order by ST_SetSRID(s.geom, 2236) <-> (select p2.geom from volusia.gis_parcels p2 where altkey=3565215);

--locating the closest random parcel from storm surge
select ST_Distance(ST_SetSRID(s.geom, 2236), (select geom from volusia.gis_parcels p2 where p2.altkey=3565215))/5280 as distance
from volusia.storm_surge s order by ST_SetSRID(s.geom, 2236) <-> (select p2.geom from volusia.gis_parcels p2 where p2.altkey=3565215) limit 5;

--add column to the parcel table to measure distance between stormsurge / parcel
alter table volusia.parcel add column dist_stormsurge double precision;
alter table volusia.parcel add column stormsurge text;
                                                                                            
alter table volusia.sales_analysis add column dist_stormsurge double precision;
alter table volusia.sales_analysis add column stormsurge text;

-- add the geometry column
SELECT AddGeometryColumn ('volusia','parcel','geom',2236,'MULTIPOLYGON',2);
update volusia.parcel a set geom = p.geom from volusia.gis_parcels p where a.parid=p.altkey;

--Updating the distance between a given parcel and the closest storm surge in miles
update volusia.parcel p1 set dist_stormsurge = ST_Distance(p1.geom, p2.geom)/5280 from volusia.stormsurge p2 where p1.parid=2004291 and p2.parid=2469498;

--Creating index for loop
create index idx_parcel on volusia.parcel (parid);
create index idx_parcel_stormsurge on volusia.parcel(stormsurge);
create index idx_parcel_dist_stormsurge on volusia.parcel(dist_stormsurge);
CREATE INDEX parcel_geom_idx ON volusia.parcel USING GIST (geom);

vacuum analyze volusia.parcel;

select count(*) from volusia.parcel where dist_stormsurge < 1;
