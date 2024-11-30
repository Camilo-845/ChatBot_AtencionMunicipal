import { Request, Response } from "express";
import AgendamientoDAO from "../dao/AgendamientoDAO";

class AgendamientoController extends AgendamientoDAO {
    public crearAgendamiento(req: Request, res: Response) {
        // Extraer datos del cuerpo de la solicitud
        const {
            correo_electronico, // $1
            motivo,             // $2
            tipo_cita,          // $3
            tipo_persona,       // $4
            primer_nombre,      // $5
            segundo_nombre,     // $6
            primer_apellido,    // $7
            segundo_apellido,   // $8
            tipo_identificacion,// $9
            numero_identificacion, // $10
            fecha_nacimiento,   // $11
            genero,             // $12
            pais,               // $13
            direccion,          // $14
            telefono_fijo,      // $15
            telefono_movil,     // $16
            dia_solicitado,     // $17
            hora_solicitada     // $18
        } = req.body;

        // Crear un arreglo con los datos en el orden esperado por la consulta
        const data = [
            correo_electronico, motivo, tipo_cita,
            tipo_persona, primer_nombre, segundo_nombre,
            primer_apellido, segundo_apellido, tipo_identificacion,
            numero_identificacion, fecha_nacimiento, genero,
            pais, direccion, telefono_fijo,
            telefono_movil, dia_solicitado, hora_solicitada
        ];

        // Llamar al método para ejecutar la consulta
        AgendamientoController.crearAgendamiento(data, res);
    }
}

const agendamientoController = new AgendamientoController();
export default agendamientoController;
