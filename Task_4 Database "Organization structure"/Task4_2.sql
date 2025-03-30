Задача 2
Условие

Найти всех сотрудников, подчиняющихся Ивану Иванову с EmployeeID = 1, включая их подчиненных и подчиненных подчиненных. Для каждого сотрудника вывести следующую информацию:

EmployeeID: идентификатор сотрудника.
Имя сотрудника.
Идентификатор менеджера.
Название отдела, к которому он принадлежит.
Название роли, которую он занимает.
Название проектов, к которым он относится (если есть, конкатенированные в одном столбце).
Название задач, назначенных этому сотруднику (если есть, конкатенированные в одном столбце).
Общее количество задач, назначенных этому сотруднику.
Общее количество подчиненных у каждого сотрудника (не включая подчиненных их подчиненных).
Если у сотрудника нет назначенных проектов или задач, отобразить NULL.

Ответ:

WITH RECURSIVE Subordinates AS (
    SELECT
        EmployeeID,
        Name AS EmployeeName,
        ManagerID,
        DepartmentID,
        RoleID
    FROM Employees
    WHERE ManagerID = 1  -- Начало с менеджера ID 1 (Иван)

    UNION ALL

    SELECT
        e.EmployeeID,
        e.Name,
        e.ManagerID,
        e.DepartmentID,
        e.RoleID
    FROM Employees e
    INNER JOIN Subordinates s
        ON e.ManagerID = s.EmployeeID
)
SELECT
    s.EmployeeID,
    s.EmployeeName,
    s.ManagerID,
    d.DepartmentName,
    r.RoleName,
    COALESCE(
        (SELECT GROUP_CONCAT(p.ProjectName SEPARATOR ', ')
         FROM Projects p
         WHERE p.DepartmentID = s.DepartmentID
         GROUP BY p.DepartmentID),
        'NULL'
    ) AS ProjectNames,
    COALESCE(
        (SELECT GROUP_CONCAT(t.TaskName SEPARATOR ', ')
         FROM Tasks t
         WHERE t.AssignedTo = s.EmployeeID
         GROUP BY t.AssignedTo),
        'NULL'
    ) AS TaskNames,
    (SELECT COUNT(*)
     FROM Tasks t
     WHERE t.AssignedTo = s.EmployeeID) AS TotalTasks,
    (SELECT COUNT(*)
     FROM Employees e
     WHERE e.ManagerID = s.EmployeeID) AS TotalSubordinates
FROM Subordinates s
LEFT JOIN Departments d ON s.DepartmentID = d.DepartmentID
LEFT JOIN Roles r ON s.RoleID = r.RoleID
ORDER BY s.EmployeeName;
