CREATE TABLE Persona (
    id_persona INT AUTO_INCREMENT PRIMARY KEY, -- Clave primaria, autoincremental
    tipo_persona ENUM('Persona Natural', 'Persona Jurídica', 'Niños, niñas y adolescentes', 'Apoderado') NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50), -- Opcional
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50), -- Opcional
    tipo_identificacion ENUM('Cédula de ciudadanía', 'Cédula Extranjera', 'Registro Civil', 'Tarjeta de Identidad', 'NIT') NOT NULL,
    numero_identificacion VARCHAR(20) NOT NULL UNIQUE, -- Identificación única
    fecha_nacimiento DATE, -- Opcional
    genero ENUM('Femenino', 'Masculino', 'Otro') NOT NULL,
    pais VARCHAR(50) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono_fijo VARCHAR(20), -- Opcional
    telefono_movil VARCHAR(20) -- Opcional
);

CREATE TABLE Agendamiento (
    id_cita INT AUTO_INCREMENT PRIMARY KEY, -- Clave primaria, autoincremental
    numero_seguimiento VARCHAR(50) NOT NULL UNIQUE, -- Código único de seguimiento
    id_persona INT NOT NULL, -- FK hacia Persona
    correo_electronico VARCHAR(100) NOT NULL,
    motivo VARCHAR(5098) NOT NULL,
    tipo_cita ENUM('Presencial', 'Virtual') NOT NULL,
    dia_solicitado ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo') NOT NULL,
    hora_solicitada TIME NOT NULL,
    dia_hora_asignados DATETIME, -- Opcional
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona) -- Relación con Persona
);

CREATE TABLE PQRDS (
    id_pqrds INT AUTO_INCREMENT PRIMARY KEY, -- Clave primaria, autoincremental
    numero_seguimiento VARCHAR(50) NOT NULL UNIQUE, -- Código único de seguimiento
    estado ENUM('Pendiente', 'Revisado', 'Respondido') NOT NULL,
    tipo_solicitud ENUM('Petición', 'Queja', 'Reclamo', 'Denuncia', 'Sugerencia') NOT NULL,
    id_persona INT NOT NULL, -- FK hacia Persona
    correo_electronico VARCHAR(100) NOT NULL,
    informacion_solicitud VARCHAR(5098) NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona) -- Relación con Persona
);
