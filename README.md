# Inversoft Inventario

Sistema de Inventario desarrollado con ASP.NET Core Razor Pages (.NET 8).

## Tecnologías utilizadas

- **.NET 8**
- **ASP.NET Core Razor Pages**
- **Entity Framework Core** (para acceso a datos)
- **Bootstrap 5** (para estilos y componentes responsivos)
- **C# 12**
- **Razor Views**
- **SQL Server** (o el motor de base de datos que configures)

## Paquetes NuGet principales

- `Microsoft.EntityFrameworkCore`
- `Microsoft.EntityFrameworkCore.SqlServer`
- `Microsoft.EntityFrameworkCore.Tools`
- `Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation`
- `Microsoft.AspNetCore.Identity.EntityFrameworkCore` (si usas autenticación)
- `Microsoft.AspNetCore.Diagnostics.EntityFrameworkCore` (opcional para diagnóstico)

> Puedes ver la lista completa de paquetes en el archivo `.csproj` del proyecto.

## Estructura y funcionamiento

El sistema sigue una arquitectura limpia separando responsabilidades en:

- **Modelos (`Models/Negocio`)**: Clases que representan las entidades del dominio, como `Producto`.
- **Enumeraciones (`Models/Enums`)**: Por ejemplo, `EnumProveedores` para listar proveedores.
- **Repositorios (`Repositories`)**: Acceso a datos mediante interfaces y clases concretas, como `ProductoRepository`.
- **Servicios (`Services`)**: Lógica de negocio, como `ProductoService`.
- **Controladores (`Controllers`)**: Gestionan las peticiones HTTP y coordinan la lógica entre vistas y servicios, por ejemplo, `ProductoController`.
- **Vistas (`Views`)**: Archivos `.cshtml` que renderizan la interfaz de usuario usando Razor y Bootstrap 5.

### Flujo de trabajo típico

1. **Visualización de productos**:  
   El usuario accede a la vista de productos (`Views/Producto/Index.cshtml`), donde se listan todos los productos en una tabla Bootstrap.

2. **Creación de productos**:  
   El usuario accede a la vista de creación (`Views/Producto/Crear.cshtml`), llena el formulario (incluyendo selección de proveedor desde un enum), y envía los datos.  
   El controlador valida y pasa la información al servicio, que la guarda usando el repositorio.

3. **Edición de productos**:  
   Similar al flujo de creación, pero cargando los datos existentes para editar.

4. **Alertas y validaciones**:  
   Se utilizan alertas Bootstrap para mostrar mensajes de éxito o error, y validación tanto del lado del cliente como del servidor.

### Configuración

1. **Clonar el repositorio**
2. **Configurar la cadena de conexión en `appsettings.json`**
3. **Ejecutar migraciones de Entity Framework (si aplica)**
4. **Ejecutar el proyecto con Visual Studio 2022 o superior**

### Notas adicionales

- El sistema es fácilmente extensible para agregar más entidades o lógica de negocio.
- Se recomienda mantener los paquetes NuGet actualizados y seguir buenas prácticas de seguridad.

---

¿Necesitas agregar instrucciones específicas de despliegue, autenticación o algún detalle adicional?
