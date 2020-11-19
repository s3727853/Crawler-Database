CREATE TABLE ibanHistory (
    id SERIAL PRIMARY KEY,
    code VARCHAR(3) NOT NULL,
    rate NUMERIC NOT NULL,
    last_updated TIMESTAMP NOT NULL
);
