Задача 2
Условие

Найти информацию о производителях и моделях различных типов транспортных средств
(автомобили, мотоциклы и велосипеды), которые соответствуют заданным критериям.

2.1 Автомобили:
Извлечь данные о всех автомобилях, которые имеют:

Мощность двигателя более 150 лошадиных сил.
Объем двигателя менее 3 литров.
Цену менее 35 тысяч долларов.
В выводе должны быть указаны производитель (maker),
номер модели (model), мощность (horsepower), объем двигателя (engine_capacity)
и тип транспортного средства, который будет обозначен как Car.

2.2 Мотоциклы:
Извлечь данные о всех мотоциклах, которые имеют:

Мощность двигателя более 150 лошадиных сил.
Объем двигателя менее 1,5 литров.
Цену менее 20 тысяч долларов.
В выводе должны быть указаны производитель (maker),
номер модели (model), мощность (horsepower), объем двигателя (engine_capacity)
и тип транспортного средства, который будет обозначен как Motorcycle.

2.3 Велосипеды:
Извлечь данные обо всех велосипедах, которые имеют:

Количество передач больше 18.
Цену менее 4 тысяч долларов.
В выводе должны быть указаны производитель (maker), номер модели (model),
а также NULL для мощности и объема двигателя,
так как эти характеристики не применимы для велосипедов.
Тип транспортного средства будет обозначен как Bicycle.

Сортировка:
Результаты должны быть объединены в один набор данных и отсортированы по мощности в порядке убывания.
Для велосипедов, у которых нет значения мощности, они будут располагаться внизу списка.

Ответ:

SELECT
    maker,
    model,
    horsepower,
    engine_capacity,
    vehicle_type
FROM (
    -- Автомобили
    SELECT
        v.maker,
        c.model,
        c.horsepower,
        c.engine_capacity,
        'Car' AS vehicle_type
    FROM
        Vehicle v
    JOIN
        Car c ON v.model = c.model
    WHERE
        c.horsepower > 150
        AND c.price < 35000.00
        AND c.engine_capacity < 3.0

    UNION ALL

    -- Мотоциклы
    SELECT
        v.maker,
        m.model,
        m.horsepower,
        m.engine_capacity,
        'Motorcycle' AS vehicle_type
    FROM
        Vehicle v
    JOIN
        Motorcycle m ON v.model = m.model
    WHERE
        m.horsepower > 150
        AND m.price < 20000.00
        AND m.engine_capacity < 1.5

    UNION ALL

    -- Велосипеды
    SELECT
        v.maker,
        b.model,
        NULL AS horsepower,
        NULL AS engine_capacity,
        'Bicycle' AS vehicle_type
    FROM
        Vehicle v
    JOIN
        Bicycle b ON v.model = b.model
    WHERE
        b.gear_count > 18
        AND b.price < 4000.00
) AS combined_vehicles
ORDER BY
    horsepower IS NULL, horsepower DESC;

