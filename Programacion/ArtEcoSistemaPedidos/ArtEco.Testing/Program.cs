using ArtEco.Dominio.Repositorios;
using ArtEco.Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using ArtEco.Dominio.Utiliades;

namespace ArtEco.Testing
{
    public class Program
    {
        private static RepositorioArtesanos repoArtesano
            = new RepositorioArtesanos();
        static void Main(string[] args)
        {
            //SqlConnection sn = UtilidadesBD.CrearConexion();
            //sn.Open();
            AgregarArtesanos();
            MostrarArtesanos();
            PararPantalla();
        }

        private static void PararPantalla()
        {
            Console.WriteLine("Presione una tecla para salir");
            Console.ReadKey();
        }

        private static void MostrarArtesanos()
        {
           foreach (Artesano unArt in repoArtesano.FindAll ())
                Console.WriteLine(unArt.Nombre); 
        }

        private static void AgregarArtesanos()
        {
            Artesano art1 = new Artesano
            {
                Apellido = "Gusto",
                Nombre = "Patricia",
                Cedula = "123"
            };

            Artesano art2 = new Artesano
            {
                Apellido = "Bueno",
                Nombre = "Marta",
                Cedula = "999"
            };
            repoArtesano.Add(art1);
            repoArtesano.Add(art2);
        }
    }
}
