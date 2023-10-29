---------------------INSERTs---------------------

-- Добавление в таблицу driver
INSERT INTO project.driver (driver_nm, mark_rate, license_valid_to_dt, bank_acc_number)
VALUES ('Иванов Иван Иванович', 4.5, '2024-05-01', 1234567),       ('Петров Петр Петрович', 4.2, '2023-11-15', 9876543),
       ('Сидоров Сидор Сидорович', 4.8, '2023-09-30', 2468135),       ('Кузнецова Анна Викторовна', 4.6, '2024-02-28', 1357908),
       ('Крылов Максим Игоревич', 4.9, '2022-12-31', 8642135),       ('Морозова Екатерина Олеговна', 4.3, '2023-07-20', 9753108),
       ('Александров Сергей Викторович', 4.7, '2024-06-15', 3692581),       ('Белов Денис Андреевич', 4.2, '2023-11-01', 7418529),
       ('Дмитриев Владислав Юрьевич', 4.5, '2022-10-10', 2581473),       ('Козлова Алена Дмитриевна', 4.4, '2023-08-25', 9638527);

SELECT *
FROM project.driver;
-- Добавление в таблицу client
INSERT INTO project.client (client_nm, mark_rate, bank_acc_number) VALUES ('Смирнов Андрей Николаевич', 4.2, 1234567),
       ('Медведева Ольга Викторовна', 4.7, 9876543),       ('Комаров Сергей Иванович', 4.3, 2468135),
       ('Николаев Максим Александрович', 4.6, 1357908),       ('Белоусова Людмила Петровна', 4.5, 8642135),
       ('Карпов Алексей Олегович', 4.8, 9753108),       ('Соколова Екатерина Сергеевна', 4.4, 3692581),
       ('Фомин Илья Денисович', 4.1, 7418529),       ('Гусева Анастасия Дмитриевна', 4.9, 2581473),
       ('Андреев Владислав Викторович', 4.7, 9638527);

SELECT *
FROM project.client;

--добавление в таблицу "leasing_company":

INSERT INTO project.leasing_company (company_nm, car_amt, address)
VALUES ('Авто-Парк', 50, 'г. Москва, ул. Ленина, д. 10');

INSERT INTO project.leasing_company (company_nm, car_amt, address)
VALUES ('Лизинг-Авто', 30, 'г. Санкт-Петербург, пр. Невский, д. 20');

INSERT INTO project.leasing_company (company_nm, car_amt, address)
VALUES ('Такси-Лизинг', 20, 'г. Екатеринбург, ул. Красноармейская, д. 5');

INSERT INTO project.leasing_company (company_nm, car_amt, address)
VALUES ('Аренда-авто', 12, 'г. Королёв, ул. Пионерская, д. 12');

INSERT INTO project.leasing_company (company_nm, car_amt, address)
VALUES ('Своё-авто', 15, 'г. Мытищи, ул. Дирижабельная, д. 50');

SELECT *
FROM project.leasing_company;

--добавление в таблицу "tariff":

INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Toyota Camry', 'econ', 2500, '2020-01-01', '2023-01-01');

INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Mercedes-Benz S-Class', 'lux', 15000, '2020-01-01', '2023-01-01');

INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Kia Optima', 'comf', 3000, '2020-01-01', '2023-01-01');

INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Kia Rio', 'econ', 2000, '2020-01-01', '2023-01-01');

INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Volkswagen Polo', 'econ', 2000, '2020-01-01', '2023-01-01');



INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Lada Samara', 'econ', 1000, '2020-01-01', '2023-01-01');

INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Chevrolet Cruz', 'comf', 2500, '2020-01-01', '2023-01-01');

INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Kia Seed', 'comf', 2750, '2020-01-01', '2023-01-01');

INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Hyundai Solaris', 'econ', 1900, '2020-01-01', '2023-01-01');

INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
VALUES ('Mitsuboshi Lancer', 'comf', 3750, '2020-01-01', '2023-01-01');

SELECT *
FROM project.tariff;

