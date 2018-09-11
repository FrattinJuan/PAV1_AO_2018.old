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
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

     

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            if ((txtUsuario.Text == ""))
            {
                MessageBox.Show("Se debe ingresar un usuario.");
                return;
            }

            if ((txtPassword.Text == ""))
            {
                MessageBox.Show("Se debe ingresar una contraseña.");
                return;
            }

            frmPrincipal principal = new frmPrincipal();
            if (principal.ValidarCredenciales(txtUsuario.Text, txtPassword.Text))
            {
                MessageBox.Show("Usted a ingresado al sistema.");
                this.Close();
            }
            else
            {
                txtUsuario.Text = "";
                txtPassword.Text = "";
                MessageBox.Show("Debe ingresar usuario y/o contraseña correctos");
            }

            
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
