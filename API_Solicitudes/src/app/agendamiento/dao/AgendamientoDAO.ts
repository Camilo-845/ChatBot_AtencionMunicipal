import { Response } from "express";
import { SQL_AGENDAMIENTO } from "../repository/sql_agendamiento";
import pool from "../../../config/connection/dbConnection";

class AgendamientoDAO{
    protected static async crearAgendamiento(data: any, res: Response){
        try{
            await pool.one(SQL_AGENDAMIENTO.CREAATE_AGENDAMIENTO, data)
            .then(result => {
                res.status(200).json(
                    {
                        "result": {
                            "solicitud_id": result.solicitudId, // Cambiar a solicitudId
                            "numero_seguimiento": result.numeroSeguimiento // Cambiar a numeroSeguimiento
                        }
                    }
                );
            })
            
            .catch(error => {
                console.log({"Error solicitud": error});
                res.status(404).json({result: "Error al crear la agendamiento"});
            });
        }catch(error){
            console.log({"Error interno": error});
            res.status(500).json({result: "Error interno"});
        }
    }
}

export default AgendamientoDAO;