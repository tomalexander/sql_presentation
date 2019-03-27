BEGIN;

CREATE TABLE customer (
       id SERIAL PRIMARY KEY,
       name TEXT NOT NULL,
       country TEXT NOT NULL,
       phone_number TEXT
);

INSERT INTO customer (name, country, phone_number) VALUES ('Becky', 'US', '2125550123');
INSERT INTO customer (name, country, phone_number) VALUES ('Joe', 'US', '2125551111');
INSERT INTO customer (name, country, phone_number) VALUES ('Samantha', 'CA', '2125552222');
INSERT INTO customer (name, country, phone_number) VALUES ('Zen', 'US', '2125553333');
INSERT INTO customer (name, country, phone_number) VALUES ('Chris', 'MX', '2125554444');
INSERT INTO customer (name, country, phone_number) VALUES ('Emily', 'JP', '2125559876');
INSERT INTO customer (name, country, phone_number) VALUES ('Marcus', 'US', '2125554580');

CREATE TABLE transaction (
       id SERIAL PRIMARY KEY,
       customer_id INT NOT NULL,
       time TIMESTAMP NOT NULL,

       FOREIGN KEY (customer_id) REFERENCES customer (id)
);

INSERT INTO transaction (customer_id, time) VALUES (1, '2019-01-20 09:57:00');
INSERT INTO transaction (customer_id, time) VALUES (3, '2019-01-22 19:20:00');
INSERT INTO transaction (customer_id, time) VALUES (5, '2019-01-18 15:01:00');
INSERT INTO transaction (customer_id, time) VALUES (6, '2019-01-18 16:03:00');

CREATE TABLE line_item (
       id SERIAL PRIMARY KEY,
       transaction_id INT NOT NULL,
       name TEXT NOT NULL,
       cost MONEY NOT NULL,

       FOREIGN KEY (transaction_id) REFERENCES transaction (id)
);

INSERT INTO line_item (transaction_id, name, cost) VALUES (1, 'Bicycle', 99);
INSERT INTO line_item (transaction_id, name, cost) VALUES (1, 'Cake', 5);
INSERT INTO line_item (transaction_id, name, cost) VALUES (2, 'Banana', 10);
INSERT INTO line_item (transaction_id, name, cost) VALUES (3, 'Pencil', 1);
INSERT INTO line_item (transaction_id, name, cost) VALUES (4, 'Car', 10000);



COMMIT;
