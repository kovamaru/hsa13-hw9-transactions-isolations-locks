SET autocommit = 0;
DROP DATABASE IF EXISTS test_db;
CREATE DATABASE test_db;
USE test_db;

CREATE TABLE IF NOT EXISTS accounts
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50),
    balance INT DEFAULT 0
) ENGINE = InnoDB;

INSERT INTO accounts (name, balance)
VALUES ('Alice', 100),
       ('Bob', 200);
COMMIT;