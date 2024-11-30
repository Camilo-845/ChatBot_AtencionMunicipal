import {Router} from "express";
import agendamientoController from "../controller/AgendamientoController";

class AgendamientoRoute{
    public apiRutaAgendamiento:Router;
    
    constructor(){
        this.apiRutaAgendamiento = Router();
        this.misRutas();
    }

    private misRutas(){
        this.apiRutaAgendamiento.post("",agendamientoController.crearAgendamiento);
    }
}

const agendamientoRoute = new AgendamientoRoute();

export default agendamientoRoute.apiRutaAgendamiento;