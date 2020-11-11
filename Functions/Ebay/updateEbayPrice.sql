CREATE OR REPLACE FUNCTION updateEbayPrice(numeric[])
RETURNS void AS
$func$
DECLARE
    x numeric[];
BEGIN
    FOREACH x SLICE 1 in ARRAY $1
    LOOP
        INSERT INTO ebaylinkhistory(link_id, price, time_crawled)
        VALUES(
            x[1],
            x[2],
            NOW()
        );

        UPDATE ebaylinks
            SET     
                last_crawled = NOW(),
                current_price = x[2]
                WHERE id = x[1];

            RAISE NOTICE 'item updated';

    END LOOP;
END;
$func$
LANGUAGE plpgsql; 