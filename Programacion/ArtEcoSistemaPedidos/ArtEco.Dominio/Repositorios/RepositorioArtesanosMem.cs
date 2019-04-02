using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ArtEco.Dominio.InterfacesRepositorio;

namespace ArtEco.Dominio.Repositorios
{
    public class RepositorioArtesanosMem : IRepositorioArtesanos
    {
        private List<Artesano> listaArtesanos
            = new List<Artesano>();//no le hacemos property


        public bool Add(Artesano art)
        {
            if (art != null && art.Validar() &&
                !listaArtesanos.Contains(art))
            {
                listaArtesanos.Add(art);
                return true;
            }
            return false;
        }

        public bool Delete(Artesano art)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Artesano> FindAll()
        {
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
