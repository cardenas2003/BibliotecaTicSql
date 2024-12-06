use bibliotecatic;
#Cristian David Cardenas Carballero
#Disparadores, modificar y eliminar
#DROP TRIGGER IF EXISTS MarcarLibroNoDisponible;
SET SQL_SAFE_UPDATES = 0;
#Se creo un disparador para cuando se presta un libro se marca como false (osea no esta disponible)
DELIMITER //
CREATE TRIGGER MarcarLibroNoDisponible
AFTER INSERT ON Prestamo
FOR EACH ROW
BEGIN
    UPDATE Libro
    SET Disponible = false
    WHERE ID_libro = NEW.id_libro;
END; //
DELIMITER ;
#Cuando se elimine un prestama quiere decir que el libro a sido devuelto ose ya esta disponible
# y lo marca como TRUE
DELIMITER //
CREATE TRIGGER MarcarLibroDisponible
AFTER DELETE ON Prestamo
FOR EACH ROW
BEGIN
    UPDATE Libro
    SET Disponible = true
    WHERE ID_libro = OLD.id_libro;
END; //
DELIMITER ;
#B) actualiza la fecha de devolucion del prestamo
UPDATE Prestamo
SET Fecha_devolucion = '2024-12-10'
WHERE ID_prestamo = (id_prestamo);
#c) Elimina un libro en la base de datos se actualizo la tabla Prestamo
# agreagdo ON DELETE CASCADE que significa que si se elimina un libro y existe relacion en
#dicha tabla se eliminan todos los registros en dicha tabla
DELETE FROM Libro
WHERE ID_libro = (id_libro);

SELECT * FROM Libro;

SELECT * FROM Autores;

SELECT * FROM Libro l
JOIN Autores a ON l.id_autor = a.ID_autores
WHERE a.Nombre = 'Gabriel' AND a.Apellido = 'García Márquez';

SELECT * 
FROM Prestamo
WHERE MONTH(Fecha_devolucion) = 8 AND YEAR(Fecha_devolucion) = 2024;


