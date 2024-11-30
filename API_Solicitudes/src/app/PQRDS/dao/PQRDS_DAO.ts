import { Response } from "express";
import { SQL_PQRDS } from "../repository/sql_pqrds";
import pool from "../../../config/connection/dbConnection";

class PQRDS_DAO {
  // Función para manejar la respuesta y los errores
  private static handleResponse(result: any, res: Response) {
    res.status(200).json({
      result: {
        solicitud_id: result.solicitudId,
        numero_seguimiento: result.numeroSeguimiento,
      },
    });
  }

  private static handleError(error: any, res: Response, customMessage: string) {
    console.log({ "Error solicitud": error });
    res.status(404).json({
      result: customMessage,
    });
  }

  // Función principal para crear el agendamiento
  protected static async creaPQRDS(data: any[], res: Response) {
    try {
      await pool.one((data.length>3)?SQL_PQRDS.CREATE_PQRDS:SQL_PQRDS.CREATE_PQRDS_ANONIMO, data)
      .then((result) => this.handleResponse(result, res))
      .catch((error) =>
        this.handleError(error, res, "Error al crear la solicitud anónima")
      );
    } catch (error) {
      console.log({ "Error interno": error });
      res.status(500).json({ result: "Error interno" });
    }
  }
}

export default PQRDS_DAO;
