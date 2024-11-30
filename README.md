# ChatBot atención al ciudadano
Proyecto de desarrollo de chatbot interactivo e inteligente que facilite la comunicación entre la administración municipal y los ciudadanos para Hackathon SEMESTRAL II de la Universidad Sergio Arboleda

## Instalar Proyecto
Clonando repositorio
```sh
git clone https://github.com/Camilo-845/ChatBot_AtencionMunicipal.git
```
## Iniciar Proyecto
Es requerido tener instalado [docker](https://docs.docker.com/get-started/get-docker/) y [docker-compose](https://docs.docker.com/compose/install/)
```sh
# Ubicarse en el directorio del proyecto
cd ChatBot_AtencionMunicipal-main

# Iniciar proyecto
docker-compose up -d --build

#Para detener el proyecto
docker-compose down -v -rmi all
```

## Iniciar Componentes por separado
Si prefieres ejecutar cada componente por separado
- [Base de Datos](./db/)
- [API Solicitudes](./API_Solicitudes/)
