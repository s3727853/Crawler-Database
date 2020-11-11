CREATE OR REPLACE FUNCTION checkEbayNotifications()
RETURNS TABLE(user_id INT, name VARCHAR, email VARCHAR, current_price NUMERIC, notification_amount NUMERIC, 
                product_name VARCHAR, initial_price NUMERIC, product_link VARCHAR, ebayemail_id INT)
LANGUAGE plpgsql
AS $$
BEGIN   
    RETURN QUERY
        SELECT ebaylinks.user_id, users.first_name, users.email, ebaylinks.current_price, ebayemail.notification_amount, 
                ebaylinks.link_description, ebaylinks.initial_price, ebaylinks.link, ebayemail.id
        FROM ebaylinks
        INNER JOIN ebayemail
        ON link_id = ebaylinks.id
        INNER JOIN users 
        ON ebaylinks.user_id = users.id
        WHERE
        CASE WHEN ebayemail.price_increase = TRUE 
            THEN ebaylinks.current_price >= ebayemail.notification_amount
        WHEN ebayemail.price_increase = FALSE
            THEN ebaylinks.current_price <= ebayemail.notification_amount 
        END;
END;
$$;


