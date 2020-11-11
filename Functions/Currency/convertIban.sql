CREATE OR REPLACE FUNCTION convertIban(amount NUMERIC, from_code VARCHAR, to_code VARCHAR)
RETURNS numeric AS
$func$
DECLARE
 result NUMERIC;
 rate1 NUMERIC;
 rate2 NUMERIC;
BEGIN
 SELECT rate FROM ibanrates WHERE code = from_code INTO rate1;
 SELECT rate FROM ibanrates WHERE code = to_code INTO rate2;
 result := amount * (rate2 / rate1);
 RETURN result;
END;
$func$
LANGUAGE plpgsql; 
