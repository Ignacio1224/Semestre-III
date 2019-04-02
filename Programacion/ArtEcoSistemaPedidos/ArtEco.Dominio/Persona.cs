using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtEco.Dominio
{
    public abstract class Persona
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public virtual bool Validar()
        {
            return !string.IsNullOrEmpty(Nombre) && !string.IsNullOrEmpty(Apellido);
        }
        public override string ToString()
        {
            return string.Format("Nombre: {0} - Apellido: {1}", Nombre, Apellido);
        }
      
    }
}
