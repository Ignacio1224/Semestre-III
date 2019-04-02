using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ArtEco.Dominio
{
   public class ItemPedido
    {
        public Producto  ProductoPedido { get; set; }
        public int Cantidad { get; set; }
       public decimal PrecioVenta { get; set; }
      
        public bool Validar()
        {
            //PENDIENTE
            return true;
        }
            
        #region Redefiniciones de Object
        public override string ToString()
        {
            if (this.ProductoPedido == null) return "Sin producto";
            return this.ProductoPedido.Nombre + " $ " + this.PrecioVenta  + " x "  + this.Cantidad  ;
        }
        #endregion
    }
}
