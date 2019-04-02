using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace ArtEco.Dominio.Utiliades
{
    public class UtilidadesBD
    {
        //private static string CadenaConexion = ConfigurationManager.ConnectionStrings["ArtEcoVS"].ConnectionString;
        private static string CadenaConexion = ConfigurationManager.ConnectionStrings["ArtEcoD"].ConnectionString;

        public static SqlConnection CreateConnection()
        {
            SqlConnection cn = new SqlConnection(CadenaConexion);
            return cn; 
        }

        public static Boolean OpenConnection(SqlConnection cn)
        {
            if (cn.State != System.Data.ConnectionState.Open)
            {
                cn.Open();
                return true;
            }
            return false;
        }

        public static Boolean CloseConnection(SqlConnection cn)
        {
            if (cn.State == System.Data.ConnectionState.Open)
            {
                cn.Close();
                return true;
            }
            return false;
        }
    }
}
