-- requesting fuber

--finding a car for an order

--user with id 125
--user requests a UberMini
--user is at location 65.00, 75.00
--there are 1000 rides
--insert into  Ride (startlatitude, startlongitude ,  destinationlatitude,destinationlongitude) 
   --Values("1001",65, 75, 66, 76);
--insert into Take_Ride ( uid,rid) Values("125","1001");
--insert into On_Ride ( rid , cid ) Values("1001",getCarForRide("small","125"));   

select getCarForRide("small",r.rid) from Ride r 
where r.starttime=null;


CREATE OR REPLACE FUNCTION getCarForRide(class varchar(7), rid char)
RETURN (char) IS
   cid char(9):= null;
   distance double:= 1.0;
BEGIN
   while ((cid = null) or (distance<10.0)) do
   set cid = getMinimumFromUser(rid,distance,class);
   set distance = distance +1;
   end while;
   return cid;
END;   

CREATE OR REPLACE FUNCTION getMinimumFromStart(rid char,double dist,class varchar(7))
RETURN (char) IS
   minid char(9):= null;
   ulat double := 0;
   ulong double := 0;
   double mininum :=dist;
   double current :=0;
BEGIN
   SELECT r.startlatitude into ulat, r.startlongitude into ulong
   FROM ride r where r.rid=rid ;

   FOR cars AS SELECT (id,latitude,longitude)
   FROM car c where  Harvensine(c.latitude,c.longitude,ulat,ulong)<=dist 
   and (c.class=class) and (status='available')
   Do
   --current distance
   	 set current = Harvensine(c.latitude,c.longitude,ulat,ulong);
   	 if current< mininum  and hasRequiredCharge(c.id) then 
   	 set	mininum = current;
   	 set	minid = c.cid;
   	end for
   RETURN (minid);
END;

CREATE OR REPLACE FUNCTION hasRequiredCharge(cid char)
RETURN (boolean) IS
total number :=0;
BEGIN
--select count(*) into total
--HAVERSINE(c.latitude,c.longitude,h.latitude,h.longitude) 

--as dist, min(dist) into min_dist
--from Car c cross join ChargingStation h 
--where c.chargePercentage = min_charge and dist=min_dist and h.status='available' 
--and c.cid=cid;
 
   --where (c.chargePercentage- 
      --(HAVERSINE(c.latitude,c.longitude,r.latitude,h.longitude) +
      --HAVERSINE(c.latitude,c.longitude,h.latitude,h.longitude)
      --HAVERSINE(c.latitude,c.longitude,h.latitude,h.longitude) ) > 0.0  
      --and c.cid=cid;
   select count(*) into total from Car c where c.cid=cid and c.chargePercentage > 40.0;
   return (total>0);
END;