import { Request, Response } from "express";
import AgendamientoDAO from "../dao/AgendamientoDAO";

class AgendamientoController extends AgendamientoDAO {
    public crearAgendamiento(req: Request, res: Response) {
        // Extraer datos del cuerpo de la solicitud
        const {
            correo,
            motivo,
            tipo_cita,
            dia_solicitado,
            hora_solicitada,
            persona,
        } = req.body;

        // Crear un arreglo con los datos en el orden esperado por la consulta
        const data = [
            correo,
            motivo,
            tipo_cita,
            dia_solicitado,
            hora_solicitada,
            persona,
        ];
        // Llamar al método para ejecutar la consulta
        AgendamientoController.crearAgendamiento(data, res);
    }
}

const agendamientoController = new AgendamientoController();
export default agendamientoController;
