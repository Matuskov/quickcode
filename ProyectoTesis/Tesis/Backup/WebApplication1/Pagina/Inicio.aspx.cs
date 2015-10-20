using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Pagina
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarProgramador_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Programador/RegistrarProgramador.aspx");
        }

        protected void btnRegistrarEmpresa_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Empresa/RegistrarEmpresa.aspx");
        }
    }
}