CREATE TABLE users (
id SERIAL PRIMARY KEY,
first_name VARCHAR(130) NOT NULL,
last_name VARCHAR(130) NOT NULL,
email VARCHAR(130) NOT NULL UNIQUE,
role VARCHAR(20) NOT NULL,
pass_hash VARCHAR(200) NOT NULL,
created_at TIMESTAMP NOT NULL
);


CREATE TABLE ibanrates (
id serial PRIMARY KEY,
code VARCHAR(3) NOT NULL UNIQUE,
rate NUMERIC NOT NULL,
last_updated TIMESTAMP NOT NULL
);

CREATE TABLE ibanHistory (
    id SERIAL PRIMARY KEY,
    code VARCHAR(3) NOT NULL,
    rate NUMERIC NOT NULL,
    last_updated TIMESTAMP NOT NULL
);


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

