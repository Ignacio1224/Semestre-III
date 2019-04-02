using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtEco.Dominio
{
  public  class Cliente:Persona
    {
        public Usuario UsuarioAsignado { get; set; }
        public string Telefono { get; set; }
    }
}
