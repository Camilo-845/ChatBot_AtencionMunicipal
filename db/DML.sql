INSERT INTO Persona (tipo_persona, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, tipo_identificacion, numero_identificacion, fecha_nacimiento, genero, pais, direccion, telefono_fijo, telefono_movil) 
VALUES 
('Persona Natural', 'Carlos', 'Andrés', 'Pérez', 'López', 'Cédula de ciudadanía', '123456789', '1985-06-15', 'Masculino', 'Colombia', 'Calle 123 #45-67', '1234567', '3101234567'),
('Persona Jurídica', 'Empresa', NULL, 'XYZ', NULL, 'NIT', '900123456', NULL, 'Otro', 'Colombia', 'Carrera 10 #20-30', NULL, '3123456789'),
('Persona Natural', 'Ana', 'María', 'García', 'Ríos', 'Cédula de ciudadanía', '987654321', '1990-04-10', 'Femenino', 'Colombia', 'Calle 456 #12-34', '2345678', '3112345678'),
('Persona Jurídica', 'Corporación', NULL, 'ABC', NULL, 'NIT', '800123456', NULL, 'Otro', 'Colombia', 'Avenida 5 #60-70', NULL, '3145678901'),
('Niños, niñas y adolescentes', 'Juan', 'Carlos', 'Martínez', 'Pérez', 'Registro Civil', '112233445', '2005-03-21', 'Masculino', 'Colombia', 'Calle 789 #89-10', '3456789', '3151234567'),
('Apoderado', 'Laura', NULL, 'Rodríguez', NULL, 'Cédula de ciudadanía', '555123456', '1982-12-30', 'Femenino', 'Colombia', 'Carrera 15 #100-20', '4567890', '3162345678'),
('Persona Natural', 'Pedro', 'Luis', 'Sánchez', 'Gómez', 'Cédula de ciudadanía', '123123123', '1980-01-25', 'Masculino', 'Colombia', 'Calle 101 #20-25', '5678901', '3173456789'),
('Persona Jurídica', 'Industria', NULL, 'DEF', NULL, 'NIT', '710123456', NULL, 'Otro', 'Colombia', 'Avenida 8 #10-15', NULL, '3184567890'),
('Persona Natural', 'María', 'Luisa', 'Torres', 'Ramírez', 'Cédula de ciudadanía', '543210987', '1987-11-18', 'Femenino', 'Colombia', 'Calle 213 #56-78', '6789012', '3195678901'),
('Persona Jurídica', 'Servicios', NULL, '123', NULL, 'NIT', '320123456', NULL, 'Otro', 'Colombia', 'Calle 22 #34-56', NULL, '3206789012'),
('Niños, niñas y adolescentes', 'Sara', 'Alejandra', 'Vargas', 'Gutiérrez', 'Registro Civil', '334455667', '2010-07-14', 'Femenino', 'Colombia', 'Calle 432 #21-22', '7890123', '3212345678'),
('Apoderado', 'José', 'Alberto', 'González', 'Cano', 'Cédula de ciudadanía', '123987654', '1975-03-11', 'Masculino', 'Colombia', 'Carrera 25 #45-65', '8901234', '3223456789'),
('Persona Natural', 'Carlos', 'Eduardo', 'Rodríguez', 'Martínez', 'Cédula de ciudadanía', '102938475', '1992-09-30', 'Masculino', 'Colombia', 'Calle 56 #10-20', '1234567', '3234567890'),
('Persona Jurídica', 'Tecnología', NULL, 'LMN', NULL, 'NIT', '550123456', NULL, 'Otro', 'Colombia', 'Avenida 12 #15-35', NULL, '3245678901'),
('Persona Natural', 'Liliana', 'Margarita', 'Álvarez', 'Fuentes', 'Cédula de ciudadanía', '982736455', '1984-12-01', 'Femenino', 'Colombia', 'Calle 76 #40-60', '2345678', '3256789012'),
('Persona Jurídica', 'Consultores', NULL, 'OPQ', NULL, 'NIT', '610123456', NULL, 'Otro', 'Colombia', 'Carrera 3 #20-40', NULL, '3267890123'),
('Niños, niñas y adolescentes', 'Felipe', 'Eduardo', 'Paredes', 'Sosa', 'Registro Civil', '998877665', '2008-05-20', 'Masculino', 'Colombia', 'Calle 12 #78-90', '3456789', '3278901234'),
('Apoderado', 'Claudia', 'Inés', 'Ramírez', 'Jaramillo', 'Cédula de ciudadanía', '776655443', '1989-06-05', 'Femenino', 'Colombia', 'Calle 34 #99-10', '4567890', '3289012345'),
('Persona Natural', 'Antonio', 'José', 'Serrano', 'Gómez', 'Cédula de ciudadanía', '765432109', '1983-01-25', 'Masculino', 'Colombia', 'Carrera 45 #12-34', '5678901', '3290123456'),
('Persona Jurídica', 'Distribuidores', NULL, 'RST', NULL, 'NIT', '910123456', NULL, 'Otro', 'Colombia', 'Avenida 5 #20-50', NULL, '3301234567'),
('Persona Natural', 'Lucía', 'Fernanda', 'Jiménez', 'Vargas', 'Cédula de ciudadanía', '324567890', '1996-08-18', 'Femenino', 'Colombia', 'Calle 11 #45-78', '6789012', '3312345678'),
('Persona Jurídica', 'Alimentos', NULL, 'UVW', NULL, 'NIT', '730123456', NULL, 'Otro', 'Colombia', 'Carrera 30 #10-20', NULL, '3323456789');

