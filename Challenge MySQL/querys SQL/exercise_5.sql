/* 5) Para obtener la “Beca de investigación en ciencias naturales” es necesario cumplir con 10 o
más créditos en los exámenes del año correspondiente. Para ganar los créditos de una
materia es necesario como mínimo regularizarla. Se desea conocer el nombre y cantidad de
créditos de los alumnos ganadores de la beca en el año 2021 */

SELECT A.nombre, 
       SUM(M.creditos) AS Creditos
FROM Alumnos A
JOIN Inscripciones I ON A.alumno_id = I.alumno_id
JOIN Materias M ON I.materia_id = M.materia_id
JOIN Notas N ON I.alumno_id = N.alumno_id AND I.materia_id = N.materia_id
WHERE  strftime('%Y', N.fecha_registro) = '2021' AND N.valor >= 60
GROUP BY A.alumno_id, A.nombre
HAVING SUM(M.creditos) >= 10;
