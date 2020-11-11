CREATE TABLE ebaylinkhistory (
    id SERIAL PRIMARY KEY,
    link_id INT,
    time_crawled TIMESTAMP NOT NULL,   
    price NUMERIC NOT NULL,
    CONSTRAINT fk_id
        FOREIGN KEY(link_id)
            REFERENCES ebaylinks(id)
            ON DELETE CASCADE
);