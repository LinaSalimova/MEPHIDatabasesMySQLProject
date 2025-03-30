# Проект по базам данных MySQL (МИФИ)

Этот репозиторий содержит учебный проект, разработанный в рамках курса по базам данных в МИФИ (Московский инженерно-физический институт). Проект демонстрирует практическое применение реляционных баз данных и SQL.

---

## Описание проекта

Проект направлен на освоение основ работы с реляционными базами данных и получение практических навыков работы с MySQL. Включает:
- Создание базы данных и таблиц.
- Написание и выполнение SQL-запросов.
- Решение практических задач, связанных с анализом и управлением данными.

---

## Требования

Для работы с проектом необходимо:
- **MySQL Server** версии 5.5 или выше.
- Клиент для управления MySQL (например, MySQL Workbench, phpMyAdmin или командная строка).
- Любая среда разработки для работы с SQL (опционально).

---

## Структура репозитория

Репозиторий организован в папки, каждая из которых соответствует отдельной базе данных и набору задач:

| Папка                                   | Описание задачи                                               |
|-----------------------------------------|--------------------------------------------------------------|
| `Task_1 Database "Vehicles"`            | Работа с данными о транспортных средствах.                   |
| `Task_2 Database "Car racing"`          | Анализ данных об автогонках.                                 |
| `Task_3 Database "Hotel booking"`       | Управление данными о бронировании отелей.                    |
| `Task_4 Database "Organization structure"` | Управление данными организационной структуры.                |

Каждая папка содержит:
- SQL-скрипты для создания и заполнения базы данных (`Creating_and_filling_the_database.sql`).
- SQL-скрипты с решениями задач (например, `Task1_1.sql`, `Task2_3.sql`).
- Скриншоты результатов выполнения запросов (например, `Task1_1.png`).

---

## Примеры задач

### Task 1: Vehicles
**Пример задачи:**  
Условие

Найдите производителей (maker) и модели всех мотоциклов, которые имеют мощность более 150 лошадиных сил,
стоят менее 20 тысяч долларов и являются спортивными (тип Sport). 
Также отсортируйте результаты по мощности в порядке убывания.

---

## Как запустить проект

1. **Создайте базу данных в MySQL**:
CREATE DATABASE mydatabase;



2. **Подключитесь к базе данных**:  
Например, через командную строку:
mysql -u root -p mydatabase



3. **Создайте таблицы и заполните их данными**:  
Выполните скрипт `Creating_and_filling_the_database.sql` из папки соответствующей задачи:
SOURCE Task_1/Creating_and_filling_the_database.sql;


4. **Выполните решение задачи**:  
После создания таблиц выполните SQL-запросы из файлов задач:
SOURCE Task_1/Task1_1.sql;



---

## Примечания

- Скрипты создают только таблицы и наполняют их данными, но не создают саму базу данных — её нужно создать вручную.
- Задачи выполняются последовательно: сначала запускается скрипт `Creating_and_filling_the_database.sql`, затем выполняются файлы с запросами для решения задач.
- Для выполнения скриптов требуется установленный MySQL Server.

---

## Лицензия

Этот проект создан в образовательных целях и не предназначен для коммерческого использования.
Этот текст написан на русском языке, оформлен в стиле README для GitHub и соответствует стандартам оформления репозиториев.
