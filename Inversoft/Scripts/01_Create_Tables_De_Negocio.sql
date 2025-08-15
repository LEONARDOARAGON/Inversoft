-- ===================================
-- ELIMINAR TABLAS SI EXISTEN (orden inverso de dependencias)
-- ===================================
IF OBJECT_ID('EmpresaProducto', 'U') IS NOT NULL DROP TABLE EmpresaProducto;
IF OBJECT_ID('Producto', 'U') IS NOT NULL DROP TABLE Producto;
IF OBJECT_ID('Cliente', 'U') IS NOT NULL DROP TABLE Cliente;
IF OBJECT_ID('Cargo', 'U') IS NOT NULL DROP TABLE Cargo;
IF OBJECT_ID('Persona', 'U') IS NOT NULL DROP TABLE Persona;
IF OBJECT_ID('Proveedor', 'U') IS NOT NULL DROP TABLE Proveedor;
IF OBJECT_ID('Empresa', 'U') IS NOT NULL DROP TABLE Empresa;

-- ===================================
-- TABLA: Empresa
-- ===================================
CREATE TABLE Empresa (
    Id INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(255) NOT NULL,
    IdTipoIdentificacion INT NOT NULL,
    NroIdentificacion NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(50),
    Direccion NVARCHAR(255),
    Email NVARCHAR(255),
    RazonSocial NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_Empresa PRIMARY KEY (Id),
    CONSTRAINT UQ_Empresa_Identificacion UNIQUE (IdTipoIdentificacion, NroIdentificacion)
);

CREATE INDEX IX_Empresa_IdTipoIdentificacion ON Empresa(IdTipoIdentificacion);
CREATE INDEX IX_Empresa_Nombre ON Empresa(Nombre);

-- ===================================
-- TABLA: Proveedor
-- ===================================
CREATE TABLE Proveedor (
    Id INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(255) NOT NULL,
    IdTipoIdentificacion INT NOT NULL,
    NroIdentificacion NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(50),
    Direccion NVARCHAR(255),
    Email NVARCHAR(255),
    RazonSocial NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_Proveedor PRIMARY KEY (Id),
    CONSTRAINT UQ_Proveedor_Identificacion UNIQUE (IdTipoIdentificacion, NroIdentificacion)
);

CREATE INDEX IX_Proveedor_IdTipoIdentificacion ON Proveedor(IdTipoIdentificacion);
CREATE INDEX IX_Proveedor_Nombre ON Proveedor(Nombre);

-- ===================================
-- TABLA: Persona
-- ===================================
CREATE TABLE Persona (
    Id INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(255) NOT NULL,
    IdTipoIdentificacion INT NOT NULL,
    NroIdentificacion NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(50),
    Direccion NVARCHAR(255),
    Email NVARCHAR(255),
    Apellido NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_Persona PRIMARY KEY (Id),
    CONSTRAINT UQ_Persona_Identificacion UNIQUE (IdTipoIdentificacion, NroIdentificacion)
);

CREATE INDEX IX_Persona_IdTipoIdentificacion ON Persona(IdTipoIdentificacion);
CREATE INDEX IX_Persona_NombreApellido ON Persona(Nombre, Apellido);

-- ===================================
-- TABLA: Cargo
-- ===================================
CREATE TABLE Cargo (
    Id INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(255) NOT NULL,
    Status BIT NOT NULL,
    CONSTRAINT PK_Cargo PRIMARY KEY (Id)
);

CREATE INDEX IX_Cargo_Nombre ON Cargo(Nombre);

-- ===================================
-- TABLA: Cliente
-- ===================================
CREATE TABLE Cliente (
    Id INT IDENTITY(1,1) NOT NULL,
    IdPersona INT NOT NULL,
    IdEmpresa INT NOT NULL,
    IdCargo INT NOT NULL,
    CONSTRAINT PK_Cliente PRIMARY KEY (Id),
    CONSTRAINT FK_Cliente_Persona FOREIGN KEY (IdPersona) REFERENCES Persona(Id),
    CONSTRAINT FK_Cliente_Empresa FOREIGN KEY (IdEmpresa) REFERENCES Empresa(Id),
    CONSTRAINT FK_Cliente_Cargo FOREIGN KEY (IdCargo) REFERENCES Cargo(Id)
);

CREATE INDEX IX_Cliente_IdPersona ON Cliente(IdPersona);
CREATE INDEX IX_Cliente_IdEmpresa ON Cliente(IdEmpresa);
CREATE INDEX IX_Cliente_IdCargo ON Cliente(IdCargo);

-- ===================================
-- TABLA: Producto
-- ===================================
CREATE TABLE Producto (
    Id INT IDENTITY(1,1) NOT NULL,
    IdProveedor INT NOT NULL,
    Nombre NVARCHAR(255) NOT NULL,
    Descripcion NVARCHAR(1000),
    SKU NVARCHAR(100),
    Precio DECIMAL(18,2) NOT NULL,
    Cantidad INT NOT NULL,
    IdClienteIngreso INT NOT NULL,
    FechaIngreso DATETIME NOT NULL,
    IdClienteActualizo INT,
    FechaActualizacion DATETIME,
    OperacionRegistro NVARCHAR(255),
    Status BIT NOT NULL,
    CONSTRAINT PK_Producto PRIMARY KEY (Id),
    CONSTRAINT FK_Producto_Proveedor FOREIGN KEY (IdProveedor) REFERENCES Proveedor(Id),
    CONSTRAINT FK_Producto_ClienteIngreso FOREIGN KEY (IdClienteIngreso) REFERENCES Cliente(Id),
    CONSTRAINT FK_Producto_ClienteActualizo FOREIGN KEY (IdClienteActualizo) REFERENCES Cliente(Id)
);

CREATE INDEX IX_Producto_IdProveedor ON Producto(IdProveedor);
CREATE INDEX IX_Producto_Nombre ON Producto(Nombre);
CREATE INDEX IX_Producto_SKU ON Producto(SKU);

-- ===================================
-- TABLA: EmpresaProducto
-- ===================================
CREATE TABLE EmpresaProducto (
    Id INT IDENTITY(1,1) NOT NULL,
    IdEmpresa INT NOT NULL,
    IdProducto INT NOT NULL,
    CONSTRAINT PK_EmpresaProducto PRIMARY KEY (Id),
    CONSTRAINT FK_EmpresaProducto_Empresa FOREIGN KEY (IdEmpresa) REFERENCES Empresa(Id),
    CONSTRAINT FK_EmpresaProducto_Producto FOREIGN KEY (IdProducto) REFERENCES Producto(Id),
    CONSTRAINT UQ_EmpresaProducto UNIQUE (IdEmpresa, IdProducto)
);

CREATE INDEX IX_EmpresaProducto_IdEmpresa ON EmpresaProducto(IdEmpresa);
CREATE INDEX IX_EmpresaProducto_IdProducto ON EmpresaProducto(IdProducto);
