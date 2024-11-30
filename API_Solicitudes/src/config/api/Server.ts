import cors from "cors";
import express from "express";
import morgan from "morgan";

import apiRutaAgendamiento from "../../app/agendamiento/route/AgendamientoRoute";
import apiRutaPQRDS from "../../app/PQRDS/route/PQRDS_Route";
import apiRutaSolicitudes from "../../app/solicitudes/route/SolicitudesRoute";

import dotenv from "dotenv";

dotenv.config({
    path: ".env",
});


class Server{
    public app:express.Application;

    constructor (){
        this.app = express();
        this.chargeConfiguration();
        this.exposeEndPoint();
    }

    public exposeEndPoint(){
        this.app.use("/agendamiento", apiRutaAgendamiento);
        this.app.use("/PQRDS", apiRutaPQRDS);
        this.app.use("/solicitud", apiRutaSolicitudes);
    }

    public chargeConfiguration(){
        this.app.set("PORT", process.env.PORT)
        this.app.use(cors());
        this.app.use(morgan("dev"));
        // Tamaño máximo de archivo
        this.app.use(express.json({ limit: "50mb" }));
        // Para que soporte la cantidad de caracteres URL
        this.app.use(express.urlencoded({ extended: true }));
    }

    public iniciar():void{
        this.app.listen(this.app.get("PORT"), ()=>{
            console.log(`Escuchando en el puerto ${this.app.get("PORT")}`)
        })
    }
}

export default Server;