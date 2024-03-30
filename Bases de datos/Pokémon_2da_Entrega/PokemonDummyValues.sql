SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
SET @old_autocommit=@@autocommit;

USE pokemon;

INSERT INTO Jugador (nombre, nivel, contrasena, vestimenta, descripcion) VALUES
('Francisco', 3, 'Francisco123', 'Gorra roja, mochila Poké Ball, zapatos amarillo eléctrico', 'Experto en estrategia, amante de los tipos agua, coleccionista de cartas raras.'),
('Alejandra', 4, 'AlePass456', 'Sombrero de detective, gafas de sol, chaqueta de cuero', 'Detallista en la construcción de mazos, prefiero estrategias defensivas, gran admiradora de Eevee.'),
('Roberto', 2, 'RobStrong89', 'Casco de ciclista, guantes de gimnasio, zapatillas de running', 'Fanático de los gimnasios, siempre en busca de la próxima gran batalla, especialista en Pokémon de tipo roca.'),
('Lucía', 5, 'Luci4Star', 'Vestido de gala, tiara de princesa, zapatos con brillo', 'Estratega maestra, amante de los Pokémon psíquicos, coleccionista de cartas holográficas.'),
('David', 3, 'DavRacerX', 'Chaqueta de piloto, gafas de aviador, botas de moto', 'Veloz en decisiones, predilección por los Pokémon de tipo eléctrico, fan de las carreras.'),
('Sofía', 1, 'Sofi1234', 'Camiseta básica, pantalones cortos, zapatillas deportivas', 'Nueva en el juego, aprendiendo rápidamente, interesada en los Pokémon de tipo agua.'),
('Miguel', 4, 'Migue77', 'Traje de astronauta, botas lunares, casco espacial', 'Explorador del espacio TCG, fascinado por los misterios del universo, coleccionista de cartas legendarias.'),
('Carla', 2, 'CarlaCombo', 'Disfraz de Pikachu, mochila temática, zapatillas amarillas', 'Entusiasta de los combos eléctricos, siempre sonriente, amante de Pikachu.'),
('Ernesto', 5, 'ErniePro', 'Toga de mago, varita mágica, capa estrellada', 'Mago de la estrategia, experto en ilusiones, prefiere los Pokémon místicos.'),
('Julia', 3, 'Jewels88', 'Gafas de esquí, chaqueta polar, botas de nieve', 'Aventurera de climas fríos, especializada en Pokémon de hielo, busca siempre superarse.');


INSERT INTO Carta (nombre, vida, costo_retirada, descripcion, tipo, evoluciona_de, debilidad) VALUES ("Pikachu", 70, 1, "Pokémon ratón. Altura: 0,4 m. Peso: 6,0 kg", "Electric", NULL, "Fighting"),
("Raichu", 130, 1, "Pokémon ratón. Altura: 0,8 m. Peso: 30,0 kg", "Electric", "Pikachu", "Fighting"),
("Electrabuzz", 90, 2, "Pokémon eléctrico. Altura: 1,1 m. Peso: 30,0 kg", "Electric", NULL, "Fighting"),
("Electivire", 140, 3, "Pokémon Rayo. Altura: 1,8 m. Peso: 138,6 kg", "Electric", "Electrabuzz", "Fighting"),
("Arbok", 130, 2, "Pokémon Cobra. Altura: 3,5 m. Peso: 65,0 kg", "Dark", "Ekans", "Fighting"),
("Lickilicky", 150, 4, "Pokémon Lametazo. Altura: 1,7 m. Peso: 140,0 kg", "Normal", "Lickitung", "Fighting"),
("Ferroverdor", 220, 1, NULL, "Grass", NULL, "Fire"),
("Wugtrio", 250, 1, NULL, "Electric", "Wiglett", "Fighting"),
("Excadrill", 130, 2, NULL, "Fighting", "Drilbur", "Grass"),
("Grotle", 130, 4, NULL, "Grass", "Turtwig", "Fire"),
("Hoothoot", 70, 1, "Pokémon Búho. Altura: 0,7 m. Peso: 21,2 kg", "Normal", NULL, "Electric"),
("Mightyena", 120, 2, "Pokémon Mordisco. Altura: 1,0 m. Peso: 37,0 kg", "Dark", "Poochyena", "Grass")
;


