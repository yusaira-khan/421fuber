select c.cid, h.sid,c.chargePercentage, m.dist
from Car c inner join ( select 
--min(c.chargePercentage) as min_charge,
c.cid as cid,
h.sid as sid,
HAVERSINE(c.latitude,c.longitude,h.latitude,h.longitude) as dist
from Car c cross join ChargingStation h
group by c.latitude,c.longitude,h.latitude,h.longitude,c.cid,h.sid
) m on m.cid = c.cid
inner join ChargingStation h on m.sid = h.sid
where h.status='available' and c.status='available'
 group by c.chargePercentage,m.dist,c.cid,h.sid

order by c.chargePercentage, m.dist
;
