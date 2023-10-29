---------------point6-------------------------

--1) GROUP BY + HAVING
SELECT class, AVG(day_price)
FROM project.tariff
GROUP BY class
HAVING AVG(day_price) > 1000;

--2) ORDER BY
SELECT driver_nm, mark_rate
FROM project.driver
ORDER BY mark_rate;

--3) Оконная + partition
SELECT brand_nm, class, day_price,
       AVG(day_price) OVER (PARTITION BY class)
FROM project.tariff;
--4) Оконная + order by (нарастающий итог)
SELECT brand_nm, class, day_price,
       AVG(day_price) OVER (ORDER BY day_price)
FROM project.tariff;

--5) Оконная + group by + order by
SELECT brand_nm, class, day_price,
       AVG(day_price) OVER (PARTITION BY class ORDER BY day_price)
FROM project.tariff;

--6) Оконная + group by + order by
SELECT brand_nm, class, day_price,
    dense_rank() OVER (PARTITION BY class ORDER BY day_price)
FROM project.tariff;

--7) Оконная + функция сдвига
SELECT trip_id, trip_dt, first_value(price_amt) OVER (PARTITION BY trip_dt)
FROM project.trip;
