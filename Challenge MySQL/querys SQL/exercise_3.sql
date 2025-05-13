/* 4) El equipo directivo de Corebi School desea conocer la variación generacional en los
estudiantes inscritos. Para ello es necesario obtener el listado de la cantidad de alumnos
registrados por cada generación (año de nacimiento) ordenados por año descendentemente*/

SELECT strftime('%Y', fecha_nacimiento) AS Generacion, COUNT(*) AS cantidad_alumnos
FROM Alumnos
GROUP BY strftime('%Y', fecha_nacimiento)
ORDER BY Generacion DESC;
