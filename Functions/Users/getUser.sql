CREATE OR REPLACE FUNCTION getUser(arg_email varchar(130), pass varchar)
RETURNS TABLE(
  id INT,
  first_name VARCHAR(130),
  last_name VARCHAR(130),
  role VARCHAR(20),
  email VARCHAR(130)
) AS
$func$
BEGIN
  RETURN QUERY
  SELECT "users".id, "users".first_name, "users".last_name, "users".role, "users".email FROM users WHERE "users".email = arg_email AND "users".pass_hash = crypt($2, "users".pass_hash);
END;
$func$
LANGUAGE plpgsql;


