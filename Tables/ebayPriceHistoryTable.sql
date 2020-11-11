CREATE TABLE ebayPriceHistory (
    id SERIAL PRIMARY KEY,
    link_id INT NOT NULL,
    price NUMERIC NOT NULL,
    date TIMESTAMP NOT NULL,
    CONSTRAINT fk_id
        FOREIGN KEY(link_id)
            REFERENCES ebaylinks(id)
            ON DELETE CASCADE
);