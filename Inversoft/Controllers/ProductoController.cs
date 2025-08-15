using Inversoft.Models.Enums;
using Inversoft.Models.Negocio;
using Inversoft.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inversoft.Controllers
{
    public class ProductoController : Controller
    {
        private readonly IProductoService _productoService;

        public ProductoController(IProductoService productoService)
        {
            _productoService = productoService;
        }

        public async Task<IActionResult> Index()
        {
            var productos = await _productoService.ObtenerTodosAsync();
            return View(productos.Where(x => x.Status));
        }

        public IActionResult Crear()
        {
            ViewBag.Proveedores = Enum.GetValues(typeof(EnumProveedores))
                .Cast<EnumProveedores>()
                .Select(e => new SelectListItem
                {
                    Value = ((int)e).ToString(),
                    Text = e.ToString()
                });
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Crear(Producto producto)
        {
            producto.FechaIngreso = DateTime.Now;
            producto.OperacionRegistro = "Ingreso al inventario";
            producto.IdClienteIngreso = 1;
            producto.Status = true;
            if (!ModelState.IsValid)
            {
                ViewBag.Proveedores = Enum.GetValues(typeof(EnumProveedores))
                    .Cast<EnumProveedores>()
                    .Select(e => new SelectListItem
                    {
                        Value = ((int)e).ToString(),
                        Text = e.ToString()
                    });
                return View(producto);
            }
            // Guardar producto...
            await _productoService.GuardarAsync(producto);
            return RedirectToAction("Index");
        }

        // GET: Producto/Editar/5
        public async Task<IActionResult> Editar(int id)
        {
            var producto = await _productoService.ObtenerPorIdAsync(id); // Asegúrate de tener este método en tu servicio
            if (producto == null)
            {
                TempData["ErrorMessage"] = "Producto no encontrado.";
                return RedirectToAction("Index");
            }

            ViewBag.Proveedores = Enum.GetValues(typeof(EnumProveedores))
                .Cast<EnumProveedores>()
                .Select(e => new SelectListItem
                {
                    Value = ((int)e).ToString(),
                    Text = e.ToString(),
                    Selected = producto.IdProveedor == (int)e
                });

            return View(producto);
        }

        // POST: Producto/Editar/5
        [HttpPost]
        public async Task<IActionResult> Editar(Producto producto)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Proveedores = Enum.GetValues(typeof(EnumProveedores))
                    .Cast<EnumProveedores>()
                    .Select(e => new SelectListItem
                    {
                        Value = ((int)e).ToString(),
                        Text = e.ToString(),
                        Selected = producto.IdProveedor == (int)e
                    });
                return View(producto);
            }

            producto.FechaActualizacion = DateTime.Now;
            producto.OperacionRegistro = "Actualización del inventario";
            producto.IdClienteActualizo = 1; // Asigna el ID del cliente que está modificando el producto

            await _productoService.EditarAsync(producto); // Implementa la lógica de actualización en tu servicio

            TempData["SuccessMessage"] = "Producto actualizado correctamente.";
            return RedirectToAction("Index");
        }
    }
}
