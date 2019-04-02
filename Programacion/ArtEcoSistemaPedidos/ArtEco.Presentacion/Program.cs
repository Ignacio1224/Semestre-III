using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ArtEco.Dominio;
using ArtEco.Dominio.InterfacesRepositorio;
using ArtEco.Dominio.Repositorios;
using ArtEco.Dominio.Repositorios.Ado;

namespace ArtEco.Presentacion
{
    class Program
    {
        static RepositorioArtesanoADO repo = new RepositorioArtesanoADO();

        static void Main(string[] args)
        {
            AgregarArtesanos();
            Console.WriteLine("\n");
            ListarArtesanos();
            PararPantalla();
        }

        private static void PararPantalla()
        {
            Console.WriteLine("Chau, presionar tecla");
            Console.ReadKey();
        }

        private static void ListarArtesanos()
        {
            var lista = repo.FindAll();
            foreach (Artesano elem in lista)
                Console.WriteLine(elem.ToString());
        }

        private static void AgregarArtesanos()
        {
            repo.Add(new Artesano
            {
                Apellido = "Pérez",
                Nombre = "Toto",
                Cedula = "345"
            });
            repo.Add(new Artesano
            {
                Apellido = "Péreza",
                Nombre = "Tota",
                Cedula = "445"
            });

        }
    }
}
