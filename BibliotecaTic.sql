create database BibliotecaTic;
use BibliotecaTic;
#Cristian David Cardenas Caballero
create table Autores (
ID_autores int auto_increment primary key,
Nombre varchar(100) not null,
Apellido varchar(100) not null,
Nacionalidad varchar(100) not null,
Fecha Date not null
);

create table Categoria(
ID_categoria int auto_increment primary key,
Nombre varchar(100)
);

create table Usuarios(
ID_usuarios int auto_increment primary key,
Nombre varchar(100) not null,
Apellido varchar(100) not null,
Direccion varchar(100) not null,
Telefono varchar(50) not null
);

create table Libro(
ID_libro int auto_increment primary key,
Titulo varchar(100) not null,
id_autor int not null,
id_categoria int not null,
Año_publicado year not null,
Disponible boolean,
foreign key (id_autor) references Autores( ID_autores),
foreign key(id_categoria) references Categoria(ID_categoria)
);

create table prestamo(
ID_prestamo int auto_increment primary key,
id_usuarios int,
id_libro int,
Fecha_prestamo Date,
Fecha_devolucion date not null,
foreign key (id_usuarios) references Usuarios(ID_usuarios),
foreign key (id_libro) references Libro(ID_libro) ON DELETE CASCADE
);

INSERT INTO Autores (Nombre, Apellido, Nacionalidad, Fecha) 
VALUES 
('Gabriel', 'García Márquez', 'Colombiana', '1927-03-06'),
('Jane', 'Austen', 'Británica', '1775-12-16'),
('Haruki', 'Murakami', 'Japonesa', '1949-01-12');

INSERT INTO Categoria (Nombre)
VALUES 
('Novela'),
('Ciencia Ficción'),
('Fantasía');

INSERT INTO Usuarios (Nombre, Apellido, Direccion, Telefono) 
VALUES 
('Juan', 'Pérez', 'Calle 123', '555-1234'),
('María', 'González', 'Avenida Central', '555-5678'),
('Carlos', 'Ramírez', 'Plaza Mayor', '555-9012');
INSERT INTO Libro (Titulo, id_autor, id_categoria, Año_publicado, Disponible)
VALUES 
('Cien años de soledad', 1, 1, 1967, TRUE),
('Orgullo y prejuicio', 2, 1, 1813, TRUE),
('Kafka en la orilla', 3, 3, 2002, TRUE);


INSERT INTO prestamo (id_usuarios, id_libro, Fecha_prestamo, Fecha_devolucion)
VALUES (1, 7, '2024-12-01', '2024-12-15'),
(2, 8, '2024-12-03', '2024-12-17'),
(3, 9, '2024-12-04', '2024-12-18');

