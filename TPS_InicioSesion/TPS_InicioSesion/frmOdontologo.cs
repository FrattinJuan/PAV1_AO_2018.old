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
    public partial class frmOdontologo : Form
    {
        BDHelper oDatos = new BDHelper();//caddena de conexion
        bool nuevo = false;
        public frmOdontologo()
        {
            InitializeComponent();
        }
        private void frmUsuarios_Load(object sender, EventArgs e)
        {
            // deshabilitar campos txt..
            //habilitar botones..
            DataTable tabla = oDatos.consultarTabla("Odontologos");
            tabla = oDatos.consultarTabla("users");
            lstUsuarios.DataSource = tabla;
            lstUsuarios.ValueMember = tabla.Columns[0].ColumnName;
            lstUsuarios.DisplayMember = "nombre";
            lstUsuarios.DisplayMember = "apellido";
        }
        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void lstOdontologo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnEditar_Click(object sender, EventArgs e)
        {

        }
    }
}
