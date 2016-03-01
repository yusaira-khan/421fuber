
-- Update validity of all the credit cards, set them to invalid if the expiration date has passed
UPDATE CreditCard
SET validity = 'invalid' 
	WHERE (CURRENT DATE > expirationDate);	
-- Works

-- Update Employee salaries for Christmas bonus
UPDATE Employee
SET salary = salary + salary*5/100
	WHERE CONTAINS(responsibilities, 'station') = 1;
-- Works



INSERT INTO Charge (cid, sid)
VALUES(
select c.cid, h.sid
from Car c inner join (select
	c.cid as cid,
	h.sid as sid,
	HAVERSINE(c.latitude,c.longitude,h.latitude,h.longitude) as dist
	from Car c cross join ChargingStation h
	group by c.latitude,c.longitude,h.latitude,h.longitude,c.cid,h.sid
) m on m.cid = c.cid
inner join ChargingStation h on m.sid = h.sid
where h.status='available' and c.status='available'
 group by c.chargePercentage,m.dist,c.cid,h.sid
order by c.chargePercentage, m.dist)