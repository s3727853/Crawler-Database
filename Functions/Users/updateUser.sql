CREATE OR REPLACE FUNCTION updateUser(arg_id INT, arg_first VARCHAR(130), arg_last VARCHAR(130), arg_email VARCHAR(130))
RETURNS void AS
$func$
BEGIN   
    UPDATE users
    SET
        first_name = arg_first,
        last_name = arg_last,
        email = LOWER(arg_email)
    WHERE id = arg_id;
END;
$func$
LANGUAGE plpgsql;