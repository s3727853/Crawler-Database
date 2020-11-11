CREATE OR REPLACE FUNCTION getEbayUpdateList()
RETURNS TABLE(link_id INT, link VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
        SELECT id, "ebaylinks".link
        FROM ebaylinks
        WHERE EXTRACT(EPOCH FROM (now() - last_crawled)) > "ebaylinks".crawl_interval * 60 * 60 AND link_valid = TRUE;
END;
$$;