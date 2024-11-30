export const SQL_PQRDS = {
    CREATE_PQRDS: "SELECT solicitud_id, numero_seguimiento FROM crear_solicitud_pqrd($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16);",

    CREATE_PQRDS_ANONIMO: `
        SELECT solicitud_id, numero_seguimiento 
        FROM crear_solicitud_pqrd($1,$2,$3);
    `,
    GET_PQRDS:`
        SELECT pqrds.id_solicitud, id_persona, numero_seguimiento, correo_electronico, estado, tipo_solicitud, informacion_solicitud
        FROM pqrds
        INNER JOIN solicitud
        ON solicitud.id_solicitud = pqrds.id_solicitud
        WHERE numero_seguimiento = $1;
    `,

    UPDATE_PQRDS:`
        UPDATE pqrds
        SET estado = $1
        WHERE id_solicitud = $2;
    `
};
