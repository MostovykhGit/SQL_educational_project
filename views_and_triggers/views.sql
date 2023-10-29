-------------------point9--------------------

--1) основная информация о водителе со скрытием карты

CREATE VIEW public_driver AS
    SELECT driver_id, driver_nm, mark_rate, concat(LEFT(CAST(bank_acc_number AS TEXT), 3), '*****', RIGHT(CAST(bank_acc_number AS TEXT), 3))
    FROM project.driver
    ORDER BY driver_id;

SELECT *
FROM public_driver;

--2) основная информация о клиенте со скрытием карты

CREATE VIEW public_client AS
    SELECT client_id, client_nm, mark_rate, concat(LEFT(CAST(bank_acc_number AS TEXT), 3), '*****', RIGHT(CAST(bank_acc_number AS TEXT), 3))
    FROM project.client
    ORDER BY client_id;

SELECT *
FROM public_client;

--3) кол-во поездок по клиентам и по водителям

CREATE VIEW driver_trip_cnt AS
    SELECT DISTINCT d.driver_id, d.driver_nm, COUNT(*) OVER (PARTITION BY d.driver_id)
    FROM project.driver d
    JOIN project.trip t ON d.driver_id = t.driver_id
    ORDER BY d.driver_id;

SELECT *
FROM driver_trip_cnt;

CREATE VIEW client_trip_cnt AS
    SELECT DISTINCT c.client_id, c.client_nm, COUNT(*) OVER (PARTITION BY c.client_id)
    FROM project.client c
    JOIN project.trip t ON c.client_id = t.client_id
    ORDER BY c.client_id;

SELECT *
FROM client_trip_cnt;

--4) Кол-во штрафов, полученных водителем

CREATE VIEW fines_per_driver AS
    SELECT driver_id, COUNT (*) OVER (PARTITION BY driver_id)
    FROM project.driver d JOIN project.lease l ON d.driver_id = l.driver_id

--5) Кол-во неоплаченных штрафов лизинговой компании

CREATE VIEW not_payed_fines AS
    SELECT l.company_id, COUNT(*) OVER (PARTITION BY l.company_id)
    FROM project.fine f JOIN project.rental_car r ON (f.car_id = r.car_id AND f.is_payed = FALSE)
        JOIN project.leasing_company l ON r.company_id = l.company_id;

SELECT *
FROM not_payed_fines;

--6) Актуальные тарифы

CREATE VIEW current_tariff AS
    SELECT *
    FROM project.tariff
    WHERE valid_from_dt < now() AND now()  < valid_to_dt;

SELECT *
FROM current_tariff;

