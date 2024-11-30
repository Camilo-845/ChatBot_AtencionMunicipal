import { Request, Response } from "express";
import PQRDS_DAO from "../dao/PQRDS_DAO";

class PQRDS_Controller extends PQRDS_DAO {
    public crearPQRS(req: Request, res: Response) {
        // Extraer datos del cuerpo de la solicitud
        const {
            correo,
            informacion_solicitud,
            tipo_solicitud,
            persona,
        } = req.body;

        // Crear un arreglo con los datos en el orden esperado por la consulta
        var data = [correo,tipo_solicitud,informacion_solicitud];
        if(persona){
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
            data = data.concat(personaData);
        }
        // Llamar al método para ejecutar la consulta
        PQRDS_Controller.creaPQRDS(data, res);
    }

    public updatePQRS(req: Request, res: Response) {
        // Extraer datos del cuerpo de la solicitud
        const { id } = req.params;
        const {estado} = req.body;
        // Crear un arreglo con los datos en el orden esperado por la consulta
        const data = [estado, id];
        // Llamar
        PQRDS_Controller.actualizarPQRDS(data, res);
    }
}

const agendamientoController = new PQRDS_Controller();
export default agendamientoController;
