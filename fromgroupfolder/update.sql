
UPDATE CreditCard
SET validity = 'invalid' 
	WHERE (CURRENT DATE > expirationDate);
