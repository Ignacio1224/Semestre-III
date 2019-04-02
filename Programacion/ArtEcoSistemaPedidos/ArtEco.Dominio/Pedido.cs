using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtEco.Dominio
{
    public class Pedido
    {
        public DateTime Fecha { get; set; } = DateTime.Today.Date;
        public int Id { get; set; }
        public static decimal TasaIVA { get; set; }
        public List<ItemPedido> Items { get; set; }

        public bool Cancelado { get; set; } = false;
      
         public bool AgregarItem(ItemPedido item)
        {
            //No controlamos que agreguen más de una vez el mismo item.
            if (this.Items == null) this.Items = new List<ItemPedido>();
            if (item.Validar())
            {
                this.Items.Add(item);
                
                return true;
            }
            return false;
        }
         public decimal ObtenerTotal()
         {
             if (this.Items == null) return 0;
             decimal total = 0;
       //PENDIENTE calcular el total
             return total;
         }
         public void Anular() {
             this.Cancelado = true;
         }

         internal bool Validar()
         {
             return true;
         }
    }
}
