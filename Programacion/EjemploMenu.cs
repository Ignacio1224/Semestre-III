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
		static RepositorioArtesanosADO repo = new RepositorioArtesanosADO();
		static void Main(string[] args)
		{
			int opcion = -1;
			do
			{
				DibujarMenu();
				opcion = LeerOpcion();
				if (opcion != 0)
					ProcesarMenu(opcion);
			} while (opcion != 0);
			Console.WriteLine("Fin del programa.");
			PararPantalla();
		}

		private static void ProcesarMenu(int opcion)
		{
			if (opcion == 1)
				AgregarArtesanos();
			else if (opcion == 2)
				ListarArtesanos();
		}

		private static void DibujarMenu()
		{
			Console.Clear();
			Console.WriteLine("Menú de opciones");
			Console.WriteLine("=================");
			Console.WriteLine("0 - Salir");
			Console.WriteLine("1 - Registrar un artesano");
			Console.WriteLine("2 - Listar los artesanos");
			Console.WriteLine("");
			Console.WriteLine("Ingrese una opción - 0 para salir");

		}
		private static int LeerOpcion()
		{
			int tope = 2;
			int opcion = -1;
			bool esNumero = false;
			char caracter; 
			do
			{
				caracter = Console.ReadKey().KeyChar;
				esNumero = int.TryParse(caracter.ToString(), out opcion);
				if (!esNumero || opcion <0 || opcion >tope)
					Console.WriteLine("Ingrese nuevamente, la opción debe estar entre 0 y {0}", tope);
			} while (!esNumero || opcion < 0 || opcion > tope);
			return opcion;
		}

		private static void PararPantalla()
		{
			Console.WriteLine("Chau, presionar tecla");
			Console.ReadKey();
		}

		private static void ListarArtesanos()
		{
			Console.WriteLine("Lista de artesanos");
			/*	var lista = repo.FindAll();
				foreach (Artesano elem in lista)
					Console.WriteLine(elem.ToString());*/
			PararPantalla();
		}

		private static void AgregarArtesanos()
		{
			Console.WriteLine("Agregando artesanos");
			/*		repo.Add(new Artesano
					{
						Apellido = "Pérez2020",
						Nombre = "Toto",
						Cedula = "3450188"
					});
					repo.Add(new Artesano
					{
						Apellido = "Péreza20",
						Nombre = "Tota",
						Cedula = "44500"
					});*/
			PararPantalla();

		}
	}
}
