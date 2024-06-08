USE zoto_db;

INSERT INTO users (user_name, adress, email, user_password) VALUES
('Carlos Martínez', 'Calle 10 # 20-30', 'carlos@gmail.com', SHA2('carlos123', 256)),
('Ana Gomez', 'Carrera 15 # 40-50', 'ana@hotmail.com', SHA2('ana456', 256)),
('Luis Benitez', 'Avenida 5 # 60-70', 'luis@yahoo.com', SHA2('luis789', 256)),
('María Parra', 'Diagonal 25 # 80-90', 'maria@gmail.com', SHA2('maria123', 256)),
('Pedro Zamora', 'Transversal 35 # 100-110', 'pedro@hotmail.com', SHA2('pedro456', 256));

INSERT INTO objects (user_id, object_name, object_description, quantity) VALUES
(1, 'Libro', 'Un libro de aventuras', 1),
(1, 'Lápiz', 'Un lápiz de color azul', 3),
(1, 'Gorra', 'Una gorra con el logo de Bing', 1),
(1, 'Mochila', 'Una mochila de tela negra', 1),
(1, 'Reloj', 'Un reloj digital con alarma', 1),
(2, 'Pelota', 'Una pelota de fútbol', 1),
(2, 'Camiseta', 'Una camiseta del equipo nacional', 1),
(2, 'Zapatos', 'Unos zapatos deportivos', 1),
(2, 'Gafas', 'Unas gafas de sol', 1),
(2, 'Bicicleta', 'Una bicicleta de montaña', 1),
(3, 'Florero', 'Un florero de cerámica con flores', 1),
(3, 'Cuadro', 'Un cuadro al óleo con un paisaje', 1),
(3, 'Vela', 'Una vela aromática con forma de estrella', 2),
(3, 'Cojín', 'Un cojín de terciopelo rojo', 2),
(3, 'Manta', 'Una manta de lana gris', 1),
(4, 'Taza', 'Una taza de café con una frase divertida', 1),
(4, 'Agenda', 'Una agenda con el calendario del año', 1),
(4, 'Bolígrafo', 'Un bolígrafo con tinta invisible', 2),
(4, 'Pendrive', 'Un pendrive con forma de llave', 1),
(4, 'Auriculares', 'Unos auriculares inalámbricos con bluetooth', 1),
(5, 'Collar', 'Un collar de plata con un colgante de corazón', 1),
(5, 'Anillo', 'Un anillo de oro con una piedra preciosa', 1),
(5, 'Pulsera', 'Una pulsera de cuero con un dije de la suerte', 1),
(5, 'Perfume', 'Un perfume con una fragancia floral', 1),
(5, 'Maquillaje', 'Un estuche de maquillaje con varios productos', 1);
