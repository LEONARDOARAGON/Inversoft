SET IDENTITY_INSERT Proveedor ON;

INSERT INTO Proveedor (Id, Nombre, IdTipoIdentificacion, NroIdentificacion, Telefono, Direccion, Email, RazonSocial)
VALUES
(1, 'PepsiCo', 1, '900100100-1', '3001234567', 'Calle 10 #20-30', 'contacto@pepsico.com', 'PepsiCo S.A.'),
(2, 'Ramo', 1, '900100101-2', '3001234568', 'Carrera 15 #45-50', 'contacto@ramo.com', 'Ramo S.A.S.'),
(3, 'Alpina', 1, '900100102-3', '3001234569', 'Avenida 5 #10-15', 'contacto@alpina.com', 'Alpina Productos Alimenticios S.A.'),
(4, 'Postobon', 1, '900100103-4', '3001234570', 'Diagonal 30 #50-55', 'contacto@postobon.com', 'Postobon S.A.'),
(5, 'Nutresa', 1, '900100104-5', '3001234571', 'Calle 100 #25-35', 'contacto@nutresa.com', 'Grupo Nutresa S.A.'),
(6, 'GrupoExito', 1, '900100105-6', '3001234572', 'Carrera 50 #80-90', 'contacto@grupoexito.com', 'Grupo Éxito S.A.'),
(7, 'Bavaria', 1, '900100106-7', '3001234573', 'Avenida 68 #40-50', 'contacto@bavaria.com', 'Bavaria S.A.'),
(8, 'Ecopetrol', 1, '900100107-8', '3001234574', 'Carrera 13 #26-40', 'contacto@ecopetrol.com', 'Ecopetrol S.A.'),
(9, 'Sura', 1, '900100108-9', '3001234575', 'Calle 52 #42-30', 'contacto@sura.com', 'Grupo Sura S.A.'),
(10, 'Bancolombia', 1, '900100109-0', '3001234576', 'Carrera 48 #26-85', 'contacto@bancolombia.com', 'Bancolombia S.A.');

SET IDENTITY_INSERT Proveedor OFF;
