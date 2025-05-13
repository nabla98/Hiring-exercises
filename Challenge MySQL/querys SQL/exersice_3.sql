/* 3) A fin de priorizar la asignación de recursos educativos entre las materias, se desea obtener el
listado de id de aquellas materias que tengan más de 5 alumnos inscriptos antes del año
2022. */

SELECT materia_id
FROM Inscripciones
WHERE strftime('%Y', fecha_inscripcion) < '2022'
GROUP BY materia_id
HAVING COUNT(*) > 5;
