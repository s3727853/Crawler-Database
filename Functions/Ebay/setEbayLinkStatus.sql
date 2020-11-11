CREATE OR REPLACE FUNCTION setEbayLinkStatus(int[])
RETURNS void AS
$func$
DECLARE
    x int[];
BEGIN
    FOREACH x SLICE 1 in ARRAY $1
    LOOP
        UPDATE ebaylinks
        SET link_valid = 'FALSE'
        WHERE id = x[1];

        RAISE NOTICE 'Link status changed to FALSE';

    END LOOP;
END;
$func$
LANGUAGE plpgsql; 