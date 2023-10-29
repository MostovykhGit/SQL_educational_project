-------------------point11--------------------
--1) Поддержание корректного leasing_company.car_amt

CREATE FUNCTION car_amt_raise()
RETURNS TRIGGER
AS $$
    BEGIN
        UPDATE project.leasing_company SET car_amt = car_amt + 1
        WHERE company_id = NEW.company_id;
        RETURN NEW;
    END;
    $$
LANGUAGE plpgsql;

CREATE TRIGGER car_amt_maintain
    AFTER INSERT ON project.rental_car
    FOR EACH ROW EXECUTE FUNCTION car_amt_raise();

--2) Поддержание корректного поля rental_car.cur_tariff_id (так как таблица tariff версионная)

CREATE FUNCTION cur_tariff_id_change()
RETURNS TRIGGER
AS $$
    BEGIN
        INSERT INTO project.tariff (brand_nm, class, day_price, valid_from_dt, valid_to_dt)
            VALUES (concat(NEW.brand_nm, ' EXPIRED'), OLD.class, OLD.day_price, OLD.valid_from_dt, now());

        RETURN NEW;
    END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER cur_tariff_id_maintain
    BEFORE UPDATE ON project.tariff
    FOR EACH ROW EXECUTE FUNCTION cur_tariff_id_change();
