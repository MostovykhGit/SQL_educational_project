--------------point10-----------------

--1) Колличество дней до просрочки водительской лицензии по id
CREATE FUNCTION days_until_end_of_license(date)
RETURNS INTEGER
AS 'SELECT $1 - CURRENT_DATE;'
LANGUAGE SQL;


SELECT driver_nm, days_until_end_of_license(license_valid_to_dt)
FROM project.driver;

--2) Подсчёт колличества поездок у водителя/клиента по id
CREATE FUNCTION trips_amt(driver1_client2 integer, id integer)
RETURNS INTEGER
AS 'SELECT COUNT(*)
    FROM project.trip
    WHERE CASE
            WHEN driver1_client2 = 1 THEN driver_id = id
            WHEN driver1_client2 = 2 THEN client_id = id
          END;
    '
LANGUAGE SQL;

SELECT driver_id, driver_nm, trips_amt(1, driver_id)
FROM project.driver;

SELECT client_id, client_nm, trips_amt(2, client_id)
FROM project.client;

