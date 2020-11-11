CREATE OR REPLACE FUNCTION ibanUpdate(currency_code VARCHAR, currency_rate NUMERIC)
RETURNS text AS
$func$
BEGIN
	UPDATE ibanrates
	SET 
		rate = currency_rate,
		last_updated = NOW()
	WHERE code = currency_code;

	IF NOT found THEN
		RETURN 'Currency code not found in database';
	ELSE
		RETURN 'Currency rate updated';
	END IF;
END;
$func$
LANGUAGE plpgsql;

