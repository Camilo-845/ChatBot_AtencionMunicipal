import {Router} from "express";
import pqrdsController from "../controller/PQRDS_Controller";

class PQRDS_Route{
    public apiRutaPQRDS:Router;
    
    constructor(){
        this.apiRutaPQRDS = Router();
        this.misRutas();
    }

    private misRutas(){
        this.apiRutaPQRDS.post("",pqrdsController.crearPQRS);
    }
}

const PQRDS_Route_ = new PQRDS_Route();

export default PQRDS_Route_.apiRutaPQRDS;