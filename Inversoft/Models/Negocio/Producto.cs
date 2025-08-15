namespace Inversoft.Models.Negocio
{
    public class Producto
    {
        public int Id { get; set; }
        public int IdProveedor { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string SKU { get; set; }
        public decimal Precio { get; set; }
        public int Cantidad { get; set; }
        public int IdClienteIngreso { get; set; }
        public DateTime FechaIngreso { get; set; }
        public int? IdClienteActualizo { get; set; }
        public DateTime? FechaActualizacion { get; set; }
        public string OperacionRegistro { get; set; }
        public bool Status { get; set; }
    }
}