INSERT INTO Ataque (nombre_ataque, costo_ataque, damage, descripcion_ataque) VALUES ("Chispa al azar", 1, 10, "Este ataque hace 10 puntos de daño a uno de los Pokémon de tu rival"),
("Rayos Colaterales", 2, 50, "Este ataque hace 50 puntos de daño a cada Pokémon"),
("Bola Eléctrica", 3, 120, NULL),
("Cortar", 1, 20, NULL),
("Puño eléctrico", 3, 50, NULL),
("Nudillo Cortocircuito", 2, 40, "Si tu rival tiene algún Pokémon agua en el juego, el ataque hace 120 puntos de daño más"),
("Electropuñetazo", 4, 140, NULL),
("Pánico Venenoso", 1, NULL, "El Pokémon Activo de tu rival pasa a estar Confundido, Envenenado y Quemado"),
("Colmillo de Oscuridad", 2, 70, NULL),
("Golpe Cuerpo", 2, 50, "Lanza 1 moneda. Si sale cara, el Pokémon activo de tu rival pasa a estar Paralizado"),
("Tornado de Lametones", 4, 70, "Lanza 4 monedas. Este ataque hace 70 puntos de daño por cada cara"),
("Filo Prisma", 3, 180, "Durante tu próximo turno, este Pokémon no puede atacar"),
("Bomba Tricolor", 1, NULL, "Descarta hasta 3 cartas de energía de tu mano. Cada carta descartada hace 60 puntos de daño al rival"),
("Bloqueo Entumecedor", 2, 120, "Durante tu próximo turno de tu rival, el Pokémon defensor no puede retirarse"),
("Disparo Lodo", 1, 20, NULL),
("Placaje Salvaje", 3, 180, "Este Pokémon también se hace 50 puntos de daño a sí mismo"),
("Corte", 1, 20, NULL),
("Embestida Caparazón", 3, 50, "Durante el próximo turno de tu rival, los ataques hacen 20 puntos de daño menos a este Pokémon"),
("Ala Silenciosa", 2, 20, "Tu rival enseña las cartas de su mano"),
("Patadón", 2, 50, "Mueve el Pokémon Activo de tu rival a la Banca"),
("Colmillo Afilado", 3, 130, NULL)
;


INSERT INTO CartaAtaque (id_carta, id_ataque) VALUES (1, 1),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6),
(4, 7),
(5, 8),
(5, 9),
(6, 10),
(6, 11),
(7, 12),
(8, 13),
(8, 14),
(9, 15),
(9,16),
(10, 17),
(10, 18),
(11, 19),
(12, 20),
(12, 21);


INSERT INTO Efecto (nombre, condiciones, magnitud, duracion, tipo_de_target) VALUES
("Confusión", "Un Pokémon se puede dañar él mismo durante el combate", NULL, NULL, "Pokémon oponente"),
("Veneno", "La vida es reducida al final de cada turno", NULL, "Hasta que el Pokémon sea curado o retirado", "Pokémon oponente"),
("Quemadura", "La vida es reducida al final de cada turno y el daño ejercido es reducido en un 50%", NULL, "Hasta que el Pokémon sea curado o retirado", "Pokémon oponente"),
("Parálisis", "El Pokémon activo no puede atacar ni ser retirado en su próximo turno", NULL, "Un turno", "Pokémon oponente"),
("Incapacidad de ataque", "El Pokémon afectado no puede atacar en su próximo turno", NULL, "Un turno", "Pokémon oponente"),
("Bloqueo de retirada", "El Pokémon afectado no puede retirarse en su próximo turno", NULL, "Un turno", "Pokémon oponente"),
("Daño autoinfligido", "El Pokémon activo se hace 50 puntos de daño a sí mismo", 50, "De inmediato", "Pokémon propio"),
("Escudo parcial", "Los ataques del rival hacen 20 puntos de daño menos", 20, "Un turno", "Pokémon propio"),
("Revelación de cartas", "El oponente debe enseñar las cartas de su mano", NULL, "De inmediato", "Oponente"),
("Envío a la banca", "El Pokémon rival es enviado a la banca. El oponente debe escoger un nuevo Pokémon.", NULL, "De inmediato", "Pokémon oponente")
;


INSERT INTO Triger (id_carta, id_efecto) VALUES
(5, 1),
(5, 2),
(5, 3),
(6, 4),
(7, 5),
(8, 6),
(9, 7),
(10, 8),
(11, 9),
(12, 10);

INSERT INTO Mazo (nombre, numero_cartas, descripcion) VALUES
('Mazo Fuego', 60, 'Un mazo centrado en Pokémon de tipo fuego.'),
('Mazo Agua', 60, 'Estrategia rápida con Pokémon de tipo agua.'),
('Mazo Eléctrico', 60, 'Alto voltaje y ataques rápidos.'),
('Mazo Planta', 60, 'Crecimiento constante y recuperación.'),
('Mazo Psíquico', 60, 'Control mental para doblegar al oponente.'),
('Mazo Oscuro', 60, 'Estrategias sigilosas y efectos de miedo.'),
('Mazo Acero', 60, 'Defensa sólida y ataques potentes.'),
('Mazo Dragón', 60, 'Poder sin igual de los Pokémon dragón.'),
('Mazo Hada', 60, 'Encantos mágicos y curaciones.'),
('Mazo Lucha', 60, 'Fuerza bruta y resistencia.');


