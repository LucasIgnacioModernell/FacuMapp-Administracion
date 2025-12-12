CREATE DATABASE IF NOT EXISTS mapa_interactivo;
USE mapa_interactivo;

-- Configurar codificación para evitar errores como "CÃ³mputo"
SET NAMES 'utf8mb4';

-- CREACIÓN DE TABLAS
CREATE TABLE IF NOT EXISTS espacio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    imagen TEXT,
    capacidad INT NOT NULL DEFAULT 0
); 

CREATE TABLE IF NOT EXISTS evento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    id_espacio INT,
    FOREIGN KEY (id_espacio) REFERENCES espacio(id) ON DELETE SET NULL ON UPDATE CASCADE
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

-- LIMPIEZA DE TABLAS (SOLUCIÓN AL ERROR 1701)
-- Desactivamos la seguridad de FK, limpiamos y reactivamos.
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE actividad;
TRUNCATE TABLE categoriaxespacio;
TRUNCATE TABLE espacio;
TRUNCATE TABLE evento;
TRUNCATE TABLE categoria;
TRUNCATE TABLE users;
SET FOREIGN_KEY_CHECKS = 1;

-- INSERTS DE DATOS

-- 1. Insertar Espacios
INSERT INTO espacio (nombre, descripcion, imagen, capacidad) VALUES
('Secretaria de Asuntos Universitarios', 'Oficina administrativa para gestión y atención al personal/alumnos.', 'img/secretaria_de_asuntos_universitarios.jpg', 6),
('No se', 'Espacio actualmente sin identificación o uso definido.', NULL, 0),
('Secretaria de asuntos universitarios', 'Oficina administrativa para gestión y atención al personal/alumnos.', 'img/secretaria_de_asuntos_universitarios.jpg', 4),
('Cocina', 'Espacio de cocina y refrigerio para el personal.', 'img/cocina.jpg', 4),
('No se', 'Espacio actualmente sin identificación o uso definido.', NULL, 0),
('Secretaria administrativa', 'Oficina administrativa para gestión y atención al personal/alumnos.', 'img/secretaria_administrativa.jpg', 5),
('Baño uso exclusivo personal', 'Instalaciones sanitarias.', 'img/bao_uso_exclusivo_personal.jpg', 5),
('Lactario', 'Espacio privado y cómodo destinado a la lactancia materna.', 'img/lactario.jpg', 2),
('Direccion de recursos humanos', 'Oficina administrativa para gestión y atención al personal/alumnos.', 'img/direccion_de_recursos_humanos.jpg', 7),
('Departamento de personal', 'Oficina administrativa para gestión y atención al personal/alumnos.', 'img/departamento_de_personal.jpg', 5),
('Direccion de administracion - departamento de compras - patrimonio', 'Oficina administrativa para gestión y atención al personal/alumnos.', 'img/direccion_de_administracion_departamento_de_compras_patrimonio.jpg', 7),
('Direccion de administracion - departamento contable - tesoreria', 'Oficina administrativa para gestión y atención al personal/alumnos.', 'img/direccion_de_administracion_departamento_contable_tesoreria.jpg', 6),
('Despacho general - mesa de entrada - informes (CORREGIR PUERTA)', 'Oficina administrativa para gestión y atención al personal/alumnos.', 'img/despacho_general_mesa_de_entrada_informes_corregir_puerta.jpg', 6),
('SECRETARIA ACADEMICA', 'Oficina administrativa para gestión y atención al personal/alumnos.', 'img/secretaria_academica.jpg', 7),
('No se', 'Espacio actualmente sin identificación o uso definido.', NULL, 0),
('Equipo interdisciplinario', 'Espacio de trabajo para el equipo de apoyo y orientación.', 'img/equipo_interdisciplinario.jpg', 6),
('DASUTEN', 'Oficina de la Dirección de Acción Social de la Universidad Tecnológica Nacional.', 'img/dasuten.jpg', 5),
('PECERA', 'Espacio vidriado de estudio o trabajo colaborativo.', 'img/pecera.jpg', 10),
('ALUMNOS', 'Oficina de atención a alumnos y gestión académica.', 'img/alumnos.jpg', 5),
('Adut', 'Oficina gremial de la Asociación de Docentes de la Universidad Tecnológica.', 'img/adut.jpg', 4),
('Direccion de servicios generales', 'Oficina administrativa para gestión y atención al personal/alumnos.', 'img/direccion_de_servicios_generales.jpg', 8),
('Baños mixtos', 'Instalaciones sanitarias.', 'img/baos_mixtos.jpg', 4),
('BUFFET', 'Comedor universitario y servicio de cafetería.', 'img/buffet.jpg', 60),
('Area tecnica de TIC - redes/servidores', 'Área técnica de servidores, redes y desarrollo de sistemas.', 'img/area_tecnica_de_tic_redes_servidores.jpg', 6),
('Area tecnica de TIC - Desarrollo / Ciberseguridad', 'Área técnica de servidores, redes y desarrollo de sistemas.', 'img/area_tecnica_de_tic_desarrollo___ciberseguridad.jpg', 6),
('IEC - Investigacion en enseñanza de las ciencias', 'Oficina de investigación educativa.', 'img/iec_investigacion_en_enseanza_de_las_ciencias.jpg', 5),
('SUM', 'Salón de Usos Múltiples destinado a eventos, conferencias y actividades recreativas.', 'img/sum.jpg', 120),
('Direccion Departamento Ciencias Basicas', 'Oficina administrativa para gestión y atención al personal/alumnos.', 'img/direccion_departamento_ciencias_basicas.jpg', 5),
('Aula 61', 'Aula equipada para el dictado de clases teóricas y prácticas. Cuenta con pizarrón y proyección.', 'img/aula_61.jpg', 66),
('Laboratorio IEC - Investigacion de Enseñanza de las Ciencias', 'Laboratorio especializado con equipamiento para prácticas científicas y técnicas.', 'img/laboratorio_iec_investigacion_de_enseanza_de_las_ciencias.jpg', 18),
('Laboratorio Fisica', 'Laboratorio especializado con equipamiento para prácticas científicas y técnicas.', 'img/laboratorio_fisica.jpg', 30),
('Aula 62', 'Aula equipada para el dictado de clases teóricas y prácticas. Cuenta con pizarrón y proyección.', 'img/aula_62.jpg', 50),
('Aula 63', 'Aula equipada para el dictado de clases teóricas y prácticas. Cuenta con pizarrón y proyección.', 'img/aula_63.jpg', 51),
('Laboratorio de fisica 3', 'Laboratorio especializado con equipamiento para prácticas científicas y técnicas.', 'img/laboratorio_de_fisica_3.jpg', 18),
('Aula 64', 'Aula equipada para el dictado de clases teóricas y prácticas. Cuenta con pizarrón y proyección.', 'img/aula_64.jpg', 40);

