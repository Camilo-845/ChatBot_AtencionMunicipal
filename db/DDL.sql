-- Crear tipos ENUM para PostgreSQL
CREATE TYPE tipo_persona_enum AS ENUM ('Persona Natural', 'Persona Jurídica', 'Niños, niñas y adolescentes', 'Apoderado');
CREATE TYPE tipo_identificacion_enum AS ENUM ('Cédula de ciudadanía', 'Cédula Extranjera', 'Registro Civil', 'Tarjeta de Identidad', 'NIT');
CREATE TYPE genero_enum AS ENUM ('Femenino', 'Masculino', 'Otro');
CREATE TYPE tipo_cita_enum AS ENUM ('Presencial', 'Virtual');
CREATE TYPE dia_enum AS ENUM ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo');
CREATE TYPE estado_enum AS ENUM ('Pendiente', 'Revisado', 'Respondido');
CREATE TYPE tipo_solicitud_enum AS ENUM ('Petición', 'Queja', 'Reclamo', 'Denuncia', 'Sugerencia');

-- Crear tabla Persona
CREATE TABLE Persona (
    id_persona SERIAL PRIMARY KEY, -- Clave primaria, autoincremental
    tipo_persona tipo_persona_enum NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50), -- Opcional
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50), -- Opcional
    tipo_identificacion tipo_identificacion_enum NOT NULL,
    numero_identificacion VARCHAR(20) NOT NULL UNIQUE, -- Identificación única
    fecha_nacimiento DATE, -- Opcional
    genero genero_enum NOT NULL,
    pais VARCHAR(50) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono_fijo VARCHAR(20), -- Opcional
    telefono_movil VARCHAR(20) -- Opcional
);

-- Crear tabla Agendamiento
CREATE TABLE Agendamiento (
    id_cita SERIAL PRIMARY KEY, -- Clave primaria, autoincremental
    numero_seguimiento VARCHAR(50) NOT NULL UNIQUE, -- Código único de seguimiento
    id_persona INT NOT NULL, -- FK hacia Persona
    correo_electronico VARCHAR(100) NOT NULL,
    motivo VARCHAR(5098) NOT NULL,
    tipo_cita tipo_cita_enum NOT NULL,
    dia_solicitado dia_enum NOT NULL,
    hora_solicitada TIME NOT NULL,
    dia_hora_asignados TIMESTAMP, -- Opcional
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona) -- Relación con Persona
);

-- Crear tabla PQRDS
CREATE TABLE PQRDS (
    id_pqrds SERIAL PRIMARY KEY, -- Clave primaria, autoincremental
    numero_seguimiento VARCHAR(50) NOT NULL UNIQUE, -- Código único de seguimiento
    estado estado_enum NOT NULL,
    tipo_solicitud tipo_solicitud_enum NOT NULL,
    id_persona INT NOT NULL, -- FK hacia Persona
    correo_electronico VARCHAR(100) NOT NULL,
    informacion_solicitud VARCHAR(5098) NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona) -- Relación con Persona
);
