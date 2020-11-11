CREATE OR REPLACE FUNCTION addUser(varchar(130), varchar(130), varchar(130), varchar(20), varchar)
RETURNS text AS
$func$
BEGIN
  INSERT INTO users (first_name, last_name, email, role, pass_hash, created_at)
  VALUES (
    $1,
    $2,
    LOWER($3),
    LOWER($4),
    crypt($5, gen_salt('bf', 12)),
    NOW()
  );

  RETURN 'User created.';

  EXCEPTION WHEN unique_violation THEN
    RETURN 'User already exists.';
END;
$func$
LANGUAGE plpgsql;


