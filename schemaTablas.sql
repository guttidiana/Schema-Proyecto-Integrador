CREATE SCHEMA ProyectoGrupo3;

USE ProyectoGrupo3;

CREATE TABLE categoria(
	categoria_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nomCategoria VARCHAR (25)

);


CREATE TABLE producto(
	producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    sku INTEGER,
    nombreProducto VARCHAR(25),
    talla VARCHAR(10),
    stock INTEGER,
    tipoCuerpo VARCHAR(25),
    precio INTEGER,
    cantMinima INTEGER

);

ALTER TABLE producto ADD categoria_id INTEGER NOT NULL;
ALTER TABLE producto
ADD FOREIGN KEY (categoria_id) REFERENCES categoria (categoria_id);

CREATE TABLE usuaria(
	usuaria_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(25),
    apellido VARCHAR(25),
    telefono INTEGER,
    correo VARCHAR(50),
    contrasenia VARCHAR (25)

);

CREATE TABLE direccion(
	direccion_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    calle VARCHAR (25),
    numDireccion INTEGER,
    casaDpto VARCHAR (25),
    region VARCHAR (50),
    comuna VARCHAR (25)

);

ALTER TABLE direccion ADD usuaria_id INTEGER NOT NULL;
ALTER TABLE direccion
ADD FOREIGN KEY (usauria_id) REFERENCES usuaria (usuaria_id);

CREATE TABLE boletaInstancia(
	boletaInstancia_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    medioDePago VARCHAR (25),
    fecha DATE,
    total INTEGER
);

ALTER TABLE boletaInstancia ADD usuaria_id INTEGER NOT NULL;
ALTER TABLE boletaInstancia
ADD FOREIGN KEY (usauria_id) REFERENCES usuaria (usuaria_id);

ALTER TABLE boletaInstancia ADD direccion_id INTEGER NOT NULL;
ALTER TABLE boletaInstancia
ADD FOREIGN KEY (direccion_id) REFERENCES direccion (direccion_id);

CREATE TABLE carrito(
	carrito_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	cantidad INTEGER,
    precioTotal INTEGER
);

ALTER TABLE carrito ADD producto_id INTEGER NOT NULL;
ALTER TABLE carrito
ADD FOREIGN KEY (producto_id) REFERENCES producto (producto_id);


CREATE TABLE boleta(
	boleta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cantidad INTEGER,
    precioTotal INTEGER
);

ALTER TABLE boleta ADD producto_id INTEGER NOT NULL;
ALTER TABLE boleta
ADD FOREIGN KEY (producto_id) REFERENCES producto (producto_id);

ALTER TABLE boleta ADD carrito_id INTEGER NOT NULL;
ALTER TABLE boleta
ADD FOREIGN KEY (carrito_id) REFERENCES carrito (carrito_id);

ALTER TABLE carrito ADD boleta_id INTEGER NOT NULL;
ALTER TABLE carrito
ADD FOREIGN KEY (boleta_id) REFERENCES boleta (boleta_id);

CREATE TABLE publicacion(
	publicacion_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    mensaje VARCHAR (150)
);

ALTER TABLE publicacion ADD usuaria_id INTEGER NOT NULL;
ALTER TABLE publicacion
ADD FOREIGN KEY (usauria_id) REFERENCES usauria (usauria_id);