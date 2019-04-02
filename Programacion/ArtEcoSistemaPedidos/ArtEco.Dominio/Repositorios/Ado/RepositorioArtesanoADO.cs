using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ArtEco.Dominio.Utiliades;

namespace ArtEco.Dominio.Repositorios.Ado
{
    public class RepositorioArtesanoADO : InterfacesRepositorio.IRepositorioArtesanos
    {

        public bool Add(Artesano art)
        {
            return art != null && art.Insertar();
        }

        public bool Delete(Artesano art)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Artesano> FindAll()
        {
            List<Artesano> listaArtesanos = new List<Artesano>();

            try
            {
                String query = @"SELECT * FROM Artesano";
                SqlConnection cn = UtilidadesBD.CreateConnection();
                SqlCommand cmd = new SqlCommand(query, cn);
                UtilidadesBD.OpenConnection(cn);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while(dr.Read())
                    {
                        listaArtesanos.Add(new Artesano
                        {
                            Cedula = dr["Cedula"].ToString(),
                            Nombre = dr["Nombre"].ToString(),
                            Apellido = dr["Apellido"].ToString()
                        });
                    }
                }

                UtilidadesBD.CloseConnection(cn);

            } catch(Exception e)
            {
                Console.WriteLine(e);
            }
            


            return listaArtesanos;
        }

        public Artesano FindById(string cedula)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Artesano> FindByName(string nom)
        {
            throw new NotImplementedException();
        }

        public bool Update(Artesano art)
        {
            throw new NotImplementedException();
        }
    }
}
