CREATE OR REPLACE FUNCTION getUsers(arg_limit INTEGER, arg_offset INTEGER, rolesort VARCHAR DEFAULT NULL)
RETURNS TABLE(id INTEGER, First_Name VARCHAR, Last_Name VARCHAR, Email VARCHAR, Role VARCHAR, Created TIMESTAMP) AS
$func$
BEGIN
	IF rolesort IS NULL THEN
	RETURN QUERY
		SELECT "users".id, "users".first_name, "users".last_name, "users".email, "users".role, "users".created_at
		FROM users
		ORDER BY "users".id ASC
		OFFSET arg_offset
		LIMIT arg_limit;
	ELSE
	RETURN QUERY
		SELECT "users".id, "users".first_name, "users".last_name, "users".email, "users".role, "users".created_at
		FROM users
		WHERE "users".role = rolesort
		ORDER BY "users".id ASC
		OFFSET arg_offset
		LIMIT arg_limit;
	END IF;
END;
$func$
LANGUAGE plpgsql;

