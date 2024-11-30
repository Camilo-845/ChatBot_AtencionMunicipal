import { Response } from "express";
import pool from "../../../config/connection/dbConnection";
import { SQL_AGENDAMIENTO } from "../../agendamiento/repository/sql_agendamiento";
import { SQL_PQRDS } from "../../PQRDS/repository/sql_pqrds";

class SolicitudesDAO {
  private static handleResponse(result: any, res: Response) {
    res.status(200).json({
      result: result,
    });
  }

  private static handleError(error: any, res: Response, customMessage: string) {
    console.log({ "Error solicitud": error });
    res.status(404).json({
      result: customMessage,
    });
  }

  protected static async getSolicitud(numeroSeguimiento: string, res: Response) {
    try {
      await pool.task(async (t) => {
        const solAgendamiento = await t.oneOrNone(SQL_AGENDAMIENTO.GET_AGENDAMIENTO,[numeroSeguimiento]);
        if (solAgendamiento) {
            solAgendamiento.estado = solAgendamiento.diaHoraAsignados
                ? "Agendado" 
                : "Pendiente";
            console.log("agendaminto", solAgendamiento);
            return solAgendamiento;
        }
        const solPQRDS= await t.oneOrNone(SQL_PQRDS.GET_PQRDS,[numeroSeguimiento]);
        if(solPQRDS){
            console.log("pqrds", solPQRDS);
          return solPQRDS;
        }
        throw new Error("Solicitud no encontrada");

      })
      .then((result) => this.handleResponse(result, res))
      .catch((error) =>
        this.handleError(error, res, "Error al buscar solicitud")
      );
    } catch (error) {
      console.log({ "Error interno": error });
      res.status(500).json({ result: "Error interno" });
    }
  }
}

export default SolicitudesDAO;