INSERT INTO Inventario (id_mazo, id_jugador, id_carta) VALUES
(1, 1, 12),
(2, 2, 11),
(3, 3, 10),
(4, 4, 9),
(5, 5, 8),
(6, 6, 7),
(7, 7, 6),
(8, 8, 5),
(9, 9, 4),
(10, 10, 3);

INSERT INTO Recompensa (id_jugador, cantidad, tipo) VALUES
(1, 100, 'Créditos'),
(2, 50, 'Monedas'),
(3, 5, 'Sobres de Refuerzo'),
(4, 1, 'Mazos del Pase de Batalla'),
(5, 2, 'Cartas Específicas'),
(6, 3, 'Objetos Cosméticos'),
(7, 150, 'Créditos'),
(8, 75, 'Monedas'),
(9, 10, 'Sobres de Refuerzo'),
(10, 4, 'Objetos Cosméticos');


INSERT INTO Juego (id_jugador1, id_jugador2, duracion, id_ganador) VALUES
(1, 2, 30, 1),
(2, 3, 45, 3),
(1, 3, 35, 1),
(2, 4, 50, 4),
(3, 4, 25, 3),
(1, 5, 40, 5),
(2, 5, 55, 2),
(3, 6, 20, 6),
(4, 5, 60, 5),
(1, 6, 30, 6);


INSERT INTO Mano (id_jugador, id_juego, size) VALUES
(1, 1, 5),
(2, 1, 7),
(1, 2, 6),
(3, 2, 4),
(2, 3, 5),
(4, 3, 7),
(3, 4, 3),
(5, 4, 6),
(4, 5, 7),
(1, 5, 5);

INSERT INTO CartaMano (id_mano, id_carta) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 11),
(2, 12),
(3, 1),
(4, 2),
(5, 3);


INSERT INTO Turno (id_juego, id_jugador, estatus, duracion, pokemon_quantity, spell_quantity, energy_quantity, tool_quantity) VALUES
(1, 1, 'Jugador', '2 minutos con 30 segundos', 3, 2, 2, 1),
(1, 2, 'Oponente', '2 minutos', 2, 3, 1, 1),
(2, 2, 'Jugador', '2 minutos con 15 segundos', 4, 1, 3, 0),
(2, 3, 'Oponente', '1 minuto con 45 segundos', 3, 2, 2, 1),
(3, 3, 'Jugador', '1 minuto con 30 segundos', 2, 3, 1, 2),
(3, 4, 'Oponente', '2 minutos con 20 segundos', 4, 1, 3, 0),
(4, 4, 'Jugador', '2 minutos con 5 segundos', 3, 2, 2, 1),
(4, 5, 'Oponente', '1 minuto con 50 segundos', 2, 3, 1, 1),
(5, 5, 'Jugador', '2 minutos con 10 segundos', 4, 1, 3, 0),
(5, 6, 'Oponente', '2 minutos con 30 segundos', 3, 2, 2, 1);

INSERT INTO Jugado (id_turno, id_carta, hit_points) VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 20),
(4, 4, 40),
(5, 5, 70),
(6, 6, 70),
(7, 7, 180),
(8, 8, 120),
(9, 9, 180),
(10, 10, 130);

INSERT INTO CartaPremio (id_jugador, id_carta, id_juego, revelada, hora_revelacion) VALUES
(1, 1, 1, FALSE, NULL),
(2, 2, 1, TRUE, '14:30:00'),
(3, 3, 2, FALSE, NULL),
(4, 4, 2, TRUE, '15:00:00'),
(5, 5, 3, FALSE, NULL),
(6, 6, 3, TRUE, '16:45:00'),
(7, 7, 4, FALSE, NULL),
(8, 8, 4, TRUE, '17:30:00'),
(9, 9, 5, FALSE, NULL),
(10, 10, 5, TRUE, '18:15:00');

INSERT INTO Banca (id_jugador, numero_de_cartas) VALUES
(1, 5),
(2, 7),
(3, 6),
(4, 3),
(5, 7),
(6, 4),
(7, 2),
(8, 5),
(9, 7),
(10, 6);

INSERT INTO CartaBanca (id_carta, id_banca) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(11, 6),
(12, 6);