-- 2. Insertar Categorías
INSERT INTO categoria (nombre, color) VALUES 
('Tecnología', '#3498db'), -- Azul
('Arte y Cultura', '#e74c3c'), -- Rojo
('Aire Libre', '#2ecc71'), -- Verde
('Networking', '#f1c40f'); -- Amarillo

-- 3. Insertar Eventos (Fechas actualizadas a 2025/2026 para que aparezcan en la app)
INSERT INTO evento (nombre, descripcion, fecha_inicio, fecha_fin) VALUES 
('Semana de la Innovación', 'Evento anual sobre nuevas tecnologías y startups.', '2025-10-10 09:00:00', '2025-10-15 18:00:00'),
('Festival de Otoño', 'Celebración cultural y artística.', '2025-11-05 10:00:00', '2025-11-07 22:00:00'),
('Hackathon 2026', 'Competición de programación de 48 horas.', '2026-12-01 18:00:00', '2026-12-03 18:00:00');

-- 4. Insertar Usuarios
INSERT INTO users (nombre, contrasena, administrador) VALUES 
('juan_perez', '$2b$10$V1DqRLVQjaxAg/P070MqUudYb1mc5QwDFiMNUETfPvPVt3HoPQXxK', FALSE),
('maria_gomez', '$2b$10$V1DqRLVQjaxAg/P070MqUudYb1mc5QwDFiMNUETfPvPVt3HoPQXxK', FALSE),
('super_admin', '$2b$10$V1DqRLVQjaxAg/P070MqUudYb1mc5QwDFiMNUETfPvPVt3HoPQXxK', TRUE),
('admin', '$2b$10$V1DqRLVQjaxAg/P070MqUudYb1mc5QwDFiMNUETfPvPVt3HoPQXxK', TRUE);

-- 5. Insertar Relación Categoría x Espacio
INSERT INTO categoriaxespacio (id_categoria, id_espacio) VALUES 
(1, 1), -- Auditorio -> Tecnología
(1, 2), -- Lab -> Tecnología
(3, 3), -- Jardín -> Aire Libre
(4, 3), -- Jardín -> Networking
(4, 4); -- Sala B -> Networking

-- 6. Insertar Actividades (Fechas actualizadas a 2025/2026)
INSERT INTO actividad (nombre, descripcion, fecha, hora_inicio, hora_fin, id_espacio, id_evento) VALUES 
('Conferencia de Apertura', 'Charla sobre el futuro de la IA.', '2025-10-10', '09:00:00', '11:00:00', 1, 1),
('Taller de Python', 'Introducción a la ciencia de datos.', '2025-10-11', '14:00:00', '16:00:00', 2, 1),
('Concierto al Atardecer', 'Música en vivo para cerrar el día.', '2025-11-05', '19:00:00', '21:00:00', 3, 2),
('Inicio del Hackathon', 'Formación de equipos y anuncio del reto.', '2026-12-01', '18:00:00', '20:00:00', 1, 3),
('Mentoria de Proyectos', 'Sesión de ayuda con expertos.', '2026-12-02', '10:00:00', '12:00:00', 4, 3);