INSERT INTO Agendamiento (numero_seguimiento, id_persona, correo_electronico, motivo, tipo_cita, dia_solicitado, hora_solicitada, dia_hora_asignados) 
VALUES 
('AG12345', 1, 'carlos.perez@example.com', 'Consulta médica general', 'Presencial', 'Martes', '09:30:00', '2024-12-05 09:30:00'),
('AG67890', 2, 'empresa.xyz@example.com', 'Revisión de contrato', 'Virtual', 'Lunes', '15:00:00', NULL),
('AG11223', 3, 'ana.garcia@example.com', 'Examen dental', 'Presencial', 'Miércoles', '10:00:00', '2024-12-06 10:00:00'),
('AG44556', 4, 'empresa.abc@example.com', 'Reunión corporativa', 'Virtual', 'Viernes', '13:00:00', NULL),
('AG78901', 5, 'juan.martinez@example.com', 'Asesoría jurídica', 'Presencial', 'Jueves', '16:00:00', '2024-12-07 16:00:00'),
('AG22334', 6, 'laura.rodriguez@example.com', 'Consulta psicológica', 'Virtual', 'Sábado', '11:00:00', NULL),
('AG33445', 7, 'pedro.sanchez@example.com', 'Asesoría financiera', 'Presencial', 'Domingo', '14:00:00', '2024-12-08 14:00:00'),
('AG55667', 8, 'maria.torres@example.com', 'Revisión médica', 'Presencial', 'Lunes', '08:30:00', '2024-12-09 08:30:00'),
('AG77889', 9, 'luis.martinez@example.com', 'Evaluación física', 'Virtual', 'Martes', '12:00:00', NULL),
('AG99001', 10, 'pedro.gomez@example.com', 'Reunión de negocio', 'Presencial', 'Miércoles', '09:00:00', '2024-12-10 09:00:00'),
('AG12346', 50, 'ana.jimenez@example.com', 'Consulta jurídica', 'Virtual', 'Viernes', '17:00:00', NULL);

INSERT INTO PQRDS (numero_seguimiento, estado, tipo_solicitud, id_persona, correo_electronico, informacion_solicitud) 
VALUES 
('PQR001', 'Pendiente', 'Queja', 1, 'carlos.perez@example.com', 'El servicio fue deficiente.'),
('PQR002', 'Revisado', 'Petición', 2, 'empresa.xyz@example.com', 'Solicitamos mayor información sobre los términos del contrato.'),
('PQR003', 'Respondido', 'Reclamo', 3, 'ana.garcia@example.com', 'El producto llegó dañado.'),
('PQR004', 'Pendiente', 'Sugerencia', 4, 'empresa.abc@example.com', 'Recomendamos mejorar la atención al cliente.'),
('PQR005', 'Revisado', 'Denuncia', 5, 'juan.martinez@example.com', 'Se reportó una violación de derechos laborales.'),
('PQR006', 'Pendiente', 'Queja', 6, 'laura.rodriguez@example.com', 'La página web no funciona correctamente.'),
('PQR007', 'Revisado', 'Petición', 7, 'pedro.sanchez@example.com', 'Solicitamos una prórroga para la entrega.'),
('PQR008', 'Respondido', 'Reclamo', 8, 'maria.torres@example.com', 'El servicio llegó con retraso.'),
('PQR009', 'Pendiente', 'Sugerencia', 9, 'luis.martinez@example.com', 'Sugerimos mejorar la calidad del soporte.'),
('PQR010', 'Revisado', 'Queja', 10, 'pedro.gomez@example.com', 'El producto no corresponde a lo solicitado.'),
('PQR049', 'Revisado', 'Petición', 49, 'pedro.sanchez@example.com', 'Solicito cambiar la fecha de mi cita.'),
('PQR050', 'Respondido', 'Reclamo', 50, 'ana.jimenez@example.com', 'La consulta fue mal realizada.');
