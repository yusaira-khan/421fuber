
CREATE TABLE CarInfo (
        class varchar(7) PRIMARY KEY check (class in ('small','big','limo','luxury')) NOT NULL,
        basePrice DOUBLE check (basePrice > 0) NOT NULL,
        duration TIME NOT NULL
);
