using Inversoft.Models.Negocio;
using Microsoft.EntityFrameworkCore;

namespace Inversoft.Context
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Configure your entities here
            // Example: modelBuilder.Entity<YourEntity>().ToTable("YourTableName");
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Cargo>().ToTable("Cargo");
            modelBuilder.Entity<Cliente>().ToTable("Cliente");
            modelBuilder.Entity<Empresa>().ToTable("Empresa");
            modelBuilder.Entity<EmpresaProducto>().ToTable("EmpresaProducto");
            modelBuilder.Entity<Persona>().ToTable("Persona");
            modelBuilder.Entity<Producto>().ToTable("Producto");
        }
        // Define DbSet properties for your entities
        public DbSet<Cargo> Cargos { get; set; }
        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Empresa> Empresas { get; set; }
        public DbSet<EmpresaProducto> EmpresaProductos { get; set; }
        public DbSet<Persona> Personas { get; set; }
        public DbSet<Producto> Productos { get; set; }
    }
}
