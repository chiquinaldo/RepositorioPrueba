using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Conexion conexion = new Conexion();
        //GridView.DataSource = conexion.mostrarColas();

    }

    protected void btnAcceso_Click(object sender, EventArgs e)

    {
        Conexion conexion = new Conexion();
        if ((TxtId.Text != "") && TxtNombre.Text != "")
        {


            bool r = conexion.guardar(Convert.ToInt32(TxtId.Text), TxtNombre.Text);
            if (r == true)
            {
                Response.Redirect("Login.aspx");
                //Response.Write("<script>alert('Usuario Ingresado con exito') </script >");
            }
            else
            {
                Response.Write("<script>alert('El id ya existe') </script >");
            }
        }
        else
        {
            Response.Write("<script>alert('Debe llenar todos los campos') </script >");
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Conexion conexion = new Conexion();
        TxtId.Text = GridView1.SelectedRow.Cells[1].Text;
        bool r = conexion.CambioEstado(Convert.ToInt32(TxtId.Text));
        if (r == true)
        {
            Response.Redirect("Login.aspx");

        }
        else
        {
            Response.Write("<script>alert('Usuario Fallo') </script >");
        }


    }

    protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Conexion conexion = new Conexion();
        TxtId.Text = GridView.SelectedRow.Cells[1].Text;
        bool r = conexion.CambioEstado(Convert.ToInt32(TxtId.Text));
        if (r == true)
        {
            Response.Redirect("Login.aspx");

        }
        else
        {
            Response.Write("<script>alert('Usuario Fallo') </script >");
        }
    }
}