using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtEco.Dominio
{
    interface IActiveRecord
    {
        Boolean Insertar();
        Boolean Eliminar();
        Boolean Modificar();

    }
}
