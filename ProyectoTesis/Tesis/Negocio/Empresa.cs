using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negocio
{
    class Empresa
    {
        LINQtoSQLDataContext db = new LINQtoSQLDataContext();
        SqlConnection conexion = new SqlConnection();
        SqlCommand comando = new SqlCommand();

        public bool agregarEmpresa(string usuario, string password, int rut, int rubro_id, int comuna_id, string razon_social, string telefono, string direccion, string mail)
        {
            int usuarioEmpresaId = 0;

            try
            {
                USUARIO_EMPRESA usuarioEmpresa = new USUARIO_EMPRESA();
                usuarioEmpresa.ESTADO_USUARIO_ID = 1;
                usuarioEmpresa.USUARIO = usuario;
                usuarioEmpresa.PASS = password; //HASHEAR
                db.USUARIO_EMPRESAs.InsertOnSubmit(usuarioEmpresa);
                db.SubmitChanges();

                usuarioEmpresaId = usuarioEmpresa.USUARIO_EMPRESA_ID;
                EMPRESA empresa = new EMPRESA();
                empresa.RUT = rut;
                empresa.RUBRO_ID = rubro_id;
                empresa.COMUNA_ID = comuna_id;
                empresa.USUARIO_EMPRESA_ID = usuarioEmpresaId;
                empresa.RAZON_SOCIAL = razon_social;
                empresa.TELEFONO = telefono;
                empresa.DIRECCION = direccion;
                empresa.MAIL = mail;
                db.EMPRESAs.InsertOnSubmit(empresa);
                db.SubmitChanges();

                return true;
            }
            catch
            {
                return false;
            }

        }

        public bool empresaLogin()
        {
            return false;
        }

        public void empresaInsertarCalificacion()
        {

        }



    }
}
