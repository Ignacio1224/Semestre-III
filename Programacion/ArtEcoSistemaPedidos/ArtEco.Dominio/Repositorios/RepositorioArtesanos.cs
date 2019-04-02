using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtEco.Dominio.Repositorios
{
  public  class RepositorioArtesanos
    {
        #region Lista
        private List<Artesano> listaArtesanos { get; set; } = new List<Artesano>();
        #endregion
		
        public bool Add(Artesano artesano)
        {
            if (!listaArtesanos.Contains (artesano) 
                && artesano.Validar())
            {
                listaArtesanos.Add(artesano);
                return true;
            }
            return false;
        }
        public IEnumerable <Artesano> FindAll()
        {
            return this.listaArtesanos;
        }
    }
}
