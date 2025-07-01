CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(128), email VARCHAR(128) UNIQUE, password_hash TEXT, role VARCHAR(32));
CREATE TABLE bands (id SERIAL PRIMARY KEY, name VARCHAR(128), owner_user_id INT REFERENCES users(id));
CREATE TABLE band_members (id SERIAL PRIMARY KEY, band_id INT REFERENCES bands(id), user_id INT REFERENCES users(id), joined_on DATE);
CREATE TABLE rehearsals (id SERIAL PRIMARY KEY, band_id INT REFERENCES bands(id), datetime TIMESTAMP, location VARCHAR(128), created_by INT REFERENCES users(id));
CREATE TABLE attendance (id SERIAL PRIMARY KEY, rehearsal_id INT REFERENCES rehearsals(id), user_id INT REFERENCES users(id), status VARCHAR(32), checked_in_at TIMESTAMP);