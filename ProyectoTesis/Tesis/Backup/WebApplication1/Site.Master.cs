using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["TIPO_USUARIO"] == "PROGRAMADOR")
            {
                btnLoginEmpresa.Visible = false;
                btnLoginProgramador.Visible = false;
                lblNombreUsuario.Text = "Logeado como " + (string)Session["NOMBRE"] + " " + (string)Session["APELLIDOS"];
            }

            if(Session["TIPO_USUARIO"] == "EMPRESA")
            {
                btnLoginEmpresa.Visible = false;
                btnLoginProgramador.Visible = false;
                lblNombreUsuario.Text = "Logeado como " + (string)Session["RAZON_SOCIAL"];
            }

            else
            {
                NavigationMenu.Visible = false;
                lblNombreUsuario.Visible = false;
                btnLogout.Visible = false;
            }

        }

        protected void btnLoginEmpresa_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Empresa/LoginEmpresa.aspx");
        }

        protected void btnLoginProgramador_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Programador/LoginProgramador.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Server.Transfer("Inicio.aspx");
        }
    }
}
