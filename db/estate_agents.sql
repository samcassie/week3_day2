DROP TABLE IF EXISTS houses;

CREATE TABLE houses (
    id SERIAL PRIMARY KEY,
    address VARCHAR(255),
    value INT,
    number_of_bedrooms INT,
    build VARCHAR(255)
);
