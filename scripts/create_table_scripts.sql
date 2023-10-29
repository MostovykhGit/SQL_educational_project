CREATE SCHEMA IF NOT EXISTS project;

----------------------------------------------
CREATE TABLE IF NOT EXISTS project.driver (
    driver_id SERIAL PRIMARY KEY,
    driver_nm VARCHAR NOT NULL,
    mark_rate FLOAT,
    license_valid_to_dt DATE,
    bank_acc_number INTEGER
);

ALTER TABLE project.driver ADD CHECK (mark_rate > 0.0 AND mark_rate <= 5.0);

----------------------------------------------
CREATE TABLE IF NOT EXISTS project.client (
    client_id SERIAL PRIMARY KEY,
    client_nm VARCHAR NOT NULL,
    mark_rate FLOAT,
    bank_acc_number INTEGER
);

ALTER TABLE project.client ADD CHECK (mark_rate > 0.0 AND mark_rate <= 5.0);
----------------------------------------------
CREATE TABLE IF NOT EXISTS project.leasing_company (
    company_id SERIAL PRIMARY KEY,
    company_nm VARCHAR NOT NULL,
    car_amt INTEGER,
    address VARCHAR
);
----------------------------------------------
CREATE TYPE different_classes AS ENUM ('econ', 'comf', 'lux');
CREATE TABLE IF NOT EXISTS project.tariff (
    tariff_id SERIAL PRIMARY KEY,
    brand_nm VARCHAR,
    class different_classes,
    day_price FLOAT,
    valid_from_dt DATE,
    valid_to_dt DATE
);

ALTER TABLE project.tariff ADD CHECK (day_price > 0);
----------------------------------------------
CREATE TABLE IF NOT EXISTS project.rental_car (
    car_id SERIAL PRIMARY KEY,
    company_id INTEGER,
    cur_tariff_id INTEGER,
    brand_nm VARCHAR NOT NULL,
    mileage_amt INTEGER,
    maintenance_dt DATE
);

ALTER TABLE project.rental_car ADD CONSTRAINT FK_rental_car_leasing_company
FOREIGN KEY (company_id) REFERENCES project.leasing_company(company_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE project.rental_car ADD CONSTRAINT FK_car_tariff
FOREIGN KEY (cur_tariff_id) REFERENCES project.tariff(tariff_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

----------------------------------------------
CREATE TABLE IF NOT EXISTS project.trip (
    trip_id SERIAL PRIMARY KEY,
    driver_id INTEGER,
    client_id INTEGER,
    car_id INTEGER,
    start_coord POINT,
    finish_coord POINT,
    price_amt FLOAT,
    trip_dt DATE
);

ALTER TABLE project.trip ADD CONSTRAINT FK_trip_driver
FOREIGN KEY (driver_id) REFERENCES project.driver(driver_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE project.trip ADD CONSTRAINT FK_trip_client
FOREIGN KEY (client_id) REFERENCES project.client(client_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE project.trip ADD CONSTRAINT FK_trip_car
FOREIGN KEY (car_id) REFERENCES project.rental_car(car_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE project.trip ADD CHECK (price_amt > 0);
----------------------------------------------
CREATE TABLE IF NOT EXISTS project.lease (
    rent_id SERIAL PRIMARY KEY,
    driver_id INTEGER,
    car_id INTEGER,
    rent_start_dt DATE,
    rent_finish_dt DATE
);

ALTER TABLE project.lease ADD CONSTRAINT FK_lease_driver
FOREIGN KEY (driver_id) REFERENCES project.driver(driver_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE project.lease ADD CONSTRAINT FK_lease_car
FOREIGN KEY (car_id) REFERENCES project.rental_car(car_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;
----------------------------------------------
CREATE TABLE IF NOT EXISTS project.fine_type (
    fine_cause INTEGER UNIQUE PRIMARY KEY,
    fine_description VARCHAR,
    fine_rate INTEGER
);

----------------------------------------------
CREATE TABLE IF NOT EXISTS project.fine (
    fine_id INTEGER UNIQUE PRIMARY KEY,
    car_id INTEGER,
    fine_dt DATE,
    fine_amt FLOAT,
    is_payed BOOLEAN,
    fine_cause INTEGER
);

ALTER TABLE project.fine ADD CONSTRAINT FK_fine_car
FOREIGN KEY (car_id) REFERENCES project.rental_car(car_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE project.fine ADD CONSTRAINT FK_fine_type
FOREIGN KEY (fine_cause) REFERENCES project.fine_type(fine_cause)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE project.fine ADD CHECK (fine_amt > 0);
