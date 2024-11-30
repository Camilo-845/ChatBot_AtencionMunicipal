export const SQL_AGENDAMIENTO = {
    CREATE_AGENDAMIENTO: "SELECT solicitud_id, numero_seguimiento FROM crear_solicitud_agendamiento($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18);",

    CREATE_AGENDAMIENTO_ANONIMO: `
        SELECT solicitud_id, numero_seguimiento 
        FROM crear_solicitud_agendamiento(
            correo_electronico => $1,  -- correo_electronico
            motivo => $2,              -- motivo
            tipo_cita => $3,           -- tipo_cita
            dia_solicitado => $4,      -- dia_solicitado
            hora_solicitada => $5      -- hora_solicitada
        );
    `,
};
