using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtEco.Dominio
{
  public  class Valoracion
    {
        public Cliente Comentarista { get; set; }
        public int Puntaje { get; set; }
        public string Comentario { get; set; } = "Sin comentarios";//Valor por defecto
    }
}
