CREATE DATABASE IF NOT EXISTS mapa_interactivo;
USE mapa_interactivo;

CREATE TABLE IF NOT EXISTS espacio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    imagen TEXT
); 

CREATE TABLE IF NOT EXISTS evento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS actividad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha DATETIME NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    id_espacio INT NOT NULL,
    id_evento INT NOT NULL,
    FOREIGN KEY (id_espacio) REFERENCES espacio(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_evento) REFERENCES evento(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS categoriaxespacio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    id_espacio INT NOT NULL,
    FOREIGN KEY (id_espacio) REFERENCES espacio(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    administrador BOOLEAN NOT NULL DEFAULT FALSE
);

USE mapa_interactivo;

-- 1. Insertar Espacios (Lugares físicos)
INSERT INTO espacio (nombre, descripcion, imagen) VALUES 
('Auditorio Principal', 'Sala magna con capacidad para 500 personas, proyector 4K y sistema de sonido envolvente.', 'auditorio_main.jpg'),
('Laboratorio de Cómputo A', 'Aula equipada con 30 ordenadores de alto rendimiento para talleres técnicos.', 'lab_a.jpg'),
('Jardín Central', 'Espacio al aire libre para actividades recreativas y networking.', 'jardin.jpg'),
('Sala de Reuniones B', 'Sala pequeña para mesas redondas y grupos de trabajo.', 'sala_b.jpg');

-- 2. Insertar Categorías (Tipos de espacios/actividades)
INSERT INTO categoria (nombre, color) VALUES 
('Tecnología', '#3498db'), -- Azul
('Arte y Cultura', '#e74c3c'), -- Rojo
('Aire Libre', '#2ecc71'), -- Verde
('Networking', '#f1c40f'); -- Amarillo

-- 3. Insertar Eventos (Marcos generales que agrupan actividades)
INSERT INTO evento (nombre, descripcion, fecha_inicio, fecha_fin) VALUES 
('Semana de la Innovación', 'Evento anual sobre nuevas tecnologías y startups.', '2024-10-10 09:00:00', '2024-10-15 18:00:00'),
('Festival de Otoño', 'Celebración cultural y artística.', '2024-11-05 10:00:00', '2024-11-07 22:00:00'),
('Hackathon 2024', 'Competición de programación de 48 horas.', '2024-12-01 18:00:00', '2024-12-03 18:00:00');

-- 4. Insertar Usuarios (Se usa el mismo hash de contraseña del admin para prueba: 'password123' aprox)
INSERT INTO users (nombre, contrasena, administrador) VALUES 
('juan_perez', '$2b$10$V1DqRLVQjaxAg/P070MqUudYb1mc5QwDFiMNUETfPvPVt3HoPQXxK', FALSE),
('maria_gomez', '$2b$10$V1DqRLVQjaxAg/P070MqUudYb1mc5QwDFiMNUETfPvPVt3HoPQXxK', FALSE),
('super_admin', '$2b$10$V1DqRLVQjaxAg/P070MqUudYb1mc5QwDFiMNUETfPvPVt3HoPQXxK', TRUE);

-- 5. Insertar Relación Categoría x Espacio
-- Asumiendo IDs: 1=Auditorio, 2=Lab, 3=Jardín, 4=Sala B
-- Categorías: 1=Tecnología, 2=Arte, 3=Aire Libre, 4=Networking
INSERT INTO categoriaxespacio (id_categoria, id_espacio) VALUES 
(1, 1), -- Auditorio es de Tecnología
(1, 2), -- Lab es de Tecnología
(3, 3), -- Jardín es de Aire Libre
(4, 3), -- Jardín también es de Networking
(4, 4); -- Sala B es de Networking

-- 6. Insertar Actividades (Conectan Eventos con Espacios)
-- Evento 1: Semana Innovación (ID 1)
-- Evento 2: Festival (ID 2)
-- Evento 3: Hackathon (ID 3)
INSERT INTO actividad (nombre, descripcion, fecha, hora_inicio, hora_fin, id_espacio, id_evento) VALUES 
('Conferencia de Apertura', 'Charla sobre el futuro de la IA.', '2024-10-10', '09:00:00', '11:00:00', 1, 1),
('Taller de Python', 'Introducción a la ciencia de datos.', '2024-10-11', '14:00:00', '16:00:00', 2, 1),
('Concierto al Atardecer', 'Música en vivo para cerrar el día.', '2024-11-05', '19:00:00', '21:00:00', 3, 2),
('Inicio del Hackathon', 'Formación de equipos y anuncio del reto.', '2024-12-01', '18:00:00', '20:00:00', 1, 3),
('Mentoria de Proyectos', 'Sesión de ayuda con expertos.', '2024-12-02', '10:00:00', '12:00:00', 4, 3);
-- Usuario administrador de prueba
INSERT INTO users (nombre, contrasena, administrador)
VALUES ('admin', '$2b$10$V1DqRLVQjaxAg/P070MqUudYb1mc5QwDFiMNUETfPvPVt3HoPQXxK', TRUE);
