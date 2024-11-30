export const SQL_PQRDS = {
    CREATE_PQRDS: "SELECT solicitud_id, numero_seguimiento FROM crear_solicitud_pqrd($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16);",

    CREATE_PQRDS_ANONIMO: `
        SELECT solicitud_id, numero_seguimiento 
        FROM crear_solicitud_pqrd($1,$2,$3);
    `,
};
