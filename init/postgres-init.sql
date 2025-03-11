\c postgres;

DO $$
    BEGIN
        IF EXISTS (SELECT FROM pg_database WHERE datname = 'test_db') THEN
            PERFORM pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'test_db';
        END IF;
    END $$;

DROP DATABASE IF EXISTS test_db;
CREATE DATABASE test_db;

\c test_db;

DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts
(
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(50),
    balance INT DEFAULT 0
);

INSERT INTO accounts (name, balance)
VALUES ('Alice', 100),
       ('Bob', 200);