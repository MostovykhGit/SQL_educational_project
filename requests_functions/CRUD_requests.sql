---------------point5-------------------------

--1) CREATE
INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Toyota Camry', 'econ', 2000, '2019-01-01', '2020-01-01');

INSERT INTO project.driver (driver_nm, mark_rate, license_valid_to_dt, bank_acc_number)
VALUES ('Панарин Александр Антоновичб', '1.2', '2019-01-02', 3213321);

INSERT INTO project.driver (driver_nm, mark_rate, license_valid_to_dt, bank_acc_number)
VALUES ('Ковальчук Илья Александрович', '3.1', '2019-01-02', 431321);

--2) CREATE
INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Kia Rio', 'econ', 1500, '2018-01-01', '2019-01-01');

--3) READ
SELECT *
FROM project.driver;

--4) READ
SELECT *
FROM project.client;

--5) READ
SELECT fine_id, fine_cause
FROM project.fine;

--6) UPDATE
UPDATE project.driver
SET driver_nm = 'Иванов Альберт Иванович'
WHERE driver_id = 1;

--7) UPDATE
UPDATE project.client
SET mark_rate = 5.0
WHERE client_id = 1;

--8) UPDATE
UPDATE project.client
SET bank_acc_number = 543122434
WHERE client_id = 3;

--9) DELETE
DELETE FROM project.driver
WHERE mark_rate < 2;

--10) DELETE
DELETE FROM project.driver
WHERE driver_id = 12;
