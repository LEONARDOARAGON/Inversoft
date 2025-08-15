using Inversoft.Models.Negocio;

namespace Inversoft.Services.Interfaces
{
    public interface IProductoService
    {
        Task<IEnumerable<Producto>> ObtenerTodosAsync();
        Task<Producto> ObtenerPorIdAsync(int id);
        Task GuardarAsync(Producto producto);
        Task EditarAsync(Producto producto);
    }
}