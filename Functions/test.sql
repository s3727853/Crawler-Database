CREATE FUNCTION test(numeric[]) RETURNS void AS $$
DECLARE
    x numeric[];
BEGIN   
    FOREACH x SLICE 1 IN ARRAY $1
    LOOP
        RAISE NOTICE 'ID = %, Price = %', x[1], x[2];
        
        INSERT INTO test(link_id, price)
        VALUES(x[1], x[2]);
        
    END LOOP;
END;
$$ LANGUAGE plpgsql;