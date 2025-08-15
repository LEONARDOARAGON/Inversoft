SET IDENTITY_INSERT Empresa ON;

INSERT INTO Empresa (Id, Nombre, IdTipoIdentificacion, NroIdentificacion, Telefono, Direccion, Email, RazonSocial)
VALUES
(1, 'TechSolutions', 1, '800100200-1', '3105550001', 'Calle 100 #15-20', 'contacto@techsolutions.com', 'TechSolutions S.A.S.'),
(2, 'Constructora Andina', 1, '800100201-2', '3105550002', 'Carrera 45 #80-90', 'info@constructoraandina.com', 'Constructora Andina S.A.'),
(3, 'AgroColombia', 1, '800100202-3', '3105550003', 'Avenida 68 #50-60', 'ventas@agrocolombia.com', 'AgroColombia Ltda.');

SET IDENTITY_INSERT Empresa OFF;


SET IDENTITY_INSERT Persona ON;

INSERT INTO Persona (Id, Nombre, IdTipoIdentificacion, NroIdentificacion, Telefono, Direccion, Email, Apellido)
VALUES
(1, 'Carlos', 1, '1002003001', '3205551111', 'Calle 50 #20-10', 'carlos.garcia@email.com', 'García'),
(2, 'María', 1, '1002003002', '3205552222', 'Carrera 10 #45-15', 'maria.lopez@email.com', 'López'),
(3, 'Andrés', 1, '1002003003', '3205553333', 'Avenida 30 #55-40', 'andres.perez@email.com', 'Pérez');

SET IDENTITY_INSERT Persona OFF;

SET IDENTITY_INSERT Cliente ON;

INSERT INTO Cliente (Id, IdPersona, IdEmpresa, IdCargo)
VALUES
(1, 1, 1, 1), -- Carlos en TechSolutions como Gerente
(2, 2, 2, 2), -- María en Constructora Andina como Vendedor
(3, 3, 3, 3); -- Andrés en AgroColombia como Asistente

SET IDENTITY_INSERT Cliente OFF;
