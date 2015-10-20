using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1.Pagina.Empresa
{
    public partial class RegistrarEmpresa : System.Web.UI.Page
    {
        LINQtoSQLDataContext db = new LINQtoSQLDataContext();
        SqlConnection conexion = new SqlConnection();
        SqlCommand comando = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            conexion.ConnectionString = @"Data Source=localhost\sqlexpress;Initial Catalog=Thequickcode;Integrated Security=True";
        }

        protected void btnRegistrarEmpresa_Click(object sender, EventArgs e)
        {
            try
            {

                
                //Crear usuario Empresa
                comando.CommandText = "INSERT INTO dbo.USUARIO_EMPRESA (ESTADO_USUARIO_ID, USUARIO, PASS, SAL) OUTPUT INSERTED.USUARIO_EMPRESA_ID VALUES(@estado_usuario_id, @usuario, @pass, @sal)";
                comando.Parameters.Clear();
                comando.Parameters.AddWithValue("@estado_usuario_id", 1);
                comando.Parameters.AddWithValue("@usuario", txtUsuario.Text);
                comando.Parameters.AddWithValue("@pass", txtPassword.Text);
                comando.Parameters.AddWithValue("@sal", txtPassword.Text); //Guardar sal PENDIENTE
                int usuarioEmpresaId = (int)comando.ExecuteScalar();

                //Crear Empresa
                comando.CommandText = "INSERT INTO dbo.EMPRESA (RUT, RUBRO_ID, COMUNA_ID, USUARIO_EMPRESA_ID, RAZON_SOCIAL, TELEFONO, DIRECCION, MAIL) VALUES (@rut, @rubro_id, @comuna_id, @usuario_empresa_id, @razon_social, @telefono, @direccion, @mail)";
                comando.Parameters.Clear();
                comando.Parameters.AddWithValue("@rut", txtRUT.Text);
                comando.Parameters.AddWithValue("@rubro_id", ddlRubro.SelectedValue);
                comando.Parameters.AddWithValue("@comuna_id", ddlComuna.SelectedValue);
                comando.Parameters.AddWithValue("@usuario_empresa_id", usuarioEmpresaId);
                comando.Parameters.AddWithValue("@razon_social", txtRazonSocial.Text);
                comando.Parameters.AddWithValue("@telefono", txtTelefono.Text);
                comando.Parameters.AddWithValue("@direccion", txtDireccion.Text);
                comando.Parameters.AddWithValue("@mail", txtCorreo.Text);
                comando.ExecuteNonQuery();

            }

            catch (SqlException ex)
            {

            }

            conexion.Close();
            comando.Dispose();
        }

        /*protected void btnRegistrarEmpresa_Click(object sender, EventArgs e)
        {
            try
            {
                comando.Connection = conexion;
                conexion.Open();

                //Crear usuario Empresa
                comando.CommandText = "INSERT INTO dbo.USUARIO_EMPRESA (ESTADO_USUARIO_ID, USUARIO, PASS, SAL) OUTPUT INSERTED.USUARIO_EMPRESA_ID VALUES(@estado_usuario_id, @usuario, @pass, @sal)";
                comando.Parameters.Clear();
                comando.Parameters.AddWithValue("@estado_usuario_id", 1);
                comando.Parameters.AddWithValue("@usuario", txtUsuario.Text);
                comando.Parameters.AddWithValue("@pass", txtPassword.Text);
                comando.Parameters.AddWithValue("@sal", txtPassword.Text); //Guardar sal PENDIENTE
                int usuarioEmpresaId = (int)comando.ExecuteScalar();

                //Crear Empresa
                comando.CommandText = "INSERT INTO dbo.EMPRESA (RUT, RUBRO_ID, COMUNA_ID, USUARIO_EMPRESA_ID, RAZON_SOCIAL, TELEFONO, DIRECCION, MAIL) VALUES (@rut, @rubro_id, @comuna_id, @usuario_empresa_id, @razon_social, @telefono, @direccion, @mail)";
                comando.Parameters.Clear();
                comando.Parameters.AddWithValue("@rut", txtRUT.Text);
                comando.Parameters.AddWithValue("@rubro_id", ddlRubro.SelectedValue);
                comando.Parameters.AddWithValue("@comuna_id", ddlComuna.SelectedValue);
                comando.Parameters.AddWithValue("@usuario_empresa_id", usuarioEmpresaId);
                comando.Parameters.AddWithValue("@razon_social", txtRazonSocial.Text);
                comando.Parameters.AddWithValue("@telefono", txtTelefono.Text);
                comando.Parameters.AddWithValue("@direccion", txtDireccion.Text);
                comando.Parameters.AddWithValue("@mail", txtCorreo.Text);
                comando.ExecuteNonQuery();

            }

            catch (SqlException ex)
            {

            }

            conexion.Close();
            comando.Dispose();
        }*/


    }
}