CREATE OR REPLACE FUNCTION deleteEbayNotification(int[])
RETURNS void AS
$func$
DECLARE
    x int[];
BEGIN
    FOREACH x SLICE 1 in ARRAY $1
    LOOP
        DELETE FROM ebayEmail
        WHERE id = x[1];

        RAISE NOTICE 'Notification data deleted';
    END LOOP;
END;
$func$
LANGUAGE plpgsql;