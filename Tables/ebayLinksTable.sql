CREATE TABLE ebaylinks (
    id SERIAL PRIMARY KEY,
    user_id INT,
    link VARCHAR(1000) NOT NULL,
    link_description VARCHAR(1000) NOT NULL,
    last_crawled TIMESTAMP NOT NULL,   
    link_valid BOOLEAN NOT NULL,
    initial_price NUMERIC NOT NULL,
    current_price NUMERIC,
    crawl_interval INT NOT NULL,
    image VARCHAR,
    endtime VARCHAR,
    CONSTRAINT fk_id
        FOREIGN KEY(user_id)
            REFERENCES users(id)
            ON DELETE CASCADE
);