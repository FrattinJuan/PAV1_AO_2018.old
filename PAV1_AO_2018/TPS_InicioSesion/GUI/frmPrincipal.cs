using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TPS_InicioSesion
{
    public partial class frmPrincipal : Form
    {
        public frmPrincipal()
        {
            InitializeComponent();
        }

       

        private void frmPrincipal_Load(object sender, EventArgs e)
        {
            frmLogin login = new frmLogin();
            login.ShowDialog();
        }

        public bool ValidarCredenciales(string pUsuario, string pPassword)
        {
            BDHelper helper = new BDHelper();
            DataTable tabla = helper.ConsultaSQL("SELECT * FROM USUARIOS WHERE nombre_usuario =  \'"
                            + pUsuario + "\' AND password = \'"
                            + pPassword + "\'");

            
            if (tabla.Rows.Count > 0)
                return true;
            else
                return false;

        }

        private void btnOdontologo_Click(object sender, EventArgs e)
        {
            new frmNuevoOdo().ShowDialog();
        }

    }
}
