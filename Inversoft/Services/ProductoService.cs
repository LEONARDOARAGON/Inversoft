using Inversoft.Models.Negocio;
using Inversoft.Repositories.Interfaces;
using Inversoft.Services.Interfaces;

namespace Inversoft.Services
{
    public class ProductoService : IProductoService
    {
        private readonly IProductoRepository _repository;
        private readonly ILogger<ProductoService> _logger;

        public ProductoService(IProductoRepository repository, ILogger<ProductoService> logger)
        {
            _repository = repository;
            _logger = logger;
        }

        public async Task<IEnumerable<Producto>> ObtenerTodosAsync()
        {
            try
            {
                return await _repository.GetAllAsync();
            }
            catch (Exception)
            {
                _logger.LogError("Error al obtener todos los productos");
                throw;
            }
        }

        public async Task<Producto> ObtenerPorIdAsync(int id)
        {
            return await _repository.GetByIdAsync(id);
        }

        public async Task GuardarAsync(Producto producto)
        {
            try
            {
                if (producto == null)
                {
                    throw new ArgumentNullException(nameof(producto), "El producto no puede ser nulo");
                }

                Producto existeProducto = await _repository.GetByIdAsync(producto.Id);

                if (existeProducto != null)
                {
                    throw new InvalidOperationException("El producto ya existe");
                }

                await _repository.AddAsync(producto);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public async Task EditarAsync(Producto producto)
        {
            var existeProducto = await _repository.GetByIdAsync(producto.Id);

            if (existeProducto == null)
            {
                throw new KeyNotFoundException("Producto no encontrado");
            }

            // Actualizar los campos necesarios
            existeProducto.Nombre = producto.Nombre;
            existeProducto.Descripcion = producto.Descripcion;
            existeProducto.Precio = producto.Precio;
            existeProducto.FechaActualizacion = DateTime.Now;
            existeProducto.OperacionRegistro = "Actualización del inventario";
            existeProducto.IdClienteActualizo = producto.IdClienteActualizo;
            existeProducto.IdProveedor = producto.IdProveedor;
            existeProducto.SKU = producto.SKU;
            existeProducto.Cantidad = producto.Cantidad;


            await _repository.UpdateAsync(existeProducto);
        }
    }
}