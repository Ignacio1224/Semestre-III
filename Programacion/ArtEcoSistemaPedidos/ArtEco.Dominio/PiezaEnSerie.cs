using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtEco.Dominio
{
    public class PiezaEnSerie : Producto
    {
        public decimal TasaGanancia { get; set; }
        public static Decimal TasaGanaciaArtesano { get; set; } = 15;//Por ahora le asignamos un valor arbitrario

        internal override decimal CalcularPrecio()
        {
            throw new NotImplementedException();
        }
    }
}
