CREATE OR REPLACE FUNCTION deleteUser(arg_userID INT)
RETURNS text AS
$func$
BEGIN
    DELETE FROM users
    WHERE id = arg_userID;

    IF NOT found THEN
        RETURN 'no user by that id';
    ELSE
        RETURN 'user deleted';
    END IF;

END;
$func$
LANGUAGE plpgsql;