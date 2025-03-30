Задача 1
Условие

Определить, какие клиенты сделали более двух бронирований в разных отелях, и вывести информацию о каждом таком клиенте,
включая его имя, электронную почту, телефон, общее количество бронирований, а также список отелей,
 в которых они бронировали номера (объединенные в одно поле через запятую с помощью CONCAT).
 Также подсчитать среднюю длительность их пребывания (в днях) по всем бронированиям.
Отсортировать результаты по количеству бронирований в порядке убывания.

Ответ:

SELECT
    c.name,
    c.email,
    c.phone,
    COUNT(b.ID_booking) AS total_bookings,
    GROUP_CONCAT(DISTINCT h.name SEPARATOR ', ') AS hotel_list,  -- Замена STRING_AGG на GROUP_CONCAT
    ROUND(AVG(DATEDIFF(b.check_out_date, b.check_in_date)), 4) AS avg_stay_duration  -- Используем DATEDIFF
FROM Booking b
JOIN Customer c ON b.ID_customer = c.ID_customer
JOIN Room r ON b.ID_room = r.ID_room
JOIN Hotel h ON r.ID_hotel = h.ID_hotel
GROUP BY c.ID_customer, c.name, c.email, c.phone  -- Добавляем все поля из SELECT в GROUP BY для MySQL
HAVING
    COUNT(DISTINCT h.ID_hotel) > 1 AND
    COUNT(b.ID_booking) >= 3
ORDER BY total_bookings DESC;
