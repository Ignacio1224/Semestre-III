using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtEco.Dominio.InterfacesRepositorio
{
  public   interface IRepositorioArtesanos
    {
        bool Add(Artesano art);
        bool Delete(Artesano art);
        bool Update(Artesano art);
        Artesano  FindById(string cedula);
        IEnumerable<Artesano> FindAll();
        IEnumerable<Artesano> FindByName(string nom);

    }
}
