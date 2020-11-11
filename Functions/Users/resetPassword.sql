CREATE OR REPLACE FUNCTION resetPassword(arg_firstname VARCHAR(130), arg_lastname VARCHAR(130), arg_email VARCHAR(130), new_password VARCHAR)
RETURNS text AS
$func$
BEGIN
	UPDATE users
	SET
		pass_hash = crypt($4, gen_salt('bf', 12))
	WHERE
		email = $3
	AND 
		LOWER(first_name) = LOWER($1)
	AND 
		LOWER(last_name) = LOWER($2);
	IF NOT FOUND THEN
		RETURN 'User not found';
	ELSE
		RETURN 'Password was reset';
	END IF;
END;
$func$
LANGUAGE plpgsql;

