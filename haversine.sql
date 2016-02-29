CREATE FUNCTION HAVERSINE( lat1 double, lon1 double, lat2 double, lon2 double)

RETURNS DOUBLE
DETERMINISTIC
f1: BEGIN ATOMIC

        declare dlat double;
        declare dlon double;
        declare a double;
        declare d double;
        set dlat = radians(lat2-lat1);
        set dlon = radians(lon2-lon1);
        set a = (sin(dlat/2) * sin(dlat/2)) + cos(radians(lat1)) * cos(radians(lat2)) * sin(dlon/2) * sin(dlon/2);
        set d = 2*6373*asin(sqrt(a));
        return d;
END f1
@

