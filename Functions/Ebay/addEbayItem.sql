CREATE OR REPLACE FUNCTION addEbayItem(arg_user INT, arg_link VARCHAR, arg_description VARCHAR, arg_price NUMERIC, arg_interval INT,
                                       notify_change BOOLEAN DEFAULT NULL, price_increase BOOLEAN DEFAULT NULL, change_amount NUMERIC DEFAULT NULL, arg_image VARCHAR DEFAULT NULL, arg_endtime VARCHAR DEFAULT NULL)
RETURNS text AS
$func$
DECLARE
    linkid INT;
BEGIN
    INSERT INTO ebaylinks (user_id, link, link_description, initial_price, current_price, crawl_interval, last_crawled, link_valid, image, endtime)
    VALUES (
        $1,
        $2,
        $3,
        $4,
        $4,
        $5,
        NOW(),
        true,
        $9,
        $10
    );
    linkid := currval(pg_get_serial_sequence('ebaylinks', 'id'));
    
    INSERT INTO ebaylinkhistory(link_id, time_crawled, price)
    VALUES (
        linkid,
        NOW(),
        $4
    );

        
    IF $6 = TRUE THEN 
        IF $7 = TRUE THEN
            INSERT INTO ebayemail(link_id, price_increase, notification_amount) 
            VALUES (linkid, 'TRUE', ($4 + $8));
        ELSEIF $7 = FALSE THEN
            INSERT INTO ebayemail(link_id, price_increase, notification_amount) 
            VALUES (linkid, 'FALSE', ($4 - $8));
        END IF;
    END IF;

    RETURN 'Link added';
END;
$func$
LANGUAGE plpgsql; 