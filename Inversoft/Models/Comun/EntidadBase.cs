namespace Inversoft.Models.Comun
{
    /// <summary>
    /// EntidadBase representa una entidad común con propiedades básicas.
    /// </summary>
    public class EntidadBase
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int IdTipoIdentificacion { get; set; }
        public string NroIdentificacion { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Email { get; set; }
    }
}
