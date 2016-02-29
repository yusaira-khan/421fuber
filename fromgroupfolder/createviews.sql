create view smallrides as
select rid, ride.cid, price from ride
inner join
(select cid from car where class = 'small')small
on small.cid = ride.cid;

create view limorides as
select rid, ride.cid, price from ride
inner join
(select cid from car where class = 'limo')limo
on limo.cid = ride.cid;

create view bigrides as
select rid, ride.cid, price from ride
inner join
(select cid from car where class = 'big')big
on big.cid = ride.cid;


create view luxuryrides as
select rid, ride.cid, price from ride
inner join
(select cid from car where class = 'luxury')luxury
on luxury.cid = ride.cid;


create view activeSubscriptions as
select uid,startDate,endDate,monthlyprice,monthlyprice * ABS(ROUND(MONTHS_BETWEEN (endDate,startDate))) as totalPrice from subscription
where (endDate > CURRENT DATE);

create view expiredSubscriptions as
select uid,startDate,endDate,monthlyprice,monthlyprice * ABS(ROUND( MONTHS_BETWEEN (endDate,startDate))) as totalPrice from subscription
where (endDate < CURRENT DATE);



