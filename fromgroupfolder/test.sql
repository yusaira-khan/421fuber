select cid, latitude, longitude, haversine(latitude, longitude, 45.525757,-73.610034) as distance from car  ORDER BY distance;
