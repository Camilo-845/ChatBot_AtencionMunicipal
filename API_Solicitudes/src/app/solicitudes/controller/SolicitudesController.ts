import { Request, Response } from "express";
import SolicitudesDAO from "../dao/SolicitudesDAO";

class SolicitudesController extends SolicitudesDAO {
    public getSolicitud(req: Request, res: Response) {
        const { numSeg } = req.params;
        SolicitudesController.getSolicitud(numSeg, res);
    }
}

const solicitudesController = new SolicitudesController();
export default solicitudesController;