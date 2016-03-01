select c.cid, h.sid,c.chargePercentage, m.dist
from Car c inner join ( select
c.cid as cid,
h.sid as sid,
HAVERSINE(c.latitude,c.longitude,h.latitude,h.longitude) as dist
from Car c cross join ChargingStation h
group by c.latitude,c.longitude,h.latitude,h.longitude,c.cid,h.sid
) m on m.cid = c.cid
inner join ChargingStation h on m.sid = h.sid
where h.status='available' and c.status='available'
 group by c.chargePercentage,m.dist,c.cid,h.sid

order by c.chargePercentage, m.dist  fetch first 1 row only;


--getting a parking spot for the car that is closest to it
select c.cid, p.sid,p.pnumber , m.dist
from Car c inner join ( select 
c.cid as cid,
p.pNumber as pNumber,
h.sid as sid,
HAVERSINE(c.latitude,c.longitude,h.latitude,h.longitude) as dist
from Car c inner join ParkingSpot p  on p.class=c.class inner join Station h on p.sid=h.sid
group by c.latitude,c.longitude,h.latitude,h.longitude,c.cid,h.sid,p.pNumber
) m on m.cid = c.cid
inner join park_At p on m.sid = p.sid and m.pNumber=p.pNumber
where p.cid=null  --car not currently parked
and c.status='available'
 group by c.cid, p.sid,p.pnumber, m.dist
order by m.dist fetch first 1 row only;
;

--getting insurance information about a car that needs repairing
select c.class, em.name,  ins.insuranceCompany, ins.endDate
 from Car c inner join
 park_At park on park.cid=c.cid  inner join
 manage mn on park.sid=mn.sid inner join
 Employee em on mn.eid=em.eid inner join
 insure i on i.cid = c.cid inner join
 InsurancePackage ins on ins.ipid=i.ipid
 where c.status='repairing' ;

--payment information for that haven't been paid yet rides
select u.uid, cr.ccNumber, sub.subsNumber  from Ride r
inner join Take_Ride t on r.rid=t.rid
inner join  User u on u.uid=t.uid
inner join CreditCard cr on u.ccNumber=cr.ccNumber
left outer join Subscription sub on u.uid =sub.uid
where r.price=null and r.endtime is not null;

--closest cars within 2 km of a ride start point
SELECT r.rid,c.cid,c.class
   FROM car c inner join ride r on  
   Harvensine(c.latitude,c.longitude,r.startlatitude,r.startlongitude)<=2
   where r.cid = null and (c.status='available') ;
