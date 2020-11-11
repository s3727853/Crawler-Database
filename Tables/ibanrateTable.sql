CREATE TABLE ibanrates (
id serial PRIMARY KEY,
code VARCHAR(3) NOT NULL UNIQUE,
rate NUMERIC NOT NULL,
last_updated TIMESTAMP NOT NULL
);

/* Add new entry example. INSERT INTO ibanrates (code, rate, last_updated) VALUES ('AUD', '1.03', NOW()); */
