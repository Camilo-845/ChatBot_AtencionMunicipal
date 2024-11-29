CREATE OR REPLACE FUNCTION crear_solicitud_agendamiento(
    correo_electronico VARCHAR(100),
    motivo VARCHAR(5098),
    tipo_cita tipo_cita_enum,
    tipo_persona tipo_persona_enum DEFAULT NULL,
    primer_nombre VARCHAR(50) DEFAULT NULL,
    segundo_nombre VARCHAR(50) DEFAULT NULL,
    primer_apellido VARCHAR(50) DEFAULT NULL,
    segundo_apellido VARCHAR(50) DEFAULT NULL,
    tipo_identificacion tipo_identificacion_enum DEFAULT NULL,
    numero_identificacion VARCHAR(20) DEFAULT NULL,
    fecha_nacimiento DATE DEFAULT NULL,
    genero genero_enum DEFAULT NULL,
    pais VARCHAR(50) DEFAULT NULL,
    direccion VARCHAR(255) DEFAULT NULL,
    telefono_fijo VARCHAR(20) DEFAULT NULL,
    telefono_movil VARCHAR(20) DEFAULT NULL,
    dia_solicitado dia_enum DEFAULT NULL,
    hora_solicitada TIME DEFAULT NULL
) RETURNS TABLE (
    solicitud_id INT,
    numero_seguimiento VARCHAR(50)
) AS $$
DECLARE
    persona_id INT;
    seguimiento VARCHAR(50);
BEGIN
    -- Validar que correo electrónico, motivo y tipo de cita no sean nulos
    IF correo_electronico IS NULL OR motivo IS NULL OR tipo_cita IS NULL THEN
        RAISE EXCEPTION 'correo_electronico, motivo y tipo_cita son obligatorios';
    END IF;

    -- Insertar persona si los datos no son nulos
    IF tipo_persona IS NOT NULL AND primer_nombre IS NOT NULL AND primer_apellido IS NOT NULL THEN
        INSERT INTO Persona (
            tipo_persona, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido,
            tipo_identificacion, numero_identificacion, fecha_nacimiento, genero, pais, direccion,
            telefono_fijo, telefono_movil
        ) VALUES (
            tipo_persona, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido,
            tipo_identificacion, numero_identificacion, fecha_nacimiento, genero, pais, direccion,
            telefono_fijo, telefono_movil
        ) RETURNING id_persona INTO persona_id;
    ELSE
        -- Si no hay datos de persona, persona_id debe ser NULL
        persona_id := NULL;
    END IF;

    -- Generar un nuevo número de seguimiento
    SELECT CONCAT('SOL-', LPAD((COALESCE(MAX(s.id_solicitud), 0) + 1)::TEXT, 6, '0'))
    INTO seguimiento
    FROM Solicitud s;

    -- Insertar en la tabla Solicitud
    INSERT INTO Solicitud (
        numero_seguimiento, id_persona, correo_electronico
    ) VALUES (
        seguimiento, persona_id, correo_electronico
    ) RETURNING id_solicitud INTO solicitud_id;

    -- Insertar en la tabla Agendamiento
    INSERT INTO Agendamiento (
        id_solicitud, motivo, tipo_cita, dia_solicitado, hora_solicitada
    ) VALUES (
        solicitud_id, motivo, tipo_cita, dia_solicitado, hora_solicitada
    );

    -- Retornar id_solicitud y numero_seguimiento
    RETURN QUERY SELECT solicitud_id, seguimiento;
END;
$$ LANGUAGE plpgsql;
