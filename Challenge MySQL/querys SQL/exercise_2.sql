/* 2) La asignatura de Matemáticas es una de las más exigentes según las encuestas estudiantiles.
Para conocer el estado histórico de los exámenes de fin de curso en esta materia se desea
obtener una tabla que contenga las columnas ‘Desaprobados’, ‘Regulares’, ‘Promocionados’,
‘Total’. Debe contener una sola fila con la cantidad de alumnos correspondiente a cada
columna.*/

SELECT 
    SUM(CASE WHEN N.valor < 60 THEN 1 ELSE 0 END) AS Desaprobados,
    SUM(CASE WHEN N.valor >= 60 AND N.valor < 80 THEN 1 ELSE 0 END) AS Regulares,
    SUM(CASE WHEN N.valor >= 80 THEN 1 ELSE 0 END) AS Promocionados,
    COUNT(*) AS Total
FROM Notas N
JOIN Materias M ON N.materia_id = M.materia_id
WHERE M.nombre = 'Matemáticas';
