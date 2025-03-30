Задача 3
Условие

Вам необходимо провести анализ данных о бронированиях в отелях и определить предпочтения клиентов
по типу отелей. Для этого выполните следующие шаги:

Категоризация отелей.
Определите категорию каждого отеля на основе средней стоимости номера:

«Дешевый»: средняя стоимость менее 175 долларов.
«Средний»: средняя стоимость от 175 до 300 долларов.
«Дорогой»: средняя стоимость более 300 долларов.
Анализ предпочтений клиентов.
Для каждого клиента определите предпочитаемый тип отеля на основании условия ниже:

Если у клиента есть хотя бы один «дорогой» отель, присвойте ему категорию «дорогой».
Если у клиента нет «дорогих» отелей, но есть хотя бы один «средний»,
присвойте ему категорию «средний».
Если у клиента нет «дорогих» и «средних» отелей, но есть «дешевые»,
присвойте ему категорию предпочитаемых отелей «дешевый».
Вывод информации.
Выведите для каждого клиента следующую информацию:

ID_customer: уникальный идентификатор клиента.
name: имя клиента.
preferred_hotel_type: предпочитаемый тип отеля.
visited_hotels: список уникальных отелей, которые посетил клиент.
Сортировка результатов.
Отсортируйте клиентов так,
чтобы сначала шли клиенты с «дешевыми» отелями, затем со «средними» и в конце — с «дорогими».

Ответ:

WITH HotelCategories AS (
    SELECT
        h.ID_hotel,
        CASE
            WHEN AVG(r.price) < 175 THEN 'Дешевый'
            WHEN AVG(r.price) <= 300 THEN 'Средний'
            ELSE 'Дорогой'
        END AS hotel_category
    FROM Hotel h
    JOIN Room r USING(ID_hotel)
    GROUP BY h.ID_hotel
),
CustomerPreferences AS (
    SELECT
        b.ID_customer,
        MAX(hc.hotel_category) AS preferred_hotel_type,
        GROUP_CONCAT(DISTINCT h.name ORDER BY h.name SEPARATOR ', ') AS visited_hotels
    FROM Booking b
    JOIN Room r USING(ID_room)
    JOIN HotelCategories hc USING(ID_hotel)
    JOIN Hotel h USING(ID_hotel)
    GROUP BY b.ID_customer
)

SELECT
    c.ID_customer,
    c.name,
    cp.preferred_hotel_type,
    cp.visited_hotels
FROM CustomerPreferences cp
JOIN Customer c USING(ID_customer)
ORDER BY
    FIELD(cp.preferred_hotel_type, 'Дешевый', 'Средний', 'Дорогой'),
    c.name;
