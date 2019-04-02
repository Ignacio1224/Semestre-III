using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtEco.Dominio
{
   public  class PiezaUnica:Producto 
    {
        public static int TasaAumento { get; set; } = 10; //cualquier valor arbitrario, por ahora
        public Decimal GananciaArtesano { get; set; }

        internal override decimal CalcularPrecio()
        {
            throw new NotImplementedException();
        }
    }
}
