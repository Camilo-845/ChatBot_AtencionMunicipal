import { Response } from "express";
import { SQL_AGENDAMIENTO } from "../repository/sql_agendamiento";
import pool from "../../../config/connection/dbConnection";

class AgendamientoDAO {
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
  protected static async crearAgendamiento(data: any[], res: Response) {
    try {
      // Si no hay datos de persona, creamos un agendamiento anónimo
      if (data[5] == null) {
        await pool
          .one(SQL_AGENDAMIENTO.CREATE_AGENDAMIENTO_ANONIMO, data)
          .then((result) => this.handleResponse(result, res))
          .catch((error) =>
            this.handleError(error, res, "Error al crear la solicitud anónima")
          );
        return;
      }

      // Si hay datos de persona, extraemos y agregamos la información de persona
      const persona = data[5];
      const personaData = [
        persona.tipo_persona,
        persona.primer_nombre,
        persona.segundo_nombre,
        persona.primer_apellido,
        persona.segundo_apellido,
        persona.tipo_identificacion,
        persona.numero_identificacion,
        persona.fecha_nacimiento,
        persona.genero,
        persona.pais,
        persona.direccion,
        persona.telefono_fijo,
        persona.telefono_movil,
      ];

      // Concatenamos los datos iniciales con los datos de persona
      const fullData = data.slice(0, 3).concat(personaData).concat(data.slice(3,5));

      // Ejecutamos la consulta para crear el agendamiento con los datos de persona
      await pool
        .one(SQL_AGENDAMIENTO.CREATE_AGENDAMIENTO, fullData)
        .then((result) => this.handleResponse(result, res))
        .catch((error) =>
          this.handleError(error, res, "Error al crear la solicitud con datos de persona")
        );
    } catch (error) {
      console.log({ "Error interno": error });
      res.status(500).json({ result: "Error interno" });
    }
  }
}

export default AgendamientoDAO;
