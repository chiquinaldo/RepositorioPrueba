using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

/// <summary>
/// Descripción breve de Conexion
/// </summary>
public class Conexion
{
    //String cadena = "Data Source=CHIQUINALDO-PC; Initial Catalog=dbproyecto; Integrated Security=true;";

    //public SqlConnection conectar = new SqlConnection();

    //public Conexion()
    //{
    //    conectar.ConnectionString = cadena; 
    //}

    private SqlConnection conectar;

    private SqlCommand comando;

    private SqlDataAdapter adaptador;


    public void abrir()
    {
        try
        {

            //conectar.Open();
            //Console.WriteLine("Se hizo la conxion");
            conectar = new SqlConnection();
            conectar.ConnectionString = "Data Source=CHIQUINALDO-PC; Initial Catalog=dbproyecto; Integrated Security=true;";
            conectar.Open();

        }
        catch (Exception ex)
        {
            throw ex;

        }
    }

    public void cerrar()
    {
        conectar.Close();
    }


    public bool guardar(int id, string nombre)
    {
        abrir();
        try
        {
            comando = new SqlCommand("GuardarDatosCliente", conectar);
            comando.CommandType = CommandType.StoredProcedure;
            SqlParameter sqlParameter = new SqlParameter("@idClient", id);
            SqlParameter sqlParamete2 = new SqlParameter("@nombreCliente", nombre);
            comando.Parameters.Add(sqlParameter);
            comando.Parameters.Add(sqlParamete2);
            comando.ExecuteNonQuery();
            return true;


        }
        catch (Exception ex)
        {
            Console.WriteLine("Error. " + ex);
        }
        return false;
    }

    public bool CambioEstado(int id)
    {
        abrir();
        try
        {
            comando = new SqlCommand("CambioEstado", conectar);
            comando.CommandType = CommandType.StoredProcedure;
            SqlParameter sqlParameter = new SqlParameter("@id", id);
            comando.Parameters.Add(sqlParameter);
            comando.ExecuteNonQuery();
            return true;


        }
        catch (Exception ex)
        {
            Console.WriteLine("Error. " + ex);
        }
        return false;
    }
}