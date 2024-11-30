import { Router } from "express";
import solicitudesController from "../controller/SolicitudesController";

class SolicitudesRoute {
  public apiRutaSolicitudes: Router;

  constructor() {
    this.apiRutaSolicitudes = Router();
    this.misRutas();
  }

  private misRutas() {
    this.apiRutaSolicitudes.get("/:numSeg", solicitudesController.getSolicitud);
  }
}

const apiRutaSolicitudes = new SolicitudesRoute();
export default apiRutaSolicitudes.apiRutaSolicitudes;