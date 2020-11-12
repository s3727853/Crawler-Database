CREATE OR REPLACE FUNCTION updateLink(arg_id INT, arg_interval INT)
RETURNS text AS
$func$
BEGIN   
    UPDATE ebaylinks
        SET 
            crawl_interval = arg_interval
            WHERE id = arg_id;
 
    IF NOT FOUND THEN   
        RETURN 'Link not found';
    ELSE
        RETURN 'link updated';
    END IF;

END;
$func$
LANGUAGE plpgsql; 

        
