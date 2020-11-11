CREATE TABLE ebayEmail (
    id SERIAL PRIMARY KEY,
    link_id INT,
    price_increase BOOLEAN NOT NULL,
    notification_amount NUMERIC NOT NULL,
    CONSTRAINT fk_id
        FOREIGN KEY(link_id)
            REFERENCES ebaylinks(id)
            ON DELETE CASCADE
);