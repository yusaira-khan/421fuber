select c.cid, h.sid 
from Car c inner join ( select 
HAVERSINE(c.latitude,c.longitude,h.latitude,h.longitude) as dist
--min(c.chargePercentage) as min_charge,
c.cid as cid,
h.sid as hid,
from Car c cross join ChargingStation h
group by c.latitude,c.longitude,h.latitude,h.longitude,c.cid,h.sid
) m on m.cid = c.cid
inner join ChargingStation h on m.sid = h.sid
from Car c cross join ChargingStation h
where h.status='available' and c.status='available'
 group by c.chargePercentage,m.dist,c.cid,h.sid

order by c.chargePercentage, m.dist fetch first 1 row only;

--getting a parking spot
select c.cid, spot.latitude, spot.longitude, spot.pNumber
from Car c inner join ( select 
HAVERSINE(c.latitude,c.longitude,spot.latitude,spot.longitude) as dist,
 from Car c inner join ParkingSpot spot on spot.class=c.class
 inner join park_At p on spot.latitude=p.latitude and spot.longitude=p.longitude
 and spot.pNumber=p.pNumber  where
dist=min_dist and
p.cid=null  --car not currently parked
and c.status!='busy' ; --car either available or needs repairing
select c.cid, spot.sid,spot.number 
from Car c inner join ( select 
HAVERSINE(c.latitude,c.longitude,h.latitude,h.longitude) as dist
c.cid as cid,
p.pNumber as hid,
h.sid as hid,
from Car c inner join ParkingSpot p  on p.class=c.class inner join Station h
group by c.latitude,c.longitude,h.latitude,h.longitude,c.cid,h.sid,p.pNumber
) m on m.cid = c.cid
inner join ChargingStation h on m.sid = h.sid
from Car c cross join ChargingStation h
where h.status='available' and c.status='available'
 group by c.chargePercentage,m.dist,c.cid,h.sid

order by c.chargePercentage, m.dist
;

--getting insurance information about a car that needs repairing
select c.cid, park.latitude, park.longitude, em.eid, ins.ipid
 from Car c inner join
 park_At park on park.cid=c.cid  inner join
 manage mn on park.latitude=mn.latitude and
        park.longitude = mn.longitude inner join
 Employee em on mn.eid=em.eid inner join
 InsurancePackage ins on ins.ipid=c.ipid
 where c.status='repairing' ;



select u.uid, cr.ccNumber, sub.subsNumber  from Ride r
inner join Take_Ride t on r.rid=t.rid
inner join  User u on u.uid=t.uid
inner join CreditCard cr on u.ccNumber=cr.ccNumber
left outer join Subscription sub on u.uid =sub.uid
where r.price=null and r.endtime is not null;
