/* 1) El equipo docente de la asignatura Historia sostiene que hay una gran cantidad de alumnos
promocionados en su materia nacidos desde 1998 en adelante. Se desea obtener su id,
nombre y fecha de nacimiento.*/

SELECT a.alumno_id, a.nombre, a.fecha_nacimiento 
FROM Alumnos as a 
JOIN Inscripciones as i ON a.alumno_id = i.alumno_id
JOIN Notas AS n ON a.alumno_id = n.alumno_id AND i.materia_id = n.materia_id
JOIN Materias as m ON i.materia_id = m.materia_id
WHERE m.nombre = 'Historia' AND a.fecha_nacimiento >= '1998-01-01';
