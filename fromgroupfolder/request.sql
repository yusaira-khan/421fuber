select u.uid, cr.ccNumber, sub.subsNumber  from Ride r
inner join Take_Ride t on r.rid=t.rid
inner join  User u on u.uid=t.uid
inner join CreditCard cr on u.ccNumber=cr.ccNumber
left outer join Subscription sub on u.uid =sub.uid
where r.price=null and r.endtime is not null; 
                                                                          
