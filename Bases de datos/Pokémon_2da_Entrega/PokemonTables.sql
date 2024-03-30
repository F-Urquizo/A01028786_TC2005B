DROP SCHEMA IF EXISTS pokemon;
CREATE SCHEMA pokemon;
USE pokemon;

CREATE TABLE Mazo(
	id_mazo SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ultima_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    numero_cartas TINYINT UNSIGNED NOT NULL,
    CHECK (numero_cartas = 60),
    descripcion VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_mazo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Carta(
	id_carta SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    vida TINYINT UNSIGNED NOT NULL,
    costo_retirada TINYINT UNSIGNED NOT NULL,
    descripcion VARCHAR(50),
    tipo ENUM("Normal", "Fire", "Water", "Electric", "Grass", "Ice", "Fighting", "Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Ghost", "Dragon", "Dark", "Steel", "Fairy") NOT NULL,
    evoluciona_de VARCHAR(50),
	debilidad ENUM("Normal", "Fire", "Water", "Electric", "Grass", "Ice", "Fighting", "Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Ghost", "Dragon", "Dark", "Steel", "Fairy") NOT NULL,
    PRIMARY KEY(id_carta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Ataque(
	id_ataque SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre_ataque VARCHAR(50) NOT NULL,
    costo_ataque TINYINT UNSIGNED NOT NULL,
    damage SMALLINT UNSIGNED,
    descripcion_ataque VARCHAR(500),
    
    PRIMARY KEY(id_ataque)

) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE CartaAtaque(
	id_carta_ataque SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	id_carta SMALLINT UNSIGNED NOT NULL,
    id_ataque SMALLINT UNSIGNED NOT NULL,
    
    
    PRIMARY KEY(id_carta_ataque),
    CONSTRAINT fk_cartaataque_carta FOREIGN KEY (id_carta) REFERENCES Carta (id_carta) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_cartaataque_ataque FOREIGN KEY (id_ataque) REFERENCES Ataque (id_ataque) ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Efecto(
	id_efecto SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    condiciones VARCHAR(500) NOT NULL,
	-- CHECAR TIPO DE EFECTO
	magnitud TINYINT UNSIGNED,
    duracion VARCHAR(50),
    -- CHECAR TIPO DE TARGET
	tipo_de_target ENUM("Pokémon propio", "Pokémon oponente", "Oponente") NOT NULL,
    PRIMARY KEY(id_efecto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Trigger es palabra reservada
CREATE TABLE Triger(
	id_trigger SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_carta SMALLINT UNSIGNED NOT NULL,
    id_efecto SMALLINT UNSIGNED NOT NULL,
    
    PRIMARY KEY(id_trigger),
    
    CONSTRAINT fk_trigger_carta FOREIGN KEY (id_carta) REFERENCES Carta (id_carta) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_trigger_efecto FOREIGN KEY (id_efecto) REFERENCES Efecto (id_efecto) ON DELETE RESTRICT ON UPDATE CASCADE 

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Jugador(
	id_jugador SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    nivel TINYINT NOT NULL,
	contrasena VARCHAR(50) NOT NULL,
    -- CHECAR VESTIMENTA (TIPO DE DATO)
	vestimenta VARCHAR(100) NOT NULL,
	descripcion VARCHAR(500) NOT NULL,
  
    PRIMARY KEY(id_jugador)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Banca(
	id_banca SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador SMALLINT UNSIGNED NOT NULL,
    ultima_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    numero_de_cartas SMALLINT UNSIGNED,
    CHECK (numero_de_cartas <= 7),
    
    PRIMARY KEY(id_banca),
    
	CONSTRAINT fk_banca_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE 

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE CartaBanca(
	id_cartabanca SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_carta SMALLINT UNSIGNED NOT NULL,
    id_banca SMALLINT UNSIGNED NOT NULL,
    
    PRIMARY KEY(id_cartabanca),
    
    CONSTRAINT fk_cartabanca_carta FOREIGN KEY (id_carta) REFERENCES Carta (id_carta) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_cartabanca_banca FOREIGN KEY (id_banca) REFERENCES Banca (id_banca) ON DELETE RESTRICT ON UPDATE CASCADE 

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Juego(
	id_juego SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador1 SMALLINT UNSIGNED NOT NULL,
    id_jugador2 SMALLINT UNSIGNED NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	-- Checar duracion
    duracion SMALLINT UNSIGNED NOT NULL,    
    id_ganador SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(id_juego),
    
    CONSTRAINT fk_juego_p1 FOREIGN KEY (id_jugador1) REFERENCES Jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_juego_p2 FOREIGN KEY (id_jugador2) REFERENCES Jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_juego_ganador FOREIGN KEY (id_ganador) REFERENCES Jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE 

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE CartaPremio(
	id_cartapremio SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador SMALLINT UNSIGNED NOT NULL,
    id_carta SMALLINT UNSIGNED NOT NULL,
	id_juego SMALLINT UNSIGNED NOT NULL,
	revelada BOOL NOT NULL,
    -- CHECAR TIPO DE DATO
    hora_revelacion TIME,
    
    PRIMARY KEY(id_cartapremio),
    
    CONSTRAINT fk_cartapremio_carta FOREIGN KEY (id_carta) REFERENCES Carta (id_carta) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_cartapremio_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_cartapremio_juego FOREIGN KEY (id_juego) REFERENCES Juego (id_juego) ON DELETE RESTRICT ON UPDATE CASCADE 

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Inventario(
	id_inventario SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_mazo SMALLINT UNSIGNED NOT NULL,
    id_jugador SMALLINT UNSIGNED NOT NULL,
	id_carta SMALLINT UNSIGNED NOT NULL,
    ultima_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY(id_inventario),
    
    CONSTRAINT fk_inventario_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_inventario_carta FOREIGN KEY (id_carta) REFERENCES Carta (id_carta) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_inventario_mazo FOREIGN KEY (id_mazo) REFERENCES Mazo (id_mazo) ON DELETE RESTRICT ON UPDATE CASCADE 

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Recompensa(
	id_recompensa SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador SMALLINT UNSIGNED NOT NULL,
    fecha_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    cantidad SMALLINT UNSIGNED NOT NULL,
    -- CONSIDERAR UN SIMPLE VARCHAR
    tipo ENUM("Créditos", "Monedas", "Sobres de Refuerzo", "Mazos del Pase de Batalla", "Cartas Específicas", "Objetos Cosméticos") NOT NULL,

    PRIMARY KEY(id_recompensa),
    
    CONSTRAINT fk_recompensa_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Mano(
	id_mano SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador SMALLINT UNSIGNED NOT NULL,
	id_juego SMALLINT UNSIGNED NOT NULL,
    size SMALLINT UNSIGNED NOT NULL,
    CHECK (size <= 7),
    -- CHECAR MAX SIZE (ES 7?)
    -- size_max SMALLINT UNSIGNED NOT NULL,

    PRIMARY KEY(id_mano),
    
    CONSTRAINT fk_mano_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_mano_juego FOREIGN KEY (id_juego) REFERENCES Juego (id_juego) ON DELETE RESTRICT ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE CartaMano(
	id_cartamano SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_mano SMALLINT UNSIGNED NOT NULL,
	id_carta SMALLINT UNSIGNED NOT NULL,

    PRIMARY KEY(id_cartamano),
    
	CONSTRAINT fk_cartamano_carta FOREIGN KEY (id_carta) REFERENCES Carta (id_carta) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_cartamano_mano FOREIGN KEY (id_mano) REFERENCES Mano (id_mano) ON DELETE RESTRICT ON UPDATE CASCADE 

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Turno(
	id_turno SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_juego SMALLINT UNSIGNED NOT NULL,
    id_jugador SMALLINT UNSIGNED NOT NULL,
    estatus ENUM("Jugador", "Oponente") NOT NULL,
    fecha_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    -- CHECAR DURACIÓN
    duracion VARCHAR(50) NOT NULL,
    pokemon_quantity SMALLINT UNSIGNED NOT NULL,
	spell_quantity SMALLINT UNSIGNED NOT NULL,
    energy_quantity SMALLINT UNSIGNED NOT NULL,
    tool_quantity SMALLINT UNSIGNED NOT NULL,


    PRIMARY KEY(id_turno),
    
    CONSTRAINT fk_turno_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador (id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_turno_juego FOREIGN KEY (id_juego) REFERENCES Juego (id_juego) ON DELETE RESTRICT ON UPDATE CASCADE 

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Jugado(
	id_jugado SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_turno SMALLINT UNSIGNED NOT NULL,
	id_carta SMALLINT UNSIGNED NOT NULL,
    hit_points SMALLINT UNSIGNED NOT NULL,
    fecha_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY(id_jugado),
    
    CONSTRAINT fk_jugado_turno FOREIGN KEY (id_turno) REFERENCES Turno (id_turno) ON DELETE RESTRICT ON UPDATE CASCADE, 
	CONSTRAINT fk_jugado_carta FOREIGN KEY (id_carta) REFERENCES Carta (id_carta) ON DELETE RESTRICT ON UPDATE CASCADE 

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;











