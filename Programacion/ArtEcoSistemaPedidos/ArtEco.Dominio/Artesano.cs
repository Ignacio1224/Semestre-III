using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using ArtEco.Dominio.Utiliades;

namespace ArtEco.Dominio
{
    public class Artesano:Persona, IEquatable<Artesano>, IActiveRecord
    {
        public string Cedula { get; set; } //identificador del artesano
        public override bool Validar()
        {
            return base.Validar() && this.Cedula.Length > 2 && Cedula.Length < 5;
        }
       

        public bool Equals(Artesano other)
        {
            return other !=null && this.Cedula ==other.Cedula;
        }
        public override string ToString()
        {
            return "Cedula: " + this.Cedula + " - " + base.ToString();
        }

        public bool Insertar()
        {
            Boolean flag = false;
			// Prepare Command
            string query = @"INSERT INTO Artesano (Cedula, Nombre, Apellido) VALUES (@cedula, @nombre, @apellido)";
			try {
                SqlConnection cn = UtilidadesBD.CreateConnection();
                SqlCommand cmd = new SqlCommand(query, cn);
                cmd.Parameters.Add(new SqlParameter("@cedula", this.Cedula));
                cmd.Parameters.Add(new SqlParameter("@nombre", this.Nombre));
                cmd.Parameters.Add(new SqlParameter("@apellido", this.Apellido));
                UtilidadesBD.OpenConnection(cn);
                cmd.ExecuteNonQuery();
                UtilidadesBD.CloseConnection(cn);
                flag = true;
            }
            catch (SqlException e)
            {
                if (e.Number == 2627) // Violation PK
                {
                    Console.WriteLine("El usuario con la cedula: " + this.Cedula + " ya existe");
                } else
                {
                    Console.WriteLine(e);
                }
            } catch (Exception ex) {
				Console.WriteLine(ex.Message + " Error");
			} finally {
				return flag;
			}
        }

        public bool Eliminar()
        {
            throw new NotImplementedException();
        }

        public bool Modificar()
        {
            throw new NotImplementedException();
        }
    }
}
