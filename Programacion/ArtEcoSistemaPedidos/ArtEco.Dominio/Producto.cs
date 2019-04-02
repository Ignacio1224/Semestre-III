using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtEco.Dominio
{
  public abstract class Producto
  {
      #region Atributos
      public int Id { get; set; }
        public string Nombre { get; set; }
        public   decimal PrecioCompra { get; set; }
        public int Stock { get; set; }
        public Artesano Proveedor { get; set; }
        public string Foto { get; set; }//guarda la ruta de la foto
        #endregion
        #region Variables de clase

        #endregion
        #region Validaciones
        public bool Validar()
        {
            //PENDIENTE, POR EL MOMENTO TRUE PARA QUE NO MOLESTE
            return true;
        }
      #endregion
        #region Constructores
      
        #endregion
        #region Redefiniciones de Object
        public override bool Equals(object obj)
        {
            Producto otroProd = obj as Producto;
            if (otroProd != null)
                return otroProd.Id == this.Id || otroProd.Nombre.ToUpper().Trim() == this.Nombre.ToUpper().Trim();
            else
                return false;
            
        }
        public override string ToString()
        {
            return this.Id + "  " + this.Nombre + "  " + this.PrecioCompra  ;
        }
      #endregion
      #region Cálculo de precios
        internal abstract Decimal CalcularPrecio();
      #endregion

  }
}
