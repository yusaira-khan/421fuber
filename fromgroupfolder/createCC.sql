
CREATE TABLE CreditCard (
        ccNumber char(16) PRIMARY KEY NOT NULL,
        expirationDate DATE NOT NULL,
        CVV SMALLINT NOT NULL,
        cardHolderName varchar(50) NOT NULl,
        billingAddress varchar(100) NOT NULL,
        validity varchar(8) check (validity in ('valid','invalid')) with default 'valid'
);