--добпвление в таблицу "rental_car":

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (1, 'Toyota Camry', 1, 10000, '2023-02-28');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (2, 'Mercedes-Benz S-Class', 2, 13213, '2022-03-14');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (3, 'Kia Optima', 3, 400123, '2022-03-14');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (4, 'Kia Rio', 4, 323864, '2022-03-14');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (5, 'Volkswagen Polo', 5, 111421, '2022-03-14');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (5, 'Toyota Camry', 1, 104324, '2021-02-28');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (4, 'Mercedes-Benz S-Class', 2, 1321343, '2023-01-01');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (3, 'Kia Optima', 3, 38574, '2022-07-15');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (2, 'Kia Rio', 4, 431154, '2022-10-08');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (1, 'Volkswagen Polo', 5, 629321, '2022-04-23');






INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (1, 'Toyota Camry', 1, 10000, '2023-02-28');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (2, 'Mercedes-Benz S-Class', 2, 13213, '2022-03-14');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (3, 'Kia Optima', 3, 400123, '2022-03-14');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (4, 'Kia Rio', 4, 323864, '2022-03-14');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (5, 'Volkswagen Polo', 5, 111421, '2022-03-14');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (5, 'Toyota Camry', 1, 104324, '2021-02-28');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (4, 'Mercedes-Benz S-Class', 2, 1321343, '2023-01-01');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (3, 'Kia Optima', 3, 38574, '2022-07-15');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (2, 'Kia Rio', 4, 431154, '2022-10-08');

INSERT INTO project.rental_car (company_id, brand_nm, cur_tariff_id, mileage_amt, maintenance_dt)
VALUES (1, 'Volkswagen Polo', 5, 629321, '2022-04-23');


SELECT *
FROM project.rental_car;

--добпвление в таблицу "trip":

INSERT INTO project.trip (driver_id, client_id, car_id, start_coord, finish_coord, price_amt, trip_dt) VALUES
        (1, 10, 3, '(32, 123)', '(75, 234)', 321.32, '2022-12-01'),     (2, 9, 5, '(43, 63)', '(2, 40)', 654.31, '2022-11-20'),
        (1, 1, 3, '(32, 123)', '(75, 234)', 321.32, '2022-12-01'),     (2, 2, 5, '(43, 63)', '(2, 40)', 654.31, '2022-11-20'),
        (3, 8, 4, '(234, 43)', '(48, 632)', 564.65, '2022-06-21'),     (4, 7, 2, '(75, 234)', '(764, 42)', 434.4, '2022-06-24'),
        (5, 6, 1, '(234, 862)', '(74, 38)', 766.35, '2022-12-01'),     (6, 5, 10, '(285, 1224)', '(74, 123)', 534.423, '2022-05-12'),
        (7, 4, 6, '(42, 746)', '(14, 765)', 3213.12, '2022-03-18'),     (8, 3, 8, '(2342, 23)', '(922, 52)', 452.23, '2023-01-23'),
        (9, 2, 9, '(836, 3)', '(55, 857)', 1010.23, '2023-02-18'),     (10, 1, 7, '(43, 86)', '(534, 234)', 232.23, '2022-03-03');

SELECT *
FROM project.trip;

--добавление в таблицу "lease":

INSERT INTO project.lease (driver_id, car_id, rent_start_dt, rent_finish_dt) VALUES
        (1, 2, '2023-01-10', '2023-01-25'),     (2, 5, '2022-10-01', '2022-10-15'),
        (4, 5, '2022-11-01', '2022-11-15'),     (5, 7, '2022-12-20', '2022-12-30'),
        (7, 7, '2023-02-01', '2023-02-20');

SELECT *
FROM project.lease;

--добпвление в таблицу "fine_type":

INSERT INTO project.fine_type (fine_cause, fine_description, fine_rate) VALUES
        (1, 'Превышение скорости', 2),     (2, 'Остановка в неположенном месте', 2),
        (3, 'Пересечение сполошной линии', 4),     (4, 'Обгон в неположенном месте', 3),
        (5, 'Опасное вождение', 3);

SELECT *
FROM project.fine_type;

--добпвление в таблицу "fine":

INSERT INTO project.fine (fine_id, car_id, fine_dt, fine_amt, is_payed, fine_cause) VALUES
        (1, 2, '2023-01-23', 5000.0, FALSE, 1),     (2, 5, '2022-10-05', 3000.0, TRUE, 2),
        (3, 5, '2022-11-09', 10000.0, TRUE, 3),     (4, 7, '2022-12-30', 10000.0, FALSE, 4),
        (5, 7, '2023-02-03', 7500.0, FALSE, 5);

SELECT *
FROM project.fine;
